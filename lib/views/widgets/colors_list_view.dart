import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(radius: 36, backgroundColor: color),
          )
        : CircleAvatar(radius: 38, backgroundColor: color);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

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
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {
                  currentIndex = index;
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
