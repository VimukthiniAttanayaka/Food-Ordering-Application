import 'package:flutter/material.dart';
import 'package:food_ordering_application/utils/colors.dart';
import 'package:food_ordering_application/providers/menu_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuBottomSheet extends StatelessWidget {
  final VoidCallback? onClose;

  const MenuBottomSheet({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Select Menu',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.gray3,
                  size: 15,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(
            height: 1.0,
            color: AppColors.gray2,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray2,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lunch · 10am - 5pm',
                  style: TextStyle(color: Colors.black),
                ),
                Radio<String>(
                  value: 'lunch',
                  groupValue: menuProvider.selectedMenu,
                  onChanged: menuProvider.onMenuChanged,
                  activeColor: AppColors.green,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray2,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Breakfast · 5pm - 11pm',
                  style: TextStyle(color: Colors.black),
                ),
                Radio<String>(
                  value: 'breakfast',
                  groupValue: menuProvider.selectedMenu,
                  onChanged: menuProvider.onMenuChanged,
                  activeColor: AppColors.green,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextButton(
              onPressed: onClose,
              child: Text(
                'Done',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
