class Seat {
  final int number;
  final bool isOccupied;
  final String type; // 'standard', 'premium', etc.

  Seat({required this.number, this.isOccupied = false, this.type = 'standard'});

  Seat copyWith({int? number, bool? isOccupied, String? type}) {
    return Seat(
      number: number ?? this.number,
      isOccupied: isOccupied ?? this.isOccupied,
      type: type ?? this.type,
    );
  }
}
