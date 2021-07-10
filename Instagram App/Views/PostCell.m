//
//  PostCell.m
//  Instagram App
//
//  Created by Ileen Fan on 7/7/21.
//

#import "PostCell.h"
#import "Post.h"
#import <Parse/PFImageView.h>
#import "DateTools.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setPost:(Post *)post {
    _post = post;
    self.postImage.file = post[@"image"];
    self.profilePic.file = post[@"author"][@"profileImage"];
    self.profilePic.layer.cornerRadius = 20;
    
    [self.postImage loadInBackground];
    [self.profilePic loadInBackground];
    self.postCaption.text = post[@"caption"];
    self.postUsername.text = post[@"author"][@"username"];
    
    self.postTimeAgo.text = post.createdAt.timeAgoSinceNow;
    
}

@end


