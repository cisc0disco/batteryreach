#line 1 "JSViewController.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class BCBatteryDeviceController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$BCBatteryDeviceController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("BCBatteryDeviceController"); } return _klass; }
#line 21 "JSViewController.xm"
@implementation JSViewController {

}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor clearColor];

    
    [self.view addSubview:_tableView];


}

#pragma mark - UITableViewDataSource    


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    BCBatteryDeviceController *bcb = [_logos_static_class_lookup$BCBatteryDeviceController() sharedInstance];
    NSArray *devices = MSHookIvar<NSArray *>(bcb, "_sortedDevices");

    return devices.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}



- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSMutableArray *arrayDevices = [[NSMutableArray alloc]init];

    if([arrayDevices count] != 0) {
        [arrayDevices removeAllObjects];
    }

    static NSString *cellIdentifier = @"";
    
    
    JSCustomCell *cell = (JSCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[JSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

        [cell setSeparatorInset:UIEdgeInsetsZero];

        
        

        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 16;
    
        BCBatteryDeviceController *bcb = [_logos_static_class_lookup$BCBatteryDeviceController() sharedInstance];  
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


- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
#line 118 "JSViewController.xm"
