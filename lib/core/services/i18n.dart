import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://www.didierboelens.com/2018/04/internationalization---make-an-flutter-application-multi-lingual/

const String _storageKey = "GooglemapsGdansk_";
const List<String> _supportedLanguages = ['en','pl'];
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Translate {
  Locale _locale;
  Map<dynamic, dynamic> _localizedValues;
  VoidCallback _onLocaleChangedCallback;

  Iterable<Locale> supportedLocales() => _supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  String text(String key) {
    return (_localizedValues == null || _localizedValues[key] == null) ? '** $key not found' : _localizedValues[key];
  }

  get currentLanguage => _locale == null ? '' : _locale.languageCode;

  get locale => _locale;
  
  Future<Null> init([String language]) async {
    if (_locale == null){
      await setNewLanguage(language);
    }
    return null;
  }

  getPreferredLanguage() async {
    return _getSharedPrefs('language');
  }
  setPreferredLanguage(String lang) async {
    return _setSharedPrefs('language', lang);
  }

  Future<Null> setNewLanguage([String newLanguage, bool saveInPrefs = false]) async {
    String language = newLanguage;
    
    if (language == null){
      language = await getPreferredLanguage();
    }

    language = language == "" ? "en" : language;

    _locale = Locale(language, "");

    String jsonContent = await rootBundle.loadString("assets/locale/${_locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);

    if (saveInPrefs){
      await setPreferredLanguage(language);
    }

    if (_onLocaleChangedCallback != null){
        _onLocaleChangedCallback();
    }

    return null;
  }

  /// Callback to be invoked when the user changes the language
  set onLocaleChangedCallback(VoidCallback callback){
    _onLocaleChangedCallback = callback;
  }


  Future<String> _getSharedPrefs(String name) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(_storageKey + name) ?? '';
  }

  Future<bool> _setSharedPrefs(String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(_storageKey + name, value);
  }


  /// Singleton
  static final Translate _translations = new Translate._internal();
  factory Translate() {
    return _translations;
  }
  Translate._internal();
}

Translate i18n = new Translate();