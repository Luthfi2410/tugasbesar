import 'package:flutter/material.dart';
import '../widgets/home/drawer.dart';
import '../widgets/home/category_container.dart';
import '../widgets/home/homepage_category.dart';
import '../widgets/home/top_products_container.dart';
import '../widgets/general/appbar.dart';
import '../screens/all_products_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      
      //resizeToAvoidBottomInset: false,
      drawer: NavDrawer(),
      appBar: appBar(),
      body: SafeArea(
        
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            Image.asset(
              'assets/voucher.png',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: 30),
            homePagecategory('Categories', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => AllProductsPage()));
            }),
            SizedBox(height: 20),
            Row(
              
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                categoryContainer(context, Colors.amber,
                    'assets/f20mbps.png', 'Paket 20 Mbps'),
                categoryContainer(context, Colors.blueAccent,
                    'assets/f30mbps.png', 'paket 30 Mbps'),
                categoryContainer(context, Colors.lightGreenAccent,
                    'assets/f30mbps.png', 'paket 40 Mbps')
                
              ],
            ),
            SizedBox(height: 30),
            homePagecategory('Top Products', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => AllProductsPage()));
            }),
            
            SizedBox(height: 30),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

    
              children: [
                topProductContainer(context, 'assets/f20mbps.png',
                    'paket 30 Mbps', Colors.amber.withOpacity(0.5)),
                topProductContainer(context, 'assets/f20mbps.png',
                    'paket 40 Mbps', Colors.blue.withOpacity(0.5)),
                topProductContainer(context, 'assets/f20mbps.png',
                    'paket 50 Mbps', Colors.pinkAccent.withOpacity(0.5)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
