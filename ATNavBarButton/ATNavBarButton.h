////////
///////  Created by Jean-Pierre Fourie
//////  Copyright © 2016 Apptality. All rights reserved.
/////  http://www.apptality.co
////
///  ATNavBarButton
//

#import <Foundation/Foundation.h>

// order must be equal to array in ATNavBarButton.m [87]
typedef NS_ENUM(NSInteger, ATNavBarButtonPressed) {
    ATNavBarButtonAdd = 0,
    ATNavBarButtonArrowLeft,
    ATNavBarButtonArrowRight,
    ATNavBarButtonBack,
    ATNavBarButtonCancel,
    ATNavBarButtonCloud,
    ATNavBarButtonComment,
    ATNavBarButtonComments,
    ATNavBarButtonDelete,
    ATNavBarButtonDone,
    ATNavBarButtonDownload,
    ATNavBarButtonEdit,
    ATNavBarButtonEllipsisH,
    ATNavBarButtonEllipsisV,
    ATNavBarButtonEmailForward,
    ATNavBarButtonEmailReplyAll,
    ATNavBarButtonEmailReply,
    ATNavBarButtonEmailSend,
    ATNavBarButtonEmail,
    ATNavBarButtonGallery,
    ATNavBarButtonHeart,
    ATNavBarButtonHome,
    ATNavBarButtonInfo,
    ATNavBarButtonLogIn,
    ATNavBarButtonLogOut,
    ATNavBarButtonMapMarker,
    ATNavBarButtonMap,
    ATNavBarButtonMenu,
    ATNavBarButtonNext,
    ATNavBarButtonRefresh,
    ATNavBarButtonSettings,
    ATNavBarButtonStar,
    ATNavBarButtonUserAdd,
    ATNavBarButtonUser,
    ATNavBarButtonUsers
};

static const NSArray *buttonTitles = nil;

@class ATNavBarButton;



@protocol ATNavBarButtonDelegate <NSObject>

@required

- (void)ATNavBarButton:(ATNavBarButton *)barButton didPressBarButton:(ATNavBarButtonPressed)buttonPressed;

@end



@interface ATNavBarButton : UIBarButtonItem

@property (nonatomic, weak) id <ATNavBarButtonDelegate> delegate;

+ (ATNavBarButton *)setBarButton:(ATNavBarButtonPressed)buttonPressed withDelegate:(id<ATNavBarButtonDelegate>)delegate;
+ (ATNavBarButton *)setBarButton:(ATNavBarButtonPressed)buttonPressed withColor:(UIColor *)color withDelegate:(id<ATNavBarButtonDelegate>)delegate;
+ (ATNavBarButton *)setIndicatorButtonWithColor:(UIColor *)color withDelegate:(id<ATNavBarButtonDelegate>)delegate;

@end