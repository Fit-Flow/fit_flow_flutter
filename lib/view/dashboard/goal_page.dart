import 'package:flutter/material.dart';

/**
 * @authors Jackie, Christoffer & Jakob
 */
class GoalPage extends StatelessWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Målsetnings Siden',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}