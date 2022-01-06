import 'package:flutter/material.dart';
import 'package:dmart/localization/language_constrants.dart';
import 'package:dmart/utill/images.dart';
import 'package:dmart/view/screens/address/address_screen.dart';
import 'package:dmart/view/screens/cart/cart_screen.dart';
import 'package:dmart/view/screens/category/all_category_screen.dart';
import 'package:dmart/view/screens/home/home_screen.dart';
import 'package:dmart/view/screens/order/my_order_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(),
      AllCategoryScreen(),
      CartScreen(),
      MyOrderScreen(),
      AddressScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Images.home, getTranslated('home', context), 0),
            _barItem(Images.list, getTranslated('all_categories', context), 1),
            _barItem(Images.order_bag, getTranslated('shopping_bag', context), 2),
            _barItem(Images.order_list, getTranslated('my_order', context), 3),
            _barItem(Images.location, getTranslated('address', context), 4),
          ],
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon, color: index == _pageIndex ? Theme.of(context).primaryColor : Colors.grey, width: 25),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
