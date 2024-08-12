// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Bus Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  // ignore: duplicate_ignore
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Bus Map', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 10, 89, 154),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white ,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DriverListPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for bus routes or stops',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 10, 89, 154),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/tambaram.png', // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Upcoming Buses:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Dummy data for upcoming buses
                  _busInfo('Bus 1', '5 mins'),
                  _busInfo('Bus 2', '10 mins'),
                  _busInfo('Bus 3', '15 mins'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _busInfo(String busName, String eta) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.directions_bus, color: Colors.white),
          const SizedBox(width: 8),
          Text('$busName - $eta', style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class DriverListPage extends StatefulWidget {
  @override
  _DriverListPageState createState() => _DriverListPageState();
}

class _DriverListPageState extends State<DriverListPage> {
  final List<Map<String, String>> drivers = [
    {'name': 'Devadass', 'photo': 'assets/driver logo.png', 'route': 'Kalpakkam', 'arrivalTime': '8:30', 'contact': '7708886427', 'routeMap': 'assets/kalpakkam.png'},
    {'name': 'Arumugam', 'photo': 'assets/1 driver.jpg', 'route': 'Arakkonam', 'arrivalTime': '8:40', 'contact': '7708886428', 'routeMap': 'assets/arakkonam.png'},
    {'name': 'Palani', 'photo': 'assets/driver logo.jpg', 'route': 'Kanchipuram', 'arrivalTime': '8:35', 'contact': '7708886429', 'routeMap': 'assets/kanchipuram.png'},
    {'name': 'Munusaamy', 'photo': 'assets/driver logo.png', 'route': 'Chengalpat', 'arrivalTime': '8:40', 'contact': '7708886430', 'routeMap': 'assets/chengalpat.png'},
    {'name': 'Anand', 'photo': 'assets/1 driver.jpg', 'route': 'Tambaram', 'arrivalTime': '8:50', 'contact': '7708886431', 'routeMap': 'assets/tambaram.png'},
    {'name': 'Kumar', 'photo': 'assets/driver logo.jpg', 'route': 'Thirumullaivoyal', 'arrivalTime': '8:47', 'contact': '7708886432', 'routeMap': 'assets/thirumullaivoyal.png'},
    {'name': 'Senthinathan', 'photo': 'assets/1 driver.jpg', 'route': 'Chrompet', 'arrivalTime': '8:50', 'contact': '7708886433', 'routeMap': 'assets/chrompet.png'},
    {'name': 'Chinnappan', 'photo': 'assets/driver logo.png', 'route': 'Pallavaram', 'arrivalTime': '8:35', 'contact': '7708886434', 'routeMap': 'assets/pallavaram.png'},
    {'name': 'Gokul', 'photo': 'assets/2logo.jpg', 'route': 'Medavakkam', 'arrivalTime': '8:50', 'contact': '7708886435', 'routeMap': 'assets/medavakkam.png'},
    {'name': 'Devaraj', 'photo': 'assets/1 driver.jpg', 'route': 'Vadapalani', 'arrivalTime': '8:30', 'contact': '7708886436', 'routeMap': 'assets/vadapalani.png'},
    {'name': 'Sugumar', 'photo': 'assets/driver logo.png', 'route': 'Madurantakam', 'arrivalTime': '8:35', 'contact': '7708886437', 'routeMap': 'assets/madurantakam.png'},
    {'name': 'Vinoth Kumar', 'photo': 'assets/2logo.jpg', 'route': 'Avadi', 'arrivalTime': '8:40', 'contact': '7708886438', 'routeMap': 'assets/avadi.png'},
  ];

  late List<Map<String, String>> filteredDrivers;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDrivers = drivers;
    searchController.addListener(() {
      filterDrivers();
    });
  }

  void filterDrivers() {
    List<Map<String, String>> results = [];
    if (searchController.text.isEmpty) {
      results = drivers;
    } else {
      results = drivers
          .where((driver) =>
              driver['name']!.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredDrivers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search Driver',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 89, 154),
        iconTheme: const IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      backgroundColor: const Color.fromARGB(255, 203, 218, 231),
      body: ListView.builder(
        itemCount: filteredDrivers.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 10, 89, 154),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(filteredDrivers[index]['photo']!),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filteredDrivers[index]['name']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    filteredDrivers[index]['route']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusInfoPage(driver: filteredDrivers[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BusInfoPage extends StatelessWidget {
  final Map<String, String> driver;

  // ignore: use_key_in_widget_constructors
  const BusInfoPage({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Information', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 10, 89, 154),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 203, 218, 231),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              color: const Color.fromARGB(255, 10, 89, 154),
              child: ListTile(
                title: const Text('Route Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text(driver['route']!, style: const TextStyle(color: Colors.white)),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 10, 89, 154),
              child: ListTile(
                title: const Text('Driver\'s Name and Contact Information', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(driver['name']!, style: const TextStyle(color: Colors.white)),
                    Text('Phone: ${driver['contact']}', style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 10, 89, 154),
              child: ListTile(
                title: const Text('Estimated Arrival Time', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text(driver['arrivalTime']!, style: const TextStyle(color: Colors.white)),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 10, 89, 154),
              child: ListTile(
                title: const Text('Route Map', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                // ignore: sized_box_for_whitespace
                subtitle: Container(
                  height: 400,
                  child: Image.asset(driver['routeMap']!, fit: BoxFit.cover),
                ),
              ),
            ),
            const Card(
              color: Color.fromARGB(255, 10, 89, 154),
              child: ListTile(
                title: Text('Dynamic Time Updates', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text('Updated based on traffic conditions and bus speed', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
