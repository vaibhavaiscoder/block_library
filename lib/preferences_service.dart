import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList(
        'programmingLanguages',
        settings.programmingLanguages
            .map((lang) => lang.index.toString())
            .toList());

    print('Saved settings');
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isEmployed =
        preferences.getBool('isEmployed') ?? false; // Provide a default value
    final gender = Gender.values[preferences.getInt('gender') ?? 0];

    final programmingLanguagesIndicies =
        preferences.getStringList('programmingLanguages');

    final programmingLanguages = programmingLanguagesIndicies != null
        ? programmingLanguagesIndicies
            .map((stringIndex) =>
                ProgrammingLanguage.values[int.parse(stringIndex)])
            .toSet()
        : Set<ProgrammingLanguage>();

    return Settings(
      username: username ?? '', // Provide a default value
      gender: gender,
      programmingLanguages: programmingLanguages,
      isEmployed: isEmployed,
    );
  }

}
