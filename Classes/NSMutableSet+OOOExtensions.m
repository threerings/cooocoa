//
// cooocoa - Copyright 2012 Three Rings Design

#import "NSMutableSet+OOOExtensions.h"

@implementation NSMutableSet (OOOExtensions)

- (BOOL)addObjectAndReport:(id)object {
    int count = self.count;
    [self addObject:object];
    return count != self.count;
}

- (BOOL)removeObjectAndReport:(id)object {
    int count = self.count;
    [self removeObject:object];
    return count != self.count;
}

@end
