class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('https://demo.vuahethong.com');
  static final Env staging = Env('https://demo.vuahethong.com');
  static final Env production = Env('https://demo.vuahethong.com');
}
