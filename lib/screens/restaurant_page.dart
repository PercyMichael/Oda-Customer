import 'package:flutter/material.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/components/productCard.dart';
import 'package:oda/components/restaurantStats.dart';
import 'package:oda/components/searchBox.dart';
import 'package:oda/components/shareButton.dart';
import 'package:oda/constants.dart';
import 'package:oda/data/data.dart' as data;
import 'package:oda/models/product.dart';
import 'package:oda/models/restaurant.dart';

class FoodCategory {
  final String category;
  final List<Product> items;
  final GlobalKey key = GlobalKey();

  FoodCategory({required this.category, required this.items});
}

final dataCategories = [
  FoodCategory(category: 'Featured', items: data.products),
  FoodCategory(category: 'New Meals', items: data.products),
  FoodCategory(category: 'Streetwise', items: data.products),
  FoodCategory(category: 'Family', items: data.products),
  FoodCategory(category: 'Combo', items: data.products),
];

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isTabChanging = false;
  late TabBar _tabBar;
  double _topBarHeight = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: dataCategories.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isTabChanging) return;
    if (_topBarHeight == 0) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 1) {
      if (_tabController.index != dataCategories.length - 1) {
        _tabController.animateTo(dataCategories.length - 1);
      }
      return;
    }

    for (int i = dataCategories.length - 1; i >= 0; i--) {
      final keyContext = dataCategories[i].key.currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final pos = box.localToGlobal(
          Offset.zero,
          ancestor: context.findRenderObject(),
        );
        // Add a small buffer for precision
        if (pos.dy <= _topBarHeight + 1) {
          if (_tabController.index != i) {
            _tabController.animateTo(i);
          }
          break; // Found the current tab
        }
      }
    }
  }

  void _scrollToSection(int index) async {
    if (_isTabChanging) return;
    _isTabChanging = true;

    final sectionKey = dataCategories[index].key;
    final context = sectionKey.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0,
      );
    }

    _isTabChanging = false;
  }

  @override
  Widget build(BuildContext context) {
    _tabBar = TabBar(
      controller: _tabController,
      isScrollable: true,
      onTap: _scrollToSection,
      indicatorColor: AppColors.secondary,
      labelColor: AppColors.secondary,
      unselectedLabelColor: Colors.black54,
      tabs: dataCategories.map((e) => Tab(text: e.category)).toList(),
    );

    if (_topBarHeight == 0) {
      _topBarHeight =
          MediaQuery.of(context).padding.top +
          kToolbarHeight +
          _tabBar.preferredSize.height;
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 440.0,
            pinned: true,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.only(left: 15),
              child: CustomBackButton(),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ShareButton(),
              ),
            ],
            title: Text(widget.restaurant.name),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        widget.restaurant.imageCover,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(widget.restaurant.logo, width: 60),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.restaurant.name,
                                  style: AppTextStyles.bodyTitle,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: AppColors.secondary,
                                    ),
                                    Text(
                                      widget.restaurant.location,
                                      style: AppTextStyles.body,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        RestaurantStats(restaurant: widget.restaurant),
                        SizedBox(height: 30),
                        const SearchBox(),
                      ],
                    ),
                  ),
                  //stats
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverTabBarDelegate(_tabBar),
          ),
          ...dataCategories.expand(
            (category) => [
              SliverToBoxAdapter(
                child: Container(
                  key: category.key,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  child: Text(
                    category.category,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        ProductCard(product: category.items[index]),
                    childCount: category.items.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  const _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
