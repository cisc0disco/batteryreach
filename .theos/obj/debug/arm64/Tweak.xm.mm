#line 1 "Tweak.xm"
@interface SBReachabilityWindow : UIView
    -(id)view;
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

@class SBReachabilityWindow; 
static id (*_logos_orig$_ungrouped$SBReachabilityWindow$view)(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$SBReachabilityWindow$view(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST, SEL); 

#line 5 "Tweak.xm"

    static id _logos_method$_ungrouped$SBReachabilityWindow$view(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        id Rview = _logos_orig$_ungrouped$SBReachabilityWindow$view(self, _cmd);

        CGRect rect = CGRectMake(0, -360, 240, 375);

        UIView *myBox = [[UIView alloc] initWithFrame:rect];
		myBox.backgroundColor = [UIColor lightGrayColor];
    	[Rview addSubview:myBox];




        
        
        
        

        return Rview;
    }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBReachabilityWindow = objc_getClass("SBReachabilityWindow"); MSHookMessageEx(_logos_class$_ungrouped$SBReachabilityWindow, @selector(view), (IMP)&_logos_method$_ungrouped$SBReachabilityWindow$view, (IMP*)&_logos_orig$_ungrouped$SBReachabilityWindow$view);} }
#line 26 "Tweak.xm"
