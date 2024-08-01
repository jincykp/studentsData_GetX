import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management_getx/controller/student_controller.dart';
import 'package:student_management_getx/model/student_model.dart';
import 'package:student_management_getx/screens/add_details.dart';
import 'package:student_management_getx/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dire = await path.getApplicationDocumentsDirectory();
  Hive.init(dire.path);
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.initFlutter('student_db');
  Get.put(StudentController());
  Get.put(PickedImageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.orange,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 160, 122, 122))),
      home: const HomeScreen(),
    );
  }
}
