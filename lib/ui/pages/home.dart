import 'package:coffee_shop/ui/components/helper.dart';
import 'package:coffee_shop/ui/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = [
      const HomeTab(),
      const Center(
        child: Text('My Favourites'),
      ),
      const Center(
        child: Text('Cart'),
      ),
      const Center(
        child: Text('Profile'),
      ),
    ];

    final kBottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Remix.home_3_line),
        activeIcon: Icon(Remix.home_3_fill),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Remix.heart_3_line),
        activeIcon: Icon(Remix.heart_3_fill),
        label: 'Favourite',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Remix.shopping_cart_line),
        activeIcon: Icon(Remix.shopping_cart_fill),
        label: 'Cart',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Remix.user_line),
        activeIcon: Icon(Remix.user_fill),
        label: 'Profile',
      ),
    ];
    assert(kTabPages.length == kBottomNavigationBarItems.length);

    final bottomNavbar = BottomNavigationBar(
      items: kBottomNavigationBarItems,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => setState(() {
        _currentIndex = value;
      }),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).primaryColor,
          title: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(ImagePath.avatar),
            ),
            title: Row(
              children: [
                Icon(
                  Remix.compass_discover_line,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 5.0),
                const Text(
                  'Yaounde, Cameroon',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Remix.notification_2_line,
                  color: Colors.black,
                ),)
          ],
        ),
        body: kTabPages[_currentIndex],
        bottomNavigationBar: bottomNavbar,
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text.rich(
            TextSpan(children: [
              const TextSpan(text: 'Hello, '),
              TextSpan(
                  text: 'Joel Fah',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
            ]),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black, fontSize: 25.0),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Remix.search_2_line),
              hintText: 'Search for coffee',
              suffixIcon: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: const Icon(Remix.equalizer_line),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          width: ContextVariables.width(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10.0),
                const Category(
                  name: 'All',
                ),
                const SizedBox(width: 10.0),
                const Category(
                  name: 'Cappuccino',
                ),
                const SizedBox(width: 10.0),
                Category(
                  name: 'Cold Brew',
                  textColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10.0),
                Category(
                  name: 'Espresso',
                  textColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10.0),
                Category(
                  name: 'Nescafé',
                  textColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10.0),
                Category(
                  name: 'Arabica',
                  textColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: ContextVariables.width(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                SizedBox(width: 10.0),
                HomeCoffeeCard(
                  image: ImagePath.cappuccino,
                  coffeeName: 'Cappuccino',
                  extra: 'with chocolate',
                  price: '5.99',
                  rating: 4.7,
                ),
                SizedBox(width: 10.0),
                HomeCoffeeCard(
                  image: ImagePath.espresso,
                  coffeeName: 'Cappuccino',
                  extra: 'with vanilla',
                  price: '8.99',
                  rating: 2.1,
                ),
                SizedBox(width: 10.0),
                HomeCoffeeCard(
                  image: ImagePath.brew,
                  coffeeName: 'Cappuccino',
                  extra: 'distilled',
                  price: '6.99',
                  rating: 3.3,
                ),
                SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              onPressed: () {},
              child: const Text(
                'See more',
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Special Offer',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 3),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: const DecorationImage(
                          image: AssetImage(ImagePath.cappuccino),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 1.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFCE9E63),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Text(
                              'Discount flushes',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          const Text(
                            'Get 03 ice flavoured cappuccinos for the price of just one. 😮',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Now',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class HomeCoffeeCard extends StatelessWidget {
  const HomeCoffeeCard({
    super.key,
    required this.coffeeName,
    required this.extra,
    required this.price,
    required this.rating,
    required this.image,
  });

  final String coffeeName, extra, price;
  final double rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      width: ContextVariables.width(context) / 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 10.0,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoffeeDetails(),
                  ),
                ),
                child: Container(
                  height: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFCE9E63),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Remix.star_fill,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              coffeeName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(extra),
          ),
          // const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Remix.add_line,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.name,
    this.backgroundColor,
    this.textColor,
  });

  final String name;
  final Color? backgroundColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
