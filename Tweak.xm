@interface SBReachabilityWindow : UIView
    -(id)view;
@end

%hook SBReachabilityWindow
    -(id)view {
        id Rview = %orig;

        CGRect rect = CGRectMake(0, -360, 240, 375);

        UIView *myBox = [[UIView alloc] initWithFrame:rect];
		myBox.backgroundColor = [UIColor lightGrayColor];
    	[Rview addSubview:myBox];




        // UILabel *myLabel = [[UILabel alloc]initWithFrame: rect];
        // [myLabel setBackgroundColor:[UIColor clearColor]];
        // [myLabel setText:@"Smrdíš"];
        // [Rview addSubview:myLabel];

        return Rview;
    }
%end