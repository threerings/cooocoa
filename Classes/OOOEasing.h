//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOPowerEaser.h"

@protocol OOOInterpolator
- (float)interpolate:(float)from to:(float)to dt:(float)dt t:(float)t;
@end

@interface OOOEasing : NSObject

+ (id<OOOInterpolator>)linear;

+ (OOOPowerEaser*)quadratic;
+ (OOOPowerEaser*)cubic;
+ (OOOPowerEaser*)quartic;
+ (OOOPowerEaser*)quintic;

@end
