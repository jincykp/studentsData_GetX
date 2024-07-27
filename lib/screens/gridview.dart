import 'package:flutter/material.dart';

class GridviewScreen extends StatelessWidget {
  const GridviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 160, 122, 122),
          title: const Text(
            " Student Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return const Card(color: Color.fromARGB(255, 219, 190, 190));
                }),
          )
        ],
      ),
    );
  }
}
