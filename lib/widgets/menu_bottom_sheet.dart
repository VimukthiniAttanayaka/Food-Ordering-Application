import 'package:flutter/material.dart';
import 'package:food_ordering_application/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBottomSheet extends StatelessWidget {
  final String selectedMenu;
  final ValueChanged<String> onMenuChanged;

  const MenuBottomSheet({
    super.key,
    required this.selectedMenu,
    required this.onMenuChanged,
  });

  @override
  Widget build(BuildContext context) {
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
          _buildMenuOption(
            label: 'Lunch · 10am - 5pm',
            value: 'lunch',
            selectedMenu: selectedMenu,
            onChanged: onMenuChanged,
          ),
          _buildMenuOption(
            label: 'Breakfast · 5pm - 11pm',
            value: 'breakfast',
            selectedMenu: selectedMenu,
            onChanged: onMenuChanged,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              'Done',
              style: GoogleFonts.roboto(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption({
    required String label,
    required String value,
    required String selectedMenu,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
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
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
          Radio<String>(
            value: value,
            groupValue: selectedMenu,
            onChanged: (String? value) {
              onMenuChanged(value!);
            },
            activeColor: AppColors.green,
          ),
        ],
      ),
    );
  }
}
