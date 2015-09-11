//
//  HoneViewController.m
//  Html_Hpple
//
//  Created by wangan on 13-4-12.
//  Copyright (c) 2013年 com.wangan. All rights reserved.
//

#import "HomeViewController.h"
#import "TFHpple.h"
#import "ExpatiationViewController.h"
#import "RTLabel.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title=@"我要跳槽";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSString *imageStr= @"<p> 各公司、各部门：</p><p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为推进考勤系统制度改革，集团计划上新打卡系统&ldquo;秒通APP&rdquo;，员工可通过登录该APP完成每日考勤打卡动作，目前该软件为试用阶段，仅支持Android手机使用，IOS手机正在开发中，具体安排如下：</p><ol> <li>  部分人员参与试用，名单详请见公司内部官网通知附件。</li> <li>  试用人员用个人工号登录，密码为个人身份证后六位。</li> <li>  在公司WIFI覆盖范围内，点击下方图标即可实现考勤打卡。</li></ol><p style='text-align: center; margin-left:80px;'> <img alt='WIFI打卡图片' src='http://mutone.fangte.com/upload/images/20150824165527932.png' style='width: 400px; height: 105px;' /></p><ol> <li value='4'>  指纹打卡系统与该系统并行运作，无法使用&ldquo;秒通APP&rdquo;人员请继续使用指纹考勤打卡。</li> <li value='5'>  信息技术中心负责系统管理和维护，咨询电话8910。</li> <li value='6'>  扫描二维码下载&ldquo;秒通App&rdquo;。（微信对其他app下载进行了限制，所以微信扫一扫不支持下载；可使用其他app扫一扫功能进行下载如QQ扫一扫）。</li></ol><p style='margin-left: 40px;'> <img alt='下载APP二维码' src='http://mutone.fangte.com/upload/images/20150824165729679.png' style='width: 286px; height: 288px;' /></p>";
//    
//    RTLabel *label = [[RTLabel alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:label];
//    [label setText:imageStr];
    
//     NSString *imageStr= [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.cnblogs.com/pchmonster/p/4791030.html"] encoding:NSUTF8StringEncoding error:nil];
//    
//    UIWebView *view = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:view];
//   // view.scalesPageToFit = YES;
//   // [view loadHTMLString:imageStr baseURL:nil];
//    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"file:///Users/cc/Desktop/index.html"]]];
    
    
    NSString *imageStr= @"<p> 各公司、各部门：</p><p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为推进考勤系统制度改革，集团计划上新打卡系统&ldquo;秒通APP&rdquo;，员工可通过登录该APP完成每日考勤打卡动作，目前该软件为试用阶段，仅支持Android手机使用，IOS手机正在开发中，具体安排如下：</p><ol> <li>  部分人员参与试用，名单详请见公司内部官网通知附件。</li> <li>  试用人员用个人工号登录，密码为个人身份证后六位。</li> <li>  在公司WIFI覆盖范围内，点击下方图标即可实现考勤打卡。</li></ol><p style='text-align: center; margin-left:80px;'> <img alt='WIFI打卡图片' src='http://mutone.fangte.com/upload/images/20150824165527932.png' style='width: 400px; height: 105px;' /></p><ol> <li value='4'>  指纹打卡系统与该系统并行运作，无法使用&ldquo;秒通APP&rdquo;人员请继续使用指纹考勤打卡。</li> <li value='5'>  信息技术中心负责系统管理和维护，咨询电话8910。</li> <li value='6'>  扫描二维码下载&ldquo;秒通App&rdquo;。（微信对其他app下载进行了限制，所以微信扫一扫不支持下载；可使用其他app扫一扫功能进行下载如QQ扫一扫）。</li></ol><p style='margin-left: 40px;'> <img alt='下载APP二维码' src='http://mutone.fangte.com/upload/images/20150824165729679.png' style='width: 286px; height: 288px;' /></p>";//[NSString stringWithContentsOfURL:[NSURL URLWithString:htmlString] encoding:NSUTF8StringEncoding error:nil];
    
    NSRange rang1=[imageStr rangeOfString:@"ftq"];//
    NSMutableString *imageStr2=[[NSMutableString alloc]initWithString:[imageStr substringFromIndex:rang1.location+rang1.length]];
    
    NSRange rang2=[imageStr2 rangeOfString:@"qft"];//
    NSMutableString *imageStr3=[[NSMutableString alloc]initWithString:[imageStr2 substringToIndex:rang2.location]];
    
    //NSLog(@"%@",imageStr3);
    
    NSData *dataTitle=[imageStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    TFHpple *xpathParser=[[TFHpple alloc]initWithHTMLData:dataTitle];
    
    NSArray *elements=[xpathParser searchWithXPathQuery:@"//img"];
    NSArray *elements2 = [xpathParser searchWithXPathQuery:@"//p"];
    
    //NSArray *arrat = [xpathParser searchWithXPathQuery:@"//width"];
    NSMutableArray *arrmub =  [NSMutableArray array];
    
    
    _imageArray=[[NSMutableArray alloc]init];
    
    
    for (TFHppleElement *element in elements) {
        
        NSDictionary *elementContent =[element attributes];
        
        // NSLog(@"%@",[elementContent objectForKey:@"src"]);
        
        [_imageArray addObject:[elementContent objectForKey:@"src"]];
        
        NSString *str = [elementContent objectForKey:@"margin-left"];
    }
    
   // return _imageArray;
    
    
    
    
    
    
    //[self initData];
    /*[self AnalyticalCont:@"http://www.lomowo.com/posts/47632"];
    [self AnalyticalImage:@"http://www.lomowo.com/posts/47632"];
    [self AnalyticalTitle:@"http://www.lomowo.com/posts/47632"];*/

    
    _array=[[NSArray alloc]init];
    _array=@[@"http://www.lomowo.com/posts/47689",
             @"http://www.lomowo.com/posts/47632",
             @"http://www.lomowo.com/posts/47605",
             @"http://www.lomowo.com/posts/47682",
             @"http://www.lomowo.com/posts/47688",
             @"http://www.lomowo.com/posts/47732",
             @"http://www.lomowo.com/posts/64"
            /*@ @"http://www.lomowo.com/posts/333",
             @"http://www.lomowo.com/posts/318",
             "http://www.lomowo.com/posts/17541",
             @"http://www.lomowo.com/posts/17699",
             @"http://www.lomowo.com/posts/40377",
             @"http://www.lomowo.com/posts/17735",
             @"http://www.lomowo.com/posts/17710",
             @"http://www.lomowo.com/posts/17690",
             @"http://www.lomowo.com/posts/17688"
             "",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @""*/];
    
    
}

#pragma 初始数据
-(void)initData{
    
    
}


#pragma  title
-(NSArray *)AnalyticalTitle:(NSString *)urlString{
    
    //self.titleArray=[[NSMutableArray alloc]initWithCoder:0];
    
    NSString *title=[NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding/*CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)*/error:nil];
    
    //NSLog(@"title%@",title);
    
    NSRange range=[title rangeOfString:@"<title>"];
    
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    
    //NSLog(@"%@",needTidyString);
    
    NSRange rang2=[needTidyString rangeOfString:@"- 微秀"];
    
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
    //NSLog(@"%@",html2);
    
    _titleArray=[[NSMutableArray alloc]init];
    
    [_titleArray addObject:html2];

    return _titleArray;
    
    
}

#pragma image
-(NSMutableArray *)AnalyticalImage:(NSString *)htmlString;{

    NSString *imageStr= [NSString stringWithContentsOfURL:[NSURL URLWithString:htmlString] encoding:NSUTF8StringEncoding error:nil];
    
    NSRange rang1=[imageStr rangeOfString:@"<div class=\"content\">"];//
    NSMutableString *imageStr2=[[NSMutableString alloc]initWithString:[imageStr substringFromIndex:rang1.location+rang1.length]];
    
    NSRange rang2=[imageStr2 rangeOfString:@"<div class=\"clear\">"];//
    NSMutableString *imageStr3=[[NSMutableString alloc]initWithString:[imageStr2 substringToIndex:rang2.location]];
    
    //NSLog(@"%@",imageStr3);
    
    NSData *dataTitle=[imageStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    TFHpple *xpathParser=[[TFHpple alloc]initWithHTMLData:dataTitle];
    
    NSArray *elements=[xpathParser searchWithXPathQuery:@"//img"];
    
    
    _imageArray=[[NSMutableArray alloc]init];
    
    
    for (TFHppleElement *element in elements) {
        
        NSDictionary *elementContent =[element attributes];
        
       // NSLog(@"%@",[elementContent objectForKey:@"src"]);
        
        [_imageArray addObject:[elementContent objectForKey:@"src"]];
    }
    
    return _imageArray;
    
}

#pragma cont
-(NSMutableArray *)AnalyticalCont:(NSString *)htmlString{
    
    NSString *imageStr=[NSString stringWithContentsOfURL:[NSURL URLWithString:htmlString] encoding:NSUTF8StringEncoding error:nil];
    
    NSRange rang1=[imageStr rangeOfString:@"<p>"];
    NSMutableString *imageStr2=[[NSMutableString alloc]initWithString:[imageStr substringFromIndex:rang1.location]];
    
    NSRange rang2=[imageStr2 rangeOfString:@"<div class=\"clear\"></div>"];
    NSMutableString *imageStr3=[[NSMutableString alloc]initWithString:[imageStr2 substringToIndex:rang2.location]];
    
    //NSLog(@"%@",imageStr3);
    
    NSData *htmlData=[imageStr3 dataUsingEncoding:/*CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)*/NSUTF8StringEncoding];
    
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *elements  = [xpathParser searchWithXPathQuery:@"//p"];
    
    //NSLog(@"%@",elements);
    
    _contArray=[[NSMutableArray alloc]init];
    
    for (TFHppleElement *element in elements) {
            
           if ([element content]!=nil) {
                
               // NSLog(@"%@",[element content]);
               
               [_contArray addObject:[element content]];
                
           }
        
    }
    
    return _contArray;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return[_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (_imageArray ==nil) {
        
        
        [self AnalyticalImage:[_array objectAtIndex:indexPath.row]];
        [self AnalyticalTitle:[_array objectAtIndex:indexPath.row]];
        
    }else{
        
        [_imageArray removeAllObjects];
        [_titleArray removeAllObjects];
        
        [self AnalyticalImage:[_array objectAtIndex:indexPath.row]];
        [self AnalyticalTitle:[_array objectAtIndex:indexPath.row]];
    }

    
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 100.0f, 45.0f)];
    
        
        imageView.image=[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[_imageArray objectAtIndex:0]]]];
        
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(130.0f, 5.0f, 180.0f, 40.0f)];
        lab.numberOfLines=0;
        lab.text=[_titleArray objectAtIndex:0];
        [lab setTextColor:[UIColor purpleColor]];
        
        
        [cell.contentView addSubview:imageView];
        [cell.contentView addSubview:lab];
      
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    return 60;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ExpatiationViewController  *detailViewController = [[ExpatiationViewController alloc] init];
    
    
    [self.navigationController pushViewController:detailViewController animated:YES];

     
}

@end
