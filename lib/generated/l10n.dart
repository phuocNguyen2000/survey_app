// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add contact successfully`
  String get add_contact_success {
    return Intl.message(
      'Add contact successfully',
      name: 'add_contact_success',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection, please try again`
  String get no_internet {
    return Intl.message(
      'No internet connection, please try again',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Close app`
  String get close_app {
    return Intl.message(
      'Close app',
      name: 'close_app',
      desc: '',
      args: [],
    );
  }

  /// `Add Contact`
  String get add_contact {
    return Intl.message(
      'Add Contact',
      name: 'add_contact',
      desc: '',
      args: [],
    );
  }

  /// `Domain does not exist`
  String get domain_does_not_exist {
    return Intl.message(
      'Domain does not exist',
      name: 'domain_does_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Database does not exist`
  String get database_does_not_exist {
    return Intl.message(
      'Database does not exist',
      name: 'database_does_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Username or Password is incorrect`
  String get username_or_password_is_incorrect {
    return Intl.message(
      'Username or Password is incorrect',
      name: 'username_or_password_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Check Domain`
  String get check_domain {
    return Intl.message(
      'Check Domain',
      name: 'check_domain',
      desc: '',
      args: [],
    );
  }

  /// `Does not have account ?`
  String get does_not_have_account {
    return Intl.message(
      'Does not have account ?',
      name: 'does_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Already a user`
  String get already_user {
    return Intl.message(
      'Already a user',
      name: 'already_user',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_hint {
    return Intl.message(
      'Email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Error, close the app and try again`
  String get error {
    return Intl.message(
      'Error, close the app and try again',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_hint {
    return Intl.message(
      'Name',
      name: 'name_hint',
      desc: '',
      args: [],
    );
  }

  /// `A new user?`
  String get new_user {
    return Intl.message(
      'A new user?',
      name: 'new_user',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get no_results {
    return Intl.message(
      'No results',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_hint {
    return Intl.message(
      'Password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait...`
  String get please_wait {
    return Intl.message(
      'Please Wait...',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Successfully signed up, please Sign In`
  String get signup_success {
    return Intl.message(
      'Successfully signed up, please Sign In',
      name: 'signup_success',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name_hint {
    return Intl.message(
      'User Name',
      name: 'user_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `chose your id recognition`
  String get chose_id_recognition {
    return Intl.message(
      'chose your id recognition',
      name: 'chose_id_recognition',
      desc: '',
      args: [],
    );
  }

  /// `Enter the password again`
  String get password_again {
    return Intl.message(
      'Enter the password again',
      name: 'password_again',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
