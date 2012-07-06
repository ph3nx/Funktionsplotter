//
//  ph3nx_Fenster.m
//  Funktionsplotter
//
//  Created by Pascal Gläser on 05.07.12.
//  Copyright (c) 2012 ph3nx.com. All rights reserved.
//

#import "ph3nx_Fenster.h"

@implementation ph3nx_Fenster

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (NSString*)nice :(NSInteger)hochzahl {
    int hoch = hochzahl;
    if (hoch < 0) {
        return @"ok";
    }
    else {
        return @"madig";
    }
}

- (CGRect)zeichneFunktion:(NSInteger)hochzahl {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = self.bounds;
    
    int xl = -20;
    int xr = 20;
    int yo = 20;
    int yu = -20;
    
    float mx = CGRectGetMaxX(bounds)/(xr-xl);
    float my = CGRectGetMaxY(bounds)/(yo-yu);
    
    float prevx = CGRectGetMinX(bounds);
    float prevy = CGRectGetMidY(bounds);
    
    for(int i = 0; i < CGRectGetMaxX(bounds); ++i) {
        float x = xl + i / mx;
        float f = pow(x, hochzahl);
        float yb = ((yo - f) * my);
        CGContextMoveToPoint(ctx, prevx, prevy);
        CGContextAddLineToPoint(ctx, i, yb);
        CGContextStrokePath(ctx);    
        prevx = i;
        prevy = yb;
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //CGContextSetLineWidth(ctx, 1.0);
    //CGContextSetLineCap(theContext, kCGLineCapRound);
    //CGContextSetRGBStrokeColor(theContext, 0.0, 0.0, 0.0, 1.0);
    CGRect bounds = self.bounds;
    CGPoint xa = CGPointMake(CGRectGetMinX(bounds), CGRectGetMidY(bounds));
    CGPoint xb = CGPointMake(CGRectGetMaxX(bounds), CGRectGetMidY(bounds));
    CGPoint ya = CGPointMake(CGRectGetMidX(bounds), CGRectGetMaxY(bounds));
    CGPoint yb = CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY(bounds));
    
    CGContextSaveGState(ctx);
    CGContextMoveToPoint(ctx, xa.x, xa.y);
    CGContextAddLineToPoint(ctx, xb.x, xb.y);
    CGContextMoveToPoint(ctx, ya.x, ya.y);
    CGContextAddLineToPoint(ctx, yb.x, yb.y);
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
    
    /*int xl = -20;
    int xr = 20;
    int yo = 20;
    int yu = -20;
    
    float mx = CGRectGetMaxX(bounds)/(xr-xl);
    float my = CGRectGetMaxY(bounds)/(yo-yu);
    
    float prevx = xa.x;
    float prevy = xa.y;
    
    for(int i = 0; i < CGRectGetMaxX(bounds); ++i) {
        float x = xl + i / mx;
        float f = x ;
        float yb = ((yo - f) * my);
        CGContextMoveToPoint(ctx, prevx, prevy);
        CGContextAddLineToPoint(ctx, i, yb);
        CGContextStrokePath(ctx);    
        prevx = i;
        prevy = yb;
    }*/    
}

@end
