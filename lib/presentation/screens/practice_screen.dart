import 'package:educate/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 1) {
      // Navigator.pushNamed(context, '/practice');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/question');
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Practice',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        widthFactor: 0.6,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                      ),
                      Align(
                        widthFactor: 0.8,
                        child: CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.qr_code,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Challenge your knowledge',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'type of question',
                style: TextStyle(fontSize: 30, color: Colors.white60),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      _PracticeButton(
                        icon: Icons.shuffle,
                        label: 'Random',
                        selected: true,
                      ),
                      _PracticeButton(icon: Icons.tag, label: 'Exam Number'),
                      _PracticeButton(
                        icon: Icons.track_changes_rounded,
                        label: 'Topic',
                      ),
                      _PracticeButton(
                        icon: Icons.format_list_numbered,
                        label: 'In a row',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Mistakes practice',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Practice more the very exam exercises which you\'re doing worse. You\'re gonna deal with it!',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              SizedBox(height: 30),
              BottomNavBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PracticeButton extends StatelessWidget {
  final String label;
  final bool selected;
  final IconData icon;

  const _PracticeButton({
    required this.label,
    required this.icon,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 165,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? Colors.greenAccent : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 36,
            color: selected ? Colors.black : Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
