//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOCollections.h"
#import "OOOUtils.h"

@implementation OOOCollections

+ (NSMutableArray*)filter:(id<NSFastEnumeration>)collection pred:(BOOL (^)(id))pred {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (id obj in collection) {
        if (pred(obj)) {
            [array addObject:obj];
        }
    }
    return array;
}

+ (NSMutableArray*)map:(id<NSFastEnumeration>)collection transformer:(id (^)(id))transformer {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (id obj in collection) {
        [array addObject:OOONilToNSNull(transformer(obj))];
    }
    return array;
}

+ (id)findObject:(id<NSFastEnumeration>)collection pred:(BOOL (^)(id))pred {
    for (id obj in collection) {
        if (pred(obj)) {
            return obj;
        }
    }
    return nil;
}

+ (NSEnumerator*)singleton:(id)object {
    return [NSArray arrayWithObject:object];
}

@end
