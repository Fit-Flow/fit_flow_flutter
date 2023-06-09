import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// Represents a card displaying the latest workout information.
///
///authors: Jackie, Christoffer & Jakob
class LatestWorkoutCard extends StatelessWidget {
  final String title;
  final List<String> workouts;

  const LatestWorkoutCard({
    Key? key,
    required this.title,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.grayTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              workouts.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  workouts[index],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.grayTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
