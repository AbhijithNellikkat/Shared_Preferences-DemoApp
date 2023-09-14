import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference_app/shared_Preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  String name = "No Saved Data";

  @override
  void dispose() {
    var dispose = super.dispose();
    controller.dispose();
  }

  saveData() {
    SharedPrefrenceService().saveString(controller.text);
    controller.clear();
    getData();
    setState(() {});
    Navigator.pop(context);
  }

  getData() {
    if (SharedPrefrenceService().getString() != null) {
      name = SharedPrefrenceService().getString();
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Lottie.asset("assets/animations/animation_lmj46bbv.json"),
            const Spacer(),
            const Text(
              "Saved Data In SharedPreference",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(name),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: SizedBox(
                              height: 170,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: controller,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text("Enter Something")),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: saveData,
                                      child: const Text("Save"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text("Add")),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
