HEADERS       = dialog.h \
                fortuneserver.h \
                fortunethread.h \
                bonjourserviceregister.h \
                bonjourrecord.h
SOURCES       = dialog.cpp \
                fortuneserver.cpp \
                fortunethread.cpp \
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

# install
target.path = $$[QT_INSTALL_EXAMPLES]/network/threadedfortuneserver
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS threadedfortuneserver.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/network/threadedfortuneserver
INSTALLS += target sources
