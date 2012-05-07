//
// cooocoa - Copyright 2012 Three Rings Design

#import "NSMutableArray+OOOExtensions.h"
#import "NSArray+OOOExtensions.h"
#import "OOOUtils.h"

@implementation NSMutableArray (OOOExtensions)

+ (NSMutableArray*)arrayFromEnumeration:(id<NSFastEnumeration>)e {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (id obj in e) {
        [array addObject:OOONilToNSNull(obj)];
    }
    return array;
}

- (int)sortedInsert:(id)object comp:(NSComparator)comp {
    int index = [self binarySearch:object comp:comp];
    if (index < 0) {
        index = -(index + 1);
    }
    [self insertObject:object atIndex:index];
    return index;
}

@end
