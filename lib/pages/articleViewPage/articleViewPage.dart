import 'package:freemedium/imports.dart';

/// holds the class for the ArticleViewPage
class ArticleViewPage extends StatefulWidget {
  // holds the url of the article to load
  final Map<String, String> _articleInformation;

  /// constructor to fetch the articleUrl
  ArticleViewPage(this._articleInformation);

  @override
  _ArticleViewPageState createState() => _ArticleViewPageState();
}

class _ArticleViewPageState extends State<ArticleViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageBody(),
    );
  }

  // holds the body of the page
  Widget _pageBody() {
    return SafeArea(
      child: Container(
        child: InAppWebView(
          initialUrl: widget._articleInformation["url"],
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              incognito: true,
              userAgent:
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36",
            ),
          ),
          shouldOverrideUrlLoading:
              (controller, shouldOverrideUrlLoadingRequest) async {
            print("urlLOADING: ${shouldOverrideUrlLoadingRequest.url}");
            return await ShouldOverrideUrlLoadingAction.CANCEL;
          },
        ),
      ),
    );
  }
}
