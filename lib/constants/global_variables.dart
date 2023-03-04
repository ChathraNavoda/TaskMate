import 'package:flutter/material.dart';

//String uri = "http://192.168.1.101:3000";
String uri = "http://192.168.1.133:3000";
//192.168.1.133

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 112, 183, 12),
      Color.fromARGB(255, 221, 240, 225),
    ],
    stops: [0.29, 1.0],
  );

  //sizes

  static const secondaryColor = Color.fromARGB(255, 112, 183, 12);
  static Color darkGreenColor = Color.fromARGB(255, 13, 113, 16);
  static Color lightGreenColor = Color.fromARGB(255, 105, 172, 38);
  static Color containerGreenColor = Color.fromARGB(255, 233, 251, 210);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greenBackgroundCOlor = Color.fromARGB(255, 228, 248, 218);
  static var selectedNavBarColor = Color.fromARGB(255, 10, 143, 0);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://www.appleyardflowers.com/blog/wp-content/uploads/2022/07/anniversary-flowers-discount-code.jpg',
    'https://growinginthegarden.com/wp-content/uploads/2019/01/Vegetable-Planting-Guide-A-Visual-Planting-Guide-for-Low-Desert-Vegetables.png.webp',
    'https://cdn.firespring.com/images/6a35f818-25bf-4b0c-bafd-12946f8d4a8c.png',
    'https://cdn.i.haymarketmedia.asia/?n=campaign-asia%2Fcontent%2F20200904124329-%23Fight4OurPlanet_KV_thumb.jpg'
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Vegetables',
      'image': 'assets/images/vege.png',
    },
    {
      'title': 'Flowers',
      'image': 'assets/images/flower.png',
    },
    {
      'title': 'Herbs',
      'image': 'assets/images/herbs.png',
    },
    {
      'title': 'Seeds',
      'image': 'assets/images/seeds.png',
    },
    {
      'title': 'Tools',
      'image': 'assets/images/tools.jpg',
    },
  ];
}

      
      
      
      
      
      
      
      
      
      
      
      
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(70),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //         gradient: GlobalVariables.appBarGradient,
      //       ),
      //     ),
      //     title: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           alignment: Alignment.topLeft,
      //           child: Image.asset(
      //             'assets/images/logo.png',
      //             width: 120,
      //             height: 45,
      //             color: Colors.black,
      //           ),
      //         ),
      //         const Text(
      //           'Add Products',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         )
      //       ],
      //     ),
      //   ),