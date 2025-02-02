import 'package:flutter/material.dart';
import 'package:food_ordering_application/utils/colors.dart';
import 'package:food_ordering_application/models/categories.dart';
import 'package:food_ordering_application/models/menu.dart';
import 'package:food_ordering_application/providers/category_provider.dart';
import 'package:food_ordering_application/providers/item_provider.dart';
import 'package:food_ordering_application/providers/menu_provider.dart';
import 'package:food_ordering_application/screens/item_screen.dart';
import 'package:food_ordering_application/widgets/menu/menu_bottom_sheet.dart';
import 'package:food_ordering_application/widgets/menu/menu_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  final List<Menu> menuList;
  final List<Category> categoryList;

  const MenuScreen(
      {super.key, required this.menuList, required this.categoryList});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 1;
  List<bool> _selectedItems = [];
  final Set<String> _selectedCategoryIDs = {};

  @override
  void initState() {
    super.initState();
    context.read<MenuProvider>().fetchMenuData();
    _selectedItems = List.filled(widget.menuList.length, false);
    _selectedItems[0] = true;
    final categoryID = widget.menuList[0].menuCategoryIDs.isNotEmpty
        ? widget.menuList[0].menuCategoryIDs[0]
        : '';
    _selectedCategoryIDs.add(categoryID);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false)
          .toggleCategorySelection(_selectedCategoryIDs);
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categoryProvider2 = Provider.of<CategoryProvider>(context, listen: false);
    final menuItemProvider = Provider.of<MenuItemProvider>(context,listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/cover-container.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => _selectedIndex = 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 0
                                      ? AppColors.gray1
                                      : AppColors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: _selectedIndex == 0
                                    ? Image.asset(
                                        'assets/icon1active.png',
                                        height: 24,
                                      )
                                    : Image.asset(
                                        'assets/icon1.png',
                                        height: 24,
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => _selectedIndex = 1),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 1
                                      ? AppColors.gray1
                                      : AppColors.white,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: _selectedIndex == 1
                                    ? Image.asset(
                                        'assets/icon2active.png',
                                        height: 24,
                                      )
                                    : Image.asset(
                                        'assets/icon2.png',
                                        height: 24,
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => _selectedIndex = 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 2
                                      ? AppColors.gray1
                                      : AppColors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: _selectedIndex == 2
                                    ? Image.asset(
                                        'assets/icon3active.png',
                                        height: 24,
                                      )
                                    : Image.asset(
                                        'assets/icon3.png',
                                        height: 24,
                                      ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return MenuBottomSheet(
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gray2,
                    foregroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      menuProvider.selectedMenu == 'lunch'? Text('LUNCH MENU'):Text('BREAKFAST MENU'),
                      Icon(Icons.arrow_drop_down_sharp),
                    ],
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
          widget.menuList.isEmpty
              ? const Text('No menu items available')
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.menuList.length,
                    itemBuilder: (context, index) {
                      final item = widget.menuList[index];
                      if (_selectedItems.length != widget.menuList.length) {
                        _selectedItems =
                            List.filled(widget.menuList.length, false);
                      }
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedItems[index] = !_selectedItems[index];
                            final categoryID = item.menuCategoryIDs.isNotEmpty
                                ? item.menuCategoryIDs[0]
                                : '';
                            if (_selectedCategoryIDs.contains(categoryID)) {
                              _selectedCategoryIDs.remove(categoryID);
                            } else {
                              _selectedCategoryIDs.add(categoryID);
                            }
                          });
                          categoryProvider2.toggleCategorySelection(_selectedCategoryIDs);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray2),
                            borderRadius: BorderRadius.circular(25),
                            color: _selectedItems[index]
                                ? AppColors.green
                                : AppColors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.title['en'] ?? '',
                                style: TextStyle(
                                  color: _selectedItems[index]
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              if (_selectedItems[index])
                                const SizedBox(
                                  width: 5,
                                ),
                              _selectedItems[index]
                                  ? const Icon(
                                      Icons.close,
                                      size: 16,
                                      color: AppColors.white,
                                    )
                                  : const Text(''),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          if (categoryProvider.selectedCategories.isEmpty)
            Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text('No items available'),
            ),
          Column(
            children: List.generate(
              categoryProvider.selectedCategories.length,
              (index) {
                final menu = categoryProvider.selectedCategories[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(menu.title.en),
                    ),
                    const SizedBox(height: 8),
                    for (String entityId
                        in categoryProvider2.getMenuEntitiesIdsByMenuCategoryId(
                                menu.menuCategoryID))
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemScreen(
                                  item: menuItemProvider.getMenuItemById(entityId)),
                            ),
                          );
                        },
                        child: ProductCard(
                          item: menuItemProvider.getMenuItemById(entityId),
                          imageUrl:
                              'https://s3-alpha-sig.figma.com/img/5ae3/bea9/74c02cf405be136eb85d899535045090?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kgL9IQ0vC1h95bWFGlIcDf0kjSvuo8aNzNa6eb9i0uQAHv7NF6CkmgSeW-LUQXzoETpxC5stPf6XYGMT2v~S5RIUyyORIZmIFQffZnPAkSarS~Yz8R1xCvtTUgBpzxTclQu8qVEcYOVgvJ73pO4qmMO0qG5YOZGYaRbYf6dfEHkvdwqHhQQALLgpCMNyBAU2xVh-58jhnQizKPAoFtejfnjBkAdXtYZVedmosQ~sEkWJk2rELx8LLdEq-VsZPJWFLqL3vm3rlEMOyCf~H9Er1iyGpmmI6wHkq1R~~6AZ926Zib8z0DuTUK-ONACO5ROTjUS2KE7ezPwDcgPj3QTwrA__',
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Basket • ',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '3',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        ' items • £',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '24.00',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.gray1,
                    border: Border.all(color: AppColors.green),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    'View basket',
                    style: GoogleFonts.roboto(
                      color: AppColors.green,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.black,
                  ),
                  height: 4.0,
                  width: 125,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
