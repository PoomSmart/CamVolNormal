#import <Foundation/Foundation.h>
#define CVNEnabled [[[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.PS.CamVolNormal.plist"] objectForKey:@"CVNEnabled"] boolValue]

@interface PLCameraView
- (void)_handleVolumeUpEvents:(unsigned int)events;
@end

%hook PLCameraView

/*------------- iOS 6 -------------*/
- (void)_handleVolumeButtonUp
{
	if (CVNEnabled) {
		[self _handleVolumeUpEvents:1];
   		[self _handleVolumeUpEvents:64];
   	} else
   		%orig;
}

- (void)_handleVolumeButtonDown
{
	if (CVNEnabled)
		return;
	else
		%orig;
}

/*------------- iOS 5 -------------*/
- (void)_handleVolumeUpButtonUp
{
	if (CVNEnabled) {
		[self _handleVolumeUpEvents:1];
   		[self _handleVolumeUpEvents:64];
   	} else
   		%orig;
}

- (void)_handleVolumeUpButtonDown
{
	if (CVNEnabled)
		return;
	else
		%orig;
}

%end