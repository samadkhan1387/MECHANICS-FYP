import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user data from Cloud Firestore after user logs in
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Replace 'users' with the actual collection name in your Firestore
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          _nameController.text = userDoc['fullName'];
          _emailController.text = userDoc['email'];
          _phoneController.text = userDoc['phoneNumber'];
          _passwordController.text = userDoc['password'];
          _addressController.text = userDoc['address'];
        });
      }
    }
  }

  Future<void> updateUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Update user data in Cloud Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'fullName': _nameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneController.text,
        'address': _addressController.text,
      });

      // Update user email and password in Firebase Authentication (if needed)
      if (_emailController.text != user.email) {
        await user.updateEmail(_emailController.text);
      }

      if (_passwordController.text.isNotEmpty) {
        await user.updatePassword(_passwordController.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'User Account Details',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone No'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 250,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Update user profile logic
                        await updateUserData();

                        // Navigate to the user's updated profile or a confirmation page
                        // For example, you can use Navigator.pop(context) to go back to the previous screen
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF3C8ED3)),
                      ),
                      child: Text('Save', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
