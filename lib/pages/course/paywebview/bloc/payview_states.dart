class PayWebViewStates {
  final String url;

  const PayWebViewStates({this.url = ""});

  //we are going to pass event.url
  PayWebViewStates copyWith({String? url}) {
    return PayWebViewStates(url: url ?? this.url);
  }
}
