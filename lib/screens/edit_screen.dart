import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/widgets/textfields.dart';

class EditStudentDetails extends StatelessWidget {
  final StudentModel student;
  final formKey = GlobalKey<FormState>();
  final StudentController studentController = Get.put(StudentController());
  final PickedImageEditController pickimgController =
      Get.put(PickedImageEditController());

  EditStudentDetails({super.key, required this.student}) {
    // Initialize the controllers with existing student data
    nameController.text = student.studentName ?? '';
    ageController.text = student.age ?? '';
    regController.text = student.registerNumber ?? '';
    phnController.text = student.phoneNumber ?? '';
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController regController = TextEditingController();
  final TextEditingController phnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 190, 190),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 122, 122),
        title: const Text(
          "Edit Student Details",
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
                          backgroundImage: pickimgController
                                      .selectedimage.value !=
                                  null
                              ? FileImage(
                                  pickimgController.selectedimage.value!)
                              : (student.photo != null &&
                                          student.photo!.isNotEmpty
                                      ? FileImage(File(student.photo!))
                                      : const AssetImage("assets/download.png"))
                                  as ImageProvider,
                          radius: 60,
                          child: pickimgController.selectedimage.value == null
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
                  controller: regController,
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
                  controller: phnController,
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
                      onPressed: () => saveStudent(
                          student,
                          nameController.text.trim(),
                          ageController.text.trim(),
                          regController.text.trim(),
                          phnController.text.trim(),
                          pickimgController.selectedimage.value?.path ?? ''),
                      child: const Text("SUBMIT"),
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

  saveStudent(StudentModel key, String name, String age, String place,
      String phone, String photo) async {
    await studentController.updateStudent(key, name, age, phone, photo, age);
    Get.back();
    Get.snackbar('Updated', 'student details has been updated successfully',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
  }

  void pickImage(PickedImageEditController controller) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        controller.selectedimage.value = File(pickedImage.path);
      }
    } catch (e) {
      log(5 as String);
    }
  }
}

class PickedImageEditController extends GetxController {
  Rx<File?> selectedimage = Rx<File?>(null);
}
