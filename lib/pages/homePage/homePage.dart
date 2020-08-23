import 'package:freemedium/imports.dart';

/// class to hold the homePage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homePageScaffoldKey,
      body: _homePageBody(),
    );
  }

  // holds the homePage body
  Widget _homePageBody() {
    return SafeArea(
      child: Container(
        child: null,
      ),
    );
  }
}
