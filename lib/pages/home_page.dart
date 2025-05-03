import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app_ui/pages/bill_page.dart';
import 'package:wallet_app_ui/pages/pay_page.dart';
import 'package:wallet_app_ui/pages/send_page.dart';
import 'package:wallet_app_ui/util/my_button.dart';
import 'package:wallet_app_ui/util/my_card.dart';
import 'package:wallet_app_ui/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Pagecontoller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  // Plus button
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            // Cards
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.25,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 320.20,
                    cardNumber: 75937629,
                    expiryMonth: 11,
                    expiryYear: 23,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 10532.42,
                    cardNumber: 12345678,
                    expiryMonth: 9,
                    expiryYear: 25,
                    color: Colors.green[300],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),

            SizedBox(height: 20),

            // 3 buttons -> Send + Pay + Bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Send button
                  MyButton(
                    iconImagePath: 'lib/icons/send-money.png',
                    buttonText: 'Send',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SendPage(),
                        ),
                      );
                    },
                  ),

                  // Pay button
                  MyButton(
                    iconImagePath: 'lib/icons/credit-card.png',
                    buttonText: 'Pay',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PayPage(),
                        ),
                      );
                    },
                  ),

                  // Bills button
                  MyButton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: 'Bills',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BillPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Column -> Stats + Transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // Statistics
                  MyListTile(
                    iconImagePath: 'lib/icons/statistics.png',
                    tileName: 'Statistics',
                    tileSubname: 'Payment and Income',
                  ),
                  // Transactions
                  MyListTile(
                    iconImagePath: 'lib/icons/transaction.png',
                    tileName: 'Transactions',
                    tileSubname: 'Transaction History',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
