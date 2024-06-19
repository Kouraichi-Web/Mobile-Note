import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class DropDown extends StatefulWidget {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onPrivate;

  DropDown({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.onPrivate,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  SampleItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardColor: Colors.red,
      ),
      child: PopupMenuButton<SampleItem>(
        initialValue: selectedItem,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: ListTile(
              leading: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              title: Text(
                "Supprimer",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: ListTile(
              leading: Icon(
                Icons.border_color,
                color: Colors.black,
              ),
              title: Text(
                "Modifié",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              title: Text(
                "Privé",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        onSelected: (value) {
          switch (value) {
            case SampleItem.itemOne:
              widget.onDelete();
              break;
            case SampleItem.itemTwo:
              widget.onEdit();
              break;
            case SampleItem.itemThree:
              widget.onPrivate();
              break;
            default:
          }
        },
      ),
    );
  }
}
