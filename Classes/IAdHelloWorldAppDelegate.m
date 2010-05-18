//
//  IAdHelloWorldAppDelegate.m
//  IAdHelloWorld
//
//  Created by Brad Smith on 5/17/10.
//  Copyright Clixtr 2010. All rights reserved.
//

#import "IAdHelloWorldAppDelegate.h"

@implementation IAdHelloWorldAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	
	ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
	adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
	adView.center = CGPointMake(window.frame.size.width/2, (window.frame.size.height - adView.frame.size.height/2) -20);
	adView.delegate = self;
	
	//All ADBannerViews must be inside a ViewController
	UIViewController *viewController = [[UIViewController alloc] init];
	[viewController.view addSubview:adView];
	[adView release];
	
	[window addSubview:viewController.view];
	[viewController release];
    [window makeKeyAndVisible];
	
	return YES;
}

// This method is invoked each time a banner loads a new advertisement. Once a banner has loaded an ad, 
// it will display that ad until another ad is available. The delegate might implement this method if 
// it wished to defer placing the banner in a view hierarchy until the banner has content to display.
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
	NSLog(@"%@",@"bannerViewDidLoadAd:");
}

// This method will be invoked when an error has occurred attempting to get advertisement content. 
// Possible error codes defined as constants in ADManager.h.
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
	NSLog(@"%@",@"bannerView:didFailToReceiveAdWithError:");
}

// This message will be sent when the user taps on the banner and some action is to be taken.
// Actions either display full screen content in a modal session or take the user to a different
// application. The delegate may return NO to block the action from taking place, but this
// should be avoided if possible because most advertisements pay significantly more when 
// the action takes place and, over the longer term, repeatedly blocking actions will 
// decrease the ad inventory available to the application. Applications may wish to pause video, 
// audio, or other animated content while the advertisement's action executes.
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
	NSLog(@"%@ %@",@"bannerViewActionDidFinish:willLeaveApplication:",willLeave?@"true":@"false");
	return YES;
}

// This message is sent when a modal action has completed and control is returned to the application. 
// Games, media playback, and other activities that were paused in response to the beginning
// of the action should resume at this point.
- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
	NSLog(@"%@",@"bannerViewActionShouldBegin::");
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
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
    [window release];
    [super dealloc];
}


@end
