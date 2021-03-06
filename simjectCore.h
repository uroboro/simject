#define dylibDir @"/opt/simject"

@interface SBApplication : NSObject
@end

@interface FBApplicationInfo : NSObject
@end

@interface SBApplicationInfo : FBApplicationInfo
-(NSString *) bundleIdentifier;
@end

NSString *simjectGenerateDylibList(SBApplicationInfo *appInfo);
NSDictionary *simjectEnvironmentVariables(NSDictionary *origVars, SBApplicationInfo *appInfo);
