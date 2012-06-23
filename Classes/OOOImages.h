//
// cooocoa - Copyright 2012 Three Rings Design

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OOOImages : NSObject

/// Converts a UIImage to RGBA8 bitmap.
/// @param image - a UIImage to be converted
/// @return a RGBA8 bitmap, or nil if any memory allocation issues.
+ (NSData*)convertUIImageToBitmapRGBA8:(UIImage*)image;

/// A helper routine used to convert a RGBA8 to UIImage
/// @return a new context that is owned by the caller
+ (CGContextRef)newBitmapRGBA8ContextFromImage:(CGImageRef)image;


/// Converts a RGBA8 bitmap to a UIImage. 
/// @param buffer - the RGBA8 unsigned char * bitmap
/// @param width - the number of pixels wide
/// @param height - the number of pixels tall
/// @return a UIImage that is autoreleased or nil if memory allocation issues
+ (UIImage*)convertBitmapRGBA8ToUIImage:(NSData*)buffer 
                              withWidth:(int)width
                             withHeight:(int)height;

@end

