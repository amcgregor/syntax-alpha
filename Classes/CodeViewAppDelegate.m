//
//  CodeViewAppDelegate.m
//  CodeView
//
//  Created by Alice Bevan–McGregor on 10-06-22.
//  Copyright Alice Zoë Bevan–McGregor 2010. All rights reserved.
//

#import "CodeViewAppDelegate.h"

@implementation CodeViewAppDelegate

@synthesize window, viewController, baseView, webView;

// NSInteger urlCount = 0;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if (!url) return NO;
    
   // [[[UIAlertView alloc] initWithTitle:@"handleOpenURL" message:[url absoluteString] delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];

    NSString *uri = [url absoluteString];
    uri = [uri stringByReplacingOccurrencesOfString:@"source://" withString:@"http://"];
    uri = [uri stringByReplacingOccurrencesOfString:@"source-s://" withString:@"https://"];
    uri = [uri stringByReplacingOccurrencesOfString:@"local-source://" withString:@"file://"];
    
//    NSLog(@"%s", uri);
//    urlCount++;
//    NSLog(@"%d", urlCount);
    
	[viewController handleURL:[NSURL URLWithString:uri]];
    
	return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch.
	
    [window addSubview:baseView];
    [window makeKeyAndVisible];
    
    if ( launchOptions ) {
        // CFShow(launchOptions);
        
        if ( [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey] ) {
            [self application:application handleOpenURL:(NSURL *)[launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]];
            return YES;
        }
        
        return NO;
    }
    
    else {
        NSURL *uri = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"WebRoot"]];
        [self application:application handleOpenURL:uri];
    }
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [webView release];
    [window release];
    [super dealloc];
}


@end
