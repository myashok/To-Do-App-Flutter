import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // No rounded corners
      ),
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a New Task",
              ),
              style: const TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Distributes space evenly
              children: [
                CustomButton(onPressed: onSave, text: "Save"),
                const SizedBox(width: 12), // Add 16 pixels of horizontal space
                CustomButton(onPressed: onCancel, text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}
