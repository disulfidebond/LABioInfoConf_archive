//
//  AgendaWebViewController.m
//  LBRN
//
//  Created by John on 2/27/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "AgendaWebViewController.h"

@interface AgendaWebViewController ()
@property (nonatomic) NSURLSession *session;
@end

@implementation AgendaWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDocument:_agendaPDF inView:_pdfWebView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) fetchData
{
    NSString *requestString = @"http://lbrn.lsu.edu/events/bioinformatics-conference/files/agendaLaBioConf.pdf";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    }];
    [dataTask resume];
    
    
}


- (void) loadDocument: (NSString *) agendaPDF inView:(UIWebView *) webView
{
    NSString *requestString = @"https://sites01.lsu.edu/wp/ored/files/2015/02/Agenda_AFocusOnBiotechnology.pdf";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
