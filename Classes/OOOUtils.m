//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOUtils.h"
#import <mach/mach_time.h>

id OOONSNullToNil (id obj) { return (obj == [NSNull null] ? nil : obj); }

id OOONilToNSNull (id obj) { return (obj == nil ? [NSNull null] : obj); }

#define OOO_COMPARE_NUMBERS(a,b) ((a) > (b) ? 1 : ((a) == (b) ? 0 : -1))

NSComparisonResult OOOCompareBooleans (BOOL a, BOOL b) { return OOO_COMPARE_NUMBERS(a, b); }
NSComparisonResult OOOCompareInts (int a, int b) { return OOO_COMPARE_NUMBERS(a, b); }
NSComparisonResult OOOCompareFloats (float a, float b) { return OOO_COMPARE_NUMBERS(a, b); }
NSComparisonResult OOOCompareDoubles (double a, double b) { return OOO_COMPARE_NUMBERS(a, b); }

uint64_t OOOTimeNowMS () {
    static mach_timebase_info_data_t sTimebaseInfo;
    if (sTimebaseInfo.denom == 0) {
        mach_timebase_info(&sTimebaseInfo);
    }

    // convert from absolute-time to nanos, and from nanos to millis
    uint64_t time = mach_absolute_time();
    return (time * (sTimebaseInfo.numer / sTimebaseInfo.denom * 1000000));
}

double OOOTimeNow () {
    return ((double) OOOTimeNowMS()) / 1000.0;
}

double OOOMeasureTime (void(^block)()) {
    double start = OOOTimeNow();
    block();
    return OOOTimeNow() - start;
}