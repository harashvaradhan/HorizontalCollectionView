//
//  ViewController.m
//  HorizontalCollectionView
//
//  Created by GNR solution PVT.LTD on 21/05/15.
//  Copyright (c) 2015 Harshavardhan Edke. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_HEIGHT   self.view.frame.size.height
#define SCREEN_WIDTH    self.view.frame.size.width

@interface ViewController (){
    NSMutableArray *animals;
    NSMutableArray *animals1;
    NSMutableArray *animals2;
    NSMutableArray *animals3;
    NSMutableSet *selectedAnimals;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    animals = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17", nil];
    
    animals1 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    animals2 = [[NSMutableArray alloc]initWithObjects:@"7",@"8",@"9",@"10",@"11",@"12", nil];
    animals3 = [[NSMutableArray alloc]initWithObjects:@"13",@"14",@"15",@"16",@"17", nil];
    animals = [NSMutableArray arrayWithObjects:animals1,animals2,animals3, nil];
    
    //FlowLayout for CollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(90, 90)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collvAnimal.pagingEnabled = YES;
    [self.collvAnimal setCollectionViewLayout:flowLayout];
}


#pragma mark - CollectionView Delegate Methods
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return animals.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"TAG : %ld",(long)cell.tag);
}
#pragma mark - CollectionView DataSource Methods

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if (cell == nil) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"animal" forIndexPath:indexPath];
    }
    ((UIImageView *)([cell viewWithTag:101])).image = [UIImage imageNamed:[[animals objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    
    NSLog(@"[animals[indexPath.section] objectAtIndex:indexPath.row] : %@",[[animals objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]);
    
    cell.tag = [[[animals objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]intValue];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[animals objectAtIndex:section] count];
}

#pragma mark - CollectionView Layout Delegate

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (SCREEN_WIDTH == 320.0) {
//        UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
        return UIEdgeInsetsMake(10, 15, 10, 15);
    }else if (SCREEN_WIDTH == 375.0){
        return UIEdgeInsetsMake(10, 40.5, 10, 35.5);
    }else if (SCREEN_WIDTH == 414.0){
        return UIEdgeInsetsMake(10, 60.5, 10, 50.5);
    }
    return UIEdgeInsetsMake(10, 25, 10, 25);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
