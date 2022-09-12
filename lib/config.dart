enum Environment {
  staging,
  production,
}

Environment environment = Environment.staging;

String get whatEnv {
  switch (environment) {
    case Environment.staging:
      return "staging";
    case Environment.production:
      return "prod";
  }
}
