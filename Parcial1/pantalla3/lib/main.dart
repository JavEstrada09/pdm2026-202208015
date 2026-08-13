import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 28),

              Stack(
                children: [
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade400,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 58,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _card([
                _info(Icons.person_outline, 'Name', 'Terry Melton'),
                _info(Icons.email_outlined, 'E-mail', 'melton89@gmail.com'),
                _info(Icons.phone_outlined, 'Phone number', '+1 201 555-0123'),
                _info(
                  Icons.home_outlined,
                  'Home address',
                  '70 Rainey Street, Apartment 146\nAustin TX 78701',
                ),
              ]),

              const SizedBox(height: 25),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account info',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              _card([
                _info(Icons.credit_card_outlined, 'Account number', '•••• •••• 4568'),
                _info(Icons.account_balance_wallet_outlined, 'Country', 'United States'),
                _info(Icons.attach_money, 'Currency', 'USD — US Dollar'),
                _info(Icons.verified_outlined, 'Status', 'Active'),
                _info(Icons.calendar_today_outlined, 'Member since', 'January 2024'),
              ]),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          color: const Color(0xFFFFF7FF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _nav(Icons.home, 'Home'),
              _nav(Icons.map, 'Map'),
              _nav(Icons.swap_horiz, 'Transfer'),
              _nav(Icons.settings, 'Settings'),
              _nav(Icons.person, 'Profile', true),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _card(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  static Widget _info(
    IconData icon,
    String title,
    String value,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F1F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 21,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade200,
        ),
      ],
    );
  }

  static Widget _nav(
    IconData icon,
    String label, [
    bool selected = false,
  ]) {
    final color = selected
        ? const Color(0xFF6E4BAE)
        : Colors.grey.shade600;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 25, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}