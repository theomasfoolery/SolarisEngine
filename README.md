# ☀️ SolarisEngine

**SolarisEngine** is a modular Luau framework designed for Roblox developers who need a robust, type-safe Ability System. It utilizes **Rojo** for external filesystem management, allowing for professional VCS workflows with Git.



## 🛠️ Features
* **Modular Design**: Abilities are decoupled from the core engine.
* **Type Safety**: Full Luau type definitions for IDE autocompletion (VS Code).
* **VCS Friendly**: Built for Git; no more binary `.rbxl` bloat.
* **Scalable**: Designed to handle hundreds of unique game mechanics.

## 🚀 Setup
1. Install [Rojo](https://rojo.space/) (VS Code Extension + CLI).
2. Run `rojo serve` in the root directory.
3. In Roblox Studio, use the Rojo plugin to connect.

## 📦 Structure
- `src/shared`: Core logic shared between Client and Server.
- `src/server`: Authority logic, data persistence, and validation.
- `src/client`: Input handling and visual effects.