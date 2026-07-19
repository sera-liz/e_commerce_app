import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CategoryWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.purple.shade100,
            child: Icon(
              icon,
              color: Colors.purple,
              size: 28,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}