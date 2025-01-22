import 'package:flutter/material.dart';
import 'package:food_ordering_application/colors.dart';
import 'package:food_ordering_application/models/item.dart';
import 'package:food_ordering_application/widgets/item_card.dart';
import 'package:food_ordering_application/widgets/sub_topping_card.dart';
import 'package:food_ordering_application/widgets/topping_card.dart';

class ItemScreen extends StatefulWidget {
  final MenuItem item;

  const ItemScreen({super.key, required this.item});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int _counter = 1;
  double price = 1260;

  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  List<Topping> toppings = [
    Topping('Cheese'),
    Topping('Pepperoni'),
    Topping('Mushrooms'),
    Topping('Onions'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ItemCard(item: widget.item),
          ToppingCard(toppings: toppings),
          SubToppingCard(
            title: 'Section 1',
            toppings: toppings,
          ),
          SubToppingCard(
            title: 'Section 1',
            toppings: toppings,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text('Add Comments (Optional)'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Write here',
                      hintStyle:
                          TextStyle(fontSize: 15.0, color: AppColors.gray3),
                      border: InputBorder.none,
                    ),
                    minLines: 3,
                    maxLines: 7,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.gray2,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => _decrementCounter(),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              elevation: 0,
                              backgroundColor: AppColors.gray2,
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                              color: AppColors.green,
                            ),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _incrementCounter(),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              elevation: 0,
                              backgroundColor: AppColors.gray2,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart  ₹${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.black,
                    ),
                    height: 4.0,
                    width: 125,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
