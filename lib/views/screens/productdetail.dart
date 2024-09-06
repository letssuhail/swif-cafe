import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // Track the active switch and choice button
  String? _activeSwitch;
  String? _activeChoice;

  bool isCheckBox = false;
  // Variable to track the selected quantity from the dropdown
  String _selectedQuantity = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Latte Image
                Stack(
                  children: [
                    Container(
                      height: 430,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/cofe.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                // Latte Details Section
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Latte Title and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Latté',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.9),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.yellow, size: 16),
                                  const SizedBox(width: 5),
                                  const Text(
                                    '4.9 (1458)',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  const SizedBox(width: 5),
                                  Image.asset('assets/icons/right.png')
                                ],
                              ),
                            ],
                          ),
                          // Quantity Selector
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 4),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _selectedQuantity,
                                      items: <String>['1', '2', '3', '4', '5']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedQuantity = newValue!;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 12,
                                        color: Colors.grey[300],
                                      ),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[700],
                                      ),
                                      dropdownColor: Colors.grey[
                                          300], // Optional: Customize dropdown background color
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[700],
                                  height: double.infinity,
                                  width: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10), // Adjust padding if needed
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 30,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Latte Description
                      const Text(
                        'Caffé latte is a rich coffee made up of one or two shots of espresso, '
                        'steamed milk and a final thin layer of foamed milk on top.',
                        style: TextStyle(color: Colors.white60, fontSize: 10),
                      ),
                      const SizedBox(height: 20),
                      // Cup Filling Choice
                      Text(
                        'Choice of Cup Filling',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.9),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildChoiceButton('Full'),
                          _buildChoiceButton('1/2 Full'),
                          _buildChoiceButton('3/4 Full'),
                          _buildChoiceButton('1/4 Full'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Milk Options
                      Text(
                        'Choice of Milk',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.9),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          _buildToggleButton('Skim Milk'),
                          _buildToggleButton('Almond Milk'),
                          _buildToggleButton('Soy Milk'),
                          _buildToggleButton('Lactose Free Milk'),
                          _buildToggleButton('Full Cream Milk'),
                          _buildToggleButton('Oat Milk'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Sugar Options
                      const Text(
                        'Choice of Sugar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          _buildToggleButton('Sugar X1'),
                          _buildToggleButton('Sugar X2'),
                          _buildToggleButton('1/3 Sugar'),
                          _buildToggleButton('No Sugar'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // High Priority and Submit Button
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom Background Container
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckBox, // This must be a bool value
                          onChanged: (value) {
                            setState(() {
                              isCheckBox =
                                  value ?? false; // Update the checkbox state
                            });
                          },
                          activeColor: const Color(0xff48984c),
                        ),
                        const Text(
                          'High Priority',
                          style: TextStyle(
                              color: Color(0xffCDCDCD),
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      // width: 146,
                      height: 44,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff48984c),
                            Color(0xff48984c), // End color
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Make button background transparent
                          shadowColor:
                              Colors.transparent, // Remove any button shadows
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 30,
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(.9),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjust the top position if needed
            left: 10, // Adjust the left position if needed
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(
                    context); // This will navigate back to the previous screen
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceButton(String title) {
    return SizedBox(
      height: 35,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _activeChoice = title;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _activeChoice == title ? Colors.green : Colors.white10,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 60,
          child: Transform.scale(
            scale: 0.6,
            child: Switch(
              value: _activeSwitch == title,
              onChanged: (bool selected) {
                setState(() {
                  _activeSwitch = selected ? title : null;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.white,
              activeTrackColor:
                  const Color.fromARGB(255, 3, 255, 11).withOpacity(0.5),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
