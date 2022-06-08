import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/sayac_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final SayacController _controller = Get.put(SayacController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyColumn(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              _controller.arttir();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              _controller.azalt();
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
          FloatingActionButton(
            heroTag: "btn3",
            foregroundColor: Get.isDarkMode ? Colors.amber : Colors.red,
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: const Icon(
              Icons.mode,
            ),
          ),
          FloatingActionButton(
            heroTag: "btn4",
            foregroundColor: Get.isDarkMode ? Colors.amber : Colors.red,
            onPressed: () {
              Get.to(NewPage());
            },
            child: const Icon(Icons.arrow_upward_rounded),
          ),
          FloatingActionButton(
            heroTag: "btn5",
            onPressed: () {
              Get.snackbar("Bildirim",
                  "Sayaca ${_controller.sayac.toString()} kadar basılmış",
                  backgroundColor: Colors.green);
              Get.showSnackbar(
                GetSnackBar(
                  title: "Varsayılan Bildirim",
                  message:
                      "Sayaca ${_controller.sayac.toString()} kadar basılmış",
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                ),
              );
            },
            child: const Icon(
              Icons.notification_add,
            ),
          ),
        ],
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  final SayacController _bulunanController = Get.find();

  MyColumn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetX<SayacController>(
          builder: (controller2) => Text(
            controller2.sayac.toString(),
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Obx(
          () => Text(
            "Butona ${_bulunanController.sayac.toString()} kere basildi",
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  NewPage({Key? key}) : super(key: key);
  final SayacController _yenisayfaController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Yeni Sayfa"),
          ),
          Center(
            child: Text(_yenisayfaController.sayac.toString()),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Geri Dön"),
          ),
        ],
      ),
    );
  }
}
