HEADERS       = server.h \
                bonjourserviceregister.h \
                bonjourrecord.h
SOURCES       = server.cpp \
                main.cpp \
                bonjourserviceregister.cpp
QT           += network widgets

!mac:x11:LIBS+=-ldns_sd

win32 {
    LIBS += -ldnssd
    INCLUDEPATH += "C:/Users/Olivier/Desktop/mDNSResponder-Windows_push/mDNSShared"
    # INCLUDEPATH += "C:/Program Files/Bonjour SDK/Include"

    contains(QT_ARCH, x86_64) {
        LIBPATH += "C:/Users/Olivier/Desktop/mDNSResponder-Windows_push/mDNSWindows/DLL/x64/Debug"
        # LIBPATH += "C:/Program Files/Bonjour SDK/Lib/x64"
    }
    contains(QT_ARCH, arm64) {
        LIBPATH += "C:/Users/Olivier/Desktop/mDNSResponder-Windows_push/mDNSWindows/DLL/ARM64/Debug"
        # LIBPATH += "C:/Program Files/Bonjour SDK/Lib/ARM64"
    }
}
