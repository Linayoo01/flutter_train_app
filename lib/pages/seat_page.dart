import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  const SeatPage({required this.departure, required this.arrival, super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('좌석 선택'), centerTitle: true),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80), // 버튼 높이만큼 아래 여백
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildHeader(), // 출발역/도착역 및 좌석 안내
                  const SizedBox(height: 20),
                  buildSeatGrid(), // 좌석 리스트
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: buildBookButton(), // 고정된 예매 버튼
          ),
        ],
      ),
    );
  }

  // ❶ 출발/도착 역 + ❸ 좌석 상태 안내
  Widget buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.departure,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.arrow_circle_right_outlined, size: 30),
            const SizedBox(width: 16),
            Text(
              widget.arrival,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSeatStatusBox(Colors.purple, "선택됨"),
            const SizedBox(width: 20),
            buildSeatStatusBox(Colors.grey[300]!, "선택안됨"),
          ],
        ),
      ],
    );
  }

  Widget buildSeatStatusBox(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ❹ 좌석 리스트
  Widget buildSeatGrid() {
    return Column(
      children: List.generate(20, (index) => buildSeatRow(index + 1)),
    );
  }

  // ❺ 좌석 위젯 + 행 번호
  Widget buildSeatRow(int rowNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSeatBox('A$rowNumber'),
          const SizedBox(width: 8),
          buildSeatBox('B$rowNumber'),
          const SizedBox(width: 16),
          Container(
            width: 30,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              '$rowNumber',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: selectedSeat == null ? Colors.grey : null,
                    fontSize: 16,
                  ),
            ),
          ),
          const SizedBox(width: 16),
          buildSeatBox('C$rowNumber'),
          const SizedBox(width: 8),
          buildSeatBox('D$rowNumber'),
        ],
      ),
    );
  }

  Widget buildSeatBox(String seatId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSeat = (selectedSeat == seatId) ? null : seatId;
        });
      },
      child: Container(
        width: 40,
        height: 48,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: selectedSeat == seatId ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // ❻ 예매하기 버튼 및 다이얼로그
  Widget buildBookButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: selectedSeat == null
          ? null
          : () {
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text("예매 하시겠습니까?"),
                  content: Text("좌석 : $selectedSeat"),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text(
                        "취소",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoDialogAction(
                      child: const Text(
                        "확인",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // dialog 닫기
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        ); // 홈페이지로 돌아가기
                      },
                    ),
                  ],
                ),
              );
            },
      child: const Text(
        "예매 하기",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
