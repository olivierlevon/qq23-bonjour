HEADERS       = client.h \
                bonjourservicebrowser.h \
                bonjourserviceresolver.h \
                bonjourrecord.h
SOURCES       = client.cpp \
                main.cpp \
                bonjourservicebrowser.cpp \
                bonjourserviceresolver.cpp
QT           += network widgets

!mac:x11:LIBS+=-ldns_sd

win32 {
    LIBS += -ldnssd
    # Add your path to Bonjour SDK here
    # LIBPATH += "C:/Program Files/Bonjour SDK/Lib/x64"
    # INCLUDEPATH += "C:/Program Files/Bonjour SDK/Include"
}
