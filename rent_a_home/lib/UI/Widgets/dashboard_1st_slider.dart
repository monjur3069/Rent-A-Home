import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utils/constants.dart';

class DashBoardFirstSlider extends StatefulWidget {

  String title;
  String img;
  num price;
  num rating;
  num sN;

  DashBoardFirstSlider({
    required this.title,
    required this.img,
    required this.price,
    required this.rating,
    required this.sN,
    Key? key,
  }) : super(key: key,);

  @override
  State<DashBoardFirstSlider> createState() => _DashBoardFirstSliderState();
}

class _DashBoardFirstSliderState extends State<DashBoardFirstSlider> {

  bool favourite = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 200.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$currencySymbol' + ' '+widget.price.toString()+'/night',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                      ),
                      Text(
                        widget.rating.toString(),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                    print(widget.sN);
                  });
                },
                icon: Icon(
                  favourite ?
                  Icons.favorite_border : Icons.favorite,
                  size: 20.0.sp,
                ),
                color: favourite ? Colors.grey : Colors.red,
                style: ButtonStyle(),
              ),
            ))
      ],
    );
  }
}
