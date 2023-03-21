import 'package:cbcreports/users/fregments/building_inspection_fragments_screen.dart';
import 'package:cbcreports/users/fregments/home_fregments_screen.dart';
import 'package:cbcreports/users/fregments/pre_purchase_inspection_fregments_screen.dart';
import 'package:cbcreports/users/fregments/profile_inspection_fragments_screen.dart';
import 'package:cbcreports/users/fregments/timber_inspection_fragments_screen.dart';
import 'package:cbcreports/users/userPreference/current_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardOfFragments extends StatelessWidget {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  List<Widget> _fragmentScreen = [
    HomeFragmentsScreen(),
    BuildingInspectionFragmentsScreen(),
    TimberInspectionFragmentsScreen(),
    ProfileFragmentsScreen(),
  ];
  List _navigationButtonPropertices = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": FontAwesomeIcons.building,
      "non_active_icon": FontAwesomeIcons.buildingColumns,
      "label": "Building Inspection",
    },
    {
      "active_icon": Icons.pest_control,
      "non_active_icon": Icons.pest_control_outlined,
      "label": "Pest Inspection",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outlined,
      "label": "Profile",
    },
  ];
  RxInt _indexNumber = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controler) {
        return Scaffold(
          backgroundColor: Colors.blue,
          body: SafeArea(
            child: Obx(() => _fragmentScreen[_indexNumber.value]),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: _indexNumber.value,
              onTap: (value) {
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              items: List.generate(4, (index) {
                var navBtnProperty = _navigationButtonPropertices[index];
                return BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(255, 255, 230, 0),
                  icon: Icon(navBtnProperty["non_active_icon"]),
                  activeIcon: Icon(navBtnProperty["active_icon"]),
                  label: navBtnProperty["label"],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
