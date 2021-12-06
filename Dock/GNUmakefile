include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = Dock

Dock_OBJC_FILES =  \
main.m \
DockServer.m \
DockController.m \
DockContainerView.m \
DockIconView.m \
DockIconLabelView.m \

ADDITIONAL_INCLUDE_DIRS += -I./Headers

LDFLAGS += -lgnustep-corebase -ldispatch

-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/tool.make
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble

