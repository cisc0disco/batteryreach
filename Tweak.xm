#import "ShitTableViewController"

@interface SBReachabilityWindow : UIView
    -(id)view;
@end

%hook SBReachabilityWindow
    -(id)view {
        
        id Rview = %orig;

        CGRect rect = CGRectMake(0, -375/1.5+11, 667, 375/1.5-11);


        UIView *myBox = [[UIView alloc] initWithFrame:rect];
		myBox.backgroundColor = [UIColor whiteColor];
    	[Rview addSubview:myBox];

        UITableView *tblView = [[UITableView alloc]initWithFrame:rect];
        [Rview addSubview:tblView];

        // UI+Label *myLabel = [[UILabel alloc]initWithFrame: rect];
        // [myLabel setBackgroundColor:[UIColor clearColor]];
        // [myLabel setText:@"Smrdíš"];
        // [Rview addSubview:myLabel];

        return Rview;   
    }
%end

%hook UITableView 

%end