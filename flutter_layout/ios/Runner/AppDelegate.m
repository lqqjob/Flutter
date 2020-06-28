#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate ()
@property(nonatomic, strong)FlutterMethodChannel * methodChannel;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];

    FlutterViewController * vc = (FlutterViewController *)self.window.rootViewController;
    
    self.methodChannel = [FlutterMethodChannel methodChannelWithName:@"mine_page/method" binaryMessenger:vc];
    __weak typeof(self) weakSelf = self;
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"picture"]) {
            [weakSelf selectPicture];
        }
    }];
    [self.methodChannel invokeMethod:@"picture" arguments:nil];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)selectPicture {
    UIImagePickerController * controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    [self.window.rootViewController presentViewController:controller animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"info %@",info);
    NSURL * imageUrl = info[@"UIImagePickerControllerImageURL"];
//    [self.methodChannel invokeMethod:@"imagePath" arguments:imageUrl];
    [self.methodChannel invokeMethod:@"imagePath" arguments:[imageUrl absoluteString] result:^(id  _Nullable result) {
        
    }];
    
}
@end
