import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:survey_app/base_color.dart';
import 'package:survey_app/controllers/authenticate/authentication.dart';

import 'package:survey_app/controllers/signup/sign_up_controller.dart';
import 'package:survey_app/controllers/signup/sign_up_state.dart';
import 'package:survey_app/generated/l10n.dart';
import 'package:survey_app/main.dart';
import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';

import 'package:survey_app/widgets/s_image64.dart';
import 'package:survey_app/widgets/s_text_field.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<XFile>? _imageFileList;
  final _signUpcontroller = Get.put(SignUpController());
  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  String? image64;
  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;
  bool ivaEmail = false;
  bool ivaPass = false;
  bool ivaRePass = false;
  bool ivaIdReco = false;
  bool ivaIdRePass = false;
  bool ivaUsName = false;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      final double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else if (isMultiImage) {
      try {
        final pickedFileList = await _picker.pickMultiImage(
          maxWidth: 20,
          maxHeight: 20,
          imageQuality: 100,
        );

        setState(() {
          _imageFileList = pickedFileList;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    } else {
      try {
        final pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: 200,
          maxHeight: 200,
          imageQuality: 100,
        );

        setState(() {
          _imageFile = pickedFile;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Icon(Icons.add_task_sharp, color: BaseColor.primary);
    } else if (_pickImageError != null) {
      print(_pickImageError);
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        S.current.chose_id_recognition,
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void signUp() async {
    if (emailController.text.isEmpty == false &&
        passwordController.text.isEmpty == false &&
        userNameController.text.isEmpty == false &&
        emailController.text.isEmail == true &&
        passwordController.text == rePasswordController.text) {
      String email = emailController.text;
      String password = passwordController.text;
      String userName = userNameController.text;
      String base64;
      String? token = await FirebaseMessaging.instance.getToken();

      if (!kIsWeb) {
        base64 =
            base64Encode(File(_imageFileList!.first.path).readAsBytesSync());
      } else {
        http.Response response =
            await http.get(Uri.parse(_imageFileList!.first.path));
        base64 = base64Encode(response.bodyBytes);
      }

      _signUpcontroller.signUp(email, password, token, userName, base64);
    } else {
      if (emailController.text.isEmpty == true) {
        this.setState(() {
          this.ivaEmail = false;
        });
      }
      if (passwordController.text.isEmpty == true) {
        this.setState(() {
          this.ivaPass = false;
        });
      }
      if (userNameController.text.isEmpty == true) {
        this.setState(() {
          this.ivaUsName = false;
        });
      }
      if (rePasswordController.text == passwordController.text) {
        this.setState(() {
          this.ivaRePass = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BaseColor.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GradientMark(
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              InitialBinding().dependencies();
              Get.back();
            },
          ),
          gradient:
              LinearGradient(colors: [Colors.blueAccent, Colors.cyanAccent]),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SImage64.imageFromBase64String(SImage64.logo100),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ContainerGradientBorder(
                    width: size.width * 0.8,
                    height: 50,
                    intColor: Colors.white,
                    borderRadius: 10,
                    child: GradientMark(
                      XTextField(
                        icon: Icons.email,
                        hintText: S.current.email_hint,
                        controller: emailController,
                      ),
                      gradient: LinearGradient(colors: BaseColor.baseGradient),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent]),
                  ),
                  ContainerGradientBorder(
                    width: size.width * 0.8,
                    height: 50,
                    intColor: Colors.white,
                    borderRadius: 10,
                    child: GradientMark(
                      XTextField(
                        icon: Icons.account_box_outlined,
                        hintText: S.current.user_name_hint,
                        controller: userNameController,
                      ),
                      gradient: LinearGradient(colors: BaseColor.baseGradient),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent]),
                  ),
                  ContainerGradientBorder(
                    width: size.width * 0.8,
                    height: 50,
                    intColor: Colors.white,
                    borderRadius: 10,
                    child: GradientMark(
                      XTextField(
                        icon: Icons.lock,
                        hintText: S.current.password_hint,
                        controller: passwordController,
                      ),
                      gradient: LinearGradient(colors: BaseColor.baseGradient),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent]),
                  ),
                  ContainerGradientBorder(
                    width: size.width * 0.8,
                    height: 50,
                    intColor: Colors.white,
                    borderRadius: 10,
                    child: GradientMark(
                      XTextField(
                        icon: Icons.lock_clock_sharp,
                        controller: rePasswordController,
                        hintText: S.current.password_again,
                      ),
                      gradient: LinearGradient(colors: BaseColor.baseGradient),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent]),
                  ),
                  GestureDetector(
                      onTap: () {
                        isVideo = false;
                        _onImageButtonPressed(
                          ImageSource.gallery,
                          context: context,
                          isMultiImage: false,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: !kIsWeb &&
                                  defaultTargetPlatform ==
                                      TargetPlatform.android
                              ? FutureBuilder<void>(
                                  future: retrieveLostData(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<void> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                      case ConnectionState.waiting:
                                        return Text(
                                          S.current.chose_id_recognition,
                                          textAlign: TextAlign.center,
                                        );
                                      case ConnectionState.done:
                                        return _handlePreview();
                                      default:
                                        if (snapshot.hasError) {
                                          return Text(
                                            'Pick image/video error: ${snapshot.error}}',
                                            textAlign: TextAlign.center,
                                          );
                                        } else {
                                          return Text(
                                            S.current.chose_id_recognition,
                                            textAlign: TextAlign.center,
                                          );
                                        }
                                    }
                                  },
                                )
                              : _handlePreview(),
                        ),
                        width: size.width * 0.8,
                        height: 30.0,
                      )),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            GestureDetector(
                onTap: () async {
                  signUp();
                },
                child: ContainerGradientBorder(
                  width: size.width * 0.3,
                  height: 50,
                  intColor: Colors.white,
                  borderRadius: 10,
                  child: Center(
                      child: Text(
                    S.current.sign_up,
                    style: TextStyle(color: BaseColor.primary, fontSize: 25),
                  )),
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent]),
                )),
            if (_signUpcontroller.state is SignUpFailure)
              Text(
                (_signUpcontroller.state as SignUpFailure).error,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber),
              ),
            if (_signUpcontroller.state is SignUpLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add optional parameters'),
            content: Column(
              children: <Widget>[],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}
