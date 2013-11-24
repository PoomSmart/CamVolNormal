#import <substrate.h>
#define CVNEnabled [[[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.PS.CamVolNormal.plist"] objectForKey:@"CVNEnabled"] boolValue]

@interface PLCameraView
- (void)_handleVolumeUpEvents:(unsigned int)events;
@end

static void (*_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonUp)(PLCameraView*, SEL);
static void _logos_method$_ungrouped$PLCameraView$_handleVolumeButtonUp(PLCameraView*, SEL);
static void (*_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonDown)(PLCameraView*, SEL);
static void _logos_method$_ungrouped$PLCameraView$_handleVolumeButtonDown(PLCameraView*, SEL);

static void (*_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonUp)(PLCameraView*, SEL);
static void _logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonUp(PLCameraView*, SEL);
static void (*_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonDown)(PLCameraView*, SEL);
static void _logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonDown(PLCameraView*, SEL);

// iOS 6
static void _logos_method$_ungrouped$PLCameraView$_handleVolumeButtonUp(PLCameraView* self, SEL _cmd) {
	if (CVNEnabled) {
		[self _handleVolumeUpEvents:1];
   		[self _handleVolumeUpEvents:64];
   	} else
   		_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonUp(self, _cmd);
}


static void _logos_method$_ungrouped$PLCameraView$_handleVolumeButtonDown(PLCameraView* self, SEL _cmd) {
	if (CVNEnabled)
		return;
	else
		_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonDown(self, _cmd);
}

// iOS 5
static void _logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonUp(PLCameraView* self, SEL _cmd) {
	if (CVNEnabled) {
		[self _handleVolumeUpEvents:1];
   		[self _handleVolumeUpEvents:64];
   	} else
   		_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonUp(self, _cmd);
}


static void _logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonDown(PLCameraView* self, SEL _cmd) {
	if (CVNEnabled)
		return;
	else
		_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonDown(self, _cmd);
}

%hook UIImagePickerController

- (void)viewWillAppear:(BOOL)view
{
	%orig;
	Class _logos_class$_ungrouped$PLCameraView = objc_getClass("PLCameraView");
	if (_logos_class$_ungrouped$PLCameraView != nil) {
		// iOS 5
		if (kCFCoreFoundationVersionNumber >= 550.32 && kCFCoreFoundationVersionNumber < 793.00) {
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeUpButtonUp), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonUp, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonUp);
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeUpButtonDown), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonDown, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonDown);
		}
		// iOS 6
		else if (kCFCoreFoundationVersionNumber >= 793.00) {
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeButtonUp), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeButtonUp, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonUp);
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeButtonDown), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeButtonDown, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonDown);
		}
	}
}

%end

%ctor {
	Class _logos_class$_ungrouped$PLCameraView = objc_getClass("PLCameraView");
	if (_logos_class$_ungrouped$PLCameraView != nil) {
		// iOS 5
		if (kCFCoreFoundationVersionNumber >= 550.32 && kCFCoreFoundationVersionNumber < 793.00) {
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeUpButtonUp), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonUp, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonUp);
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeUpButtonDown), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeUpButtonDown, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeUpButtonDown);
		}
		// iOS 6
		else if (kCFCoreFoundationVersionNumber >= 793.00) {
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeButtonUp), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeButtonUp, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonUp);
			MSHookMessageEx(_logos_class$_ungrouped$PLCameraView, @selector(_handleVolumeButtonDown), (IMP)&_logos_method$_ungrouped$PLCameraView$_handleVolumeButtonDown, (IMP*)&_logos_orig$_ungrouped$PLCameraView$_handleVolumeButtonDown);
		}
	}
}
