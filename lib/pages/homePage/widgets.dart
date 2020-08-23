import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/homePage/homePageControllers.dart';
import './functions.dart' as functions;

/// holds the floatingActionBar for the app
Widget floatingActionButtonW() {
  return Consumer<HomePageModel>(
    builder: (context, value, child) {
      // getting the loading percentage
      int _loadingPercent = value.loadingPercentage;
      return FloatingActionButton.extended(
        onPressed: (_loadingPercent == 100)
            ? () {
                webViewController.reload();
              }
            : () {},
        label: (_loadingPercent == 100) ? Text("Refresh") : Text("Loading"),
        icon: (_loadingPercent == 100)
            ? Icon(Icons.refresh)
            : CircularPercentIndicator(
                radius: 18.0,
                animateFromLastPercent: true,
                animation: true,
                progressColor: GlobalThemes().colorConstants["primaryWhite"],
                backgroundColor: GlobalThemes().colorConstants["primaryColor"],
                lineWidth: 3,
                percent: _loadingPercent / 100,
              ),
      );
    },
  );
}

/// holds the webView for the page
Widget webViewW({@required BuildContext context}) {
  return InAppWebView(
    initialUrl: "https://medium.com/",
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
    onProgressChanged: (controller, progress) async {
      // updating provider model data
      Provider.of<HomePageModel>(context, listen: false).loadingPercentage =
          progress;
    },
    shouldOverrideUrlLoading: (controller, shouldOverrideUrlLoadingRequest) =>
        functions.overrideUrlLoadingFun(
      context: context,
      controller: controller,
      shouldOverrideUrlLoadingRequest: shouldOverrideUrlLoadingRequest,
    ),
  );
}
