#import "TaskDataController.h"
#import "SkillTree.h"
#import "ViewableInTable.h"

@implementation TaskDataController

@synthesize valueList = _valueList;

- (id)initWithSkillTree: (SkillTree *)skillTree {
    if (self = [super init]) {
        self.valueList = [[NSMutableArray alloc] init];
        [self.valueList addObject:skillTree];
        
        for (Level *level in skillTree.levels) {
            [self.valueList addObject:level];
            for (Task *task in level.tasks) {
                [self.valueList addObject:task];
            }
        }
        NSLog(@"Initialised TaskDataController with %d values", [self.valueList count]);
    }
    NSLog(@"Dumping Task Data controller");
    [skillTree dump];
    return self;
}

- (void)setValueList:(NSMutableArray *)newList {
    if(_valueList != newList) {
        _valueList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList {
    return [self.valueList count];
}

- (id <ViewableInTable>)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.valueList objectAtIndex:theIndex];
}

// curl -X PUT -H "Content-Type:application/json" -H "Accept:application/json" http://localhost:3000/tasks/3/toggle_complete.json -d ''
// curl -X PUT -H "Content-Type:application/json" -H "Accept:application/json" http://glowing-sunset-9969.herokuapp.com/tasks/4/toggle_complete.json -d ''
#define url [NSURL URLWithString: @"http://glowing-sunset-9969.herokuapp.com/tasks/4/toggle_complete.json"] 

- (BOOL) updateStatus:(NSUInteger) theIndex
{
    NSString *jsonstring=@"http://glowing-sunset-9969.herokuapp.com/tasks/4/toggle_complete.json"; 
    NSString *urlString = [NSString stringWithFormat:@"%@",jsonstring];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"PUT"]; 

    NSError *error;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (!returnData) {
        NSLog(@"Error = %@", error);
        return NO;
    }
    
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",returnString);
    BOOL newStatus = [returnString boolValue];
    
    Task *task = (Task *)[self objectInListAtIndex:theIndex];
    task.status = newStatus;
    return YES;
//    [returnString boolValue];
}
    
    //    NSString *method =  @"addProduct"; 
    //    NSMutableData *body = [NSMutableData data];
//    // image file
//    NSData *imageData = UIImageJPEGRepresentation( labelimage, 0.8);
//    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
//    //  parameter method
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"method\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[method dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    //  parameter categoryid
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"category_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[selectedID dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [request setHTTPBody:body];
    // now lets make the connection to the web
    //    NSDictionary *profile = (NSDictionary*)[returnString JSONValue];
//    NSLog(@"profile=%@", profile); 
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [request HTTPBody:[HTTPBody ]
//    
//    [request setHTTPMethod:@"PUT"];
//    (void)setHTTPBody:(NSData *)data
//    (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field
//    Send your request in 2 ways using NSURLConnection:
//    
//Synchronously: (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error
//    
//    NSError* error = nil;
////    NSInteger id = 4;
////    NSString *urlString = [NSString stringWithFormat: @"http://glowing-sunset-9969.herokuapp.com/tasks/%@/toggle_complete.json", id];
////    NSString *urlString = @"http://glowing-sunset-9969.herokuapp.com/tasks/4/toggle_complete.json";
//    
////    NSLog(@"url: %@", urlString);
////    NSURL *url = [NSURL URLWithString:urlString];
//    NSData* data = [NSData dataWithContentsOfURL:url];
////    NSData* data = [NSData initWithContentsOfURL:url];
//    
//    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (!json) {
//        NSLog(@"Error = %@", error);
//        return NO;
//    }
//    
//    return YES;
//}


//#define url [NSURL URLWithString: @"http://glowing-sunset-9969.herokuapp.com/skill_trees/everything.json"] 
//// not in code listing
//- (NSArray *)getJsonFromServer {
//    NSMutableArray *skillTrees = [[NSMutableArray alloc] init];
//    
//    NSError* error;
//    
//    NSData* data = [NSData dataWithContentsOfURL:url];
//    
//    NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (!json) {
//        NSLog(@"Error = %@", error);
//        return skillTrees;
//    }





//NSMutableArray *skillTrees = [[NSMutableArray alloc] init];
//
//NSError* error;
//
//NSData* data = [NSData dataWithContentsOfURL:url];
//
//NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//if (!json) {
//    NSLog(@"Error = %@", error);
//    return skillTrees;
//}
//
//for (id skillTreeJson in json) {



@end