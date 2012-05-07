//
// cooocoa - Copyright 2012 Three Rings Design

#define OOO_ENUM(NAME) \
    static id _##NAME = nil; \
    + (void)OOOEnum_Init##NAME { \
        if (_##NAME == nil) { \
            _##NAME = [[self alloc] init]; \
            [_##NAME setName:@#NAME]; \
        } \
    } \
    + (id)NAME { return _##NAME; }

#define OOO_ENUM_INIT(NAME, INIT) \
    static id _##NAME = nil; \
    + (void)OOOEnum_Init##NAME { \
        if (_##NAME == nil) { \
            _##NAME = INIT; \
            [_##NAME setName:@#NAME]; \
        } \
    } \
    + (id)NAME { return _##NAME; }


@interface OOOEnum : NSObject <NSCopying>

+ (id)valueOf:(NSString*)name;
+ (NSArray*)values;

@property(readonly) NSString* name;

@end
