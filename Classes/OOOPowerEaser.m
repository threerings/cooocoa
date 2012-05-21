//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOPowerEaser.h"
#import "OOOEasing.h"
#import <math.h>

typedef float (^OOOEasingBlock)(int exp, float from, float to, float dt, float t);

static OOOEasingBlock EASE_IN = ^float (int exp, float from, float to, float dt, float t) {
    if (t == 0) {
        return to;
    }
    return from + ((to - from) * powf(dt / t, exp));
};

static OOOEasingBlock EASE_OUT = ^float (int exp, float from, float to, float dt, float t) {
    if (t == 0) {
        return to;
    }
    return from + ((to - from) * (1.0f - powf(1.0f - dt / t, exp)));
};

static OOOEasingBlock EASE_IN_OUT = ^float (int exp, float from, float to, float dt, float t) {
    if (t == 0) {
        return to;
    }
    float mid = from + ((to - from) * 0.5f);
    t *= 0.5f;
    return (dt <= t ? EASE_IN(exp, from, mid, dt, t) : EASE_OUT(exp, mid, to, dt - t, t));
};

@interface OOOPowerEaserImpl : NSObject<OOOInterpolator> {
@protected
    int _exp;
    OOOEasingBlock _easer;
}
- (id)initWithExponent:(int)exp easer:(OOOEasingBlock)easer;
@end

@implementation OOOPowerEaserImpl
- (id)initWithExponent:(int)exp easer:(OOOEasingBlock)easer {
    if ((self = [super init])) {
        _exp = exp;
        _easer = [easer copy];
    }
    return self;
}

- (float)interpolate:(float)from to:(float)to dt:(float)dt t:(float)t {
    return _easer(_exp, from, to, dt, t);
}
@end

@implementation OOOPowerEaser

@synthesize easeIn = _easeIn;
@synthesize easeOut = _easeOut;
@synthesize easeInOut = _easeInOut;

- (id)initWithExponent:(int)exp {
    if ((self = [super init])) {
        _easeIn = [[OOOPowerEaserImpl alloc] initWithExponent:exp easer:EASE_IN];
        _easeOut = [[OOOPowerEaserImpl alloc] initWithExponent:exp easer:EASE_OUT];
        _easeInOut = [[OOOPowerEaserImpl alloc] initWithExponent:exp easer:EASE_IN_OUT];
    }
    return self;
}

@end
