import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'otp_screen.dart';

// Mobile Number Screen Widget
// ignore: use_key_in_widget_constructors
class MobileNumberScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter Your Mobile Number',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white70, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mobile icon.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  // ignore: avoid_print
                  print(number.phoneNumber);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.white),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                keyboardType:
                    const TextInputType.numberWithOptions(signed: true, decimal: true),
                inputDecoration: InputDecoration(
                  hintText: 'Enter mobile number',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                textStyle: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToOtpScreen(context);
                },
                // ignore: sort_child_properties_last
                child: const Text('Verify'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToOtpScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OtpScreen()),
    );
  }
}
