import 'package:flutter/material.dart';

class Wallets extends StatelessWidget {
  const Wallets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.people_alt),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Hello Sacof!",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Send Money",
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Card",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 200, // Définissez la hauteur souhaitée
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              // Ajoutez le contenu souhaité ici
              child: const Center(
                child: Text(
                  'Carte sélectionnée',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
