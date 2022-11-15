import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ap/storage_servise.dart/storage.dart';
import 'package:todo_ap/theme_provider.dart';
import 'package:todo_ap/utils/my_themes.dart';
import 'main_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  StorageService.getInstance();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("uz", "UZ")],
      path: "assets/translatsion",
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Styles.themeData(
          context.watch<ThemeProvider>().getIsLight(), context),
      themeMode: context.watch<ThemeProvider>().getIsLight()
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
