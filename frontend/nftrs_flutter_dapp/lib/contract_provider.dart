import 'package:flutter/material.dart';

import 'house_nftrs.dart';

class ContractProvider extends ChangeNotifier {
  List<HouseNftrs> availableNftrs = [];

  fetchAvailableNftrs() {
    var h = HouseNftrs();
    h.tokenId = "1";
    h.tokenName = "Demo";
    availableNftrs = [h];
    notifyListeners();
  }

  buyNftrs() {}
}
