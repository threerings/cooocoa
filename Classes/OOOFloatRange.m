//
// Betwixt - Copyright 2012 Three Rings Design

#import "OOOFloatRange.h"
#import "OOORandoms.h"

@implementation OOOFloatRange

@synthesize rands, min, max;

- (id)initWithMin:(float)theMin max:(float)theMax rands:(OOORandoms*)theRands {
    if (!(self = [super init])) {
        return nil;
    }
    self.min = theMin;
    self.max = theMax;
    self.rands = theRands;
    return self;
}

- (float)next {
    return [rands getFloatLow:min high:max];
}

@end
