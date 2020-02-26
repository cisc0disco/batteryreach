#import <UIKit/UIKit.h>

// extends UITableViewCell
@interface JSCustomCell : UITableViewCell

// now only showing one label, you can add more yourself
@property (nonatomic, strong) UILabel *descriptionLabel;

@end