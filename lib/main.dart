import 'package:akarbook/ui/pages/home/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'configs/app_environment.dart';
import 'configs/i18n/app_translations.dart';
import 'configs/loger.dart';
import 'configs/routes/app_pages.dart';
import 'configs/themes/app_themes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) {
      options.dsn = AppEnvironment.sentryDsn;
      // use breadcrumb tracking of WidgetsBindingObserver
      // options.useFlutterBreadcrumbTracking();
      // use breadcrumb tracking of platform Sentry SDKs
      options.useNativeBreadcrumbTracking();
    },
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 0),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.light,
      locale: AppTranslations.locale,
      fallbackLocale: AppTranslations.fallbackLocale,
      translations: AppTranslations(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}

