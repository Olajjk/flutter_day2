import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // Première ligne (Avatar + Texte + Bouton)
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(child: Icon(Icons.people)),
                    SizedBox(width: 10),
                    Text(
                      "Hello Sacof!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          // Carte de crédit
          Container(
            width: 350,
            height: 200,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Stack(
              children: [
                // Texte en haut à gauche
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    'Sacof Account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Texte en haut à droite
                Positioned(
                  top: 10,
                  right: 10,
                  child: Text(
                    'Ariane Zezane',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Texte en bas à gauche
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    'Add Card:05',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Texte en bas à droite
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Ac.no.2343435536',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Texte centré horizontalement
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '\$324542634',
                    style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
                // Texte centré horizontalement en bas
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      'Total Balance',
                      style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Section "Features"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Features",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("See more",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Boutons "Send"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              return ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                    ),
                    // Permet au bottom sheet d'occuper plus d'espace si nécessaire
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        height: MediaQuery.of(context).size.height * 0.9, // 60% de la hauteur de l'écran
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Send Money',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 16),
                              Text("Select Card", style: TextStyle(fontSize: 18)),
                              SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(4, (index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 8), // Espace entre les cartes
                                      padding: EdgeInsets.all(8),
                                      width: 120, // Taille ajustée pour afficher le texte
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Paypal ebl Card",
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Choose Recipient",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 16),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Card Number',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleChildScrollView(
                                    child: CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),

                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Amout",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Amout',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:
                                Row(
                                  children: [

                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.check_box)),
                                  Text("Agree with ideate's terms and consition",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),

                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Logique pour envoyer de l'argent
                                  Navigator.pop(context); // Ferme le bottom sheet
                                },
                                child: Text('Envoyer'),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.send),
                    SizedBox(width: 4), // Espace entre l'icône et le texte
                    Text("Send"),
                  ],
                ),
              );

            }),
          ),

          // Section "Recent Activity"
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text("All", style: TextStyle(fontSize: 11)),
                Icon(Icons.directions),
              ],
            ),
          ),
          // Liste de contacts
          const SizedBox(height: 15),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person),
                  ),
                  title: Text("Miradie",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                  subtitle: Text("22 jan 2025",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("+123",
                          style: TextStyle(color: Colors.blue, fontSize: 17)),
                      Text("22h42",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}