import 'package:flutter/material.dart';
import 'package:student_management_getx/widgets/textfields.dart';

class AddStudentsData extends StatelessWidget {
  const AddStudentsData({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final registerNoController = TextEditingController();
    final phoneNoController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 190, 190),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 160, 122, 122),
          title: const Text(
            "Add Student Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 70,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFields(
                controller: nameController,
                hintText: "Enter Your name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFields(
                controller: ageController,
                hintText: "Enter Your age",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFields(
                controller: registerNoController,
                hintText: "Enter Your ResgisterNumber",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'RegisterNumber is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFields(
                controller: phoneNoController,
                hintText: "Enter Your Contact Number",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact number is required';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
