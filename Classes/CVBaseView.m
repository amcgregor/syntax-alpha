    //
//  CVBaseView.m
//  CodeView
//
//  Created by Alice Bevan–McGregor on 10-06-22.
//  Copyright 2010 Alice Zoë Bevan–McGregor. All rights reserved.
//

#import "CVBaseView.h"


@implementation CVBaseView


@synthesize webView, activity;
@synthesize libraryButton, backButton, titleButton, settingsButton;



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


// NSURL *url = [NSURL URLWithString:@"http://www.mobileorchard.com"];
// [[UIApplication sharedApplication] openURL:url];


- (void)webViewDidStartLoad:(UIWebView *)webView {
    activity.hidden = NO;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    titleButton.title = @"Loading…";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    activity.hidden = YES;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [titleButton setTitle:[webView stringByEvaluatingJavaScriptFromString:@"document.title"]];
    
    // backButton.enabled = webView.canGoBack;
}


- (void)handleURL:(NSURL *)url {
    NSURL *uri = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"WebRoot"]];
    
//    [webView loadRequest:[NSURLRequest requestWithURL:[[NSURL alloc] initWithScheme:uri.scheme
//                                                                               host:uri.host
//                                                                               path:[[uri.path stringByAppendingString:@"?"] stringByAppendingString: [url absoluteString]]
//                                                       ]]];
    
    // NSLog(@"%s", [[[uri absoluteString] stringByAppendingString: @"?"] stringByAppendingString: [url absoluteString]]);
    
    // [[[UIAlertView alloc] initWithTitle:@"Recieved URL" message:[[[uri absoluteString] stringByAppendingString: @"?"] stringByAppendingString: [url absoluteString]] delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil] show];

    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[[uri absoluteString] stringByAppendingString: @"?"] stringByAppendingString: [url absoluteString]]]]];
}


- (IBAction)getTest:(id)sender {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"source://www.google.com/"]];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
