#import "JSViewController.h"

@interface SBReachabilityManager

+(id)sharedInstance;
@property(readonly, nonatomic) double effectiveReachabilityYOffset; // @synthesize effectiveReachabilityYOffset=_effectiveReachabilityYOffset;
@end

%hook SBReachabilityWindow
    -(id)layoutSubviews {     
        UIView *Rview = %orig;

        JSViewController *jsvc = [[%c(JSViewController) alloc] init];
        CGFloat height = [[%c(SBReachabilityManager) sharedInstance] effectiveReachabilityYOffset];
        jsvc.view.frame = CGRectMake(Rview.frame.origin.x, -height, Rview.frame.size.width, height);
        [Rview addSubview: jsvc.view];

        // UILabel *myLabel = [[UILabel alloc]initWithFrame: rect];
        // [myLabel setBackgroundColor:[UIColor clearColor]];
        // [myLabel setText:@"Smrdíš"];
        // [Rview addSubview:myLabel];

        return Rview;   
    }

%end