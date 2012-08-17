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

double OOOTimeNowMS () {
    static double ABSOLUTE_TO_MILLIS = 0;
    if (ABSOLUTE_TO_MILLIS == 0) {
        mach_timebase_info_data_t timebaseInfo;
        mach_timebase_info(&timebaseInfo);
        // timeBaseInfo takes us from absolute time to nanos.
        // divide by 1M to get to millis.
        ABSOLUTE_TO_MILLIS = ((double) (timebaseInfo.numer / timebaseInfo.denom)) / 1000000.0;
    }

    return mach_absolute_time() * ABSOLUTE_TO_MILLIS;
}

double OOOTimeNow () {
    return OOOTimeNowMS() / 1000.0;
}

double OOOMeasureTime (void(^block)()) {
    double start = OOOTimeNow();
    block();
    return OOOTimeNow() - start;
}