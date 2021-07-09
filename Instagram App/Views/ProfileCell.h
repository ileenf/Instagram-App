//
//  ProfileCell.h
//  Instagram App
//
//  Created by Ileen Fan on 7/8/21.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Post.h"
#import <Parse/PFImageView.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;

@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
