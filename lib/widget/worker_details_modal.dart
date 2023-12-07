import 'package:flutter/material.dart';
class WorkerDetailsModal extends StatelessWidget {
  final String name;
  final String ?snippet;

  WorkerDetailsModal({required this.name,  this.snippet});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Thiết kế giao diện hiển thị thông tin chi tiết của Worker
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(snippet!),
          // Các thông tin khác của Worker có thể được thêm vào đây
        ],
      ),
    );
  }
}
