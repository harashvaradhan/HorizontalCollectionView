//
//  ViewController.h
//  HorizontalCollectionView
//
//  Created by GNR solution PVT.LTD on 21/05/15.
//  Copyright (c) 2015 Harshavardhan Edke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collvAnimal;
@property (weak, nonatomic) IBOutlet UITableView *tblAnimals;

@end

