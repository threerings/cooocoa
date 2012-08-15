//
// cooocoa - Copyright 2012 Three Rings Design

/// A simple utility for profiling sections of code.
/// Use OOO_PROFILE_SECTION(ExpensiveCodeSection) in the block of code you want to profile.
@interface OOOProfiler : NSObject

+ (NSString*)allStats;
+ (NSString*)statsForSection:(NSString*)name;

- (id)initWithName:(NSString*)name;

@end

#ifdef DEBUG
    #define OOO_PROFILE_SECTION(Name) \
        OOOProfiler* Name##Profiler = [[OOOProfiler alloc] initWithName:@#Name]; \
        [Name##Profiler hash] // call a function with no side effects, to prevent 'unused variable' warning
#else
    #define OOO_PROFILE_SECTION(Name)
#endif
