#import "JSCustomCell.h"

@implementation JSCustomCell

@synthesize descriptionLabel = _descriptionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // // configure control(s)
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        self.descriptionLabel.textColor = [UIColor blackColor];
        self.descriptionLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        [self addSubview:self.descriptionLabel];
    }
    return self;
}

@end