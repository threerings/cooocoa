//
// cooocoa - Copyright 2012 Three Rings Design

#import "NSMutableArray+OOOExtensions.h"
#import "NSArray+OOOExtensions.h"
#import "OOOUtils.h"
#import "OOORandoms.h"

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

- (void)shuffleWithRands:(OOORandoms*)rands {
    // starting from the end of the list, repeatedly swap the element in question with a
    // random element previous to it up to and including itself
    for (NSUInteger ii = self.count; ii > 1; --ii) {
        [self exchangeObjectAtIndex:ii - 1 withObjectAtIndex:[rands getUint:ii]];
    }
}

@end
