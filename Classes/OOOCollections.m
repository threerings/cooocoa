//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOCollections.h"
#import "OOOUtils.h"

@implementation OOOCollections

+ (NSMutableArray*)allObjects:(id<NSFastEnumeration>)collection {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (id obj in collection) {
        [array addObject:OOONilToNSNull(obj)];
    }
    return array;
}

+ (NSMutableArray*)filter:(id<NSFastEnumeration>)collection pred:(BOOL(^)(id))pred {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (id obj in collection) {
        if (pred(obj)) {
            [array addObject:OOONilToNSNull(obj)];
        }
    }
    return array;
}

+ (NSMutableArray*)map:(id<NSFastEnumeration>)collection transformer:(id(^)(id))transformer {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (id obj in collection) {
        [array addObject:OOONilToNSNull(transformer(obj))];
    }
    return array;
}

+ (id)findObject:(id<NSFastEnumeration>)collection pred:(BOOL(^)(id))pred {
    for (id obj in collection) {
        if (pred(obj)) {
            return obj;
        }
    }
    return nil;
}

+ (id)findMin:(id<NSFastEnumeration>)collection withComparator:(NSComparator)comp {
    id candidate = nil;
    for (id obj in collection) {
        if (candidate == nil || comp(obj, candidate) < 0) {
            candidate = obj;
        }
    }
    return candidate;
}

+ (id)findMax:(id<NSFastEnumeration>)collection withComparator:(NSComparator)comp {
    return [OOOCollections findMin:collection withComparator:^NSComparisonResult(id obj1, id obj2) {
        return comp(obj2, obj1);
    }];
}

@end
