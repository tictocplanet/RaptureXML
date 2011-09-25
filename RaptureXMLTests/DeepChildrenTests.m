//
//  DeepChildrenTests.m
//  RaptureXML
//
//  Created by John Blanco on 9/24/11.
//  Copyright (c) 2011 Rapture In Venice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>
#import "RXMLElement.h"

@interface DeepChildrenTests : SenTestCase {
}

@end



@implementation DeepChildrenTests

- (void)testQuery {
    RXMLElement *rxml = [RXMLElement elementFromXMLFile:@"players.xml"];
    __block NSInteger i = 0;
    
    // count the players
    RXMLElement *players = [rxml child:@"players"];
    NSArray *children = [players children:@"player"];
    
    [rxml iterateElements:children with: ^(RXMLElement *e) {
        i++;
    }];    
    
    STAssertEquals(i, 9, nil);
}

@end
