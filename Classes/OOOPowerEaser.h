//
// cooocoa - Copyright 2012 Three Rings Design

@protocol OOOInterpolator;

@interface OOOPowerEaser : NSObject {
@protected
    id<OOOInterpolator> _easeIn;
    id<OOOInterpolator> _easeOut;
    id<OOOInterpolator> _easeInOut;
}

@property (nonatomic,readonly) id<OOOInterpolator> easeIn;
@property (nonatomic,readonly) id<OOOInterpolator> easeOut;
@property (nonatomic,readonly) id<OOOInterpolator> easeInOut;

- (id)initWithExponent:(int)exp;

@end
