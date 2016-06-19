#import "simjectCore.h"

@interface NSTask : NSObject
+ (NSTask *)launchedTaskWithLaunchPath:(NSString *)path
							 arguments:(NSArray<NSString *> *)arguments;
@end

int main(int argc, const char * argv[]) {
	printf("respring_simulator (C) 2016 Karen Tsai (angelXwind)\n");
	printf("Injecting appropriate dynamic libraries from /opt/simject...\n");
	NSArray *t_args = @[ @"simctl", @"spawn", @"booted", @"launchctl", @"debug", @"system/com.apple.SpringBoard"];
	NSString *envVars = simjectGenerateDylibList(nil);
	if (envVars) {
		NSString *dyld = [NSString stringWithFormat:@" --environment DYLD_INSERT_LIBRARIES=%@", envVars];
		t_args = [t_args arrayByAddingObject:dyld];
	}
	[NSTask launchedTaskWithLaunchPath:@"/usr/bin/xcrun" arguments:t_args];
	
	printf("Respringing...\n");
	t_args = @[ @"simctl", @"spawn", @"booted", @"launchctl", @"stop", @"system/com.apple.SpringBoard"];
	[NSTask launchedTaskWithLaunchPath:@"/usr/bin/xcrun" arguments:t_args];
	return 0;
}
