import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:todoapp/services/auth.dart';

class MicrosoftLoginExample extends StatelessWidget {
  const MicrosoftLoginExample({Key? key}) : super(key: key);
  static final AuthService _authService = AuthService();

  static const String urlBase =
      "https://dev-portalapi.theksquaregroup.com/api/v1";

  dynamic loginSSSO(context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform:
              InAppWebViewOptions(userAgent: 'Chrome/96.0.4664.55 Mobile'),
        ),
        initialUrlRequest:
            URLRequest(url: Uri.parse('$urlBase/microsoftauth/login')),
        onLoadStop: (InAppWebViewController controller, url) async {
          String urlCurrentPath = url.toString();
          print(urlCurrentPath);
          var token = urlCurrentPath.split("token=")[1];
          print("token => $token");
          _authService.setToken(token);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginSSSO(context)),
              );
            },
            child: Text("Login with Microsoft"),
          ),
          TextButton(
              onPressed: () async {
                print(await AuthService().getToken());
              },
              child: Text("Read Token"))
        ],
      ),
    );
  }
}
