import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/screens/add_details.dart';
import 'package:student_management_getx/screens/full_view.dart';
import 'package:student_management_getx/screens/gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find();
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          backgroundColor: const Color.fromARGB(255, 160, 122, 122),
          title: const Text(
            "Student Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(GridviewScreen());
              },
              icon: const Icon(Icons.grid_view, size: 30),
            )
          ],
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      contentPadding:
                          const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      studentController.searchStudent(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Obx(() {
            final studentList = studentController.filteredStudentList.isEmpty &&
                    searchController.text.isNotEmpty
                ? []
                : studentController.filteredStudentList.isEmpty
                    ? studentController.studentList
                    : studentController.filteredStudentList;

            if (studentList.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add students Details",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.to(AddStudentsData());
                    //   },
                    //   child: const Text("Add Student Data"),
                    // ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                final StudentModel student = studentList[index];
                return SizedBox(
                  height: 90,
                  child: Card(
                    color: const Color.fromARGB(255, 219, 190, 190),
                    child: ListTile(
                      onTap: () {
                        Get.to(FullViewScreen(student: student));
                      },
                      title: Text(
                        student.studentName ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        student.registerNumber ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: student.photo == null ||
                                student.photo!.isEmpty
                            ? const AssetImage('assets/download.png')
                            : FileImage(File(student.photo!)) as ImageProvider,
                        child: student.photo == null || student.photo!.isEmpty
                            ? const Icon(Icons.person, size: 25)
                            : null,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 160, 122, 122),
        onPressed: () {
          Get.to(AddStudentsData());
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 37,
        ),
      ),
    );
  }
}
