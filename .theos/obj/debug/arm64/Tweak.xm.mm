#line 1 "Tweak.xm"
#import "JSViewController.h"


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

@class SBReachabilityWindow; @class JSViewController; 
static id (*_logos_orig$_ungrouped$SBReachabilityWindow$view)(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$SBReachabilityWindow$view(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$JSViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("JSViewController"); } return _klass; }
#line 3 "Tweak.xm"

    static id _logos_method$_ungrouped$SBReachabilityWindow$view(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {     
        id Rview = _logos_orig$_ungrouped$SBReachabilityWindow$view(self, _cmd);



        JSViewController *jsvc = [[_logos_static_class_lookup$JSViewController() alloc] init];
        [Rview addSubview: jsvc.view];

        
        
        
        

        return Rview;   
    }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBReachabilityWindow = objc_getClass("SBReachabilityWindow"); MSHookMessageEx(_logos_class$_ungrouped$SBReachabilityWindow, @selector(view), (IMP)&_logos_method$_ungrouped$SBReachabilityWindow$view, (IMP*)&_logos_orig$_ungrouped$SBReachabilityWindow$view);} }
#line 20 "Tweak.xm"
