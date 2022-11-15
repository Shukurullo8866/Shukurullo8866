import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_ap/utils/colors.dart';

class PrioritiyPicer extends StatefulWidget {
  ValueChanged<int> onSelected;
  PrioritiyPicer({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<PrioritiyPicer> createState() => _PrioritiyPicerState();
}

class _PrioritiyPicerState extends State<PrioritiyPicer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemBuilder: ((context, index) {
          return categoryItem(index + 1);
        }),
      ),
    );
  }

  Widget categoryItem(int index) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            color: MyColors.color_indicator_unselected,
            child: Center(
              child: Icon(
                Icons.flag_outlined,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 4,),
          Expanded(child: Text(index.toString(),style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
