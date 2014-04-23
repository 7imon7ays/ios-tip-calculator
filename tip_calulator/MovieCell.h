//
//  MovieCell.h
//  tip_calulator
//
//  Created by Simon Chaffetz on 4/22/14.
//
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@end
