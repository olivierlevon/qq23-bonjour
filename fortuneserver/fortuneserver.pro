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
    # Add your path to Bonjour SDK here
    # LIBPATH += "C:/Program Files/Bonjour SDK/Lib/x64"
    # INCLUDEPATH += "C:/Program Files/Bonjour SDK/Include"
}
