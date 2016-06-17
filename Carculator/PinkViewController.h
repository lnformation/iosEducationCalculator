//
//  PinkViewController.h
//  Carculator
//
//  Created by MF839-012 on 2016. 6. 17..
//  Copyright © 2016년 MF839-012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinkViewController : UIViewController{
    void(^changeMainBackColor)(UIColor*);
}
- (IBAction)newFunction:(id)sender;
- (IBAction)close:(id)sender;
- (void)changeColorFunc:(void(^)(UIColor*))myFunc;
@end
