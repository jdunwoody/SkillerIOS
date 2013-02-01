//
//  ExerciseRowCell.h
//  Skiller
//
//  Created by James on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseRowCell : UITableViewCell

    @property (nonatomic, strong) IBOutlet UILabel *exerciseLabel;
    @property (nonatomic, strong) IBOutlet UIPickerView *exercisePicker;

@end