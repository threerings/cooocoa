//
// cooocoa - Copyright 2012 Three Rings Design

#import "OOOProfiler.h"
#import <QuartzCore/QuartzCore.h>

@interface OOOPerfTimer : NSObject
@property (nonatomic,assign) int timesRun;
@property (nonatomic,assign) int concurrentRunCount;
@property (nonatomic,assign) double totalTime;
@property (nonatomic,assign) double startTime;

+ (void)startTimer:(NSString*)name;
+ (void)stopTimer:(NSString*)name;
+ (OOOPerfTimer*)timerNamed:(NSString*)name;
@end

static NSMutableDictionary* _timers;

static double Now () { return CACurrentMediaTime(); }

@implementation OOOPerfTimer
+ (void)startTimer:(NSString*)name {
    OOOPerfTimer* timer = [OOOPerfTimer timerNamed:name];
    timer.timesRun++;
    if (timer.concurrentRunCount++ == 0) {
        timer.startTime = Now();
    }
}

+ (void)stopTimer:(NSString*)name {
    OOOPerfTimer* timer = [OOOPerfTimer timerNamed:name];
    if (timer.concurrentRunCount > 0 && --timer.concurrentRunCount == 0) {
        timer.totalTime += Now() - timer.startTime;
    }
}

+ (OOOPerfTimer*)timerNamed:(NSString*)name {
    if (_timers == nil) {
        _timers = [[NSMutableDictionary alloc] init];
    }
    OOOPerfTimer* timer = [_timers objectForKey:name];
    if (timer == nil) {
        timer = [[OOOPerfTimer alloc] init];
        [_timers setObject:timer forKey:name];
    }
    return timer;
}

@end

@interface OOOProfiler () {
@protected
    NSString* _name;
}
@end

@implementation OOOProfiler

+ (NSString*)allStats {
    NSMutableString* all = [NSMutableString stringWithString:@"OOOProfiler stats:"];
    for (NSString* name in _timers.keyEnumerator) {
        [all appendFormat:@"\n%@", [OOOProfiler statsForSection:name]];
    }
    return all;
}

+ (NSString*)statsForSection:(NSString*)name {
    static NSString* const STATS_FORMAT = @"* %@"
        "\t\tTimes run: %d"
        "\tTotal time: %g"
        "\tAvg time: %g";
    
    OOOPerfTimer* timer = [OOOPerfTimer timerNamed:name];
    return [NSString stringWithFormat:STATS_FORMAT,
            name, timer.timesRun, timer.totalTime, timer.totalTime / (float) timer.timesRun];
}

- (id)initWithName:(NSString*)name {
    if ((self = [super init])) {
        _name = name;
        [OOOPerfTimer startTimer:_name];
    }
    return self;
}

- (void)dealloc {
    [OOOPerfTimer stopTimer:_name];
}

@end
