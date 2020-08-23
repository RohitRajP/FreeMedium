import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/homePage/homePageControllers.dart';
import './functions.dart' as functions;
import './widgets.dart' as widgets;

/// class to hold the homePage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: InAppWebView(
          initialUrl: "https://medium.com",
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              userAgent:
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36",
            ),
          ),
          onProgressChanged: (controller, progress) {
            // updating provider model data
            Provider.of<HomePageModel>(context, listen: false)
                .loadingPercentage = progress;
          },
          shouldOverrideUrlLoading:
              (controller, shouldOverrideUrlLoadingRequest) async {
            print("urlLOADING: ${shouldOverrideUrlLoadingRequest.url}");
            Navigator.pushNamed(context, "/articleViewPage",
                arguments: {"url": shouldOverrideUrlLoadingRequest.url});
            return await ShouldOverrideUrlLoadingAction.CANCEL;
          },
        ),
      ),
    );
  }
}
