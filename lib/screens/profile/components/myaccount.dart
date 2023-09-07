import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set temporary values in the text fields
    _nameController.text = 'Mechanic Mangao';
    _emailController.text = 'info@mechanicmangao.com';
    _phoneController.text = '+923137868899';
    _passwordController.text = '********';
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
                decoration: InputDecoration(labelText: 'Name'),
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
              Center(
                child: Container(
                  width: 250,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Get the updated values from the text fields
                        String newName = _nameController.text;
                        String newEmail = _emailController.text;
                        String newPhoneNo = _phoneController.text;
                        String newPassword = _passwordController.text;

                        // Implement logic to update user profile here

                        // Set the controllers with the new values
                        setState(() {
                          _nameController.text = newName;
                          _emailController.text = newEmail;
                          _phoneController.text = newPhoneNo;
                          _passwordController.text = newPassword;
                        });

                        // Navigate to the user's updated profile or a confirmation page
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3C8ED3)),
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
