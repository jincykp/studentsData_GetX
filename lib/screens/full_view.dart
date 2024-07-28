import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_getx/model/student_model.dart';

class FullViewScreen extends StatelessWidget {
  final StudentModel student;
  const FullViewScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: const Color.fromARGB(255, 219, 190, 190),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 122, 122),
        title: const Text(
          "Student Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Card(
                  color: Color.fromARGB(255, 160, 122, 122),
                  child: SizedBox(
                    height: 500,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: -30,
                  left: (MediaQuery.of(context).size.width / 2) - 60,
                  child: CircleAvatar(
                    backgroundImage:
                        student.photo != null && student.photo!.isNotEmpty
                            ? FileImage(File(student.photo!))
                            : const AssetImage("assets/download.png")
                                as ImageProvider,
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 6, 1, 20),
                    child: student.photo != null && student.photo!.isNotEmpty
                        ? null
                        : const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const SizedBox(
                            width: 130,
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Text(
                            student.studentName ?? ' ',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(
                            width: 130,
                            child: Text(
                              'Age:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Text(
                            student.age ?? ' ',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(
                            width: 130,
                            child: Text(
                              'Reg no:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Text(
                            student.registerNumber ?? ' ',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(
                            width: 130,
                            child: Text(
                              'Phone No:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Text(
                            student.phoneNumber ?? ' ',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
