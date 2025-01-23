import 'package:flutter/material.dart';
import 'package:food_ordering_application/utils/colors.dart';

class ToppingCard extends StatefulWidget {
  final List<Topping> toppings;

  const ToppingCard({super.key, required this.toppings});

  @override
  State<ToppingCard> createState() => _ToppingCardState();
}

class _ToppingCardState extends State<ToppingCard> {
  List<int> _toppingCounts = [];

  @override
  void initState() {
    super.initState();
    _toppingCounts = List.filled(widget.toppings.length, 0);
  }

  void _incrementToppingCount(int index) {
    setState(() {
      _toppingCounts[index]++;
    });
  }

  void _decrementToppingCount(int index) {
    setState(() {
      if (_toppingCounts[index] > 0) {
        _toppingCounts[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Toppings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 16.0),
          for (int i = 0; i < widget.toppings.length; i++)
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.toppings[i].name),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () => _decrementToppingCount(i),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              elevation: 0,
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 12,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      Text('${_toppingCounts[i]}'),
                      Container(
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: ElevatedButton(
                              onPressed: () => _incrementToppingCount(i),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: const CircleBorder(),
                                elevation: 0,
                              ),
                              child: const Icon(
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
            )
        ],
      ),
    );
  }
}

class Topping {
  final String name;

  Topping(this.name);
}
