////////
///////  Created by Jean-Pierre Fourie
//////  Copyright © 2016 Apptality. All rights reserved.
/////  http://www.apptality.co
////
///  ATNavBarButton
//

#import "ATNavBarButton.h"

@implementation ATNavBarButton


#pragma mark - Button Init


- (id)initWithCustomView:(UIView *)customView
{
    self = [super initWithCustomView:customView];
    if (self) {
        if ([customView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)customView;
            [button addTarget:self action:@selector(navBarButtonPressed:) forControlEvents:UIControlEventTouchDown];
        }
    }
    return self;
}


#pragma mark - ATNavBarButton Methods


+ (ATNavBarButton *)setBarButton:(ATNavBarButtonPressed)navButton withDelegate:(id<ATNavBarButtonDelegate>)delegate
{
    UIImage *btnImg = [UIImage imageNamed:[NSString stringWithFormat:@"navButton_%@.png", [self titleForButton:navButton]]];
    
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setFrame:CGRectMake(0, 0, btnImg.size.width, btnImg.size.height)];
    [customButton setImage:btnImg forState:UIControlStateNormal];
	[customButton setTag:navButton];
    
    ATNavBarButton *customBarButton = [[ATNavBarButton alloc] initWithCustomView:customButton];
    [customBarButton setDelegate:delegate];
    
    return customBarButton;
}

+ (ATNavBarButton *)setBarButton:(ATNavBarButtonPressed)navButton withColor:(UIColor *)color withDelegate:(id<ATNavBarButtonDelegate>)delegate
{
    UIImage *btnImg = [UIImage imageNamed:[NSString stringWithFormat:@"navButton_%@.png", [self titleForButton:navButton]]];
    if (color) btnImg = [self colorizeImage:btnImg withColor:color];
    
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setFrame:CGRectMake(0, 0, btnImg.size.width, btnImg.size.height)];
    [customButton setImage:btnImg forState:UIControlStateNormal];
    [customButton setTag:navButton];
    
    ATNavBarButton *customBarButton = [[ATNavBarButton alloc] initWithCustomView:customButton];
    [customBarButton setDelegate:delegate];
    
    return customBarButton;
}

+ (ATNavBarButton *)setIndicatorButtonWithColor:(UIColor *)color withDelegate:(id<ATNavBarButtonDelegate>)delegate
{
	UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[indicator setColor:color];
    [indicator setHidesWhenStopped:YES];
    [indicator startAnimating];
    [activityView addSubview:indicator];
    
    ATNavBarButton *customBarButton = [[ATNavBarButton alloc] initWithCustomView:activityView];
    [customBarButton setDelegate:delegate];
    
    return customBarButton;
}


#pragma mark - Helpers


+ (NSString *)titleForButton:(ATNavBarButtonPressed)navButton
{
    // this array should be exactly the same as the ATNavBarButtonPressed enum in ATNavBarButton.h [12]
    if (!buttonTitles) buttonTitles = @[@"add", @"arrow_left", @"arrow_right", @"back", @"cancel", @"cloud", @"comment", @"comments", @"delete", @"done", @"download", @"edit", @"ellipsis_h", @"ellipsis_v",
                                        @"email_forward", @"email_reply_all", @"email_reply", @"email_send", @"email", @"gallery", @"heart", @"home", @"info", @"log_in", @"log_out",
                                        @"map_marker", @"map", @"menu", @"next", @"refresh", @"settings", @"star", @"user_add", @"user", @"users"];
    return buttonTitles[navButton];
}

+ (UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [[UIScreen mainScreen] scale]);
    [image drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


#pragma mark - ATNavBarButton Delegate


- (void)navBarButtonPressed:(ATNavBarButton *)buttonPressed
{
    if ([self.delegate respondsToSelector:@selector(ATNavBarButton:didPressBarButton:)]) {
        [self.delegate ATNavBarButton:buttonPressed didPressBarButton:buttonPressed.tag];
    }
}

@end
