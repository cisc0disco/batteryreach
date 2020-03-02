#import "JSViewController.h"
#import "JSCustomCell.h"

@interface BCBatteryDeviceController {
    NSArray *_sortedDevices;
}
+(id)sharedInstance;
@end

@interface BCBatteryDevice {
    long long _percentCharge;
    NSString *_name;
}

@end

@interface JSViewController ()

@end

@implementation JSViewController {

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // init table view
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor clearColor];

    // add to canvas
    [self.view addSubview:_tableView];


}

#pragma mark - UITableViewDataSource    
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    BCBatteryDeviceController *bcb = [%c(BCBatteryDeviceController) sharedInstance];
    NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");

    return devices.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSMutableArray *arrayDevices = [[NSMutableArray alloc]init];

    if([arrayDevices count] != 0) {
        [arrayDevices removeAllObjects];
    }

    static NSString *cellIdentifier = @"";
    
    // Similar to UITableViewCell, but 
    JSCustomCell *cell = (JSCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[JSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

        [cell setSeparatorInset:UIEdgeInsetsZero];

        //[_tableView setLayoutMargins: 10];
        //[_tableView setSeparatorInset:UIEdgeInsetsZero];

        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 16;
    
        BCBatteryDeviceController *bcb = [%c(BCBatteryDeviceController) sharedInstance];  
        NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");

        for (BCBatteryDevice *device in devices) {
            NSString* shitString = @"";

            long long percentCharge = MSHookIvar<long long>(device, "_percentCharge");
            NSString* deviceName = MSHookIvar<NSString*>(device, "_name");

            NSString* percentString = [NSString stringWithFormat:@"%lld", percentCharge];

            shitString = [NSString stringWithFormat:@"%@ : %@%%",deviceName, percentString];

            [arrayDevices addObject: shitString];
        }

        cell.textLabel.text = [[arrayDevices objectAtIndex:indexPath.row] capitalizedString];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end