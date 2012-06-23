//
// cooocoa - Copyright 2012 Three Rings Design

#import <UIKit/UIKit.h>

/// An RGBA bitmap
@interface OOOBitmap : NSObject {
@protected
    NSData* _data;
    NSUInteger _width;
    NSUInteger _height;
}

@property (nonatomic,readonly) uint32_t* pixels;
@property (nonatomic,readonly) NSUInteger width;
@property (nonatomic,readonly) NSUInteger height;

- (id)initWithData:(NSData*)data width:(NSUInteger)width height:(NSUInteger)height;
- (id)initWithUIImage:(UIImage*)image;

- (uint32_t)pixelAtX:(NSUInteger)x y:(NSUInteger)y;

- (UIImage*)createUIImage;

@end

