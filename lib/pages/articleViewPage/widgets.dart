import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/articleViewPage/articleViewPageControllers.dart';

/// holds the webView
Widget webViewW({
  @required String webViewUrl,
  @required BuildContext context,
}) {
  return InAppWebView(
    initialUrl: webViewUrl,
    onWebViewCreated: (controller) {
      articleViewWebViewController = controller;
    },
    initialOptions: InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        incognito: true,
        userAgent:
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36",
      ),
    ),
    onProgressChanged: (controller, progress) {
      // updating provider model data
      Provider.of<ArticleViewPageModel>(context, listen: false)
          .loadingPercentage = progress;
    },
    shouldOverrideUrlLoading:
        (controller, shouldOverrideUrlLoadingRequest) async {
      print("urlLOADING: ${shouldOverrideUrlLoadingRequest.url}");
      return await ShouldOverrideUrlLoadingAction.ALLOW;
    },
  );
}

/// holds the loading progress indicator for the page
Widget loadingProgressIndicator() {
  return Consumer<ArticleViewPageModel>(
    builder: (context, value, child) {
      // getting the loading value
      int _loadingPercent = value.loadingPercentage;
      return (_loadingPercent == 100)
          ? Container(child: null)
          : Center(
              child: CircularPercentIndicator(
                radius: 50.0,
                animateFromLastPercent: true,
                animation: true,
                progressColor: GlobalThemes().colorConstants["primaryColor"],
                backgroundColor: GlobalThemes().colorConstants["primaryWhite"],
                lineWidth: 4,
                center: Text(
                  "$_loadingPercent %",
                  style: TextStyle(fontSize: 16.0),
                ),
                percent: _loadingPercent / 100,
              ),
            );
    },
  );
}
