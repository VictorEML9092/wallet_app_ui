import 'package:flutter/material.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final TextEditingController _recipientController =
      TextEditingController(); // Varible controladora de texto

  @override
  void dispose() {
    _recipientController.dispose(); // Limpia recursos
    super.dispose();
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
                          'Send Money',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              // Después del SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 210,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _recipientController.text = 'Persona 1';
                          });
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.pink[100],
                              child: Icon(Icons.person, size: 100),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Persona 1',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _recipientController.text = 'Persona 2';
                          });
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.blue[100],
                              child: Icon(Icons.person, size: 100),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Persona 2',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _recipientController.text = 'Persona 3';
                          });
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.green[100],
                              child: Icon(Icons.person, size: 100),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Persona 3',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recipient", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 5),
                    TextField(
                      controller:
                          _recipientController, // Aquí usa el controlador de texto
                      decoration: InputDecoration(
                        hintText: 'Enter name or number',
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
                      // Aquí puedes mostrar un mensaje o ir a otra pantalla
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Money Sent!')),
                      );
                    },
                    child: Text(
                      'Send Now',
                      style: TextStyle(fontSize: 18),
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
