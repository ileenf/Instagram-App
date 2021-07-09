//
//  PostCell.h
//  Instagram App
//
//  Created by Ileen Fan on 7/7/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/PFImageView.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postCaption;
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *postUsername;
@property (weak, nonatomic) IBOutlet UILabel *postTimeAgo;
@property (weak, nonatomic) IBOutlet PFImageView *profilePic;


- (void)setPost:(Post *)post;
@end

NS_ASSUME_NONNULL_END
