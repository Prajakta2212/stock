<<<<<<< HEAD
=======
# 📈 Flutter Watchlist App (BLoC)

A clean and responsive **Stock Watchlist Application** built using **Flutter** and **BLoC Architecture**.
This project demonstrates state management, UI/UX design, and list reordering (drag & drop) similar to modern trading apps.

---

## 🚀 Features

* 📊 Display list of stocks (Watchlist)
* 🔄 Drag & drop to reorder stocks
* 🗑 Delete stocks from watchlist
* 💾 Save updated watchlist using BLoC
* 🔍 Clean UI inspired by trading apps (like Zerodha)
* 📱 Fully responsive design
* ⚡ Efficient state management using BLoC

---

## 🏗️ Architecture

This project follows **BLoC (Business Logic Component)** architecture:

```
lib/
│
├── bloc/
│   ├── stock_bloc.dart
│   ├── stock_event.dart
│   └── stock_state.dart
│
├── data/
│   └── stock_repository.dart
│
├── models/
│   └── stock_model.dart
│
├── ui/
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── edit_watchlist_screen.dart
│   │
│   └── widgets/
│       └── stock_tile.dart
│
└── main.dart
```

---

## 🧠 BLoC Flow

```
UI → Event → BLoC → State → UI
```

### Events:

* `LoadStocks`
* `ReorderStocks`
* `SaveWatchlist`

### States:

* `StockInitial`
* `StockLoaded`

---

## 🎨 UI Screens

### 🏠 Home Screen

* Displays stock list
* Top market summary (Sensex / Nifty)
* Bottom navigation bar
* "Sort by" / "Edit Watchlist" option

### ✏️ Edit Watchlist Screen

* Drag & reorder stocks
* Delete items
* Save updated list

---

## 🛠️ Tech Stack

* Flutter
* Dart
* flutter_bloc

---

## 📦 Dependencies

Add this in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
```

---

## ▶️ Getting Started

1. Clone the repository:

```bash
git clone https://github.com/Prajakta2212/stock.git
```

2. Navigate to project:

```bash
cd stock
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run(on directly on chrome also)
```

---

## 📸 Screenshots

* Home Screen (Watchlist)
* Edit Watchlist (Drag & Drop)

---
## 📸 Screenshots

### 🏠 Home Screen
![stock Screen](assets/images/stock.png)

### ✏️ Before Edit Watchlist
![Edit Screen](assets/images/beforeeditwatchlist.png)

### ✏️ After Edit Watchlist
![Edit Screen](assets/images/aftereditwatchlist.png)

### 🏠 After edit Home Screen
![stock Screen](assets/images/aftereditstock.png)

## 💡 Key Highlights

* Clean separation of UI & business logic
* Reusable widgets
* Type-safe implementation
* Smooth drag-and-drop UX
* Scalable project structure

---

## 🚀 Future Improvements

* 🔄 Real-time stock API integration
* 💾 Local storage (SharedPreferences)
* 🔍 Search functionality
* 📊 Sorting (Price / Change / Name)
* 🌙 Dark mode

---

## 👩‍💻 Author

**Prajakta Narayankar**

---

## 📄 License

This project is for assignment/demo purposes.

