import 'package:flutter/material.dart';
import 'package:task/screans/second_screan.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.home_outlined,title: 'الرئيسيه',),
            TabItem(icon: Icons.home_repair_service, title: "الموردين",),
            TabItem(icon: Icons.shopping_cart_outlined, title: "السله"),
            TabItem(icon: Icons.flag_outlined, title: "الموقع"),
            TabItem(icon: Icons.assignment_late_sharp, title: "احدث العروض",),
          ],
          initialActiveIndex: 0,
          backgroundColor: Colors.deepOrange,
          color: Colors.white,
          height:50,
        ),
        drawer:  Drawer(
          child: Builder(
              builder: (ctx) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context)=> MainScreen()));
                    },
                      child: Text('Go to Main Screen'),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context)=> SecondScreen()));
                    },
                      child: Text('Go to Second Screen'),
                    ),
                  ],
                );
              }
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text(
            'عروض جهينه',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'عوده',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ),
            ),
          ],
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 130,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.asset(
                    'lib/assets/images/1.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'مصنع جهينه',
                                style: TextStyle(
                                  fontSize: 22 ,
                                ),
                              ),
                              Text(
                                'عباس العقاد مدينه نصر 52',
                                style: TextStyle(
                                  fontSize: 22 ,
                                ),
                              ),
                              SizedBox(height: 30,),
                            ],
                          ),
                          Card(
                            elevation: 4,
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                'lib/assets/images/2.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Positioned(
                        left: 5,
                        bottom: 5 ,
                        child:  Text('بنتهي العرض في 31/5/2022'),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  [
                          const Text(
                            'مصنع جهينه',
                            style: TextStyle(
                              fontSize: 18 ,
                            ),
                          ),
                          Row(
                            children:const [
                              Text(
                                '183 جنيه',
                                style: TextStyle(
                                  fontSize: 18 ,
                                ),
                              ),
                              Icon(Icons.center_focus_strong,color: Colors.green,)
                            ],
                          ),
                          const Text(
                            'حد ادني للطلبيه 25000 جنيه',
                            style: TextStyle(
                              fontSize: 18 ,
                            ),
                          ),
                          const Text(
                            'اقل كميه 3 كرتونه',
                          ),
                        ],
                      ),
                      Card(
                        elevation: 4,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'lib/assets/images/2.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 190,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2 ,
                      mainAxisSpacing: 10 ,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 170
                  ),
                  itemBuilder:(context,_){
                    return Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 75,
                            margin: EdgeInsets.only(bottom: 5),
                            child: Image.asset('lib/assets/images/3.jpg',fit: BoxFit.fill,),
                          ),
                          const Text('لبن بخيره كامل الدسم'),
                          const Text('100 مم'),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 180,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const[
                                  Text('اضف الي العربه',style: TextStyle(color: Colors.white),),
                                  Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
