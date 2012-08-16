//
// cooocoa - Copyright 2012 Three Rings Design

id OOONilToNSNull(id obj);
id OOONSNullToNil(id obj);

NSComparisonResult OOOCompareBooleans (BOOL a, BOOL b);
NSComparisonResult OOOCompareInts (int a, int b);
NSComparisonResult OOOCompareFloats (float a, float b);
NSComparisonResult OOOCompareDoubles (double a, double b);

/// Returns the current time in seconds
double OOOTimeNow ();

/// Executes the given block, and returns the execution time (in seconds)
double OOOMeasureTime (void(^block)());