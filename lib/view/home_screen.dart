import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/auth_controller.dart';

import 'package:task/controller/medicin_controller.dart';
import 'package:task/view/AuthScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MedicineProvider>(context, listen: false).getData();
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Welcome'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Provider.of<AuthProvider>(context).userData['name'],
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Provider.of<AuthProvider>(context).userData['email'],
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateTime.now().toUtc().toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ));
    });
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<MedicineProvider>(context, listen: false).disData.clear();
    Provider.of<MedicineProvider>(context, listen: false).diseases.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).singOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const AuthScreen()));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<MedicineProvider>(context).disData.length,
        itemBuilder: (_, index) => Container(
          margin: const EdgeInsets.all(10),
          child: Card(
            elevation: 16,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    Provider.of<MedicineProvider>(context)
                        .disData[index]
                        .disease,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Name : ${Provider.of<MedicineProvider>(context).disData[index].drugName}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Dose : ${Provider.of<MedicineProvider>(context).disData[index].drugDose}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Strength : ${Provider.of<MedicineProvider>(context).disData[index].drugStrength}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
