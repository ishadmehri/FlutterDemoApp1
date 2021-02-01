import 'package:flutter/material.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/widgets/ProductDeals.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'config/pallet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(viewportFraction: .6, );

  int currentNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.accessible_forward_rounded,
                          size: 40,
                          color: Colors.amber,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Nicolas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.menu,
                      size: 40,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_sharp),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: 'Search Product You Wish...',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500]
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daily Deals',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: products.length,
                        effect: WormEffect(),
                        onDotClicked: (index){
                          controller.animateToPage(index, duration: Duration(seconds: 2), curve: Curves.ease);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 310,
                child: PageView(
                  controller: controller,
                  children: List.generate(
                      products.length,
                      (index) {
                          var product = products[index];
                          return ProductCard(product: product, index: index);
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Colors.red,
            elevation: 0,
            showSelectedLabels:
                false, // force icon to set horizontally in center
            showUnselectedLabels:
                false, // force icon to set horizontally in center
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home_filled,
                  color: currentNavigationItem == 0
                      ? Palette.homeIcon
                      : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.shopping_cart_sharp,
                  color: currentNavigationItem == 1
                      ? Palette.cartIcon
                      : Colors.grey,
                ),
              ),
            ],
            currentIndex: currentNavigationItem,
            onTap: (index) => setState(
              () {
                currentNavigationItem = index;
              },
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        // to make bigger floating action that works with center Notched Docked
        width: 80.0,
        height: 80.0,
        child: FloatingActionButton(
          backgroundColor: Palette.micButton,
          onPressed: () => setState(() {}),
          child: Icon(
            Icons.mic,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}
