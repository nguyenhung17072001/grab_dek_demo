import 'package:flutter/material.dart';
class WorkerDetailsModal extends StatelessWidget {
  final String name;
  final String ?snippet;

  const WorkerDetailsModal({super.key, required this.name,  this.snippet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0), 
          topRight: Radius.circular(10.0), 
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(snippet!),
              ],
            ),
            TextButton(
              onPressed: () {}, 
              child: Text('Chọn thợ')
            )
          ],
        ),
      ),
    );
  }
}
