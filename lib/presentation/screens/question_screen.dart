import 'package:educate/widgets/bottom_navbar.dart';
import 'package:educate/widgets/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:educate/data/datasource/local/dummy_data.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Widget> _buildAnswerOptions() {
    return DummyData.dummyData.map((item) {
      final int index = item['id'];
      final String text = item['text'] ?? '';
      return _AnswerOption(
        index: index,
        text: text,
      );
    }).toList();
  }

  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/practice');
    } else if (index == 2) {
      // Navigator.pushNamed(context, '/question');
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
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
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
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Economics',
                    style: TextStyle(fontSize: 30, color: Colors.greenAccent),
                  ),
                  Text(
                    '#6',
                    style: TextStyle(fontSize: 30, color: Colors.greenAccent),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Select the correct judgment about the global economy from the list below.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ..._buildAnswerOptions(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.all(24),
                  ),
                  child: Text(
                    'Check The Answer',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Spacer(),
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

class _AnswerOption extends StatelessWidget {
  final int index;
  final String text;

  const _AnswerOption({required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CustomRadio(value: index, groupValue: -1, onChanged: (_) {}),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
