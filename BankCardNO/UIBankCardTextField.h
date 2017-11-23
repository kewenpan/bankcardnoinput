//
//  OraBankCardTextField.h
//  Imora
//
//  Created by blithe.pan on 2017/11/20.
//  Copyright © 2017年 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBankCardTextField : UITextField
@property(nonatomic, strong) NSString* realCardNO;

-(void) resetManual;
@end
