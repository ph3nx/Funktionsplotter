//
//  ph3nx_ViewController.m
//  Funktionsplotter
//
//  Created by Pascal Gläser on 05.07.12.
//  Copyright (c) 2012 ph3nx.com. All rights reserved.
//

#import "ph3nx_ViewController.h"

@interface ph3nx_ViewController ()

@end

@implementation ph3nx_ViewController
@synthesize eingabe;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setEingabe:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)go:(id)sender {
    
    if([eingabe.text length] > 0) {
        
        NSString *funktion = eingabe.text;
        int i = 0;
        NSString *vorFaktor = nil;
        
        while(([funktion characterAtIndex:i] >= '0' && [funktion characterAtIndex:i] <= '9') || ([funktion characterAtIndex:i]) == '.') {
            
            if (vorFaktor == nil) {
                vorFaktor = [NSString stringWithFormat:@"%C", [funktion characterAtIndex:i]];
            }
            else {
                vorFaktor = [NSString stringWithFormat:@"%@%C", vorFaktor, [funktion characterAtIndex:i]];
            }
            ++i;
        }
        
        if (vorFaktor == nil) {
            vorFaktor = @"1";
        }
        NSLog(@"Vorfaktor enthält: %@", vorFaktor);
    }
    
    else {
        NSLog(@"No input");
    }
}

- (IBAction)tastatur:(id)sender {
    [eingabe resignFirstResponder];
}

@end
