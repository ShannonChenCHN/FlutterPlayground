import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'screens/product_list_tab.dart';   
import 'screens/search_tab.dart';         
import 'screens/shopping_cart_tab.dart'; 

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(home: CupertinoStoreHomePage());
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const productsItem = BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('Products'),
    );
    const searchItem = BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('Search'),
    );
    const cartItem = BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('Cart'),
    );
    final tabBar = CupertinoTabBar(items: const <BottomNavigationBarItem>[
      productsItem,
      searchItem,
      cartItem,
    ]);

    final tabBuilder = (context, index) {
      CupertinoTabView returnValue;
      switch (index) {
        case 0:
          returnValue = CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: ProductListTab(),
            );
          });
          break;
        case 1:
          returnValue = CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: SearchTab(),
            );
          });
          break;
        case 2:
          returnValue = CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: ShoppingCartTab(),
            );
          });
          break;
      }
      return returnValue;
    };

    return CupertinoTabScaffold(
      tabBar: tabBar,
      tabBuilder: tabBuilder,
    );
  }
}
