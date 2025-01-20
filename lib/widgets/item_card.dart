import 'package:flutter/material.dart';
import 'package:food_ordering_application/colors.dart';
import 'package:food_ordering_application/models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatefulWidget {
  final MenuItem item;

  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSpecial = widget.item.price < 3000;
    final rating = 4.5;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/e252/5b9b/9ef5d8f0d917030278aaa827f7623265?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mM9daoT8x1K2QG-9rZ7Ekf6TtgYuoz0co04TUmGTZx5DN6Kz171IDFb361Nke~q1bqhN-55rIt5mAMSLd8zAlqMLGGrL1bMjgtIoJ2Sv-CJ49oCLylSrwFNFKGXTG6L8F3gGgd8FqBu6CYwh4x1xMJ3C04rF1cliKKAyHqqUizFXfT7XkzXke9UiG0d0g5wyEGePpgD-eoAEhTsgyMYkRj-xXDvzU9K5LU9rvc1nwwDMHxNqdH9zJzU4SqXI7zqZEI9HrnvK0SVhLtrUpDnlf6B6rMCN2ZiGVlB-ci4MYyzVb3U-JdpZWDS-2HBZQYdMncYHA8~lyBQCvvgz5JWNVA__',
              fit: BoxFit.cover,
              width: double.infinity, // Set width to full screen
              height: 200,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.title,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '₹${widget.item.price.toStringAsFixed(2)}',
                      style: GoogleFonts.roboto(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (!isSpecial)
                      Row(
                        children: [
                          Text('  '),
                          const Icon(
                            Icons.star_rounded,
                            size: 20.0,
                            color: AppColors.green,
                          ),
                          Text(
                            '${rating.toStringAsFixed(1)}',
                            style: GoogleFonts.roboto(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
          if (isSpecial)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 25.0,
                  color: AppColors.green,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 20.0,
                      color: AppColors.green,
                    ),
                    Text(
                      ' ${rating.toStringAsFixed(1)}',
                      style: GoogleFonts.roboto(
                          fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 15.0),
          Text(
            widget.item.description,
            style: GoogleFonts.roboto(fontSize: 14.0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15.0),
          TabBar(
            controller: _tabController,
            labelColor: AppColors.green,
            unselectedLabelColor: AppColors.black,
            indicatorColor: AppColors.green,
            // isScrollable: true,
            tabs: const [
              Tab(text: 'Ingredients'),
              Tab(text: 'Nutritional'),
              Tab(text: 'Instructions'),
              Tab(text: 'Allergies'),
            ],
          ),
          const SizedBox(height: 25.0),
          // TabBarView(
          //   controller: _tabController,
          //   children: [
          //     const Center(child: Text('Nutritional Information')),
          //     const Center(child: Text('Nutritional Information')),
          //     const Center(child: Text('Instructions')),
          //     const Center(child: Text('Allergies')),
          //   ],
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This product contains ingredients that may trigger allergies. Please review the ingredient list for details.',
              ),
              const SizedBox(height: 15.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 2.0,
                children: [
                  const Chip(label: Text('Ing 1'),labelStyle: TextStyle(color: AppColors.gray4),),
                  const Chip(label: Text('Int 2'),labelStyle: TextStyle(color: AppColors.gray4),),
                  const Chip(label: Text('Inient 3'),labelStyle: TextStyle(color: AppColors.gray4),),
                  const Chip(label: Text('Ingredient 4'),labelStyle: TextStyle(color: AppColors.gray4),),
                  const Chip(label: Text('Ingredient 5'),labelStyle: TextStyle(color: AppColors.gray4),),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(color: AppColors.green),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.green, size: 15),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
