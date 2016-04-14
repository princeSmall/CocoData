//
//  ViewController.m
//  simpleCocoData
//
//  Created by tongle on 16/4/14.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myDelegate = [[UIApplication sharedApplication]delegate];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard:)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)hideKeyboard:(id)sender
{
    [self.textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//添加数据
- (IBAction)addData:(id)sender {
    Data * data = (Data *)[NSEntityDescription insertNewObjectForEntityForName:@"Data" inManagedObjectContext:self.myDelegate.managedObjectContext];
    data.title = self.textField.text;
    //NSLog(@"---%@,---%@",data.title,self.textField.text);
    NSError * error = nil;
    BOOL isSaveSuccess = [self.myDelegate.managedObjectContext save:&error];
    if (isSaveSuccess &&error ==nil) {
        NSLog(@"save Success");
    }else{
        NSLog(@"%@",error);
    }
     //从托管对象上下文中获取BookData名对应的Entity对象
  }
//查看数据
- (IBAction)queryData:(id)sender {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Data" inManagedObjectContext:self.myDelegate.managedObjectContext];
    [request setEntity:entityDescription]; // 设置请求对象为名为Data的Entity
    
    // 对搜索结果进行排序
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc] initWithObjects:sort, nil];
    [request setSortDescriptors:sortDescriptions];
    
    NSError *error = nil;
    // 获取Fetch请求得到的结果，是一个数组
    NSArray *fetchResults = [self.myDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (fetchResults) {
        // 输出数组中各个元素的title
        for (Data *data in fetchResults) {
            NSLog(@"title:%@", data.title);
        }
    }
    else {
        NSLog(@"%@", error);
    }
   
   }

- (IBAction)deleteData:(id)sender {
    NSPersistentStore *store = [self.myDelegate.persistentStoreCoordinator.persistentStores lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    [self.myDelegate.persistentStoreCoordinator removePersistentStore:store error:&error];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    
    NSLog(@"Delete succeed");
    
    //Make new persistent store for future saves   (Taken From Above Answer)
    if (![self.myDelegate.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // do something with the error
        NSLog(@"Delete error");
    }
}
@end
