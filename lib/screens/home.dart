import 'package:exams/models/depensemodel.dart';
import 'package:exams/screens/add_depense.dart';
import 'package:exams/screens/login.dart';
import 'package:exams/screens/widgets/depense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DepenseModel> depense = [
    DepenseModel(2000, "materiel", "achat de materiel", DateTime(2023, 4, 1)),
    DepenseModel(2000, "materiel", "achat de materiel", DateTime(2023, 4, 1)),
    DepenseModel(2000, "materiel", "achat de materiel", DateTime(2023, 4, 1)),
    DepenseModel(2000, "materiel", "achat de materiel", DateTime(2023, 4, 1)),
  ];
  create() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List des depenses",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: depense.length,
        itemBuilder: (context, index) {
          return Depense(depenseModel: depense[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddPage()));
        },
        backgroundColor: Colors.black,
        tooltip: 'Ajouter une depense',
        child: Icon(Icons.add),
      ),
    );
  }
}
