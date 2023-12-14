import 'package:flutter/material.dart';
import 'package:grab_dek_demo/widgets/image_view.dart';
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
                    Text('Tên: ', style: TextStyle(fontFamily: 'Roboto-Medium'),),
                    Text(name, style: TextStyle(fontFamily: 'Roboto-Bold'),),
                  ],
                ),
                const Row(
                  children: [
                    Text('Địa chỉ: ', style: TextStyle(fontFamily: 'Roboto-Medium'),),
                    Text("Phường A, Quận B, tp. Hà Nội", style: TextStyle(fontFamily: 'Roboto-Bold'),),
                  ],
                ),
                const Row(
                  children: [
                    Text('Số năm kinh nghiệm: ', style: TextStyle(fontFamily: 'Roboto-Medium'),),
                    Text("10", style: TextStyle(fontFamily: 'Roboto-Bold'),),
                  ],
                ),
                const Row(
                  children: [
                    Text('Đánh giá: ', style: TextStyle(fontFamily: 'Roboto-Medium'),),
                    Text("4.5/5 sao", style: TextStyle(fontFamily: 'Roboto-Bold'),),
                  ],
                ),
                Text('Các công trình đã thi công: ', style: TextStyle(fontFamily: 'Roboto-Medium'),),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        height: 100,
                        width: 100,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => ImageView(asset: 'lib/assets/images/construction1.jpg')
                            )
                            );
                            
                          },
                          child: Image.asset(
                            'lib/assets/images/construction1.jpg',
                            fit: BoxFit.contain,
                          ),
                        )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        height: 100,
                        width: 100,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => ImageView(asset: 'lib/assets/images/construction2.jpg')
                            )
                            );
                            
                          },
                          child: Image.asset(
                            'lib/assets/images/construction2.jpg',
                            fit: BoxFit.contain,
                          ),
                        )
                      ),
                      
                      
                    ],
                  ),
                )
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
