import 'package:flutter/material.dart';

class BookAppointmentPage extends StatefulWidget {
  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _carModelController = TextEditingController();
  TextEditingController _carYearController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _packageNameController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: 9, minute: 0);

  List<int> validCarYears = [2020, 2021, 2022, 2023];
  List<TimeOfDay> validTimes = [
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 11, minute: 0),
    TimeOfDay(hour: 13, minute: 0),
    TimeOfDay(hour: 15, minute: 0),
  ];

  Future<void> _selectYear(BuildContext context) async {
    final int? picked = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Car Year'),
          children: validCarYears.map((year) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, year);
              },
              child: Text(year.toString()),
            );
          }).toList(),
        );
      },
    );
    if (picked != null) {
      setState(() {
        _carYearController.text = picked.toString();
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showDialog<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: validTimes.map((time) {
              return ListTile(
                title: Text('${time.format(context)}'),
                onTap: () {
                  Navigator.of(context).pop(time);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Padding(
          padding: EdgeInsets.all(21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Book Appointment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: _packageNameController,
                decoration: InputDecoration(labelText: 'Package Name'),
              ),
              SizedBox(height: 25),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 25),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 25),
              TextField(
                controller: _carModelController,
                decoration: InputDecoration(labelText: 'Car Model'),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () => _selectYear(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Car Year',
                  ),
                  child: Text(
                    _carYearController.text,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date',
                        ),
                        child: Text(
                          '${_selectedDate.toLocal()}'.split(' ')[0],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Time',
                        ),
                        child: Text(
                          '${_selectedTime.format(context)}',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                maxLines: 1,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle appointment booking logic here

                    // Show a confirmation snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Appointment booked')),
                    );
                  },
                  child: Text('Book Appointment'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _carModelController.dispose();
    _carYearController.dispose();
    _addressController.dispose();
    _packageNameController.dispose();
    super.dispose();
  }
}
