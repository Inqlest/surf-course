import 'package:flutter/material.dart';

class SortingModal extends StatefulWidget {
  final String currentOption;
  const SortingModal({Key? key, required this.currentOption}) : super(key: key);

  @override
  State<SortingModal> createState() => _SortingModalState(currentOption: currentOption);
}

class _SortingModalState extends State<SortingModal> {
  final String currentOption;
  List<String> option = [
    'Без Сортировки',
    'По имени от А до Я',
    'По имени от Я до А',
    'По возрастанию',
    'По убыванию',
    'По типу',
  ];
  _SortingModalState({required this.currentOption}) : selectedOption = currentOption;
  String selectedOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21.0,
            vertical: 24.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Сортировка",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, selectedOption);
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        RadioListTile(
          title: Text(option[0]),
          activeColor: const Color.fromRGBO(103, 205, 0, 1),
          value: option[0],
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value.toString();
              Navigator.pop(context, value);
            });
          },
        ),
        const Divider(
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(241, 241, 241, 1),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "По имени",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        for (int i = 1; i < 3; i++)
          RadioListTile(
            title: Text(option[i]),
            activeColor: const Color.fromRGBO(103, 205, 0, 1),
            value: option[i],
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value.toString();
                Navigator.pop(context, value);
              });
            },
          ),
        const Divider(
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(241, 241, 241, 1),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "По цене",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        for (int i = 3; i < 5; i++)
          RadioListTile(
            title: Text(option[i]),
            activeColor: const Color.fromRGBO(103, 205, 0, 1),
            value: option[i],
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value.toString();
                Navigator.pop(context, value);
              });
            },
          ),
        const Divider(
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(241, 241, 241, 1),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "По типу",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        for (int i = 5; i < option.length; i++)
          RadioListTile(
            title: Text(option[i]),
            activeColor: const Color.fromRGBO(103, 205, 0, 1),
            value: option[i],
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value.toString();
                Navigator.pop(context, value);
              });
            },
          ),
        GestureDetector(
            onTap: () {
              Navigator.pop(context, selectedOption);
            },
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Color.fromRGBO(103, 205, 0, 1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 138, vertical: 14),
                    child: Text(
                      'ГОТОВО',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )))
      ],
    );
  }
}
