import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GridView Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GridViewDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GridViewDemo extends StatelessWidget {
  GridViewDemo({super.key});

  final List<String> imageUrls = [
  'https://picsum.photos/200/300?random=1',
  
  ];

  // Generate 30 random images from picsum
  final List<String> items = List.generate(
    10,
    (index) => 'https://picsum.photos/200/300?random=$index',
  );

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GridView Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "count"),
              Tab(text: "builder"),
              Tab(text: "extent"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // --- GridView.count with Images ---
            GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                items.length,
                (index) => GridTile(
                  child: Card(
                    child: Image.network(
                      items[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // --- GridView.builder with Images and Text ---
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8, // Adjust height for text space
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            items[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Description $index',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // --- GridView.extent with Images ---
            GridView.extent(
              maxCrossAxisExtent: 150,
              children: List.generate(
                items.length,
                (index) => Card(
                  color: Colors.orangeAccent,
                  child: Image.network(
                    items[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}