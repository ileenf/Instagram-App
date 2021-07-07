//
//  PostCell.h
//  Instagram App
//
//  Created by Ileen Fan on 7/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postCaption;
@property (weak, nonatomic) IBOutlet UILabel *postUsername;

@end

NS_ASSUME_NONNULL_END
