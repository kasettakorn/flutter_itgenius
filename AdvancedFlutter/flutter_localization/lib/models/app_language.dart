class AppLanguage {
  final String languageName;
  final String languageCode;

  AppLanguage(this.languageName, this.languageCode);

  static List<AppLanguage> languages() {
    return <AppLanguage>[
      AppLanguage('English', 'en'),
      AppLanguage('ภาษาไทย', 'th'),
    ];
  }

  bool operator ==(dynamic other) =>
      other != null &&
      other is AppLanguage &&
      this.languageName == other.languageName;

  @override
  int get hashCode => super.hashCode;
}
