//
// Betwixt - Copyright 2012 Three Rings Design

#import "OOOIntRange.h"
#import "OOORandoms.h"

@implementation OOOIntRange

@synthesize rands, min, max;

- (id)initWithMin:(int)theMin max:(int)theMax rands:(OOORandoms*)theRands {
    if ((self = [super init])) {
        self.min = theMin;
        self.max = theMax;
        self.rands = theRands;
    }
    return self;
}

- (int)next {
    return [rands getIntLow:min high:max + 1];
}

@end
