import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
 late  int currentIndex;

  List<Color> colors = [
    Color(0xfff44336),
    Color(0xffe91e63),
    Color(0xff9c27b0),
    Color(0xff673ab7),
    Color(0xff3f51b5),
    Color(0xff2196f3),
    Color(0xff03a9f4),
    Color(0xff00bcd4),
    Color(0xff009688),
    Color(0xff4caf50),
    Color(0xff8bc34a),
  ];

  @override
  void initState() {
    currentIndex = colors.indexWhere(
      (color) => color.value == widget.note.color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.note.color = colors[index].value;
                  widget.note.save();
                });
              },
              child: ColorItem(
                isActive: index == currentIndex,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
