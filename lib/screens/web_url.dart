import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prime_web/helpers/Constant.dart';
import '../widgets/admob_service.dart';
import '../widgets/load_web_view.dart';

class WebUrlScreen extends StatefulWidget {
  final String url;
  WebUrlScreen(this.url);

  static const routeName = '/webView';

  @override
  State<WebUrlScreen> createState() => _WebUrlScreenState();
}

class _WebUrlScreenState extends State<WebUrlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Flexible(flex: 9, child: LoadWebView(widget.url, true)),

        // to show banner ads
        if (showBannerAds)
          Flexible(
            flex: 1,
            child: Container(
              width: 320.0,
              // height: 100.0,
              child: AdWidget(
                  key: UniqueKey(), ad: AdMobService.createBannerAd()..load()),
            ),
          ),
      ],
    ));
  }
}
