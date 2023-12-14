import 'package:flutter/material.dart';
class WorkerDetailsModal extends StatelessWidget {
  final String name;
  final String ?snippet;

  const WorkerDetailsModal({super.key, required this.name,  this.snippet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        //color: Colors.red
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text('Tên: ', style: TextStyle(fontFamily: 'Roboto-Bold'),),
                    Text(name, style: TextStyle(fontFamily: 'Roboto-Medium'),),
                  ],
                ),
                const Row(
                  children: [
                    Text('Địa chỉ: ', style: TextStyle(fontFamily: 'Roboto-Bold'),),
                    Text("Phường A, Quận B, tp. Hà Nội", style: TextStyle(fontFamily: 'Roboto-Medium'),),
                  ],
                ),
                const Row(
                  children: [
                    Text('Số năm kinh nghiệm: ', style: TextStyle(fontFamily: 'Roboto-Bold'),),
                    Text("10", style: TextStyle(fontFamily: 'Roboto-Medium'),),
                  ],
                ),
                const Row(
                  children: [
                    Text('Đánh giá: ', style: TextStyle(fontFamily: 'Roboto-Bold'),),
                    Text("4.5/5", style: TextStyle(fontFamily: 'Roboto-Medium'),),
                  ],
                ),

                //Text(snippet!),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {}, 
                child: Text('Chọn thợ')
              ),
            )
          ],
        ),
      ),
    );
  }
}
