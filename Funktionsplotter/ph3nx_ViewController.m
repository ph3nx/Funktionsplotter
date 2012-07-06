//
//  ph3nx_ViewController.m
//  Funktionsplotter
//
//  Created by Pascal Gläser on 05.07.12.
//  Copyright (c) 2012 ph3nx.com. All rights reserved.
//

#import "ph3nx_ViewController.h"
#import "ph3nx_Fenster.h"

@interface ph3nx_ViewController ()

@end

@implementation ph3nx_ViewController
@synthesize hochzahlEingabe;
@synthesize eingabe;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setEingabe:nil];
    [self setHochzahlEingabe:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)go:(id)sender {
    
    if([eingabe.text length] > 0) {
        
        NSString *funktion = eingabe.text;
        NSString *vorFaktor = nil;
        
        // && i <= ([eingabe.text length]
        // || [funktion characterAtIndex:i] == '.'
        
        //NSLog(@"laenge: %i", [eingabe.text length]);
        // && (i < [eingabe.text length]))
        
        //while(isnumber([funktion characterAtIndex:i])) {
        // (isnumber([funktion characterAtIndex:i]) || [funktion characterAtIndex:i] == '.' || [funktion characterAtIndex:i] == ',')
        //unichar 
        NSLog(@"Laenge string: %i", [eingabe.text length]);
        for(int i = 0; i == [eingabe.text length]; ++i) {  
            NSLog(@"for1");
            if (vorFaktor == nil) {
                vorFaktor = [NSString stringWithFormat:@"%c", [funktion characterAtIndex:i]];
                NSLog(@"if");
            }
            else {
                vorFaktor = [NSString stringWithFormat:@"%@%c", vorFaktor, [funktion characterAtIndex:i]];
                NSLog(@"else");
            }
            NSLog(@"for");
        }
        
        /*if (vorFaktor == nil) {
            vorFaktor = @"1";
        }
        else {
            float vFaktor = [vorFaktor floatValue];
        }*/
        float vFaktor = [vorFaktor floatValue];
        NSLog(@"Vorfaktor string: %@", vorFaktor);
        NSLog(@"Vorfaktor float: %.2f", vFaktor);
    }
    
    else {
        NSLog(@"No input");
    }
}

- (IBAction)tastatur:(id)sender {
    [self resignFirstResponder];
}

- (IBAction)ok:(id)sender {
    int hoch = [hochzahlEingabe.text intValue];
    NSLog(@"%@",nice(hoch));
}

@end
