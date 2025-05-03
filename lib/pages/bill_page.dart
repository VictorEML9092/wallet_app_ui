import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final List<Map<String, dynamic>> pendingBills = [
    {'title': 'Water', 'due': 'Aug 5', 'amount': '\$45.00'},
    {'title': 'Electricity', 'due': 'Aug 10', 'amount': '\$120.00'},
    {'title': 'Internet', 'due': 'Aug 15', 'amount': '\$60.00'},
    {'title': 'Phone', 'due': 'Aug 20', 'amount': '\$80.00'},
    {'title': 'Netflix', 'due': 'Aug 25', 'amount': '\$20.00'},
    {'title': 'Spotify', 'due': 'Aug 28', 'amount': '\$10.00'},
  ];

  final List<Map<String, dynamic>> paidBills = [
    {'title': 'Water', 'due': 'Jul 5', 'amount': '\$45.00'},
    {'title': 'Electricity', 'due': 'Jul 10', 'amount': '\$120.00'},
    {'title': 'Internet', 'due': 'Jul 15', 'amount': '\$60.00'},
    {'title': 'Phone', 'due': 'Jul 20', 'amount': '\$80.00'},
    {'title': 'Netflix', 'due': 'Jul 25', 'amount': '\$20.00'},
    {'title': 'Spotify', 'due': 'Jul 28', 'amount': '\$10.00'},
  ];

  final List<Map<String, dynamic>> overdueBills = [
    {'title': 'Phone', 'due': 'Jun 20', 'amount': '\$80.00'},
  ];

  Widget _buildBillsList(List<Map<String, dynamic>> bills) {
    return ListView.builder(
      padding: const EdgeInsets.all(25),
      itemCount: bills.length,
      itemBuilder: (context, index) {
        final bill = bills[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 15),
          child: ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text(bill['title']),
            subtitle: Text('Due: ${bill['due']}'),
            trailing: Text(
              bill['amount'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${bill['title']}')),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Encabezado
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bills',
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
                      child: Icon(Icons.blinds_closed),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Pestañas
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: const [
                  Tab(text: 'Pending'),
                  Tab(text: 'Paid'),
                  Tab(text: 'Overdue'),
                ],
              ),
              // Contenido de cada pestaña
              Expanded(
                child: TabBarView(
                  children: [
                    _buildBillsList(pendingBills),
                    _buildBillsList(paidBills),
                    _buildBillsList(overdueBills),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
