// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'mobile_number.dart';
import 'busmap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: duplicate_ignore
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final _studentFormKey = GlobalKey<FormState>();
  final _driverFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(235, 124, 192, 186),
          title: const Text('Login/Register'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Students'),
              Tab(text: 'Drivers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildStudentLogin(context),
            _buildDriverLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentLogin(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 226, 220, 157), Color(0xFF40C4FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _studentFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildTextField('Email/Username', false, Icons.email),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildTextField('Password', true, Icons.lock),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  _navigateToResetPassword(context);
                },
                // ignore: sort_child_properties_last
                child: const Text('Forgot Password?'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_studentFormKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(233, 106, 160, 252),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              SignInButton(
                Buttons.Google,
                text: "Sign in with Google",
                onPressed: () {
                  // Handle Google sign-in
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _navigateToMobileNumber(context);
                },
                icon: const Icon(Icons.phone),
                label: const Text("Sign in with Phone"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  _navigateToRegister(context, 'Student');
                },
                child: const Text('New user? Register here'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDriverLogin(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 226, 220, 157), Color(0xFF40C4FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _driverFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildTextField('License Number', false, Icons.card_membership),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildTextField('Vehicle ID', false, Icons.directions_car),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildTextField('Password', true, Icons.lock),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_driverFormKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              SignInButton(
                Buttons.Google,
                text: "Sign in with Google",
                onPressed: () {
                  // Handle Google sign-in
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _navigateToMobileNumber(context);
                },
                icon: const Icon(Icons.phone),
                label: const Text("Sign in with Phone"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, bool isPassword, IconData icon) {
    return TextFormField(
      obscureText: isPassword ? !_passwordVisible : false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  void _navigateToResetPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
    );
  }

  void _navigateToRegister(BuildContext context, String role) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => RegisterScreen(role: role)),
    );
  }

  void _navigateToMobileNumber(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MobileNumberScreen()),
    );
  }
}




// Register Screen Widget
class RegisterScreen extends StatelessWidget {
  final String role;
  final _registerFormKey = GlobalKey<FormState>();

  RegisterScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Registration'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _registerFormKey,
          child: Column(
            children: [
              const Spacer(),
              _buildTextField('Email/Username', false, Icons.email),
              const SizedBox(height: 20),
              const _PasswordField(hintText: 'Password', icon: Icons.lock),
              const SizedBox(height: 20),
              const _PasswordField(hintText: 'Confirm Password', icon: Icons.lock),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_registerFormKey.currentState?.validate() ?? false) {
                    _navigateToSuccess(context);
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text('Register'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.extraLightBackgroundGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, bool isPassword, IconData icon) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  void _navigateToSuccess(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegisterSuccessScreen()),
    );
  }
}

class _PasswordField extends StatefulWidget {
  final String hintText;
  final IconData icon;

  const _PasswordField({required this.hintText, required this.icon});

  @override
  __PasswordFieldState createState() => __PasswordFieldState();
}

class __PasswordFieldState extends State<_PasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}





// Reset Password Screen Widget
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  // ignore: prefer_final_fields
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(),
              _buildTextField('Enter your email', false, Icons.email),
              const SizedBox(height: 20),
              _buildTextField('Enter new password', true, Icons.lock),
              const SizedBox(height: 20),
              _buildTextField('Confirm new password', true, Icons.lock),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _navigateToPasswordChanged(context);
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.extraLightBackgroundGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, bool isPassword, IconData icon) {
    return TextFormField(
      obscureText: isPassword ? !_passwordVisible : false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  void _navigateToPasswordChanged(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const PasswordChangedScreen()),
    );
  }
}

// Password Changed Screen Widget
class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password Changed!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your password has been changed successfully',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                // ignore: sort_child_properties_last
                child: const Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Success Screen Widget
class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Success',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'Congratulations, your account has been successfully created',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                // ignore: sort_child_properties_last
                child: const Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
     ),
);
}
}

