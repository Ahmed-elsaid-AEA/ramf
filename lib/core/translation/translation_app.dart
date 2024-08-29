import 'package:get/get.dart';
import 'package:ramf2_app/core/resources/const_values.dart';
import 'package:ramf2_app/core/translation/ar_values.dart';
import 'package:ramf2_app/core/translation/en_values.dart';
import 'package:ramf2_app/core/translation/fr_values.dart';
import 'package:ramf2_app/core/translation/trans_keys.dart';

class TranslationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ConstValues.kLangAr: {
          TranslationKey.kRamfApp: ArabicValues.ramfApp,
          TranslationKey.kNext: ArabicValues.next,
          TranslationKey.kSignalCheck: ArabicValues.signalCheck,
          TranslationKey.kSatSTB: ArabicValues.satSTB,
          TranslationKey.kWriteSTBIP: ArabicValues.writeSTBIP,
          TranslationKey.kConnected: ArabicValues.connected,
          TranslationKey.kHome: ArabicValues.home,
          TranslationKey.kSettings: ArabicValues.settings,
          TranslationKey.kConnect: ArabicValues.connect,
          TranslationKey.kFind: ArabicValues.find,
          TranslationKey.kAutoLoop: ArabicValues.autoLoop,
          TranslationKey.kManual: ArabicValues.manual,
          TranslationKey.kAdvanced: ArabicValues.advanced,
          TranslationKey.kByName: ArabicValues.byName,
          TranslationKey.kElapsed: ArabicValues.elapsed,
        },
        ConstValues.kLangEn: {
          TranslationKey.kRamfApp: EnglishValues.ramfApp,
          TranslationKey.kNext: EnglishValues.next,
          TranslationKey.kSignalCheck: EnglishValues.signalCheck,
          TranslationKey.kSatSTB: EnglishValues.satSTB,
          TranslationKey.kWriteSTBIP: EnglishValues.writeSTBIP,
          TranslationKey.kConnected: EnglishValues.connected,
          TranslationKey.kHome: EnglishValues.home,
          TranslationKey.kSettings: EnglishValues.settings,
          TranslationKey.kConnect: EnglishValues.connect,
          TranslationKey.kFind: EnglishValues.find,
          TranslationKey.kAutoLoop: EnglishValues.autoLoop,
          TranslationKey.kManual: EnglishValues.manual,
          TranslationKey.kAdvanced: EnglishValues.advanced,
          TranslationKey.kByName: EnglishValues.byName,
          TranslationKey.kElapsed: EnglishValues.elapsed,
        },
        ConstValues.kLangFr: {
          TranslationKey.kNext: FranceValues.next,
          // TranslationKey.kSignalCheck: FranceValues.signalCheck,
        }
      };
}
