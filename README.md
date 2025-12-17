# Crypto Coins – iOS (SwiftUI)

An iOS application built using **SwiftUI** and **MVVM** that displays cryptocurrency market data using the **CoinGecko API**.

This project was developed as part of a technical assignment to demonstrate modern iOS development practices, including architecture, networking, state-driven UI, UI/UX polish, and testability.

---

##  Features

### Crypto Coins List
- Displays a list of cryptocurrencies with:
  - Coin logo (remote image with caching)
  - Name & symbol
  - Current price (formatted as currency)
  - 24h percentage change with color & direction indicator
- Card-based list UI
- Pull-to-refresh support
- Loading & error states
- Tap to navigate to coin detail screen

### Crypto Coin Detail
- Dynamic navigation title (coin name)
- Custom back button (default iOS back button hidden)
- Current price section
- Market statistics:
  - Market Cap
  - 24h Volume
- All-time statistics:
  - All Time High (ATH)
  - All Time Low (ATL)
- Pull-to-refresh support
- Graceful loading and error states with retry support

---

##  Architecture

- **MVVM (Model–View–ViewModel)**
- State-driven UI using SwiftUI
- Clear separation of concerns
- No UIKit usage

### Structure
- **Views** – SwiftUI views
- **ViewModels** – Business logic & state handling
- **Networking** – Reusable, protocol-based network service
- **Models / DTOs** – API decoding and domain mapping
- **Mocks** – Fallback data for offline / rate-limited scenarios

---

##  Networking

- Uses `URLSession` with async/await
- Centralized `NetworkService`
- Protocol-based abstraction for testability
- Handles HTTP errors and retry logic
- Proper HTTP error handling
- Automatic retry logic for transient network failures


---

##  Testing

Unit tests included for:
- Networking layer using a mock network service
- Coins list ViewModel
- Coin detail ViewModel

Tests are isolated and do not rely on live API calls.

---

## Accessibility

- VoiceOver labels for coin rows
- Combined accessibility elements for list items
- Uses system colors for appropriate contrast

---

## Dark/Light Appearance

- Supports Light and Dark Mode
- Uses system adaptive colors

---

##  Getting Started

### Requirements
- Xcode 16+
- iOS 16.4+
- Swift 5.9+

### Run Instructions
1. Open `CryptpoCoin.xcodeproj`
2. Select an iOS simulator or device
3. Build & run the project

No additional setup required.

---

## ⚠️ Notes / Trade-offs

- CoinGecko free API has strict rate limits; the app surfaces clear error states with retry support  
- Charts and advanced visualizations were intentionally excluded to keep the scope focused
- UI animations are minimal to avoid unnecessary complexity

---

## 📂 Git History

The repository includes the full `.git` history showing:
- Initial project setup
- MVVM integration
- Networking implementation
- Detail screen flow
- Error handling and fallback logic
- UI/UX improvements
- Test additions

## 🚀 Getting Started

### Requirements
- Xcode 16.4+
- iOS 16.4+
- Swift 5.9+

### Installation & Run
1. Clone the repository:
   ```bash
   git clone <repository-url>


---

## 👤 Author

**Vaibhav Limbani**  
Senior iOS Developer

