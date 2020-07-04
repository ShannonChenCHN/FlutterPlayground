import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    @required this.controller,
    @required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    const searchIcon = const Icon(
      CupertinoIcons.search,
      color: Styles.searchIconColor,
    );
    final textField = CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      style: Styles.searchText,
      cursorColor: Styles.searchCursorColor,
    );
    final clearButton = GestureDetector(
      onTap: controller.clear,
      child: const Icon(
        CupertinoIcons.clear_thick_circled,
        color: Styles.searchIconColor,
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Styles.searchBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Row(
          children: [
            searchIcon,
            Expanded(child: textField),
            clearButton,
          ],
        ),
      ),
    );
  }
}
