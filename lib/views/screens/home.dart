import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:swift_cafe/components/BottomNavBTN.dart';
import 'package:swift_cafe/components/sized_configration.dart';
import 'package:swift_cafe/model/custom_rout.dart';
import 'package:swift_cafe/views/screens/productdetail.dart';

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            children: [
              // Here you can add your different screens. For now, it's just a single screen.
              _buildHomePageContent(context),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // Background Image

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Applying BackdropFilter with blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black
                  .withOpacity(0.3), // Adjust opacity to see the blur
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/waving-hand.png'),
                            const SizedBox(width: 20),
                            RichText(
                              text: const TextSpan(
                                text: '20/12/2022\n',
                                style: TextStyle(
                                  color: Color(0XFFB6B6B6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Joshua Scanlan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFFB6B6B6),
                                      height: 1.5,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(.9),
                              ),
                              child: Center(
                                  child: Image.asset('assets/icons/bah.png')),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff71AB7A),
                                  width: 2.0,
                                ),
                              ),
                              child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                    'assets/images/userpic1.jpg',
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: _buildSearchBar(),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    _buildPopularBeveragesSection(screenWidth),
                    const SizedBox(height: 30),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return _buildGetItInstantlySection();
                        })
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search, color: Color(0xffBBBBBC)),
        hintText: 'Search favorite Beverages',
        suffixIcon: Image.asset('assets/icons/menu.png'),
        hintStyle: const TextStyle(
          color: Color(0xffBBBBBC),
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildPopularBeveragesSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Most Popular Beverages",
            style: TextStyle(
              color: Colors.white.withOpacity(.7),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return _buildBeverageCard(
                  screenWidth, "Hot Cappuccino", "4.9", 458);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildBeverageCard(
      double width, String name, String rating, int reviews) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CustomPageRoute(
            child: const ProductDetail(), direction: AxisDirection.left));
      },
      child: Container(
        width: 195,
        margin: const EdgeInsets.only(right: 0, left: 15),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/formbg.png'),
            fit: BoxFit.cover,
          ),
          color: Colors.white.withOpacity(.4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Coffeecup.png',
                width: 120,
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      name,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              textAlign: TextAlign.start,
                              "Espresso, Steamed Milk",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 10),
                            ),
                            const SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: rating,
                                    style: const TextStyle(
                                      color: Color(0xff303030),
                                      fontSize: 13,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' ★  ',
                                    style: TextStyle(
                                      color: Color(0xffFFC003),
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '($reviews)',
                                    style: const TextStyle(
                                      color: Color(0xff303030),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xff66A35C),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetItInstantlySection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        image: const DecorationImage(
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Get it instantly",
                style: TextStyle(
                  color: Colors.white.withOpacity(.7),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildInstantBeverageCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildInstantBeverageCard() {
    return Container(
      height: 163,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        image: const DecorationImage(
          image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lattè",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffCDCDCD),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '4.9  ',
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: ' ★  ',
                        style: TextStyle(
                          color: Color(0xffFFC003),
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: '(232)',
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Coffee latte is a rich coffee that is made with steamed milk and a thin layer of foamed milk on top.",
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),
          SizedBox(
            height:
                163, // Increased height to accommodate both the image and the button
            child: Stack(
              children: [
                // Positioned widget for the ADD button

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/cofe.png',
                    fit: BoxFit.cover,
                    height: 119, // Match the height of the SizedBox
                  ),
                ),
                Positioned(
                  bottom: -.1, // Position it from the bottom of the Stack
                  left: 20,
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff66A35C),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(.6),
        elevation: 6,
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: AppSizes.blockSizeHorizontal * 3,
                right: AppSizes.blockSizeHorizontal * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBTN(
                      onPressed: (val) {
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.home,
                      currentIndex: _currentIndex,
                      index: 0,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.person,
                      currentIndex: _currentIndex,
                      index: 1,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.wallet,
                      currentIndex: _currentIndex,
                      index: 2,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.delete_sweep_sharp,
                      currentIndex: _currentIndex,
                      index: 3,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: Icons.message_sharp,
                      currentIndex: _currentIndex,
                      index: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
