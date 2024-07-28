import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/widgets/textfields.dart';

class AddStudentsData extends StatelessWidget {
  AddStudentsData({super.key});

  final formKey = GlobalKey<FormState>();
  final StudentController studentControllerss = Get.put(StudentController());
  final PickedImageController pickimgController =
      Get.put(PickedImageController());
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final registerNoController = TextEditingController();
  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 190, 190),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 122, 122),
        title: const Text(
          "Add Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Obx(() => Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              pickimgController.selectedImage.value != null
                                  ? FileImage(pickimgController
                                      .selectedImage.value!) as ImageProvider
                                  : null,
                          radius: 60,
                          child: pickimgController.selectedImage.value == null
                              ? IconButton(
                                  onPressed: () {
                                    pickImage(pickimgController);
                                  },
                                  icon: const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Color.fromARGB(255, 82, 81, 81),
                                  ),
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: -5,
                          right: -4,
                          child: IconButton(
                            onPressed: () {
                              pickImage(pickimgController);
                            },
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                TextFormFields(
                  controller: registerNoController,
                  hintText: "Enter Your Register Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Register Number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: saveDetails,
                      child: const Text("SAVE"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveDetails() async {
    if (formKey.currentState!.validate()) {
      StudentModel student = StudentModel(
        studentName: nameController.text.trim(),
        age: ageController.text.trim(),
        registerNumber: registerNoController.text.trim(),
        phoneNumber: contactController.text.trim(),
        photo: pickimgController.selectedImage.value?.path ?? '',
      );

      await studentControllerss.addStudentDetails(student);
    }
  }

  void pickImage(PickedImageController controller) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        controller.selectedImage.value = File(pickedImage.path);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

class PickedImageController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
}
