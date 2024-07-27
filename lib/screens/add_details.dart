import 'package:flutter/material.dart';

import 'package:student_management_getx/screens/tabbar.dart';
import 'package:student_management_getx/widgets/textfields.dart';

class AddStudentsData extends StatefulWidget {
  const AddStudentsData({super.key});

  @override
  State<AddStudentsData> createState() => _AddStudentsDataState();
}

class _AddStudentsDataState extends State<AddStudentsData> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final registerNoController = TextEditingController();
  final contactController = TextEditingController();
  String? photo;
  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          size: 60,
                          color: Color.fromARGB(255, 82, 81, 81),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      right: -4,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
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
                  controller: contactController,
                  hintText: "Enter Your Contact Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Contact number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          //  Get.to(BottomTabBarss());
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const BottomTabBarss()));
                        },
                        child: const Text("SAVE"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // saveStudentData() async {
  //   if (photo == null || photo!.isEmpty) {
  //     return;
  //   }
  //   final studentName = nameController.text.trim();
  //   final studentAge = ageController.text.trim();
  //   final studentRegisterno = registerNoController.text.trim();
  //   final studentContactNo = contactController.text.trim();
  //   if (nameController.text.isNotEmpty ||
  //       ageController.text.isNotEmpty ||
  //       registerNoController.text.isNotEmpty ||
  //       contactController.text.isNotEmpty) {
  //     final studentDetails = StudentModel(
  //         studentName: studentName,
  //         age: studentAge,
  //         registerNumber: studentRegisterno,
  //         phoneNumber: studentContactNo,
  //         photo: photo.toString());
  //     await addStudentDetails(studentDetails);
  //   }
  // }
}
