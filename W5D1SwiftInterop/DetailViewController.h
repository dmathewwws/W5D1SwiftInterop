//
//  DetailViewController.h
//  W4D3 - Networking
//
//  Created by Daniel Mathews on 2015-07-22.
//  Copyright (c) 2015 Daniel Mathews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

