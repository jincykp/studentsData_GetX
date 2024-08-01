import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/screens/full_view.dart';
import 'package:student_management_getx/screens/home_screen.dart';
import 'package:student_management_getx/screens/tabbar.dart';

class GridviewScreen extends StatelessWidget {
  GridviewScreen({super.key});

  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 160, 122, 122),
        title: const Text(
          "Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const BottomTabBarss());
              },
              icon: const Icon(
                Icons.list,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (studentController.studentList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            itemCount: studentController.studentList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              final student = studentController.studentList[index];
              return GestureDetector(
                onTap: () {
                  // Get.to(FullViewScreen(student: student));
                  Get.to(() => FullViewScreen(student: student));
                },
                child: Card(
                  color: const Color.fromARGB(255, 219, 190, 190),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            student.photo != null && student.photo!.isNotEmpty
                                ? FileImage(File(student.photo!))
                                : null,
                        radius: 40,
                        child: student.photo == null || student.photo!.isEmpty
                            ? const Icon(
                                Icons.person,
                                size: 40,
                                color: Color.fromARGB(255, 82, 81, 81),
                              )
                            : null,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        student.studentName ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Reg No: ${student.registerNumber ?? ''}"),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
