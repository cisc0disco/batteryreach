#import <UIKit/UIKit.h>

// Tell the compiler to conform to these protocols
@interface JSViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) UITableView *tableView;
@end