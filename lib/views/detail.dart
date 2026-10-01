import 'package:flutter/material.dart';

import '../models/data.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Product product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
        actions: [
          // Tombol favorite
          IconButton(
            onPressed: () {
              setState(() {
                product.isFavorite = !product.isFavorite;
              });
            },
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.grey[300],
                    child: Icon(Icons.fastfood, size: 60),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              product.productName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(product.type, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text(
              product.price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Jumlah Total",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            Column(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to be read by screen readers',
                ),
              ],
            ),
            Text(
              "${product.likeCount} likes   Stok : ${product.stock}",
              style: TextStyle(
                fontSize: 12,
              ),
            ), 
            SizedBox(height: 15),
            Text(
              "Ukuran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ), 
            Text(
              "${product.sizes}"
            ),
            SizedBox(height: 15),
            Text(
              "Deskripsi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(product.details),
          ],
        ),
      ),
    );
  }
}
