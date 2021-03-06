//
// cooocoa - Copyright 2012 Three Rings Design

/// Simple bitflag implementation
@interface OOOFlags : NSObject <NSCopying> {
@protected
    uint32_t _bits;
}

@property (nonatomic,readonly) uint32_t bits;

- (id)initWithBits:(uint32_t)bits;
- (id)init;
- (BOOL)isSet:(int)flag;

@end

@interface OOOMutableFlags : OOOFlags

@property (nonatomic,assign) uint32_t bits;

- (void)setFlag:(int)flag value:(BOOL)value;

- (void)setFlag:(int)flag;
- (void)clearFlag:(int)flag;

@end

uint32_t OOOSetFlag (uint32_t bits, int flag);
uint32_t OOOClearFlag (uint32_t bits, int flag);
BOOL OOOIsFlagSet (uint32_t bits, int flag);
