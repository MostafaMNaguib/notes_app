import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xff41729F),
    Color(0xff5885AF),
    Color(0xff274472),
    Color(0xffC3E0E5),
    Color(0xff05445E),
    Color(0xff189AB4),
    Color(0xff75E6DA),
    Color(0xffD4F1F4),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: (){
                  currentIndex = index;
                  setState(() {});
                },
                child: ColorItem(
                  isActive: currentIndex == index,
                  color: colors[index],
                ),
              ),
            );
          },

      ),
    );
  }
}
