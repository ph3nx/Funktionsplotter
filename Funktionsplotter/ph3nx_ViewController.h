//
//  ph3nx_ViewController.h
//  Funktionsplotter
//
//  Created by Pascal Gläser on 05.07.12.
//  Copyright (c) 2012 ph3nx.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ph3nx_ViewController : UIViewController
- (IBAction)go:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *eingabe;
- (IBAction)tastatur:(id)sender;
- (IBAction)ok:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *hochzahlEingabe;

@end
