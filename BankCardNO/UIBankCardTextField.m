//
//  OraBankCardTextField.m
//  Imora
//
//  Created by blithe.pan on 2017/11/20.
//  Copyright © 2017年 All rights reserved.
//

#import "UIBankCardTextField.h"
#import "UITextField+ExtentRange.h"

@interface UIBankCardTextField()
@property(nonatomic,strong) NSString* lastValue;
@end

@implementation UIBankCardTextField
-(instancetype)init {
    self=[super init];
    if (self) {
        [self setInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setInit];
    }
    
    return self;
}

-(void) setInit{
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.lastValue = @"";
    [self addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}


- (void)textFieldChanged:(UITextField *)textField{
    if (![self isCardRegular:self.text]) {
        NSRange range = [self selectedRange];
        NSLog(@"%@",NSStringFromRange(range));
        self.text = [self processCameralCardNO:self.text];
        if (self.text.length>self.lastValue.length && range.location%5==0) {
            range.location++;
        }
        [self setSelectedRange:range];
        
    }
    self.lastValue = self.text;
    self.realCardNO = [self.text stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (BOOL) isCardRegular:(NSString*)cardno{
    if (cardno) {
        for (int i=0; i<cardno.length; i++) {
            unichar c = [cardno characterAtIndex:i];
            if ((i%5)==4) {
                if (c!=' ') {
                    return NO;
                }
            }else{
                if (c<'0' || c>'9') {
                    return NO;
                }
            }
        }
    }
    return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    [super canPerformAction:action withSender:sender];
    return NO;
}


- (NSString*)processCameralCardNO:(NSString*)cardNO{
    cardNO = [cardNO stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!cardNO) {
        return @"";
    }
    
    NSMutableString* str = [NSMutableString new];
    if (cardNO.length<=4) {
        [str appendString:cardNO];
        return str;
    }
    [str appendFormat:@"%@", [cardNO substringWithRange:NSMakeRange(0, 4)]];
    int i=4;
    while (i<cardNO.length) {
        NSInteger len = MIN(4,cardNO.length-i);
        [str appendFormat:@" %@", [cardNO substringWithRange:NSMakeRange(i, len)]];
        i += len;
    }
    return str;
}


-(void) resetManual{
    self.lastValue = @"";
    self.realCardNO = @"";
    self.text = @"";
    [self becomeFirstResponder];
}
@end
