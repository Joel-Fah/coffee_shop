import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../components/helper.dart';

class CoffeeDetails extends StatelessWidget {
  const CoffeeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: ContextVariables.height(context) / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.espresso),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white54, shape: BoxShape.circle),
                      child: const BackButton(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                          color: Colors.white54, shape: BoxShape.circle),
                      child: const Icon(Remix.heart_3_line),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ContextVariables.height(context) / 4,
              ),
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30.0),
                      title: Text(
                        'Cappuccino',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                      ),
                      subtitle: const Text(
                        'with chocolate',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFCE9E63),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Remix.star_fill, color: Colors.white),
                            SizedBox(width: 10.0),
                            Text(
                              '4.7',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0)),
                        color: Color(0xFFF0F0F0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.grey.shade300,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Coffee',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  VerticalDivider(thickness: 1),
                                  Text(
                                    'Chocolate',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  VerticalDivider(thickness: 1),
                                  Text(
                                    'Medium roasted',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Coffee Size',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          const SizedBox(height: 10.0),
                          const SelectCoffeeSize(),
                          const SizedBox(height: 30.0),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Tooltip(
                            message:
                                'This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino should be rich, but not acidic and have a mildly sweet flavouring from the milk.',
                            preferBelow: false,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino rich, not acidic and mildly sweet flavouring from the milk.',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: ContextVariables.width(context),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 30.0),
                              ),
                              onPressed: () {},
                              child: IntrinsicHeight(
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'Add to cart',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    VerticalDivider(
                                      thickness: 2.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      '\$5.99',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum CoffeeSize { small, medium, large }

class SelectCoffeeSize extends StatefulWidget {
  const SelectCoffeeSize({Key? key}) : super(key: key);

  @override
  State<SelectCoffeeSize> createState() => _SelectCoffeeSizeState();
}

class _SelectCoffeeSizeState extends State<SelectCoffeeSize> {
  CoffeeSize _coffeeSize = CoffeeSize.small;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              setState(() {
                _coffeeSize = CoffeeSize.small;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _coffeeSize == CoffeeSize.small
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                children: [
                  Radio(
                    value: CoffeeSize.small,
                    groupValue: _coffeeSize,
                    onChanged: (CoffeeSize? value) {
                      setState(() {
                        _coffeeSize = value!;
                      });
                    },
                    activeColor: _coffeeSize == CoffeeSize.small
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                  Text(
                    CoffeeSize.small.name.replaceFirst(CoffeeSize.small.name[0],
                        CoffeeSize.small.name[0].toUpperCase()),
                    style: TextStyle(
                      // fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: _coffeeSize == CoffeeSize.small
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              setState(() {
                _coffeeSize = CoffeeSize.medium;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _coffeeSize == CoffeeSize.medium
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                children: [
                  Radio(
                    value: CoffeeSize.medium,
                    groupValue: _coffeeSize,
                    onChanged: (CoffeeSize? value) {
                      setState(() {
                        _coffeeSize = value!;
                      });
                    },
                    activeColor: _coffeeSize == CoffeeSize.medium
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                  Text(
                    CoffeeSize.medium.name.replaceFirst(
                        CoffeeSize.medium.name[0],
                        CoffeeSize.medium.name[0].toUpperCase()),
                    style: TextStyle(
                      // fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: _coffeeSize == CoffeeSize.medium
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              setState(() {
                _coffeeSize = CoffeeSize.large;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _coffeeSize == CoffeeSize.large
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                children: [
                  Radio(
                    value: CoffeeSize.large,
                    groupValue: _coffeeSize,
                    onChanged: (CoffeeSize? value) {
                      setState(() {
                        _coffeeSize = value!;
                      });
                    },
                    activeColor: _coffeeSize == CoffeeSize.large
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                  Text(
                    CoffeeSize.large.name.replaceFirst(CoffeeSize.large.name[0],
                        CoffeeSize.large.name[0].toUpperCase()),
                    style: TextStyle(
                      // fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: _coffeeSize == CoffeeSize.large
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}