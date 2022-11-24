//
// AutoLayoutDemoViewController.m
// DTCoreText
//
// Created by David Whetstone on 5/8/15.
// Copyright (c) 2015 Drobnik.com. All rights reserved.
//

#import "AutoLayoutDemoViewController.h"

@interface AutoLayoutDemoViewController ()

//@property (nonatomic, DT_WEAK_PROPERTY) IBOutlet DTAttributedTextContentView *textView;

@property (nonatomic, strong) UILabel *augusLabel;
@end

@implementation AutoLayoutDemoViewController

- (void)viewDidLoad {

    [super viewDidLoad];
	
	[self.view addSubview:self.augusLabel];

    NSString *html = @"<html><body><b>Lorem ipsum dolor sit amet</b>, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <b>labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea </b>commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</body></html>";
    NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
	
	
	NSDictionary *options = @{
		DTUseiOS6Attributes:@YES, // 这个属性设置为NO就会崩溃 `-[__NSCFType hyphenationFactor]: unrecognized selector sent to instance`
		DTIgnoreInlineStylesOption:@YES,
		DTDefaultLinkDecoration:@NO,
		DTDefaultLinkColor:[UIColor blueColor],
		DTLinkHighlightColorAttribute:[UIColor redColor],
		DTDefaultFontSize:@15,
		DTDefaultFontFamily:@"Helvetica Neue",
		DTDefaultFontName:@"HelveticaNeue-Light"
	};

	self.augusLabel.attributedText = [[NSAttributedString alloc] initWithHTMLData:data options:options documentAttributes:nil];
	
}


- (UILabel *)augusLabel {
	if(!_augusLabel) {
		
		_augusLabel = [[UILabel alloc] init];
		_augusLabel.frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
		_augusLabel.backgroundColor = UIColor.greenColor;
	}
	return _augusLabel;
}

@end
