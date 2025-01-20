import 'package:flutter/material.dart';
import 'package:food_ordering_application/colors.dart';
import 'package:food_ordering_application/providers/menu_provider.dart';
import 'package:food_ordering_application/widgets/menu_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 1;
  List<bool> _selectedItems = [];
  String _selectedMenu = 'lunch';

  @override
  void initState() {
    super.initState();
    context.read<MenuProvider>().fetchMenuData();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.only(bottom: 20),
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
                                ? Image.asset('assets/icon1active.png')
                                : Image.asset('assets/icon1.png'),
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
                                ? Image.asset('assets/icon2active.png')
                                : Image.asset('assets/icon2.png'),
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
                                ? Image.asset('assets/icon3active.png')
                                : Image.asset('assets/icon3.png'),
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: 300,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Select Menu',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                          color: AppColors.gray3,
                                          size: 15,
                                        ),
                                        onPressed: () => Navigator.pop(
                                            context), // Close the bottom sheet
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: AppColors.gray2,
                                    ),
                                    height: 1.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    margin:
                                        EdgeInsets.only(bottom: 15, top: 10),
                                    // Add padding for spacing
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.gray2,
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Lunch · 10am - 5pm',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Radio(
                                          value: 'lunch',
                                          groupValue: _selectedMenu,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedMenu = value!;
                                            });
                                          },
                                          activeColor: AppColors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    margin: EdgeInsets.only(bottom: 15),
                                    // Add padding for spacing
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.gray2,
                                        width: 1.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Breakfast · 5pm - 11pm',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Radio(
                                          value: 'breakfast',
                                          groupValue: _selectedMenu,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedMenu = value!;
                                            });
                                          },
                                          activeColor: AppColors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    // Set full width
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 4),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Text(
                                      'Done',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gray2,
                    foregroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LUNCH MENU'),
                      Icon(Icons.arrow_drop_down_sharp),
                    ],
                  )),
              Icon(Icons.search),
            ],
          )),
      menuProvider.menus.length == 0
          ? Text('No menu items available') // Informative message
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuProvider.menus.length,
                itemBuilder: (context, index) {
                  final item = menuProvider.menus[index];
                  // Initialize _selectedItems here
                  if (_selectedItems.length != menuProvider.menus.length) {
                    _selectedItems =
                        List.filled(menuProvider.menus.length, false);
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedItems[index] = !_selectedItems[index];
                      });
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
                                  : AppColors
                                      .black, // Set the desired color here
                            ),
                          ),
                          if (_selectedItems[index])
                            SizedBox(
                              width: 5,
                            ),
                          _selectedItems[index]
                              ? Icon(
                                  Icons.close,
                                  size: 16,
                                  color: AppColors.white,
                                )
                              : Text(''),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          children: [
            Text('SANDWICHES'),
          ],
        ),
      ),
      ProductCard(
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/5ae3/bea9/74c02cf405be136eb85d899535045090?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kgL9IQ0vC1h95bWFGlIcDf0kjSvuo8aNzNa6eb9i0uQAHv7NF6CkmgSeW-LUQXzoETpxC5stPf6XYGMT2v~S5RIUyyORIZmIFQffZnPAkSarS~Yz8R1xCvtTUgBpzxTclQu8qVEcYOVgvJ73pO4qmMO0qG5YOZGYaRbYf6dfEHkvdwqHhQQALLgpCMNyBAU2xVh-58jhnQizKPAoFtejfnjBkAdXtYZVedmosQ~sEkWJk2rELx8LLdEq-VsZPJWFLqL3vm3rlEMOyCf~H9Er1iyGpmmI6wHkq1R~~6AZ926Zib8z0DuTUK-ONACO5ROTjUS2KE7ezPwDcgPj3QTwrA__',
        title: 'Product Name',
        subtitle: 'Short description',
        price: 29.99,
      ),
      ProductCard(
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/5ae3/bea9/74c02cf405be136eb85d899535045090?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kgL9IQ0vC1h95bWFGlIcDf0kjSvuo8aNzNa6eb9i0uQAHv7NF6CkmgSeW-LUQXzoETpxC5stPf6XYGMT2v~S5RIUyyORIZmIFQffZnPAkSarS~Yz8R1xCvtTUgBpzxTclQu8qVEcYOVgvJ73pO4qmMO0qG5YOZGYaRbYf6dfEHkvdwqHhQQALLgpCMNyBAU2xVh-58jhnQizKPAoFtejfnjBkAdXtYZVedmosQ~sEkWJk2rELx8LLdEq-VsZPJWFLqL3vm3rlEMOyCf~H9Er1iyGpmmI6wHkq1R~~6AZ926Zib8z0DuTUK-ONACO5ROTjUS2KE7ezPwDcgPj3QTwrA__',
        title: 'Product Name',
        subtitle: 'Short description',
        price: 29.99,
      ),
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          children: [
            Text('SANDWICHES'),
          ],
        ),
      ),
      ProductCard(
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/5ae3/bea9/74c02cf405be136eb85d899535045090?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kgL9IQ0vC1h95bWFGlIcDf0kjSvuo8aNzNa6eb9i0uQAHv7NF6CkmgSeW-LUQXzoETpxC5stPf6XYGMT2v~S5RIUyyORIZmIFQffZnPAkSarS~Yz8R1xCvtTUgBpzxTclQu8qVEcYOVgvJ73pO4qmMO0qG5YOZGYaRbYf6dfEHkvdwqHhQQALLgpCMNyBAU2xVh-58jhnQizKPAoFtejfnjBkAdXtYZVedmosQ~sEkWJk2rELx8LLdEq-VsZPJWFLqL3vm3rlEMOyCf~H9Er1iyGpmmI6wHkq1R~~6AZ926Zib8z0DuTUK-ONACO5ROTjUS2KE7ezPwDcgPj3QTwrA__',
        title: 'Product Name',
        subtitle: 'Short description',
        price: 29.99,
      ),
      ProductCard(
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/5ae3/bea9/74c02cf405be136eb85d899535045090?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kgL9IQ0vC1h95bWFGlIcDf0kjSvuo8aNzNa6eb9i0uQAHv7NF6CkmgSeW-LUQXzoETpxC5stPf6XYGMT2v~S5RIUyyORIZmIFQffZnPAkSarS~Yz8R1xCvtTUgBpzxTclQu8qVEcYOVgvJ73pO4qmMO0qG5YOZGYaRbYf6dfEHkvdwqHhQQALLgpCMNyBAU2xVh-58jhnQizKPAoFtejfnjBkAdXtYZVedmosQ~sEkWJk2rELx8LLdEq-VsZPJWFLqL3vm3rlEMOyCf~H9Er1iyGpmmI6wHkq1R~~6AZ926Zib8z0DuTUK-ONACO5ROTjUS2KE7ezPwDcgPj3QTwrA__',
        title: 'Product Name',
        subtitle: 'Short description',
        price: 29.99,
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // Set full width
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Space evenly
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
              // Set full width
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
    ])));
  }
}
