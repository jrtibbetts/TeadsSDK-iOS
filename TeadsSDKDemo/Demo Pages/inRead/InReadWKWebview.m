//
//  inRead.m
//  TeadsSDKDemo
//
//  Created by Nikolaï Roycourt on 17/12/2015.
//  Copyright © 2015 Teads. All rights reserved.
//

#import "InReadWKWebview.h"

@interface InReadWKWebview ()

@property (strong, nonatomic) WKWebView *wkWebView;

@property (strong, nonatomic) TeadsAd *teadsInRead;

@end

@implementation InReadWKWebview

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:theConfiguration];
    self.wkWebView.navigationDelegate = self;
    
    [self.view addSubview:self.wkWebView];
    
    [self.wkWebView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_wkWwebView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_wkWebView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_wkWwebView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_wkWebView)]];
    
    self.navigationItem.title = @"inRead WKWebView";
    
    NSString *pid = [[NSUserDefaults standardUserDefaults] stringForKey:@"pid"];
    
    //Load a web page from an URL
    NSURL *webSiteURL;
    NSString *urlToLoad = [[NSUserDefaults standardUserDefaults] stringForKey:@"website"];
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"website"] isEqual:@"Default demo website"]) {
        //Here we specify in placeholderText an id for a HTML node to insert the inRead
        self.teadsInRead = [[TeadsAd alloc] initInReadWithPlacementId:pid
                                                         placeholderText:@"#my-placement-id"
                                                               wkWebView:self.wkWebView
                                                                delegate:self];
        webSiteURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] isDirectory:NO];
    } else {
        // inRead
        self.teadsInRead = [[TeadsAd alloc] initInReadWithPlacementId:pid
                                                         placeholderText:[[NSUserDefaults standardUserDefaults] stringForKey:@"placeholderText"]
                                                               wkWebView:self.wkWebView
                                                                delegate:self];
        webSiteURL = [NSURL URLWithString:urlToLoad];
    }
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:webSiteURL]];

}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.teadsInRead.isLoaded) {
        [self.teadsInRead viewControllerAppeared:self];
    } else {
        [self.teadsInRead load];
    }
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.teadsInRead viewControllerDisappeared:self];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
}

-(void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    completionHandler(NSURLSessionAuthChallengePerformDefaultHandling, NSURLCredentialPersistenceNone);
}

#pragma mark -
#pragma mark - TeadsAd delegate

/**
 * Ad failed to load
 *
 * @param ad The TeadsAd object
 * @param error The TeadsError object
 */
- (void)teadsAd:(TeadsAd *)ad didFailLoading:(TeadsError *)error {
    
}

/**
 * Ad will load (loading)
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillLoad:(TeadsAd *)ad {
    
}

/**
 * Ad did load (loaded successfully)
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidLoad:(TeadsAd *)ad {
    
}

/**
 * Ad experience will start
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillStart:(TeadsAd *)ad {
    
}

/**
 * Ad experience did start
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidStart:(TeadsAd *)ad {
    
}

/**
 * Ad experience stop
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillStop:(TeadsAd *)ad {
    
}

/**
 * Ad experience did stop
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidStop:(TeadsAd *)ad {
    
}

/**
 * Ad experience did pause
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidPause:(TeadsAd *)ad {
    
}

/**
 * Ad experience did resume
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidResume:(TeadsAd *)ad {
    
}

/**
 * Ad did mute sound
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidMute:(TeadsAd *)ad {
    
}

/**
 * Ad did unmute sound
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidUnmute:(TeadsAd *)ad {
    
}

/**
 * Ad will expand
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillExpand:(TeadsAd *)ad {
    
}

/**
 * Ad did expand
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidExpand:(TeadsAd *)ad {
    
}

/**
 * Ad will collapse
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillCollapse:(TeadsAd *)ad {
    
}

/**
 * Ad did collapse
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidCollapse:(TeadsAd *)ad {
    
}

/**
 * Ad was clicked
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWasClicked:(TeadsAd *)ad {
    
}

/**
 * Ad experience did stop
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidClickBrowserClose:(TeadsAd *)ad {
    
}

/**
 * Ad will take over fullscreen
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillTakeOverFullScreen:(TeadsAd *)ad {
    
}

/**
 * Ad did take over fullscreen
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidTakeOverFullScreen:(TeadsAd *)ad {
    
}

/**
 * Ad qill dismiss fullscreen
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdWillDismissFullscreen:(TeadsAd *)ad {
    
}

/**
 * Ad did dismiss fullscreen
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdDidDismissFullscreen:(TeadsAd *)ad {
    
}

/**
 * Ad Skip Button Was Tapped
 *
 * @param ad The TeadsAd object
 * @discussion Eg: skip button was pressed
 */
- (void)teadsAdSkipButtonTapped:(TeadsAd *)ad {
    
}

/**
 * Ad skip button appeared
 *
 * @param ad The TeadsAd object
 */
- (void)teadsAdSkipButtonDidShow:(TeadsAd *)ad {
    
}

/**
 * Ad did reset
 *
 * @param ad The TeadsAd object
 * @discussion Player is closed if open, new `load` call can be made after
 */
- (void)teadsAdDidReset:(TeadsAd *)ad {
    
}

/**
 * Ad did clean
 *
 * @param ad The TeadsAd object
 * @discussion All related resoures have been removed
 */
- (void)teadsAdDidClean:(TeadsAd *)ad {
    
}

@end
