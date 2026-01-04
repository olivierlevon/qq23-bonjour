# Qt Bonjour/Zeroconf Integration Examples

Qt wrapper classes for Apple's Bonjour (mDNS/DNS-SD) zero-configuration networking, originally from Qt Quarterly Issue 23.

## Overview

This project provides reusable Qt classes for integrating Bonjour/Zeroconf service discovery into Qt applications:

| Class | Purpose |
|-------|---------|
| `BonjourServiceBrowser` | Discover services on the local network |
| `BonjourServiceResolver` | Resolve service names to IP addresses and ports |
| `BonjourServiceRegister` | Publish/advertise services on the network |

## Projects

- **fortuneclient** - Client that discovers and connects to fortune servers
- **fortuneserver** - Simple single-threaded fortune server
- **threadedfortuneserver** - Multi-threaded fortune server variant

## Requirements

- Qt 6.x (QtCore, QtWidgets, QtNetwork)
- Apple Bonjour SDK or compatible mDNS implementation:
  - **Windows**: [Bonjour SDK for Windows](https://developer.apple.com/bonjour/)
  - **Linux**: Avahi with libdns_sd compatibility layer (`libavahi-compat-libdnssd-dev`)
  - **macOS**: Built-in (no additional installation needed)

## Building

### Configure Bonjour SDK paths (Windows only)

Edit the `.pro` files and uncomment/set the SDK paths:

```qmake
win32 {
    LIBS += -ldnssd
    LIBPATH += "C:/Program Files/Bonjour SDK/Lib/x64"
    INCLUDEPATH += "C:/Program Files/Bonjour SDK/Include"
}
```

### Build with qmake

```bash
# Build the client
cd fortuneclient
qmake
make    # or nmake/mingw32-make on Windows

# Build a server
cd ../fortuneserver
qmake
make
```

## Usage

1. Start one of the fortune servers
2. Start the fortune client
3. The client will automatically discover available servers via Bonjour
4. Select a server and click "Get Fortune"

## Service Type

All examples use the service type `_trollfortune._tcp` for discovery.

## License

This project contains code under two licenses:

- **Qt example code**: GNU General Public License v2.0 or Qt Commercial License
- **Bonjour integration code**: BSD 3-Clause License (Copyright (c) 2007, Trenton Schulz)

See [LICENSE](LICENSE) for full details.

## References

- [Original Qt Quarterly 23 Article](https://doc.qt.io/archives/qq/qq23-bonjour.html)
- [Apple DNS-SD API Reference](https://developer.apple.com/documentation/dnssd)
