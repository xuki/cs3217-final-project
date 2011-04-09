//
//  ShopViewController.h
//  MallExplorer
//
//  Created by bathanh-m on 3/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnoViewController.h"
#import "Shop.h"

@interface ShopViewController : UITabBarController<UINavigationControllerDelegate> {
	Shop* shop;
	Annotation* annotation;
}
@property (retain) Shop* shop;
-(id)initWithShop:(Shop*)aShop;
@end
