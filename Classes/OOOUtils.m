//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOUtils.h"
#import <QuartzCore/QuartzCore.h>

id OOONSNullToNil (id obj) { return (obj == [NSNull null] ? nil : obj); }

id OOONilToNSNull (id obj) { return (obj == nil ? [NSNull null] : obj); }

#define OOO_COMPARE_NUMBERS(a,b) ((a) > (b) ? 1 : ((a) == (b) ? 0 : -1))

NSComparisonResult OOOCompareBooleans (BOOL a, BOOL b) { return OOO_COMPARE_NUMBERS(a, b); }
NSComparisonResult OOOCompareInts (int a, int b) { return OOO_COMPARE_NUMBERS(a, b); }
NSComparisonResult OOOCompareFloats (float a, float b) { return OOO_COMPARE_NUMBERS(a, b); }
NSComparisonResult OOOCompareDoubles (double a, double b) { return OOO_COMPARE_NUMBERS(a, b); }

double OOOTimeNow () {
    return CACurrentMediaTime();
}

double OOOMeasureTime (void(^block)()) {
    double start = OOOTimeNow();
    block();
    return OOOTimeNow() - start;
}