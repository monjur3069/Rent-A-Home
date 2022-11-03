import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_a_home/db_helper/db.dart';

import '../Widgets/dashboard_1st_slider.dart';
import '../Widgets/dashboard_2nd_slider.dart';
import '../Widgets/dashboard_drawer.dart';


class DashBoardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>(); //Used for opening drawer
  var searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: DashBoardDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.deepOrange,
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 5.w),
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  'Find, ',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  'your Home',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold,color: Colors.deepOrange),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45.h,
                    child: TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3.w, color: Colors.white30)),
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.black12,
                          filled: true),
                      validator: (value) {},
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Center(
                  child: Container(
                    child: Image.asset(
                      'images/filter.png',
                      height: 35.h,
                      width: 35.w,
                      fit: BoxFit.cover,
                      color: Colors.deepOrange,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dashboardMap.length,
                itemBuilder: (context,index){
                  return InkWell(
                    child: Row(
                      children: [
                        DashBoardFirstSlider(
                          title: dashboardMap[index][dashboardDataTitle],
                          img: dashboardMap[index][dashboardDataImg],
                          price: dashboardMap[index][dashboardDataPrice],
                          rating: dashboardMap[index][dashboardDataRating],
                          sN: dashboardMap[index][dashboardDataSerialNumber],
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Center(
                          child: SizedBox(
                            height: 50.h,
                            width: 1.w,
                            child: Container(color: Colors.amber),
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
                /*children: [
                  InkWell(
                    child: DashBoardFirstSlider(
                      title: '7 star Hotel Room',
                      img: img3,
                      price: 9999,
                      rating: 5.0,
                      sN: 1,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 1.w,
                      child: Container(color: Colors.amber),
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  InkWell(
                    child: DashBoardFirstSlider(
                        title: '5 star Hotel Room',
                        img: img2,
                        price: 5999,
                        rating: 4.5,
                        sN: 2),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 1.w,
                      child: Container(color: Colors.amber),
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  InkWell(
                    child: DashBoardFirstSlider(
                        title: '3 star Hotel Room',
                        img: img1,
                        price: 3999,
                        rating: 5.0,
                        sN: 3),
                    onTap: () {},
                  ),
                ],*/
              ),
            ),
            Divider(color: Colors.deepOrange,thickness: 0.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Our',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                    Text(' Rooms',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                  ],
                ),
                Row(
                  children: [
                    Text('View All',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
                    SizedBox(width: 10.w,),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),color: Colors.grey,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                        },
                        icon: Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10.w,),

                  ],
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.8),
                itemCount: dashboardMap.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: DashBoardSecondSlider(
                      title: dashboardMap[index][dashboardDataTitle],
                      img: dashboardMap[index][dashboardDataImg],
                      price: dashboardMap[index][dashboardDataPrice],
                      rating: dashboardMap[index][dashboardDataRating],
                      sN: dashboardMap[index][dashboardDataSerialNumber],
                  ),
                    /*Container(
                      color: Colors.grey,
                    ),*/
                    onTap: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
