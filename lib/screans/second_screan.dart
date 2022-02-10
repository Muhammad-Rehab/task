import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'main_screan.dart';


class SecondScreen extends StatelessWidget {


  List<String> products = [
    'البان','خضروات','زيت وسمنه','صلصه وصوص','بقولبات','مجمدات','فاكهه','حلويات',
  ];
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
              Card(
                elevation: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'lib/assets/images/2.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'مصنع جهينه',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            ' جنيه',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,

                            ),
                          ),
                          Text(
                            '250000',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            ':اقل سعر للطلب ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            ' منتجات ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ' 4 ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ':حد ادني للطلبيه ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            ' الجمعه',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            ':ايام العطله',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6,)
                    ],
                  ),
                ),
              ),
              Container(
                margin:const EdgeInsets.only(left: 20,right: 20,bottom: 5),
                height: 60,
                child: const Card(
                  child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: 'ابحث عم منتج'
                    ) ,
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 8,right: 10,left: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true ,
                    itemCount: products.length,
                    itemBuilder: (context, index) => Container(
                      child: TextButton(
                        onPressed: (){},
                        child: Text(products[index],style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      ),
                    )
                ),
              ),
              const Divider(
                color: Colors.green,
                thickness: 1,
              ),
              Container(
                height: 250,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 170),
                  itemBuilder: (context, _) {
                    return Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 75,
                            margin: EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              'lib/assets/images/3.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Text('لبن بخيره كامل الدسم'),
                          const Text('100 مم'),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 180,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'اضف الي العربه',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
