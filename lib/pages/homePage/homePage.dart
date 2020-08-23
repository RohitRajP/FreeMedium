import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/homePage/homePageControllers.dart';

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
        child: InAppWebView(
          initialUrl: "https://medium.com",
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldInterceptAjaxRequest: true,
              useShouldInterceptFetchRequest: true,
              useShouldOverrideUrlLoading: true,
              userAgent:
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36",
            ),
          ),
          shouldOverrideUrlLoading:
              (controller, shouldOverrideUrlLoadingRequest) async{
            print("urlLOADING: ${shouldOverrideUrlLoadingRequest.url}");
            return await ShouldOverrideUrlLoadingAction.CANCEL;
          },
        ),
      ),
    );
  }
}
