import 'package:flutter/material.dart';
import 'package:flutter_act4_115/presentation/detail_order.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();
  int totalHarga = 0;

  final _formKey = GlobalKey<FormState>();

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;

    setState(() {
      totalHarga =
          (jumlahMakanan * 32000) +
          (jumlahMinuman * 5000); // Hitung total harga
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('order page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: makananController,
                decoration: const InputDecoration(labelText: 'food order'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your food order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: jumlahMakananController,
                decoration: const InputDecoration(labelText: 'food QTY Order'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your qty of food order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: minumanController,
                decoration: const InputDecoration(labelText: 'Drink Order'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your drink order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: jumlahMinumanController,
                decoration: const InputDecoration(labelText: 'Drink QTY Order'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your quantity of drink order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateTotalPrice();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailOrderPage(
                              jumlahMakanan: jumlahMakananController.text,
                              jumlahMinuman: jumlahMinumanController.text,
                              makanan: makananController.text,
                              minuman: minumanController.text,
                              totalHarga: totalHarga,
                            ),
                      ),
                    );
                  }
                },
                child: const Text('Order Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
