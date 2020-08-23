import 'package:freemedium/imports.dart';

void main() => runApp(MyApp());

/// holds the main entrypoint class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalThemes().themeData,
      home: HomePage(),
    );
  }
}
