//
//  CVBaseView.h
//  CodeView
//
//  Created by Alice Bevan–McGregor on 10-06-22.
//  Copyright 2010 Alice Zoë Bevan–McGregor. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CVBaseView : UIViewController <UIWebViewDelegate> {
    UIWebView *webView;
    
    UIBarButtonItem *libraryButton;
    UIBarButtonItem *backButton;
    UIBarButtonItem *titleButton;
    UIBarButtonItem *settingsButton;
    
    UIActivityIndicatorView *activity;
    
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *libraryButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *titleButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *settingsButton;

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;

- (void)handleURL:(NSURL *)url;

- (IBAction)getTest:(id)sender;

@end
