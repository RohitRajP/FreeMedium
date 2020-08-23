import 'package:freemedium/imports.dart';
import './widgets.dart' as widgets;

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
        child: Stack(
          children: [
            widgets.webViewW(
              webViewUrl: widget._articleInformation["url"],
              context: context,
            ),
            Container(
              child: widgets.loadingProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
