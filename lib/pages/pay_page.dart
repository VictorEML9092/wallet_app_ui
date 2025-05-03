import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  String? selectedService; // Almacena el nombre del servicio seleccionado

  Widget _buildServiceTile(IconData icon, String label) {
    final isSelected = selectedService == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedService = label;
        });
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.blue, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 70,
              color: isSelected ? Colors.blue[800] : Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.blue[800] : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Esto permite que el contenido se mueva cuando aparece el teclado
      body: SafeArea(
          // Esto evita el desbordamiento
          child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20), // Un poco de espacio al fondo
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pay Something',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.payment),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Select a service", style: TextStyle(fontSize: 25)),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _buildServiceTile(Icons.lightbulb, 'Electricity'),
                      _buildServiceTile(Icons.water_drop, 'Water'),
                      _buildServiceTile(Icons.wifi, 'Internet'),
                      _buildServiceTile(Icons.phone, 'Phone'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Reference Number", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter reference number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Amount", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '\$0.00',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Condicional para que seleccione el servicio a pagar
                    if (selectedService == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a service')),
                      );
                      return;
                    }
                    // Aquí puedes mostrar un mensaje o ir a otra pantalla
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Payment Sent!')),
                    );
                  },
                  child: Text(
                    'Pay Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
