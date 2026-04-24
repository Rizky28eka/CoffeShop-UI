# ☕ CoffeeShop UI - Premium Experience

A production-ready, feature-rich Coffee Shop application built with **Flutter**.

---

## 📌 1. Project Title & Description
**CoffeeShop UI - Premium Experience** is a Flutter-based mobile application designed to provide a luxurious and intuitive coffee shopping experience. This project goes beyond simple *UI Slicing*, featuring a fully integrated dynamic business logic system.

**Project Goal:**
To set a new standard for coffee e-commerce applications by focusing on premium aesthetics, silky-smooth animations, and efficient state management.

---

## 📌 2. Overview / Background
Many current coffee applications suffer from rigid and static interfaces. This project was created to address the challenge of building an app that feels "alive" through the use of micro-animations and intelligent transitions.

**The Solution:**
- Elegant and premium *Dark Mode* interface.
- Silky smooth navigation using *Hero Animations*.
- Deep product customization system (Size, Milk Type, Extra Shots).

---

## 📌 3. Features

### 🔐 Authentication
- **Login:** Secure access to user accounts.
- **Register:** New user registration flow.
- **Forgot Password:** Account recovery system.
- **Logout:** Secure exit with navigation stack clearing.

### 🏠 Dashboard & Catalog
- **Home Catalog:** Curated coffee list with dynamic category tabs.
- **Real-time Search:** Instant product filtering system.
- **Category Filtering:** Browse products by coffee types.

### 🛒 Order Management
- **Product Customization:** Select size (S/M/L), milk type (Oat, Almond, etc.), and extra shots.
- **Dynamic Cart:** Real-time quantity management and automated price calculation.
- **Checkout Flow:** Integrated checkout with simulated addresses and payment methods.
- **Order Tracking:** Real-time-like order status monitoring.

### 👤 User Profile & Loyalty
- **Profile Management:** Edit user profile details.
- **Order History:** Comprehensive transaction logs.
- **Rewards System:** Earn and track loyalty points from every purchase.
- **Favorites:** Save your preferred brews for quick access.

---

## 📌 4. Tech Stack
- **Frontend:** [Flutter](https://flutter.dev/) (Main Framework)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Animations:** [Lottie](https://pub.dev/packages/lottie) & Flutter Hero
- **Database:** Local Storage Simulation (via CoffeeShopProvider)
- **Typography:** Google Fonts (Outfit / Inter)

---

## 📌 5. System Architecture
This application follows the **Provider Pattern**, separating the Business Logic (*Logic Layer*) from the User Interface (*UI Layer*).
- **Models:** Data structures for Products, CartItems, and CoffeeOrders.
- **Providers:** Centralized state control and application logic (Single Source of Truth).
- **Pages/UI:** Visual components that react to data changes from the Provider.

---

## 📌 6. Installation Guide

### Requirements:
- Flutter SDK (Latest version recommended)
- Dart SDK
- Android Studio / VS Code

### Step-by-step:
1. **Clone Repo:**
   ```bash
   git clone https://github.com/SLicing-CoffeShop-UI/CoffeShop-UI.git
   ```
2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run Project:**
   ```bash
   flutter run
   ```

---

## 📌 7. Usage

**User Flow:**
1. **Login/Register:** User enters the application.
2. **Browse:** Discover favorite coffee on the Home or Search pages.
3. **Customize:** Configure size, milk type, and extra shots.
4. **Checkout:** Add items to the cart and proceed to payment.
5. **Track:** Monitor the order status as the barista prepares the coffee.

---

## 📌 8. Folder Structure
```text
lib/
├── models/         # Data Structures (Coffee, CartItem, CoffeeOrder)
├── providers/      # Business Logic & State Management
├── constants.dart  # Color configurations & Design System styles
├── main.dart       # Application entry point
└── [pages].dart    # UI Pages collection (Home, Cart, Profile, etc.)
```

---

## 📌 9. Screenshots / Demo
*(Add your images or demo GIFs here)*
- [Initial UI Preview](https://i.postimg.cc/nzC799GQ/Screenshot-2023-06-26-at-07-10-10.png)

---

## 📌 10. Roadmap / Future Development
- [ ] Firebase Auth integration for real-world authentication.
- [ ] Online Database implementation (Firestore/Supabase).
- [ ] Payment Gateway integration (Midtrans/Stripe).
- [ ] Push Notification system for order updates.

---

## 📌 11. Contributing
Contributions are welcome! Please **Fork** this repo, create a new branch, and submit a **Pull Request**. Ensure your code follows Flutter clean code standards.

---

## 📌 12. License
Distributed under the **MIT License**. See `LICENSE` for more information.

---

## 📌 13. Author / Credits
**Rizky28eka**
- Instagram: [@rzkyhryd._](https://www.instagram.com/rzkyhryd._/)
- GitHub: [rizky28eka](https://github.com/rizky28eka)

---

<p align="center">Made with ❤️ for the Coffee Lovers Community</p>
