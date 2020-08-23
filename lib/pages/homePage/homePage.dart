import 'package:freemedium/imports.dart';
import './functions.dart' as functions;
import './widgets.dart' as widgets;

/// class to hold the homePage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    // checking if the authFlag has been reached
    SharedPrefsOps().checkUserAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: homePageScaffoldKey,
        body: _homePageBody(),
        floatingActionButton: widgets.floatingActionButtonW(),
      ),
      onWillPop: functions.willPopScopeCallbackFun,
    );
  }

  // holds the homePage body
  Widget _homePageBody() {
    return SafeArea(
      child: Container(
        child:
            widgets.webViewW(context: context),
      ),
    );
  }
}
