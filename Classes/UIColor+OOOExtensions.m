//
// Betwixt - Copyright 2012 Three Rings Design

#import "UIColor+OOOExtensions.h"

#define OOO_COLOR_PART_ALPHA(color)  (((color) >> 24) & 0xff)
#define OOO_COLOR_PART_RED(color)    (((color) >> 16) & 0xff)
#define OOO_COLOR_PART_GREEN(color)  (((color) >>  8) & 0xff)
#define OOO_COLOR_PART_BLUE(color)   ( (color)        & 0xff)

@implementation UIColor (OOOExtensions)

+ (UIColor*)colorWithARGB:(uint)color {
    return [UIColor colorWithRed:OOO_COLOR_PART_RED(color) / 255.0f 
                           green:OOO_COLOR_PART_GREEN(color) / 255.0f 
                            blue:OOO_COLOR_PART_BLUE(color) / 255.0f 
                           alpha:OOO_COLOR_PART_ALPHA(color) / 255.0f];
}

@end
