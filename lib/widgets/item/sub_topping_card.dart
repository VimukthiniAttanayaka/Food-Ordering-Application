import 'package:flutter/material.dart';
import 'package:food_ordering_application/utils/colors.dart';
import 'package:food_ordering_application/widgets/item/topping_card.dart';
import 'package:google_fonts/google_fonts.dart';

class SubToppingCard extends StatefulWidget {
  final String title;
  final List<Topping> toppings;
  final bool initiallyExpanded;

  const SubToppingCard({
    super.key,
    required this.title,
    required this.toppings,
    this.initiallyExpanded = false,
  });

  @override
  _SubToppingCardState createState() => _SubToppingCardState();
}

class _SubToppingCardState extends State<SubToppingCard> {
  bool _isExpanded = false;
  List<int> _toppingCounts = [];

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: ElevatedButton(
                                  onPressed: () => _decrementToppingCount(i),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: const CircleBorder(),
                                      elevation: 0,
                                      backgroundColor: AppColors.white),
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
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: ElevatedButton(
                                    onPressed: () => _incrementToppingCount(i),
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        shape: const CircleBorder(),
                                        elevation: 0,
                                        backgroundColor: AppColors.white),
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
          ),
      ],
    );
  }
}
