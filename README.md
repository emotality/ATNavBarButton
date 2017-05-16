# ATNavBarButton 1.1
A sub-class of UIBarButtonItem to insert custom buttons or indicatorView into your navigationBar with one line of code.

## Features

- One line of code
- One method to handle all button actions
- Change to any button when needed
- Custom indicator view and button colors
- Change or add your own images
- 35 Pre-defined FontAwesome icons on all 3 scales

## Examples

**Default Color:**

![ATNavBarButton1](https://www.emotality.com/development/GitHub/ATNavBarButton-1.png)
````objc
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonUser withDelegate:self]];
    [self.navigationItem setRightBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonSettings withDelegate:self]];
}
````

**Custom color:**

![ATNavBarButton2](https://www.emotality.com/development/GitHub/ATNavBarButton-2.png)
````objc
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonMenu withColor:UIColorFromRGB(0x5a4d8c) withDelegate:self]];
    [self.navigationItem setRightBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonRefresh withColor:[UIColor redColor] withDelegate:self]];
}
````

**Indicator view:**

![ATNavBarButton3](https://www.emotality.com/development/GitHub/ATNavBarButton-3.png)
````objc
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonArrowLeft withColor:UIColorFromRGB(0x5a4d8c) withDelegate:self]];
    [self loadIndicatorView:YES];
}

- (void)loadIndicatorView:(BOOL)loading
{
    if (loading) {
        [self.navigationItem setRightBarButtonItem:[ATNavBarButton setIndicatorButtonWithColor:[UIColor orangeColor] withDelegate:self]];
    } else {
        [self.navigationItem setRightBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonRefresh withColor:[UIColor redColor] withDelegate:self]];
        // or [self.navigationItem setRightBarButtonItem:nil]; to remove the indicator or button if you don't have a manual refresh button
    }
}
````

## Delegate

There's only left and right nav buttons, but you can set any button any time. Here is where you handle their actions:
````objc
- (void)ATNavBarButton:(ATNavBarButton *)barButton didPressBarButton:(ATNavBarButtonPressed)buttonPressed
{
    if (buttonPressed == ATNavBarButtonBack) {
        [self.navigationController popViewControllerAnimated:YES];
        
    } else if (buttonPressed == ATNavBarButtonArrowRight) {
        NextViewController *nextController = [NextViewController new];
        [self.navigationController pushViewController:nextController animated:YES];
        
    } else if (buttonPressed == ATNavBarButtonRefresh) {
        [self reloadContent];
        
    } else if (buttonPressed == ATNavBarButtonDownload) {
        [self downloadFile:@"https://www.emotality.com/development/GitHub/ATNavBarButton-1.png"];
    }
}
````

## Installation

**Manual:**

- Copy `ATNavBarButton` folder into your project
- `#import "ATNavBarButton.h"` in the required class
- Add the `<ATNavBarButtonDelegate>` protocol
- Add the delegate method, `ATNavBarButton:didPressBarButton:`, like above

**CocoaPods:**

- Add to podfile: `pod 'ATNavBarButton'`
- `#import "ATNavBarButton.h"` in the required class
- Add the `<ATNavBarButtonDelegate>` protocol
- Add the delegate method, `ATNavBarButton:didPressBarButton:`, like above

## License

ATAppUpdater is released under the MIT license. See [LICENSE](https://github.com/emotality/ATNavBarButton/blob/master/LICENSE.md) for details.
