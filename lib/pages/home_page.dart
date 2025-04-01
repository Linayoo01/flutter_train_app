import 'package:flutter/material.dart';
import 'seat_page.dart';
import 'station_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KTX 예매'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 출발역 선택
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => StationListPage(
                          type: "출발역",
                          excludeStation: arrivalStation,
                        ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    departureStation = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                   departureStation ?? '출발역 선택',
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                     color: departureStation == null ? Colors.grey : null,
                        ),
                     ),

                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 도착역 선택
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => StationListPage(
                          type: "도착역",
                          excludeStation: departureStation,
                        ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    arrivalStation = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      arrivalStation ?? '도착역 선택',
                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                       color: departureStation == null ? Colors.grey : null,
                         ),
                     ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // 예매하기 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed:
                  (departureStation != null && arrivalStation != null)
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => SeatPage(
                                  departure: departureStation!,
                                  arrival: arrivalStation!,
                                ),
                          ),
                        );
                      }
                      : null,
              child: const Text(
                '예매하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
