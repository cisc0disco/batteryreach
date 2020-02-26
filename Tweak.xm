#import "JSViewController.h"

%hook SBReachabilityWindow
    -(id)view {     
        id Rview = %orig;



        JSViewController *jsvc = [[%c(JSViewController) alloc] init];
        [Rview addSubview: jsvc.view];

        // UILabel *myLabel = [[UILabel alloc]initWithFrame: rect];
        // [myLabel setBackgroundColor:[UIColor clearColor]];
        // [myLabel setText:@"Smrdíš"];
        // [Rview addSubview:myLabel];

        return Rview;   
    }
%end