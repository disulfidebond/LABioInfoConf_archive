//
//  AgendaWebViewController.h
//  LBRN
//
//  Created by John on 2/27/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgendaWebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *pdfWebView;

@property (nonatomic) NSString *agendaPDF;

@end
