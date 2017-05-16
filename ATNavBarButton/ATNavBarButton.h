/*
 Created by Jean-Pierre Fourie
 Copyright (c) 2015-2017 emotality <jp@emotality.com>
 Website: https://www.emotality.com
 GitHub: https://github.com/emotality
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// order must be equal to array in ATNavBarButton.m [L104]
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
