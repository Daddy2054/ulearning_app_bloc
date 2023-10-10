import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/widgets/base_text_widget.dart';
import 'bloc/payview_blocs.dart';
import 'bloc/payview_events.dart';
import 'bloc/payview_states.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({Key? key}) : super(key: key);

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print('------my url is ${args['url']}');

    context.read<PayWebViewBlocs>().add(TriggerWebView(args["url"]));
  }

  @override
  void dispose(){
    webViewController.clearCache();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PayWebViewBlocs, PayWebViewStates>(
        builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Payment page"),

        body : state.url==""?SizedBox(width:50.w, height:50.h,child: const CircularProgressIndicator(),): WebView(
            initialUrl: state.url,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {

            JavascriptChannel(
                name: "Pay",
                onMessageReceived: (JavascriptMessage message){
                  print(message.message);
                  Navigator.of(context).pop(message.message);
                }
            ),

          },
          onWebViewCreated: (WebViewController w){
              webViewController = w;
          },


        ),
      );
    });
  }
}
