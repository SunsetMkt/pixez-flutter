/*
 * Copyright (C) 2020. by perol_notsf, All rights reserved
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:mobx/mobx.dart';
import 'package:pixez/component/pixiv_image.dart';
import 'package:pixez/main.dart';
import 'package:pixez/models/illust.dart';
import 'package:pixez/network/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_setting.g.dart';

class UserSetting = _UserSetting with _$UserSetting;

abstract class _UserSetting with Store {
  late SharedPreferences prefs;
  static const String ZOOM_QUALITY_KEY = "zoom_quality";
  static const String SINGLE_FOLDER_KEY = "single_folder";
  static const String SAVE_FORMAT_KEY = "save_format";
  static const String LANGUAGE_NUM_KEY = "language_num";
  static const String CROSS_COUNT_KEY = "cross_count";
  static const String H_CROSS_COUNT_KEY = "h_cross_count";
  static const String PICTURE_QUALITY_KEY = "picture_quality";
  static const String MANGA_QUALITY_KEY = "manga_quality";
  static const String THEME_DATA_KEY = "theme_data";
  static const String IS_BANGS_KEY = "is_bangs";
  static const String IS_AMOLED_KEY = "is_amoled";
  static const String STORE_PATH_KEY = "save_store";
  static const String PICTURE_SOURCE_KEY = "picture_source";
  static const String ISHELPLESSWAY_KEY = "is_helplessway";
  static const String THEME_MODE_KEY = "theme_mode";
  static const String SAVE_MODE_KEY = "save_mode";
  static const String NOVEL_FONT_SIZE_KEY = "novel_font_size";
  static const String IS_RETURN_AGAIN_TO_EXIT_KEY = "is_return_again_to_exit";
  static const String IS_CLEAR_OLD_FORMAT_FILE_KEY = "is_clear_old_format_file";
  static const String IS_FOLLOW_AFTER_STAR = "is_follow_after_star";
  static const String IS_OVER_SANITY_LEVEL_FOLDER =
      "is_over_sanity_level_folder";
  static const String MAX_RUNNING_TASK_KEY = "max_running_task";
  static const String NSFW_MASK_KEY = "nsfw_mask";
  static const String SAVE_EFFECT_KEY = "save_effect";
  static const String SAVE_EFFECT_ENABLE_KEY = "save_effect_enable";
  static const String PAD_MODE_KEY = "pad_mode";
  static const String COPY_INFO_TEXT_KEY = "copy_info_text";
  static const String NAME_EVAL_KEY = "name_eval";
  static const String CROSS_ADAPT_KEY = "cross_adapt";
  static const String CROSS_ADAPT_WIDTH_KEY = "cross_adapt_width";
  static const String H_CROSS_ADAPT_KEY = "cross_adapt";
  static const String H_CROSS_ADAPT_WIDTH_KEY = "cross_adapt_width";
  static const String DEFAULT_PRIVATE_LIKE_KEY = "default_private_like";
  static const String IMAGE_PICKER_TYPE_KEY = "image_picker_type";
  static const String LONG_PRESS_SAVE_CONFIRM_KEY = "long_press_save_confirm";

  @observable
  int crossAdapterWidth = 100;
  @observable
  bool crossAdapt = false;
  @observable
  int hCrossAdapterWidth = 100;
  @observable
  bool hCrossAdapt = false;
  @observable
  String copyInfoText =
      "title:{title}\npainter:{user_name}\nillust id:{illust_id}";
  @observable
  bool animContainer = true;
  @observable
  bool isClearOldFormatFile = false;
  @observable
  bool isReturnAgainToExit = true;
  @observable
  bool? isHelplessWay = false;
  @observable
  int saveMode = 0;
  @observable
  bool isAMOLED = false;
  @observable
  String? storePath = null;
  @observable
  bool isBangs = false;
  @observable
  int zoomQuality = 0;
  @observable
  int pictureQuality = 0;
  @observable
  int mangaQuality = 0;
  @observable
  int languageNum = 0;
  @observable
  int welcomePageNum = 0;
  @observable
  int crossCount = 2;
  @observable
  int hCrossCount = 4;
  @observable
  int? displayMode;
  @observable
  bool disableBypassSni = false;
  @observable
  bool singleFolder = false;
  @observable
  bool overSanityLevelFolder = false;
  @observable
  bool hIsNotAllow = false;
  @observable
  bool followAfterStar = false;
  @observable
  String? pictureSource = ImageHost;
  @observable
  double novelFontsize = 16.0;
  @observable
  dynamic locale = Locale('en', 'US'); //stupid mobx generator
  @observable
  TextStyle novelTextStyle = TextStyle();
  @observable
  int maxRunningTask = 2;
  @observable
  bool nsfwMask = false;
  @observable
  int saveEffect = 0;
  @observable
  bool saveEffectEnable = false;
  @observable
  int padMode = 0;
  @observable
  int fileNameEval = 0;
  @observable
  String? nameEval;
  @observable
  bool defaultPrivateLike = false;
  @observable
  bool longPressSaveConfirm = false;
  @observable
  int imagePickerType = 1;

  @observable
  String? format = "";
  static const String intialFormat = "{illust_id}_p{part}";

  @action
  setCrossAdapt(bool value) async {
    crossAdapt = value;
    await prefs.setBool(CROSS_ADAPT_KEY, value);
  }

  @action
  setCrossAdapterWidth(int value) async {
    crossAdapterWidth = value;
  }

  persisitCrossAdapterWidth(int value) async {
    await prefs.setInt(CROSS_ADAPT_WIDTH_KEY, value);
  }

  @action
  setHCrossAdapt(bool value) async {
    hCrossAdapt = value;
    await prefs.setBool(H_CROSS_ADAPT_KEY, value);
  }

  @action
  setHCrossAdapterWidth(int value) async {
    hCrossAdapterWidth = value;
  }

  persisitHCrossAdapterWidth(int value) async {
    await prefs.setInt(H_CROSS_ADAPT_WIDTH_KEY, value);
  }

  @action
  setNameEval(String value) async {
    await prefs.setString(NAME_EVAL_KEY, value);
    nameEval = value;
  }

  @action
  setIsClearnOldFormatFile(bool v) async {
    await prefs.setBool(IS_CLEAR_OLD_FORMAT_FILE_KEY, v);
    isClearOldFormatFile = v;
  }

  @action
  setOverSanityLevelFolder(bool v) async {
    await prefs.setBool(IS_OVER_SANITY_LEVEL_FOLDER, v);
    overSanityLevelFolder = v;
  }

  @action
  setIsReturnAgainToExit(bool value) async {
    await prefs.setBool(IS_RETURN_AGAIN_TO_EXIT_KEY, value);
    this.isReturnAgainToExit = value;
  }

  @action
  setStorePath(String path) async {
    await prefs.setString(STORE_PATH_KEY, path);
    storePath = path;
  }

  @action
  setFollowAfterStar(bool value) async {
    await prefs.setBool(IS_FOLLOW_AFTER_STAR, value);
    followAfterStar = value;
  }

  @action
  setFileNameEval(int value) async {
    await prefs.setInt("file_name_eval", value);
    fileNameEval = value;
  }

  Color _stringToColor(String colorString) {
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    Color otherColor = new Color(value);
    return otherColor;
  }

  @observable
  ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      colorScheme: ThemeData()
          .colorScheme
          .copyWith(secondary: Colors.blue[400], primary: Colors.blue[400]),
      primaryColor: Colors.blue[400]);

  @observable
  ThemeMode themeMode = ThemeMode.system;

  @action
  setThemeMode(int themeMode) async {
    await prefs.setInt(THEME_MODE_KEY, themeMode);
    this.themeMode = ThemeMode.values[themeMode];
  }

  @action
  setIsBangs(bool v) async {
    await prefs.setBool(IS_BANGS_KEY, v);
    isBangs = v;
  }

  @action
  setIsAMOLED(bool v) async {
    await prefs.setBool(IS_AMOLED_KEY, v);
    isAMOLED = v;
  }

  @action
  setDefaultPrivateLike(bool v) async {
    await prefs.setBool(DEFAULT_PRIVATE_LIKE_KEY, v);
    defaultPrivateLike = v;
  }

  @action
  setPictureSource(String value) async {
    await prefs.setString(PICTURE_SOURCE_KEY, value);
    pictureSource = value;
  }

  @action
  setSaveMode(int value) async {
    await prefs.setInt(SAVE_MODE_KEY, value);
    saveMode = value;
  }

  @action
  setMaxRunningTask(int value) async {
    await prefs.setInt(MAX_RUNNING_TASK_KEY, value);
    maxRunningTask = value;
  }

  @action
  setNovelFontsizeWithoutSave(double v) async {
    novelFontsize = v;
    novelTextStyle = novelTextStyle.copyWith(fontSize: novelFontsize);
  }

  @action
  setNovelFontsize(double v) async {
    await prefs.setDouble(NOVEL_FONT_SIZE_KEY, v);
    novelFontsize = v;
    novelTextStyle = novelTextStyle.copyWith(fontSize: novelFontsize);
  }

  @action
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    disableBypassSni = prefs.getBool('disable_bypass_sni') ?? false;
    zoomQuality = prefs.getInt(ZOOM_QUALITY_KEY) ?? 0;
    singleFolder = prefs.getBool(SINGLE_FOLDER_KEY) ?? false;
    displayMode = prefs.getInt('display_mode');
    hIsNotAllow = prefs.getBool('h_is_not_allow') ?? false;
    welcomePageNum = prefs.getInt('welcome_page_num') ?? 0;
    crossCount = prefs.getInt(CROSS_COUNT_KEY) ?? 2;
    hCrossCount = prefs.getInt(H_CROSS_COUNT_KEY) ?? 4;
    pictureQuality = prefs.getInt(PICTURE_QUALITY_KEY) ?? 0;
    mangaQuality = prefs.getInt(MANGA_QUALITY_KEY) ?? 0;
    isBangs = prefs.getBool(IS_BANGS_KEY) ?? false;
    isAMOLED = prefs.getBool(IS_AMOLED_KEY) ?? false;
    isHelplessWay = prefs.getBool(ISHELPLESSWAY_KEY);
    int themeModeIndex = prefs.getInt(THEME_MODE_KEY) ?? 0;
    maxRunningTask = prefs.getInt(MAX_RUNNING_TASK_KEY) ?? 2;
    isReturnAgainToExit = prefs.getBool(IS_RETURN_AGAIN_TO_EXIT_KEY) ?? true;
    isClearOldFormatFile = prefs.getBool(IS_CLEAR_OLD_FORMAT_FILE_KEY) ?? false;
    overSanityLevelFolder = prefs.getBool(IS_OVER_SANITY_LEVEL_FOLDER) ?? false;
    followAfterStar = prefs.getBool(IS_FOLLOW_AFTER_STAR) ?? false;
    nsfwMask = prefs.getBool(NSFW_MASK_KEY) ?? false;
    novelFontsize = prefs.getDouble(NOVEL_FONT_SIZE_KEY) ?? 16.0;
    novelTextStyle = novelTextStyle.copyWith(fontSize: novelFontsize);
    saveMode = prefs.getInt(SAVE_MODE_KEY) ??
        (isHelplessWay == null ? 0 : (isHelplessWay! ? 2 : 1));
    pictureSource = disableBypassSni
        ? ImageHost
        : (prefs.getString(PICTURE_SOURCE_KEY) ?? ImageHost);
    splashStore.setHost(pictureSource!);
    saveEffect = prefs.getInt(SAVE_EFFECT_KEY) ?? 0;
    saveEffectEnable = prefs.getBool(SAVE_EFFECT_ENABLE_KEY) ?? false;
    padMode = prefs.getInt(PAD_MODE_KEY) ?? 0;
    copyInfoText = prefs.getString(COPY_INFO_TEXT_KEY) ?? copyInfoText;
    fileNameEval = prefs.getInt("file_name_eval") ?? 0;
    nameEval = prefs.getString(NAME_EVAL_KEY);
    crossAdapt = prefs.getBool(CROSS_ADAPT_KEY) ?? false;
    hCrossAdapt = prefs.getBool(CROSS_ADAPT_KEY) ?? false;
    final crossAdapterV = prefs.getInt(CROSS_ADAPT_WIDTH_KEY) ?? 100;
    final hCrossAdapterV = prefs.getInt(H_CROSS_ADAPT_WIDTH_KEY) ?? 100;
    crossAdapterWidth = min(2160, max(100, crossAdapterV));
    hCrossAdapterWidth = min(2160, max(100, hCrossAdapterV));
    defaultPrivateLike = prefs.getBool(DEFAULT_PRIVATE_LIKE_KEY) ?? false;
    longPressSaveConfirm = prefs.getBool(LONG_PRESS_SAVE_CONFIRM_KEY) ?? false;
    imagePickerType = prefs.getInt(IMAGE_PICKER_TYPE_KEY) ?? 1;

    for (var i in ThemeMode.values) {
      if (i.index == themeModeIndex) {
        this.themeMode = i;
        break;
      }
    }
    var colors = prefs.getStringList(THEME_DATA_KEY);
    if (colors != null) {
      if (colors.length < 2) {
        prefs.remove(THEME_DATA_KEY);
      } else {
        try {
          themeData = ThemeData(
              brightness: Brightness.light,
              colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: _stringToColor(colors[0]),
                  primary: _stringToColor(colors[0])));
        } catch (e) {
          print(e);
        }
      }
    }
    if (Platform.isAndroid) {
      try {
        var modeList = await FlutterDisplayMode.supported;
        if (displayMode != null && modeList.length > displayMode!) {
          await FlutterDisplayMode.setPreferredMode(modeList[displayMode!]);
        }
      } catch (e) {}
    }
    languageNum = prefs.getInt(LANGUAGE_NUM_KEY) ?? 0;
    format = prefs.getString(SAVE_FORMAT_KEY);
    if (format == null || format!.isEmpty) format = intialFormat;
    ApiClient.Accept_Language = languageList[languageNum];
    apiClient.httpClient.options.headers[HttpHeaders.acceptLanguageHeader] =
        ApiClient.Accept_Language;
    locale = iSupportedLocales[languageNum];
  }

  int toRealLanguageNum(int num) {
    switch (num) {
      case 1:
        return 2;
      case 2:
        return 3;
      case 3:
        return 1;
    }
    return num;
  }

  @action
  setImagePickerType(int value) async {
    await prefs.setInt(IMAGE_PICKER_TYPE_KEY, value);
    imagePickerType = value;
  }

  bool imagePickerHasChoose() {
    return prefs.getInt(IMAGE_PICKER_TYPE_KEY) != null;
  }

  @action
  setThemeData(List<String> data) async {
    Colors.black.computeLuminance();
    await prefs.setStringList(THEME_DATA_KEY, data);
    themeData = ThemeData(
      brightness: Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
          secondary: _stringToColor(data[0]), primary: _stringToColor(data[0])),
    );
  }

  @action
  setMangaQuality(int value) async {
    await prefs.setInt(MANGA_QUALITY_KEY, value);
    mangaQuality = value;
  }

  @action
  setPictureQuality(int value) async {
    await prefs.setInt(PICTURE_QUALITY_KEY, value);
    pictureQuality = value;
  }

  @action
  setCrossCount(int value) async {
    crossCount = value;
    await prefs.setInt(CROSS_COUNT_KEY, value);
  }

  @action
  setHCrossCount(int value) async {
    hCrossCount = value;
    await prefs.setInt(H_CROSS_COUNT_KEY, value);
  }

  @action
  setWelcomePageNum(int value) async {
    await prefs.setInt('welcome_page_num', value);
    welcomePageNum = value;
  }

  @action
  setHIsNotAllow(bool value) async {
    await prefs.setBool('h_is_not_allow', value);
    hIsNotAllow = value;
  }

  @action
  setDisableBypassSni(bool value) async {
    await prefs.setBool('disable_bypass_sni', value);
    disableBypassSni = value;
  }

  @action
  setDisplayMode(int value) async {
    await prefs.setInt('display_mode', value);
    displayMode = value;
  }

  @action
  Future<void> setSingleFolder(bool value) async {
    await prefs.setBool(SINGLE_FOLDER_KEY, value);
    singleFolder = value;
  }

  final languageList = [
    'en-US',
    'zh-CN',
    'zh-TW',
    'ja',
    'ko',
    'ru',
    'es',
    'tr'
  ];

  List<Locale> iSupportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
    Locale('ja'),
    Locale('ko'),
    Locale('ru'),
    Locale('es'),
    Locale('tr')
  ];

  @action
  setLanguageNum(int value) async {
    await prefs.setInt(LANGUAGE_NUM_KEY, value);
    languageNum = value;
    ApiClient.Accept_Language = languageList[languageNum];
    apiClient.httpClient.options.headers[HttpHeaders.acceptLanguageHeader] =
        ApiClient.Accept_Language;
    locale = iSupportedLocales[languageNum];
  }

  @action
  setFormat(String format) async {
    await prefs.setString(SAVE_FORMAT_KEY, format.trim());
    this.format = format;
  }

  @action
  Future<void> change(int value) async {
    await prefs.setInt(ZOOM_QUALITY_KEY, value);
    zoomQuality = value;
  }

  @action
  Future<void> changeNsfwMask(bool value) async {
    await prefs.setBool(NSFW_MASK_KEY, value);
    nsfwMask = value;
  }

  @action
  Future<void> setSaveEffectEnable(bool value) async {
    await prefs.setBool(SAVE_EFFECT_ENABLE_KEY, value);
    saveEffectEnable = value;
  }

  @action
  Future<void> setSaveEffect(int value) async {
    await prefs.setInt(SAVE_EFFECT_KEY, value);
    saveEffect = value;
  }

  @action
  Future<void> setPadMode(int value) async {
    await prefs.setInt(PAD_MODE_KEY, value);
    padMode = value;
  }

  @action
  Future<void> setAnimContainer(bool anim) async {
    animContainer = anim;
  }

  @action
  Future<void> setCopyInfoText(String text) async {
    copyInfoText = text;
    await prefs.setString(COPY_INFO_TEXT_KEY, text);
  }

  @action
  Future<void> setLongPressSaveConfirm(bool value) async {
    await prefs.setBool(LONG_PRESS_SAVE_CONFIRM_KEY, value);
    longPressSaveConfirm = value;
  }

  String illustToShareInfoText(Illusts illusts) {
    final str = copyInfoText
        .replaceAll('{illust_id}', illusts.id.toString())
        .replaceAll("{user_name}", illusts.user.name)
        .replaceAll("{tags}", illusts.tags.map((e) => e.name).join(', '))
        .replaceAll("{user_id}", illusts.user.id.toString())
        .replaceAll("{title}", illusts.title);
    return str;
  }
}
