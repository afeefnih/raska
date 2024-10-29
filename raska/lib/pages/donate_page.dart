import 'dart:io'; // Required to handle File with Image widget
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:raska/config/components/button.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  String _foodName = '';
  String _foodCategory = 'Raw Food';
  DateTime _selectedDate = DateTime.now();
  int _quantity = 1;
  String _address = '';
  String _userName = 'John Doe'; // Prefilled user info
  String _userContact = '123-456-7890'; // Prefilled user info
  XFile? _foodImage;

  // Category options with corresponding image assets
  final List<Map<String, String>> _categories = [
    {'title': 'Raw Food', 'image': 'lib/images/raw-food.png'},
    {'title': 'Cooked Food', 'image': 'lib/images/cooked-food.png'},
    {'title': 'Canned Food', 'image': 'lib/images/canned-food.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Food Name",
                  border: OutlineInputBorder(                                        
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  
                ),
                validator: (value) => value == null || value.isEmpty
                    ? "Please enter the food name"
                    : null,
                onSaved: (value) => _foodName = value ?? '',
              ),
              SizedBox(height: 16),
              const Text(
                  'Food Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 8),
              Row(
                children: _categories.map((category) {
                  bool isSelected = _foodCategory == category['title'];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _foodCategory = category['title']!);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
                            width: isSelected ? 2.0 : 1.0,
                          ),
                          color: Colors.black.withOpacity(0.6), // Dark overlay for unselected
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Category Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                category['image']!,
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                                color: isSelected ? null : Colors.black.withOpacity(0.5),
                                colorBlendMode: isSelected ? null : BlendMode.darken,
                              ),
                            ),
                            // Category Title Overlay
                            Text(
                              category['title']!,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.white70,
                                fontSize: 18,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              const Text(
                  'Expiry Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ListTile(
                title: Text(DateFormat.yMMMd().add_jm().format(_selectedDate)),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(1999),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_selectedDate),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedDate = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 16),

              // Quantity Serving (Number Input)
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Quantity Serving",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || int.tryParse(value) == null
                    ? "Please enter a valid quantity"
                    : null,
                onSaved: (value) => _quantity = int.parse(value ?? '1'),
              ),
              SizedBox(height: 16),

              // Upload Food Image
              Text("Upload Food Image"),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _foodImage = image;
                  });
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: _foodImage == null
                      ? Center(child: Text("Tap to upload image"))
                      : Image.file(
                          File(_foodImage!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(height: 16),

              // Address (e.g., using a map or basic text for now)
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),  
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? "Please enter an address"
                    : null,
                onSaved: (value) => _address = value ?? '',
              ),
              SizedBox(height: 16),

              Divider(),

              const Text(
                'User Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text("Name: $_userName"),
              Text("Contact: $_userContact"),
              SizedBox(height: 16),

              MyButton(
                text: 'Submit Donation', onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Donation Submitted!")),
                      );
                    }
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
