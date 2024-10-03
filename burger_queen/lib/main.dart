import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Burger Queen'),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final String title;
  const MyHomePage({super.key, required this.title});

  final TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.brown
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.token),
        actions: const [
           Icon(Icons.person),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section "Restaurant le plus proche"
              Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                height: 150,
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const Text(
                                "Mon restaurant le plus proche!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              "4 kms",
                              style: Theme.of(context).textTheme.bodyMedium ,
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.blue
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.touch_app,
                                  color: Colors.white
                              ),
                              SizedBox(width: 16),
                              Text(
                                "Commander",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Section "En ce moment"
              sectionTitle(title: "En ce moment"),
              Center(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/layer-burger.jpg"),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            "Une petite faim?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Venez personnaliser votre burger",
                          style: TextStyle(
                            backgroundColor: Theme.of(context).colorScheme.inversePrimary
                          ),
                        )
                      ],
                    ),

                  ),
                ),
              ),

              // Section de choix des burgers
              sectionTitle(title: "Chaud devant!"),
              const Text("Le meilleur de nos burgers!"),
              SizedBox(
                height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                     burgerCard(name: "Twins", url: "twins", description: "Le burger des jumeaux"),
                      burgerCard(name: "Big Queen", url: "big-queen", description: "Pour des reines."),
                      burgerCard(name: "Egg Bacon", url: "egg-bacon-burger", description: "Le burger des lèves tot!"),
                      burgerCard(name: "Prince", url: "prince", description: "Le préféré pour des futurs rois."),
                      burgerCard(name: "Cheese", url: "cheese", description: "Le classique pour les fans de fromage.")

                    ],
                  ),
                ),
              ),

              // Les accompagnements
              sectionTitle(title: "Les accompagnements"),
              Card(
                elevation: 8,
                child: Column(
                  children: [
                    sideDish(name: "Frites classiques", url: "fries"),
                    sideDish(name: "Frites de patates douces", url: "patate-douce"),
                    sideDish(name: "Poutine", url: "poutine"),
                    sideDish(name: "Potatoes", url: "potatoes")
                  ],
                ),
              ),

              // Les boissons
              sectionTitle(title: "Une petite soif?"),
              Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      drink(name: "Le classique", url: "classic-cola"),
                      drink(name: "Eau gazeuse", url: "sparkling"),
                      drink(name: "A l'orange", url: "orange-soda"),
                      drink(name: "Gout fraise", url: "strawberry-soda")
                    ],
                  ),
                ),
              )

            ],
          ),
        )
      ),
    );
  }

  Widget sectionTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 8,
          top: 8),
      child: Text(title, style: titleStyle)
    );
  }

  Container burgerCard({required String name, required String url, required String description}){
    double size = 250;
    TextStyle descriptionStyle = const TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.black54
    );
   return Container(
     margin: const EdgeInsets.all(12),
     clipBehavior: Clip.antiAlias,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(24),
       color: Colors.blueAccent.withOpacity(0.3)
     ),
     height: size,
     width: size,
     child: Column(
       children: [
         Image.asset(
           "assets/$url.jpg",
           height: size * 0.6,
           width: size,
           fit: BoxFit.cover,
         ),
         Text(name, style: titleStyle),
         Text(description, style: descriptionStyle, textAlign: TextAlign.center,
         )

       ],
     ),
   ) ;

  }

  Container sideDish({required String name, required String url}) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/$url.jpg",) ,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
            ],
          ),
          const Divider(
            indent: 8,
            endIndent: 8,
          )
        ],
      ),

    );
  }

  Container drink({required String name, required String url}){
    const  double height = 250;
    const double width = 125;
    
    return Container(
      margin: const EdgeInsets.all(8),
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/$url.jpg",
            fit: BoxFit.cover,
            height: height,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}