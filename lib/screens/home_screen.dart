import 'package:flutter/material.dart';
import 'package:student_management_getx/screens/add_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
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
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Align column to bottom

              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                      decoration: InputDecoration(
                    hintText: 'Search...',
                    contentPadding:
                        const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(24)),
                  )),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.grid_view,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 90,
                      child: Card(
                        color: const Color.fromARGB(255, 177, 158, 158),
                        child: ListTile(
                          title: const Text(
                            "jincy",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            "123",
                            style: TextStyle(color: Colors.black),
                          ),
                          leading: const CircleAvatar(
                            radius: 50,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 160, 122, 122),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddStudentsData()));
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
