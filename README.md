# 🚄 KTX 예매 앱

Flutter로 제작한 기차 예매 앱입니다. 출발역과 도착역을 선택한 후 좌석을 선택하여 예매할 수 있으며, UI 명세를 기반으로 충실하게 구현되었습니다. 

---

## ✅ 기능 요약

### 🔹 필수 기능
- ✅ **UI 명세서 기반 화면 구현**
- ✅ `HomePage`: 출발역과 도착역을 선택
- ✅ `StationListPage`: 역 목록 중 선택 (출발/도착 구분)
- ✅ `SeatPage`: 좌석 선택 및 예매 다이얼로그 출력

### 🔸 도전 기능
- ✅ **UX 고려: 같은 역 중복 선택 방지**
- ✅ **다크 모드 자동 적용** (`ThemeMode.system`)
- ✅ **예약 버튼 고정 UI 구현** (스크롤과 무관하게 항상 하단 고정)

---

## 🧠 개발 설계

### 📁 디렉토리 구조

```plaintext
lib/
├── constants/         # 상수 관리
├── models/            # 데이터 모델 (필요 시 확장 가능)
├── pages/             # 각 페이지 (홈, 좌석, 역 선택)
│   ├── home_page.dart
│   ├── seat_page.dart
│   └── station_list_page.dart
├── widgets/           # 커스텀 위젯 분리
└── main.dart          # 앱 진입점
```
![image](https://github.com/user-attachments/assets/2d1838c6-b933-4f75-b421-3f480f86be94)

📁📁 main.dart가 앱 진입점입니다.


---

### 💡 이해도 및 직관성
- 변수명과 함수명은 `buildSeatBox`, `selectedSeat` 등 기능 기반 직관적으로 구현
- 모든 주요 함수에는 주석 추가로 가독성 향상

---

## ⚠️ 예외 처리 (도전)
- ✅ 출발역과 도착역이 같을 경우 선택 불가 처리
- ✅ 좌석 선택 없이 "예매하기" 버튼 클릭 시 작동 안 함
- ✅ 예매 확인 시 `showCupertinoDialog`를 통한 명확한 안내 제공

---

## 📌 커밋 컨벤션
- 총 **10회 이상의 커밋** 기록
- 커밋 메시지는 다음과 같은 규칙을 따릅니다:
 - feat: 기능 구현
 - fix: 버그 수정
 - style: 코드 포맷팅, 스타일 변경
 - refactor: 리팩토링

---

## 🎨 스크린샷
> 아래는 앱 주요 화면 예시입니다:
> 본 앱은 사용자의 시스템 테마 설정을 감지하여, 라이트 모드 및 다크 모드를 자동으로 전환합니다.

🌞 Light Mode
| 홈 화면 | 역 선택 화면 | 좌석 선택 화면 |
|--------|-------------|----------------|
| ![image](https://github.com/user-attachments/assets/79e00349-1310-430d-8101-2187aeb9648e) | ![image](https://github.com/user-attachments/assets/f0fcd52d-3a1e-486b-b0ee-8b1fcb44ae3d) | ![image](https://github.com/user-attachments/assets/542ef875-0cd3-47ac-8145-01dc840b6877) |

🌙 Dark Mode
| 홈 화면 | 역 선택 화면 | 좌석 선택 화면 |
|--------|-------------|----------------|
| ![image](https://github.com/user-attachments/assets/3eed44ff-09cd-4175-8236-92d02140e6bf)|![image](https://github.com/user-attachments/assets/713c7f62-9648-4c58-9487-c3a93be98664) | ![image](https://github.com/user-attachments/assets/282461e2-970f-413b-8a1e-d14b6eff7c4f) |

⚙️ main.dart 내부 테마 설정 code
```plaintext
MaterialApp(
  title: '기차 예매',
  theme: ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[200],
    primarySwatch: Colors.purple,
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  ),
  themeMode: ThemeMode.system, //  !!시스템 설정에 따라 자동 적용!!
  home: const HomePage(),
);
```


---

## 🛠 사용 기술

- Flutter 3.7
- Dart
- Cupertino-style Dialog
- Git & GitHub

---

## 👨‍💻 개발자
- GitHub: [Linayoo01](https://github.com/Linayoo01)


