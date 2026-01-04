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
  - **Windows**: [Bonjour SDK for Windows](https://developer.apple.com/bonjour/) or mDNSResponder build
  - **Linux**: Avahi with libdns_sd compatibility layer (`libavahi-compat-libdnssd-dev`)
  - **macOS**: Built-in (no additional installation needed)

## Supported Architectures

| Platform | x86_64 | ARM64 |
|----------|--------|-------|
| Windows | Yes | Yes |
| Linux | Yes | Yes |
| macOS | Yes | Yes (Apple Silicon) |

The `.pro` files automatically detect the target architecture and select the appropriate library paths.

## Building

### Configure mDNSResponder paths (Windows only)

The `.pro` files use `QT_ARCH` to automatically select the correct library path for x64 or ARM64 builds.

Edit the `.pro` files and set the paths for your mDNSResponder build:

```qmake
win32 {
    LIBS += -ldnssd
    INCLUDEPATH += "/path/to/mDNSResponder/mDNSShared"

    contains(QT_ARCH, x86_64) {
        LIBPATH += "/path/to/mDNSResponder/mDNSWindows/DLL/x64/Debug"
    }
    contains(QT_ARCH, arm64) {
        LIBPATH += "/path/to/mDNSResponder/mDNSWindows/DLL/ARM64/Debug"
    }
}
```

> **Note**: The official Bonjour SDK for Windows does not include ARM64 libraries. For ARM64 support, you must build [mDNSResponder](https://github.com/apple-oss-distributions/mDNSResponder) from source.

### Build with Qt Creator

Open `qq23-bonjour.pro` in Qt Creator to load all three projects at once.

### Build with qmake (command line)

```bash
# Build all projects
qmake qq23-bonjour.pro
make    # or nmake/mingw32-make on Windows

# Or build individually
cd fortuneclient
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
