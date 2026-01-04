TEMPLATE = subdirs

SUBDIRS += \
    fortuneclient \
    fortuneserver \
    threadedfortuneserver

# Build servers before client (optional, for convenience)
fortuneclient.depends = fortuneserver
