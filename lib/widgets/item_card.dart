import 'package:flutter/material.dart';
import 'package:food_ordering_application/colors.dart';
import 'package:food_ordering_application/models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatefulWidget {
  final MenuItem item;

  const ItemCard({
    super.key,
    required this.item,
  });

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
    final isSpecial = widget.item.metaData.isDealProduct ?? false;
    final rating = widget.item.totalReviews;

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
              width: double.infinity,
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
                  widget.item.title.en,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '₹${widget.item.priceInfo.price.deliveryPrice}',
                      style: GoogleFonts.roboto(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (!isSpecial)
                      Row(
                        children: [
                          const Text('  '),
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
            widget.item.description.en,
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
            tabs: const [
              Tab(text: 'Ingredients'),
              Tab(text: 'Nutritional'),
              Tab(text: 'Instructions'),
              Tab(text: 'Allergies'),
            ],
          ),
          const SizedBox(height: 25.0),
          SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This product contains ingredients that may trigger allergies. Please review the ingredient list for details.',
                    ),
                    const SizedBox(height: 15.0),
                    widget.item.dishInfo == null
                        ? Text('')
                        : Wrap(
                            spacing: 8.0,
                            runSpacing: 2.0,
                            children: [
                              const Chip(
                                label: Text('Int 1'),
                                labelStyle: TextStyle(color: AppColors.gray4),
                              ),
                              const Chip(
                                label: Text('Int 2'),
                                labelStyle: TextStyle(color: AppColors.gray4),
                              ),
                              const Chip(
                                label: Text('Inient 3'),
                                labelStyle: TextStyle(color: AppColors.gray4),
                              ),
                              const Chip(
                                label: Text('Ingredient 4'),
                                labelStyle: TextStyle(color: AppColors.gray4),
                              ),
                              const Chip(
                                label: Text('Ingredient 5'),
                                labelStyle: TextStyle(color: AppColors.gray4),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'See More',
                                      style: TextStyle(color: AppColors.green),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  const Icon(Icons.arrow_forward_ios_outlined,
                                      color: AppColors.green, size: 15),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Text(
                              'Nutritional Value per 100g',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '198',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Kcal',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14, color: AppColors.gray4),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '14.1',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Protiens',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14, color: AppColors.gray4),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '19.6',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Fats',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14, color: AppColors.gray4),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6.6',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Carbo H',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14, color: AppColors.gray4),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                          ],
                        )
                      ]),
                ),
                const Center(child: Text('Instructions')),
                const Center(child: Text('Allergies')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
