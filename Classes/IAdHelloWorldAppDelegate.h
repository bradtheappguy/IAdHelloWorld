//
//  IAdHelloWorldAppDelegate.h
//  IAdHelloWorld
//
//  Created by Brad Smith on 5/17/10.
//  Copyright Clixtr 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface IAdHelloWorldAppDelegate : NSObject <UIApplicationDelegate, ADBannerViewDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

