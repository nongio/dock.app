## PoC Dock.app using Distributed Objects

The project contains 2 apps: **Dock.app** and **Client.app**

- Dock.app: registers a new service named: DockService and waits for clients to send views and menus. Is creating a new Icon for every app and can open menus on right-click. The menu's callbacks are managed by the apps in the original process

- Client.app: connects to the DockService and register a new icon and sends his menu

### Imagery credits
Václav Vančura, "macOS Big Sur Icon Template"
https://www.figma.com/community/file/857303226040719059

