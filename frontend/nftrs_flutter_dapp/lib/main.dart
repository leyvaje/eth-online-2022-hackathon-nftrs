import 'package:flutter/material.dart';
import 'package:nftrs_flutter_dapp/contract_provider.dart';
import 'package:nftrs_flutter_dapp/house_nftrs.dart';
import 'package:provider/provider.dart';

import 'metamask_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: ChangeNotifierProvider(
              create: (context) => MetaMaskProvider()..start(),
              builder: (context, child) {
                return Container(
                  child: Center(
                    child: Consumer<MetaMaskProvider>(
                      builder: (context, provider, child) {
                        late final String message;
                        if (provider.isConnected && provider.isOperatingChain) {
                          message = 'Connected';
                        } else if (provider.isConnected &&
                            !provider.isOperatingChain) {
                          message =
                              'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                        } else if (provider.isEnabled) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MaterialButton(
                                onPressed: () =>
                                    context.read<MetaMaskProvider>().connect(),
                                color: Colors.white,
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                              /*
                              Container(
                                color: Colors.white,
                                child: ListView(
                                  children: [
                                  ListTile(title: Text('Nft 1', style: TextStyle(color: Colors.white),)),
                                  ListTile(title: Text('Nft 2 ')),
                                ],),
                              )
                              */
                            ],
                          );
                        } else {
                          message = 'Please use a Web3 supported browser.';
                        }
                        return Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                );
              }),
        ));
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void main() {
    runApp(MyApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: ChangeNotifierProvider(
          create: (context) => MetaMaskProvider()..start(),
          builder: (context, child) {
            return Container(
              child: Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late final String message;
                    if (provider.isConnected && provider.isOperatingChain) {
                      message = 'Connected';
                    } else if (provider.isConnected &&
                        !provider.isOperatingChain) {
                      message =
                          'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                    } else if (provider.isEnabled) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            onPressed: () =>
                                context.read<MetaMaskProvider>().connect(),
                            color: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                  width: 250,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      message = 'Please use a Web3 supported browser.';
                    }
                    return Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}

*/