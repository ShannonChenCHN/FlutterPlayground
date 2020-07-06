import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/app_state_model.dart';
import 'product_row_item.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final builder = (context, model, child) {
      final products = model.getProducts();
      const navigationBar =
          CupertinoSliverNavigationBar(largeTitle: Text('Cupertino Store'));
      
      final sliverListBuilderDelegate = SliverChildBuilderDelegate(
        (context, index) {
          if (index < products.length) {
            return ProductRowItem(
              index: index,
              product: products[index],
              lastItem: index == products.length - 1,
            );
          }

          return null;
        },
      );
      final listView = SliverSafeArea(
        top: false,
        minimum: const EdgeInsets.only(top: 8),
        sliver: SliverList(
          delegate: sliverListBuilderDelegate,
        ),
      );

      return CustomScrollView(
        semanticChildCount: products.length,
        slivers: <Widget>[navigationBar, listView],
      );
    };

    return Consumer<AppStateModel>(
      builder: builder,
    );
  }
}
