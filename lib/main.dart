// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'language_selection.dart';

void main() {
  runApp(SmartRideApp());
}

// ignore: use_key_in_widget_constructors
class SmartRideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Ride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _mockLoading();
  }

  Future<void> _mockLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/bus logo.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class OnboardingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _navigateToUserPermissions() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AllowLocationScreen()),
    );
  }

  void _onNextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex++;
      });
    } else {
      _navigateToUserPermissions();
    }
  }

  void _onPreviousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OnboardingPage(
                  image: 'assets/track image .jpg',
                  title: 'Track your bus',
                  description: 'Real-time tracking for students and drivers',
                ),
                OnboardingPage(
                  image: 'assets/estimated image.jpg',
                  title: 'Estimated Arrival Times',
                  description: 'Get accurate arrival times for your bus',
                ),
                OnboardingPage(
                  image: 'assets/stay informed image.jpg',
                  title: 'Stay Informed',
                  description: 'Receive important notifications and updates',
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentIndex > 0)
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: _onPreviousPage,
                      )
                    else
                      const SizedBox(width: 48),
                    IconButton(
                      icon: Icon(
                        _currentIndex < 2 ? Icons.arrow_forward : Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: _onNextPage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  // ignore: use_key_in_widget_constructors
  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 1),
            child: Image.asset(image, height: 250),
          ),
          const SizedBox(height: 30),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: 150,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AllowLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.location_on,
              size: 100,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 20),
            const Text(
              'Allow your location',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'We will need your location to give you a better experience.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AllowContactsScreen(),
                  ),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text('Sure, I\'d like that'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle "Not now" action
              },
              child: const Text(
                'Not now',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AllowContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.contacts,
              size: 100,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 20),
            const Text(
              'Allow your contacts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'We will need your contacts to give you a better experience.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LanguageSelectionScreen(),
                  ),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text('Sure, I\'d like that'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AllowLocationScreen(),
                  ),
                );
              },
              child: const Text(
                'Not now',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


