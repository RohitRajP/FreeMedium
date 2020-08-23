import 'package:freemedium/imports.dart';

void main() => runApp(MyApp());

/// holds the main entrypoint class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalThemes().themeData,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomePageModel>(
            create: (context) => HomePageModel(),
          )
        ],
        child: HomePage(),
      ),
      routes: {
        '/homePage': (context) => HomePage(),
        '/articleViewPage': (context) =>
            ArticleViewPage(ModalRoute.of(context).settings.arguments)
      },
    );
  }
}
