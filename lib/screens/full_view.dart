import 'package:flutter/material.dart';

class FullViewScreen extends StatelessWidget {
  const FullViewScreen({super.key});

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
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color.fromARGB(255, 6, 1, 20),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
