//
//  CodeViewAppDelegate.h
//  CodeView
//
//  Created by Alice Bevan–McGregor on 10-06-22.
//  Copyright Alice Zoë Bevan–McGregor 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CVBaseView.h"


@interface CodeViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CVBaseView *viewController;
    UIView *baseView;
    UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CVBaseView *viewController;
@property (nonatomic, retain) IBOutlet UIView *baseView;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;


@end

