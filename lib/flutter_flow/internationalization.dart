import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en', 'ky'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
    String? kyText = '',
  }) =>
      [ruText, enText, kyText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashPage
  {
    'bvwqdohm': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // WelcomePage
  {
    'pws8vs6j': {
      'ru': 'Face ID',
      'en': '',
      'ky': '',
    },
    'ky75afvq': {
      'ru':
          'Повышенная безопасность и бесперебойная работа, защита от мошенничества и кражи личных данных',
      'en': '',
      'ky': '',
    },
    'dxd1ghjy': {
      'ru': 'Пропустить',
      'en': '',
      'ky': '',
    },
    '7rocwi5r': {
      'ru': 'Удобство',
      'en': '',
      'ky': '',
    },
    'md795j1h': {
      'ru':
          'Экономит время и усилия, предостовляя доступ к нескольким сервисам услуг в одном приложений',
      'en': '',
      'ky': '',
    },
    'fxysqcky': {
      'ru': 'Пропустить',
      'en': '',
      'ky': '',
    },
    'lx2ai84f': {
      'ru': 'Спектр услуг',
      'en': '',
      'ky': '',
    },
    'blrudfdk': {
      'ru':
          'Мы свяжем вас с надежными специалистами для выполнения задач через нашу удобную онлайн-платформу',
      'en': '',
      'ky': '',
    },
    'j2tgsegr': {
      'ru': 'Пропустить',
      'en': '',
      'ky': '',
    },
    'vrxdxbxe': {
      'ru': 'Открытость',
      'en': '',
      'ky': '',
    },
    '5mqfhswp': {
      'ru':
          'Надежные платежи  и взаимодействия.  Применяем технологии шифрования и прозрачную систему отзывов клиентов',
      'en': '',
      'ky': '',
    },
    'qqrrgdig': {
      'ru': 'Старт',
      'en': '',
      'ky': '',
    },
    '3hubhwu1': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // LoginPage
  {
    '446jelug': {
      'ru': 'Войти в Аккаунт',
      'en': '',
      'ky': '',
    },
    'tb25yzmv': {
      'ru': 'Полное Имя',
      'en': '',
      'ky': '',
    },
    'xumcx89c': {
      'ru': 'Полное Имя',
      'en': '',
      'ky': '',
    },
    '527k8xsg': {
      'ru': 'Пароль',
      'en': '',
      'ky': '',
    },
    '8e4y0x9u': {
      'ru': 'Пароль',
      'en': '',
      'ky': '',
    },
    'ze43he1j': {
      'ru': 'Войти',
      'en': '',
      'ky': '',
    },
    'igqq6y74': {
      'ru': 'Или',
      'en': '',
      'ky': '',
    },
    '0518192l': {
      'ru': 'Обязательное поле',
      'en': '',
      'ky': '',
    },
    'm3y0s8xc': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ky': '',
    },
    '0djkox8e': {
      'ru': 'Обязательное поле',
      'en': '',
      'ky': '',
    },
    '7955z2b8': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ky': '',
    },
    'o3w7tvnn': {
      'ru': 'Нет Аккаунта? ',
      'en': '',
      'ky': '',
    },
    '1myayf94': {
      'ru': 'Создать Аккаунт',
      'en': '',
      'ky': '',
    },
    'rqh6lov5': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // SignupPage
  {
    'shed4fd4': {
      'ru': 'Создать Аккаунт',
      'en': '',
      'ky': '',
    },
    'p6pafi0o': {
      'ru': 'Полное Имя',
      'en': '',
      'ky': '',
    },
    'dagogucq': {
      'ru': 'Полное Имя',
      'en': '',
      'ky': '',
    },
    'fy04sxg5': {
      'ru': 'Почта',
      'en': '',
      'ky': '',
    },
    't6x02coz': {
      'ru': 'Почта',
      'en': '',
      'ky': '',
    },
    'v6j9xt5m': {
      'ru': 'Пароль',
      'en': '',
      'ky': '',
    },
    '41ktw3mh': {
      'ru': 'Пароль',
      'en': '',
      'ky': '',
    },
    'ln3lzekv': {
      'ru': 'Согласен с ',
      'en': '',
      'ky': '',
    },
    'ltj3slho': {
      'ru': 'Условиями использования',
      'en': '',
      'ky': '',
    },
    'f1kgm4a7': {
      'ru': 'Войти',
      'en': '',
      'ky': '',
    },
    '35pzmxhs': {
      'ru': 'Или',
      'en': '',
      'ky': '',
    },
    'kvlepa3r': {
      'ru': 'Уже есть Аккаунт? ',
      'en': '',
      'ky': '',
    },
    'zbbe6vjw': {
      'ru': 'Войти',
      'en': '',
      'ky': '',
    },
    '4ddgmihp': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // SubcategoryPage
  {
    '5fn86omg': {
      'ru': 'Чистка',
      'en': '',
      'ky': '',
    },
    'csza2feb': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // HomePage
  {
    'ehktoxn8': {
      'ru': 'Здравствуйте, ',
      'en': '',
      'ky': '',
    },
    'zk7vkcjc': {
      'ru': 'Нургуль',
      'en': '',
      'ky': '',
    },
    'dosi4fas': {
      'ru': 'Искать...',
      'en': '',
      'ky': '',
    },
    '9xk8gssw': {
      'ru': 'Категории',
      'en': '',
      'ky': '',
    },
    'e09q2bk2': {
      'ru': 'Больше',
      'en': '',
      'ky': '',
    },
    'i8rkqgfc': {
      'ru': 'Главная',
      'en': '',
      'ky': '',
    },
  },
  // ContractorPage
  {
    'q2v39qm1': {
      'ru': 'Подрядчик',
      'en': '',
      'ky': '',
    },
    '7kpstrgl': {
      'ru': '4,97',
      'en': '',
      'ky': '',
    },
    '45ovgqui': {
      'ru': 'Чистка полов и ковров',
      'en': '',
      'ky': '',
    },
    '98bagj5o': {
      'ru': '100',
      'en': '',
      'ky': '',
    },
    '5v88f2oo': {
      'ru': 'c ',
      'en': '',
      'ky': '',
    },
    'u11ujq7q': {
      'ru': 'Omega plaza CLK',
      'en': '',
      'ky': '',
    },
    'sf3ce00v': {
      'ru': 'за м3',
      'en': '',
      'ky': '',
    },
    'zbpi8koa': {
      'ru':
          '\"Мега Клин\" - компания с огромным опытом работы в сфере наведения чистоты и порядка любого уровня сложности. У специалистов компании есть опыт работы не только с домами и офисами, но и медицинскими клиниками, банками, торговыми центрами, складскими помещениями, ангарами, швейными цехами, автозаправочными станциями, школами.',
      'en': '',
      'ky': '',
    },
    'jkchsqkm': {
      'ru': 'Хозяин',
      'en': '',
      'ky': '',
    },
    'rzniqbot': {
      'ru': 'Акба Азаматов',
      'en': '',
      'ky': '',
    },
    '3mxtytae': {
      'ru': 'Гарантия',
      'en': '',
      'ky': '',
    },
    '6f1jwag0': {
      'ru': 'Электроника',
      'en': '',
      'ky': '',
    },
    '88gv0rjk': {
      'ru': 'Вещи',
      'en': '',
      'ky': '',
    },
    'eadq4ya2': {
      'ru': 'Чистота',
      'en': '',
      'ky': '',
    },
    '2rgjiozx': {
      'ru': 'Без повреждений',
      'en': '',
      'ky': '',
    },
    'a0ipzyx8': {
      'ru': 'В срок',
      'en': '',
      'ky': '',
    },
    'm1ex8wuv': {
      'ru': 'В срок',
      'en': '',
      'ky': '',
    },
    't2rgx9g5': {
      'ru': '29,99',
      'en': '',
      'ky': '',
    },
    'zogqnn8n': {
      'ru': 'c',
      'en': '',
      'ky': '',
    },
    'xvbmo215': {
      'ru': ' за м3 ',
      'en': '',
      'ky': '',
    },
    '8zi6q95x': {
      'ru': '29,99',
      'en': '',
      'ky': '',
    },
    'pqxnlkae': {
      'ru': 'c',
      'en': '',
      'ky': '',
    },
    'tosglya1': {
      'ru': ' за м3 ',
      'en': '',
      'ky': '',
    },
    'fmw8m4i2': {
      'ru': 'Нанять',
      'en': '',
      'ky': '',
    },
    'z900o43t': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // MapPage
  {
    'ib4et9ro': {
      'ru': 'Ваше местоположение:',
      'en': '',
      'ky': '',
    },
    'dcoxlqe5': {
      'ru': 'Codify Academy',
      'en': '',
      'ky': '',
    },
    'syhnfmuu': {
      'ru': 'Заказать услугу',
      'en': '',
      'ky': '',
    },
    '9unfuo11': {
      'ru': 'Bekborbek, Jantaev 123',
      'en': '',
      'ky': '',
    },
    '3tt3tys5': {
      'ru': 'Электричество',
      'en': '',
      'ky': '',
    },
    'djtyyhmw': {
      'ru': 'Bekborbek, Jantaev 123',
      'en': '',
      'ky': '',
    },
    'n6w2cfvh': {
      'ru': 'Электричество',
      'en': '',
      'ky': '',
    },
    'ojfj3atk': {
      'ru': 'Электричество',
      'en': '',
      'ky': '',
    },
    'eio23rwv': {
      'ru': 'Водопровод',
      'en': '',
      'ky': '',
    },
    'x1xvac2z': {
      'ru': 'Чистка',
      'en': '',
      'ky': '',
    },
    '4fsyszii': {
      'ru': 'Карта',
      'en': '',
      'ky': '',
    },
  },
  // FaceIDMessagePage
  {
    'ir9dvhqq': {
      'ru':
          'Данные лица нужны для подтверждения личности, обеспечения безопасности услуг и платежей, соблюдения налогового законодательства',
      'en': '',
      'ky': '',
    },
    'wytc3grk': {
      'ru': 'Сканировать',
      'en': '',
      'ky': '',
    },
    '3qli3s08': {
      'ru': 'Face ID',
      'en': '',
      'ky': '',
    },
    'u6xbrtwn': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // FaceIDPage
  {
    'ejgfsi9g': {
      'ru': '100%',
      'en': '',
      'ky': '',
    },
    'd3vm88ci': {
      'ru': 'Сканируем ваше лицо',
      'en': '',
      'ky': '',
    },
    'zfoyw4n8': {
      'ru': 'Face ID',
      'en': '',
      'ky': '',
    },
    'ejew8qp8': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // AddPage
  {
    'wnq3hyz4': {
      'ru': 'Создать',
      'en': '',
      'ky': '',
    },
    'nlo4hydd': {
      'ru': 'Создать',
      'en': '',
      'ky': '',
    },
  },
  // SavedPage
  {
    'cx9y9w1m': {
      'ru': 'Сохраненное',
      'en': '',
      'ky': '',
    },
    '4i8tyrhe': {
      'ru': 'Создать',
      'en': '',
      'ky': '',
    },
  },
  // AccountPage
  {
    'iye8l7ss': {
      'ru': 'Профиль',
      'en': '',
      'ky': '',
    },
    'bh67rqxw': {
      'ru': 'Создать',
      'en': '',
      'ky': '',
    },
  },
  // subcategoryCard
  {
    'x9pu1kxr': {
      'ru': 'Чистка ковров',
      'en': '',
      'ky': '',
    },
  },
  // categoryListWidget
  {
    '6lptp015': {
      'ru': 'Чистка',
      'en': '',
      'ky': '',
    },
    'pppczika': {
      'ru': 'Больше',
      'en': '',
      'ky': '',
    },
  },
  // categoryCard
  {
    'tivi6dgf': {
      'ru': 'Чистка ковров',
      'en': '',
      'ky': '',
    },
  },
  // contractorCard
  {
    'f8taey9q': {
      'ru': 'Азамат Сабуров',
      'en': '',
      'ky': '',
    },
    'xb1fbc90': {
      'ru': 'Эксперт по чистке',
      'en': '',
      'ky': '',
    },
    'h21a0a0n': {
      'ru': 'Рейтинг',
      'en': '',
      'ky': '',
    },
    '421cdm17': {
      'ru': '4,9',
      'en': '',
      'ky': '',
    },
    '8u5jnb2u': {
      'ru': 'Работ всего',
      'en': '',
      'ky': '',
    },
    'sgh03tb4': {
      'ru': '128',
      'en': '',
      'ky': '',
    },
  },
].reduce((a, b) => a..addAll(b));
