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
    // this array should be exactly the same as the ATNavBarButtonPressed enum in ATNavBarButton.h [L29]
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
