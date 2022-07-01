import 'package:flutter/material.dart';
import 'package:wallet_connect/wallet_connect.dart';
import 'package:flutter_3d_demo/utils/qr_scan_view.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late WCClient _wcClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Petto Camp',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Foreground color
                onPrimary: Colors.black,
                // Background color
                primary: Colors.white,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => _onButtonShowBottomSheet(),
              child: const Text(
                'Wallet Connect',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ));
  }

  void _onButtonShowBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Container(
              child: _bottomSheet(),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
            ),
          );
        });
  }

  Column _bottomSheet() {
    return Column(
      children: [
        const Text(
          'Connect Wallet',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black87),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              'Scan QR code',
              textAlign: TextAlign.center,
            ),
            onTap: () => {},
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              'Connect via QR',
              textAlign: TextAlign.center,
            ),
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => QRScanView()),
              // ).then((value) {
              //   if (value != null) {
              //     _qrScanHandler(value);
              //   }
              // })
              Navigator.pushNamed(context, '/home')
              // connector,
              // connectors
            },
          ),
        ),
      ],
    );
  }

  _qrScanHandler(String value) {
    final session = WCSession.from(value);
    debugPrint('session $session');
    final peerMeta = WCPeerMeta(
      name: "Example Wallet",
      url: "https://example.wallet",
      description: "Example Wallet",
      icons: [
        "https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png"
      ],
    );
    _wcClient.connectNewSession(session: session, peerMeta: peerMeta);
  }

  final connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'WalletConnect',
      description: 'WalletConnect Developer App',
      url: 'https://walletconnect.org',
      icons: [
        'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
      ],
    ),
  );


  // Create a connector
  // final connectors = WalletConnect(
  //   uri: 'wc:8a5e5bdc-a0e4-47...TJRNmhWJmoxdFo6UDk2WlhaOyQ5N0U=',
  //   clientMeta: const PeerMeta(
  //     name: 'WalletConnect',
  //     description: 'WalletConnect Developer App',
  //     url: 'https://walletconnect.org',
  //     icons: [
  //       'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  //     ],
  //   ),
  // );
}
