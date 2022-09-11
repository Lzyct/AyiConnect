enum Environment {
  staging,
  production,
}

Environment environment = Environment.staging;

String get baseUrl {
  switch (environment) {
    case Environment.staging:
      return "https://reqres.in";
    case Environment.production:
      return "https://reqres.in";
  }
}

String get whatEnv {
  switch (environment) {
    case Environment.staging:
      return "staging";
    case Environment.production:
      return "prod";
  }
}
