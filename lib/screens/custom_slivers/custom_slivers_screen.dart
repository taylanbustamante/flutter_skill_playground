import 'package:flutter/material.dart';

class CustomSliversScreen extends StatelessWidget {
  const CustomSliversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(
      40,
      (index) => 'Item nº ${index + 1}',
    );

    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Custom Slivers',
                style: TextStyle(color: Colors.white),
              ),
              background: Container(color: Colors.purple),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Lista de elementos com SliverList',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text(items[index]),
                leading: const Icon(Icons.arrow_forward_rounded),
              ),
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
