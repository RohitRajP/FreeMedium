// import 'package:freemedium/imports.dart';
import 'package:freemedium/global/controllers/homePage/homePageControllers.dart';
import 'package:freemedium/imports.dart';

/// used to handle willPopScope callback
Future<bool> willPopScopeCallbackFun() async {
  // checking if the browser can go back
  if (await webViewController.canGoBack()) {
    // check if it is at the homePage
    if (await webViewController.getUrl() == "https://medium.com/") {
      return true;
    }
    webViewController.goBack();
    return false;
  } else {
    return true;
  }
}

/// used to handle the OverrideUrlLoading
Future<ShouldOverrideUrlLoadingAction> overrideUrlLoadingFun(
    {@required InAppWebViewController controller,
    @required ShouldOverrideUrlLoadingRequest shouldOverrideUrlLoadingRequest,
    @required BuildContext context}) async {
  // flag to decide if the redirect must be pushed to new page
  bool _navPushFlag = false;
  // getting the url navigation
  String _fetchUrl = shouldOverrideUrlLoadingRequest.url;
  // checking if user is authenticated
  bool _isAuthenticated =
      Provider.of<HomePageModel>(context, listen: false).userAuthenticated;

  // checking if user has not been logged in
  if (_isAuthenticated == true) {
    _navPushFlag = true;
  } else {
    // check if the current urls are redirect urls in anyway
    if (_fetchUrl.contains("https://medium.com/?source=login")) {
      // setting the user as authenticated
      Provider.of<HomePageModel>(context, listen: false).userAuthenticated =
          true;
    }
  }

  if (_navPushFlag) {
    // pushing URL to next page
    Navigator.pushNamed(context, "/articleViewPage",
        arguments: {"url": shouldOverrideUrlLoadingRequest.url});
    // cancelling redirect in the current page
    return await ShouldOverrideUrlLoadingAction.CANCEL;
  } else {
    return await ShouldOverrideUrlLoadingAction.ALLOW;
  }
}
