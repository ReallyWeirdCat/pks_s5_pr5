import 'package:flutter/material.dart';
import '../models/product.dart';

class Profile extends StatelessWidget {

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        titleTextStyle: const TextStyle(
            fontSize: 24,
            color: Colors.black
        ),
        title: const Center(child: Text('Овощной')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Папин Николай",
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                "papin.n.a@edu.mirea.ru",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image(
                  image: AssetImage("images/me.webp"),
                  width: MediaQuery.of(context).size.width*0.9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}