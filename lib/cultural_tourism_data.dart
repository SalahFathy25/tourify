import 'package:flutter/material.dart';

class TourismType {
  final String title;
  final String description;
  final String mainImage;
  final List<String> details;
  final List<String> additionalImages;

  TourismType({
    required this.title,
    required this.description,
    required this.mainImage,
    required this.details,
    required this.additionalImages,
  });
}

final List<TourismType> culturalTourismTypes = [
  TourismType(
    title: 'Cultural tourism',
    description:
        'Cultural tourism in Egypt is a journey through millennia of history, art, and traditions. The country is a living museum, offering visitors the chance to explore ancient civilizations, Islamic heritage, Coptic Christianity, and vibrant local cultures.',
    mainImage:
        'https://i.pinimg.com/736x/fa/42/f6/fa42f61c19d7db1562e6983c640818d4.jpg',
    details: [
      '1. Ancient Egyptian Heritage\n'
          '- The Pyramids of Giza and the Sphinx: Iconic symbols of Egypt, these structures are marvels of ancient engineering and architecture.\n'
          '- Luxor: Known as the world\'s greatest open-air museum, Luxor is home to the Karnak Temple, Luxor Temple, and the Valley of the Kings, where pharaohs like Tutankhamun were buried.\n'
          '- Abu Simbel: The colossal temples of Ramses II and Queen Nefertari, relocated to save them from the rising waters of Lake Nasser.\n'
          '- Temples of Karnak and Luxor: These temples are masterpieces of ancient Egyptian art and religion.',
      '2. Islamic Heritage\n'
          '- Islamic Cairo: This area is filled with mosques, madrasas, and historic buildings. Notable landmarks include:\n'
          '  Al-Azhar Mosque: One of the oldest universities in the world.\n'
          '  Sultan Hassan Mosque: A masterpiece of Mamluk architecture.\n'
          '  The Citadel of Saladin: A medieval fortress with the stunning Mosque of Muhammad Ali.\n'
          '  Mosque of Ibn Tulun: One of the oldest and largest mosques in Cairo.\n'
          '  Al-Muizz Street: A historic street lined with Islamic monuments and bazaars.',
      '3. Coptic Christian Heritage\n'
          '- Coptic Cairo: Home to some of the oldest Christian churches in the world, including:\n'
          '   The Hanging Church\n'
          '   Church of St. Sergius and Bacchus\n'
          '   Coptic Museum',
    ],
    additionalImages: [
      'https://i.pinimg.com/736x/c5/d4/2a/c5d42a8bdb76a88c259a978483fbf47a.jpg',
      'https://i.pinimg.com/736x/c1/49/2c/c1492cff10af91ab36f0309e431c4429.jpg',
      'https://i.pinimg.com/736x/6d/5f/63/6d5f63f1f66ba7d42aac744ab5090697.jpg',
    ],
  ),
  TourismType(
    title: 'Therapeutic tourism',
    description:
        'Therapeutic tourism in Egypt is a growing sector that attracts visitors seeking natural remedies, relaxation, and medical treatments. The country is rich in natural resources like mineral springs, sulfur water, and healing sand, making it an ideal destination for those looking to improve their health.',
    mainImage:
        'https://i.pinimg.com/1200x/8b/9a/23/8b9a23945c865e32d95043bc7f5a8f1f.jpg',
    details: [
      '1. Siwa Oasis\n'
          '- Famous for its hot sand baths and natural springs, Siwa is a top destination for treating rheumatism, skin diseases, and arthritis.\n'
          '- The Dakrour Mountain in Siwa is particularly known for sand therapy.',
      '2. Safaga\n'
          '- This coastal city on the Red Sea is well known for its black sand, which is rich in minerals that help treat psoriasis, arthritis, and skin conditions.\n'
          '- The high salt concentration in the water also aids in healing.',
      '3. Ain Sokhna\n'
          '- Located near Cairo, Ain Sokhna has natural hot springs that help with respiratory diseases and joint pain.',
      '4. Helwan Sulfur Springs\n'
          '- Near Cairo, these springs are among the most famous in Egypt for their high sulfur content, which is beneficial for skin diseases, rheumatism, and respiratory conditions.',
      '5. Aswan (El-Nasr Sanatorium)\n'
          '- Aswan’s dry climate and warm sunshine make it an excellent location for treating respiratory issues, kidney diseases, and rheumatoid arthritis.',
      '6. Siwa, Bahariya, and Farafra Oases\n'
          '- Known for their hot springs and therapeutic mud, these oases provide natural treatments for a variety of ailments.',
    ],
    additionalImages: [
      'https://i.pinimg.com/736x/87/f0/20/87f0203b2abc28d57e96e604c7acb980.jpg',
      'https://i.pinimg.com/736x/07/c1/f3/07c1f385a7ee7770337df00a62dcc1e1.jpg',
    ],
  ),
  TourismType(
    title: 'Yacht tourism',
    description:
        'Yacht tourism in Egypt is an increasingly popular way to explore the country\'s stunning coastal waters, historic landmarks, and vibrant marine life. With access to the Mediterranean Sea, the Red Sea, and the Nile River, Egypt offers unique yacht tourism experiences that combine luxury, adventure, and cultural discovery.',
    mainImage:
        'https://i.pinimg.com/736x/d2/73/05/d273057690cea85a66a5f7faf73d7715.jpg',
    details: [
      '1. Popular Destinations for Yacht Tourism\n',
      '1.1 Red Sea\n'
          '- Hurghada: A major hub for yacht charters and sailing trips.\n'
          '   Activities: Snorkeling, diving, and island hopping to places like Giftun Island.\n'
          '- Marsa Alam: Known for pristine waters and vibrant coral reefs, including spots like Sataya Dolphin Reef.\n'
          '- Sharm El-Sheikh: Offers luxury yacht charters with access to Ras Mohammed National Park and Tiran Island.\n'
          '- El Gouna: A luxury resort town with a marina offering yacht charters for leisure and diving.',
      '1.2 Mediterranean Sea\n'
          '- Alexandria: Egypt’s historic Mediterranean port city with opportunities for coastal cruising and fishing.\n'
          '- Marina El-Alamein: A luxury resort destination with marinas catering to private yachts and upscale visitors.',
      '1.3 Nile River\n'
          '- Cairo to Aswan: Luxurious river yachts (dahabiyas) offer a leisurely way to explore the Nile, with stops at historic landmarks like Luxor, Karnak Temple, and the Valley of the Kings.\n'
          '- Aswan to Abu Simbel: Cruise Lake Nasser on a yacht, visiting temples and enjoying serene landscapes.',
      '2. Activities on Yacht Tours\n'
          '- Diving and Snorkeling\n'
          '- Island Hopping\n'
          '- Fishing Expeditions\n'
          '- Cultural Excursions\n'
          '- Luxury Experiences',
    ],
    additionalImages: [
      'https://i.pinimg.com/736x/27/17/6a/27176a52af4921800b63be7122934802.jpg',
      'https://i.pinimg.com/736x/f8/46/26/f84626c412fdfa3ff715c7ce44c1996d.jpg',
      'https://i.pinimg.com/736x/1e/c2/fd/1ec2fd2a84b499dc37ea9eba3714d02a.jpg',
    ],
  ),
  TourismType(
    title: 'Recreational tourism',
    description:
        'Recreational tourism in Egypt is a thriving sector due to the country\'s unique blend of natural beauty, rich history, and modern attractions. Here are some highlights of recreational tourism in Egypt:',
    mainImage:
        'https://i.pinimg.com/736x/2b/f5/ad/2bf5ad611db89916ad3153f956d37e15.jpg',
    details: [
      '1. Beach Tourism\n'
          '- Red Sea Resorts: Egypt is famous for its coastal cities like Hurghada, Sharm El-Sheikh, and Dahab, which offer pristine beaches, crystal-clear waters, and vibrant coral reefs. These areas are ideal for snorkeling, scuba diving, and water sports.\n'
          '- Mediterranean Coast: Cities like Alexandria, North Coast, Marsa Matrouh, Baltim, Port Said, Damietta, and Ras El Bar.',
      '2. Diving and Snorkeling\n'
          '- Sharm El-Sheikh:\n'
          '   Ras Mohammed National Park - Tiran Island - Sharks Bay\n'
          '- Hurghada:\n'
          '   Giftun Islands - Dolphin House - Abu Nuhas - Magawish Island\n'
          '- Dahab:\n'
          '   Blue Hole - The Canyon - Lighthouse Reef\n'
          '- Marsa Alam:\n'
          '   Elphinstone Reef - Dolphin House (Sha’ab Samadai) - Abu Dabbab - Sataya Reef',
      '3. Cruises and Nile Tourism\n'
          '- A Nile cruise between Luxor and Aswan offers a mix of relaxation and exploration, with stops at iconic sites like the Valley of the Kings, Karnak Temple, and Philae Temple.\n'
          '- Felucca rides (traditional sailboats) provide a more tranquil way to experience the Nile.',
      '4. Desert and Oasis Retreats\n'
          '- Explore Egypt\'s vast deserts with activities like sandboarding, quad biking, and camping under the stars.\n'
          '- Visit oases such as Siwa, Bahariya, and Farafra, which offer hot springs, palm groves, and unique landscapes.',
    ],
    additionalImages: [
      'https://i.pinimg.com/736x/f5/5a/d6/f55ad6d219a6bae322c1fa7f3ef52898.jpg',
      'https://i.pinimg.com/736x/d2/e2/9d/d2e29daa2849bf934252bd260ee8dbb6.jpg',
      'https://i.pinimg.com/736x/2a/2a/a3/2a2aa3c48412b6ab67aa57934cc11991.jpg',
    ],
  ),
  TourismType(
    title: 'Safari Tourism',
    description:
        'Safari tourism in Egypt is a thrilling way to explore the country\'s vast deserts, unique landscapes, and diverse ecosystems. With its rich natural heritage, Egypt offers various safari experiences that combine adventure, nature, and cultural immersion.',
    mainImage:
        'https://i.pinimg.com/736x/f5/84/15/f584151568a2e1007a8247e700160dc5.jpg',
    details: [
      '1. Types of Safari Tourism in Egypt\n'
          '- Desert Safaris: Explore Egypt’s expansive deserts, including the Western Desert, Eastern Desert, and Sinai Desert.\n'
          '- Wildlife Safaris: Egypt is home to diverse wildlife, including:\n'
          '   Fennec Fox\n'
          '   Nubian Ibex\n'
          '   Egyptian Cobra\n'
          '   Dugong (Sea Cow)\n'
          '   Whale Sharks & Dolphins (Hurghada)\n'
          '   Greater Flamingo\n'
          '- Protected areas like Ras Mohammed, Wadi El Gemal, and the White Desert help preserve Egypt’s wildlife.\n'
          '- Cultural Safaris: Visit Bedouin communities to experience their traditions and lifestyle.\n'
          '- Adventure Safaris: Engage in activities like **dune bashing, sandboarding, and camel trekking.',
      '2. Top Safari Destinations in Egypt\n'
          '- Western Desert:\n'
          '   White Desert National Park: Known for its surreal chalk rock formations shaped by wind erosion. Ideal for camping under the stars and witnessing spectacular desert sunsets.\n'
          '   Farafra Oasis: Famous for its hot springs and traditional mud-brick houses. A gateway to the White Desert.\n'
          '   Siwa Oasis: Offers lush palm groves, salt lakes, and ancient ruins like the Temple of the Oracle. Known for its unique Berber culture and natural springs.\n'
          '   Bahariya Oasis: Features the Golden Mummies Museum and hot springs. Starting point for excursions to the White and Black Deserts.',
      '- Eastern Desert:\n'
          '  Wadi El Gemal National Park:Located near Marsa Alam, it combines desert landscapes with marine life. Home to camels, gazelles, and ancient emerald mines.\n'
          '  Hurghada Desert:Popular for quad biking, camel rides, and Bedouin dinner experiences.',
      '- Sinai Desert:\n'
          '  Mount Sinai and St. Catherine: A mix of religious and natural exploration. Enjoy hikes and stunning views of the Sinai Peninsula.\n'
          '  Nuweiba and Dahab:Combine desert adventures with snorkeling and diving opportunities in the Red Sea.',
      '3. Safari Activities\n'
          '- Dune Bashing: Ride 4x4 vehicles over towering sand dunes.\n'
          '- Camel Trekking\n'
          '- Sandboarding\n'
          '- Star Gazing\n'
          '- Camping',
      '📅Best Time for Safari Tourism in Egypt:\n'
          '-  🔴 The best months for safari tourism in Egypt are October to April, when temperatures are cooler and more comfortable for outdoor activities.',
    ],
    additionalImages: [
      'https://i.pinimg.com/736x/e0/76/5e/e0765ebc7cf3df7ca21359b31a6d8ed3.jpg',
      'https://i.pinimg.com/736x/3d/b2/b7/3db2b784629b064f9f63fa648bd17581.jpg',
      'https://i.pinimg.com/736x/53/fe/f4/53fef4bf64313be53c0f352687676666.jpg',
    ],
  ),
];

class TourismTypeDetailsScreen extends StatefulWidget {
  final TourismType tourismType;

  const TourismTypeDetailsScreen({super.key, required this.tourismType});

  @override
  _TourismTypeDetailsScreenState createState() =>
      _TourismTypeDetailsScreenState();
}

class _TourismTypeDetailsScreenState extends State<TourismTypeDetailsScreen> {
  bool _isDescriptionVisible = false; // State to manage description visibility

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tourismType.title,
          style: TextStyle(
            fontSize: screenWidth * 0.06, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF203A58),
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            AspectRatio(
              aspectRatio: 16 / 9, // Maintain aspect ratio
              child: Image.network(
                widget.tourismType.mainImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Description Card with Toggle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isDescriptionVisible =
                        !_isDescriptionVisible; // Toggle visibility
                  });
                },
                child: Card(
                  elevation: 4, // Add shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        screenWidth * 0.04), // Responsive padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.045, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple[900],
                          ),
                        ),
                        if (_isDescriptionVisible) // Show description only if visible
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.02),
                            child: Text(
                              widget.tourismType.description,
                              style: TextStyle(
                                fontSize:
                                    screenWidth * 0.04, // Responsive font size
                                color: Colors.grey[800],
                                height: 1.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.tourismType.details.map((detail) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: Text(
                      detail,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035, // Responsive font size
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            // Additional Images
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Text(
                'Gallery',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Grid of Additional Images
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: screenWidth * 0.02,
                mainAxisSpacing: screenHeight * 0.02,
                childAspectRatio: 1, // Square images
              ),
              itemCount: widget.tourismType.additionalImages.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.tourismType.additionalImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}

class TourismListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourism Types'),
      ),
      body: ListView.builder(
        itemCount: culturalTourismTypes.length,
        itemBuilder: (context, index) {
          final tourismType = culturalTourismTypes[index];
          return ListTile(
            title: Text(tourismType.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TourismTypeDetailsScreen(tourismType: tourismType),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
