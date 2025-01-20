import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  const Dropdown({
    super.key,
    this.value,
    this.height,
    this.width,
    this.validator,
    this.hintText = 'Selecione',
    required this.onChanged,
    required this.items,
    required this.itemToString,
  });

  final T? value;
  final ValueChanged<T?> onChanged;
  final List<T> items;
  final String Function(T) itemToString;
  final double? height;
  final double? width;
  final String hintText;
  final String? Function(String?)? validator;

  List<DropdownMenuItem<T>> _addDividersAfterItems(List<T> items) {
    final List<DropdownMenuItem<T>> menuItems = [];
    for (int i = 0; i < items.length; i++) {
      final T item = items[i];

      menuItems.add(
        DropdownMenuItem<T>(
          value: item,
          child: Text(
            itemToString(item),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      );

      if (i < (items.length - 1)) {
        menuItems.add(
          DropdownMenuItem<T>(
            enabled: false,
            child: const Divider(),
          ),
        );
      }
    }

    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      } else {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 8.0;
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        items: _addDividersAfterItems(items),
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        hint: Text(
          hintText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        buttonStyleData: ButtonStyleData(
          height: height,
          width: width,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color.fromARGB(255, 240, 241, 247),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: _getCustomItemsHeights(),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down),
          openMenuIcon: Icon(Icons.keyboard_arrow_up),
        ),
      ),
    );
  }
}
