import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_application/colors.dart';

class SizeCard extends StatefulWidget {
  const SizeCard({Key? key}) : super(key: key);

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  String _selectedSize = 'Small';
  int _toppingCount = 0;

  void _incrementToppingCount() {
    setState(() {
      _toppingCount++;
    });
  }

  void _decrementToppingCount() {
    setState(() {
      if (_toppingCount > 0) {
        _toppingCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(
            'Choose Size',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Small',
                  groupValue: _selectedSize,
                  onChanged: (value) {
                    setState(() {
                      _selectedSize = value!;
                    });
                  },
                  activeColor: AppColors.green,
                ),
                const Text('Small'),
              ],
            ),
            Row(children: [
              Radio<String>(
                value: 'Medium',
                groupValue: _selectedSize,
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value!;
                  });
                },
                activeColor: AppColors.green,
              ),
              const Text('Medium'),
            ]),
            Row(
              children: [
                Radio<String>(
                  value: 'Large',
                  groupValue: _selectedSize,
                  onChanged: (value) {
                    setState(() {
                      _selectedSize = value!;
                    });
                  },
                  activeColor: AppColors.green,
                ),
                const Text('Large'),
              ],
            ),
          ]),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Classic Thin'),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () => _decrementToppingCount(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                            elevation: 0,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Text('${_toppingCount}'),
                    Container(
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SizedBox(
                          width: 20,
                          // Adjust this value to change the button size
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () => _incrementToppingCount(),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              elevation: 0,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: AppColors.black,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New York Style Crus'),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () => _decrementToppingCount(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                            elevation: 0,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Text('${_toppingCount}'),
                    Container(
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SizedBox(
                          width: 20,
                          // Adjust this value to change the button size
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () => _incrementToppingCount(),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              elevation: 0,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: AppColors.black,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Detroit Style'),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () => _decrementToppingCount(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                            elevation: 0,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Text('${_toppingCount}'),
                    Container(
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SizedBox(
                          width: 20,
                          // Adjust this value to change the button size
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () => _incrementToppingCount(),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              elevation: 0,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: AppColors.black,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child:Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.gray2,
              ),
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
