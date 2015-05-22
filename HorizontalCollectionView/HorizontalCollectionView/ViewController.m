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
    NSDictionary *animalsNamePair;
    NSArray *selectedAnimalsArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedAnimals = [[NSMutableSet alloc]init];
    selectedAnimalsArray = [[NSArray alloc]init];
//    animals = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17", nil];
    animalsNamePair = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"Frog",@"1",
                             @"Horse",@"2",
                             @"Dog",@"3",
                             @"Panda",@"4",
                             @"Hippopotamus",@"5",
                             @"Adult Penguin",@"6",
                             @"Elephant",@"7",
                             @"Squirrel",@"8",
                             @"Baby Penguin",@"9",
                             @"Animal Husbandry",@"10",
                             @"Bird",@"11",
                             @"Camel",@"12",
                             @"Fish",@"13",
                             @"Butterfly",@"14",
                             @"Cat",@"15",
                             @"Flying Bird",@"16",
                             @"White Tiger",@"17", nil];
    
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
    NSString *selectedAnimalTag = [NSString stringWithFormat:@"%ld",cell.tag];
    if (![selectedAnimals containsObject:selectedAnimalTag]) {
        [selectedAnimals addObject:selectedAnimalTag];
        selectedAnimalsArray = [selectedAnimals allObjects];
        ((UIImageView *)([cell viewWithTag:102])).image = [UIImage imageNamed:@"check"];
    }else{
        [selectedAnimals removeObject:selectedAnimalTag];
        selectedAnimalsArray = [selectedAnimals allObjects];
        ((UIImageView *)([cell viewWithTag:102])).image = [UIImage imageNamed:@"add"];
    }
    [self.tblAnimals reloadData];
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
    
    NSString *selectedAnimalTag = [NSString stringWithFormat:@"%ld",cell.tag];
    if ([selectedAnimals containsObject:selectedAnimalTag]) {
        ((UIImageView *)([cell viewWithTag:102])).image = [UIImage imageNamed:@"check"];
    }else{
        ((UIImageView *)([cell viewWithTag:102])).image = [UIImage imageNamed:@"add"];
    }
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

#pragma mark - TableView Delegate Methods


#pragma mark - TableView DataSource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return selectedAnimalsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"animal"];
        NSLog(@"[selectedAnimalsArray objectAtIndex:indexPath.row] : %@",[selectedAnimalsArray objectAtIndex:indexPath.row]);
        ((UILabel *)[cell viewWithTag:201]).text = [animalsNamePair objectForKey:[NSString stringWithFormat:@"%@",[selectedAnimalsArray objectAtIndex:indexPath.row]]];
        ((UIImageView *)([cell viewWithTag:101])).image = [UIImage imageNamed:[selectedAnimalsArray objectAtIndex:indexPath.row]];

    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
