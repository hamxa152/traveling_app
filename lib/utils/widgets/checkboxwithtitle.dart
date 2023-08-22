import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    this.contentPadding,
    required this.value,
    required this.onTap,
    this.activeColor,
    this.fontSize,
    this.gap = 4.0,
    this.bold = false,
  });

  final String label;
  final EdgeInsets? contentPadding;
  final bool value;
  final Function onTap;
  final Color? activeColor;
  final double? fontSize;
  final double gap;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(!value),
      child: Padding(
        padding: contentPadding ?? const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              value: value,
              activeColor: activeColor,
              visualDensity: VisualDensity.compact,
              onChanged: (val) => onTap(val),
            ),
            SizedBox(
              width: gap,
            ), // you can control gap between checkbox and label with this field
            Flexible(
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
