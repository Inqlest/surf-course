import 'package:flutter/material.dart';
import 'sorting_modal.dart';

Future<String> modal(BuildContext context, String currentOption) async {
  String? selectedOption = await showModalBottomSheet<dynamic>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    elevation: 5,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (BuildContext context) {
      return ListView(
        shrinkWrap: true,
        children: [
          SortingModal(
            currentOption: currentOption,
          ),
        ],
      );
    },
  );

  // ignore: unnecessary_null_comparison
  if (selectedOption == null) {
    return currentOption; // Замените на свое значение по умолчанию
  } else {
    return selectedOption;
  }
}
