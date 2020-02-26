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
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(-15, -375/1.5+11, 667, 375/1.5-11) ];

    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    _tableView.delegate = self;
    _tableView.dataSource = self;

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

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    BCBatteryDeviceController *bcb = [%c(BCBatteryDeviceController) sharedInstance];
    NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");

    static NSString *cellIdentifier = @"";
    
    // Similar to UITableViewCell, but 
    JSCustomCell *cell = (JSCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[JSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    //ty kriple davas devices jako text, potrebujes jejich jmeno
    cell.textLabel.text = [[devices objectAtIndex:indexPath.row] capitalizedString];
    
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end