import 'package:flutter/material.dart';

class SkincareOption {
  final IconData icon;
  final String label;

  SkincareOption({required this.icon, required this.label});
}

class SkincareSelectionWidget extends StatefulWidget {
  final String title;
  final List<SkincareOption> options;
  final bool allowMultiple;

  const SkincareSelectionWidget({
    super.key,
    required this.title,
    required this.options,
    this.allowMultiple = false,
  });

  @override
  State<SkincareSelectionWidget> createState() => _SkincareSelectionWidgetState();
}

class _SkincareSelectionWidgetState extends State<SkincareSelectionWidget> {
  List<String> selectedLabels = [];

  final Color greenColor = const Color(0xFF2ECC71); // Nice green

  void toggleSelection(String label) {
    setState(() {
      if (widget.allowMultiple) {
        if (selectedLabels.contains(label)) {
          selectedLabels.remove(label);
        } else {
          selectedLabels.add(label);
        }
      } else {
        selectedLabels = [label];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title Row
        Row(
          children: [
            Text(
              widget.title, // You can pass this dynamically via widget.title
              style: const TextStyle(
                color: Color(0xFF1F2024),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ), // text1F2024s14w600
            ),
            const SizedBox(width: 8),
            Text(
              'Learn more >',
              style: TextStyle(
                color: greenColor,
                fontSize: 12,
              ),
            )
          ],
        ),
        const SizedBox(height: 12),

        /// Horizontal List
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.options.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final option = widget.options[index];
              final isSelected = selectedLabels.contains(option.label);
              final bgColor = isSelected ? greenColor : Colors.transparent;
              final borderColor = greenColor;
              final contentColor = isSelected ? Colors.white : greenColor;

              return GestureDetector(
                onTap: () => toggleSelection(option.label),
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(color: borderColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(option.icon, color: contentColor, size: 28),
                      const SizedBox(height: 6),
                      Text(
                        option.label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: contentColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
