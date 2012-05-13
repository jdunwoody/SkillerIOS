#import <Foundation/Foundation.h>

@protocol ViewableInTable <NSObject>
@required
- (NSString *)dataForTable;
@end
