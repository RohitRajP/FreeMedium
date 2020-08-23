import 'package:freemedium/imports.dart';
import 'package:freemedium/models/articleViewPage/articleViewPageModel.dart';

void main() => runApp(MyApp());

/// holds the main entrypoint class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageModel>(
          create: (context) => HomePageModel(),
        ),
        ChangeNotifierProvider<ArticleViewPageModel>(
          create: (context) => ArticleViewPageModel(),
        )
      ],
      child: MaterialApp(
        theme: GlobalThemes().themeData,
        home: HomePage(),
        routes: {
          '/homePage': (context) => HomePage(),
          '/articleViewPage': (context) =>
              ArticleViewPage(ModalRoute.of(context).settings.arguments)
        },
      ),
    );
  }
}
