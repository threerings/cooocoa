//
// Betwixt - Copyright 2012 Three Rings Design

#import "OOOEasing.h"
#import "OOOMacros.h"

@interface OOOLinearEaser : NSObject <OOOInterpolator>
@end

@implementation OOOLinearEaser
- (float)interpolate:(float)from to:(float)to dt:(float)dt t:(float)t {
    if (t == 0) { 
        return to;
    }
    return from + ((to - from) * (dt / t));
}
@end

@implementation OOOEasing

+ (id<OOOInterpolator>)linear { return OOO_STATIC_OBJECT([[OOOLinearEaser alloc] init]); }
+ (OOOPowerEaser*)quadratic { return OOO_STATIC_OBJECT([[OOOPowerEaser alloc] initWithExponent:2]); }
+ (OOOPowerEaser*)cubic { return OOO_STATIC_OBJECT([[OOOPowerEaser alloc] initWithExponent:3]); }
+ (OOOPowerEaser*)quartic { return OOO_STATIC_OBJECT([[OOOPowerEaser alloc] initWithExponent:4]); }
+ (OOOPowerEaser*)quintic { return OOO_STATIC_OBJECT([[OOOPowerEaser alloc] initWithExponent:5]); }
@end
