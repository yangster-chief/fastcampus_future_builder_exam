import 'package:flutter/material.dart';

///
/// future_builder_exam
/// File Name: ex_1
/// Created by sujangmac
///
/// Description:
///
class FutureBuilderExample1 extends StatelessWidget {
  const FutureBuilderExample1({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuilder 데모'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // 로딩 인디케이터 표시
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}'); // 에러 표시
              } else {
                return Text(snapshot.data ?? '데이터 없음'); // 데이터 표시
              }
            },
          ),
        ),
      );
}

Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 2));
  return '데이터 로드 완료!';
}
