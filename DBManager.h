//
//  DBManager.h
//  DogCare
//
//  Created by wb27 on 11/19/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabase.h"

@interface DBManager : NSObject

-(id)init;

@property NSArray *docPaths;
@property NSString *documentsDir;
@property NSString *dbPath;


//methods to create database tables

-(void)createDogDetailsTable;

-(void)createVaccinationDetailsTable;

-(void)createAntiparasiticsDetailsTable;

-(void)createMedAdminDetailsTable;

-(void)createVisitsSurgDetailsTable;


//methods to save data in tables

-(void)saveDogDetails:(NSString*)dogName :(NSString*)birthDate :(NSString*)weight :(NSString*)withers :(NSString*)breed :(NSString*)chipCode :(NSString*)sex;

-(void)saveVaccinationDetails:(NSString*)vaccinDate :(NSString*)VaccinNameType :(NSString*)veternarian :(NSString*)reminderDate :(NSString*)notes :(int)dogInfoID;

-(void)saveAntiparasiticsDetails:(NSString*)treatmentName :(NSString*)treatmentType :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes :(int)dogInfoID;

-(void)saveMedAdminDetails:(NSString*)medicationName :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes :(int)dogInfoID;

-(void)saveVisitsSurgDetails:(NSString*)visitDate :(NSString*)veternarian :(NSString*)nextInspectionDate :(NSString*)description :(int)dogInfoID;


//methods to fetch data from tables

-(void)fetchDogDetails:(NSString*)dogName :(NSString*)birthDate :(NSString*)weight :(NSString*)withers :(NSString*)breed :(NSString*)chip :(NSString*)sex :(int)dogInfoID;
//
//-(void)fetchVaccinationDetails:(NSString*)vaccinDate :(NSString*)VaccinNameType :(NSString*)veternarian :(NSString*)reminderDate :(NSString*)notes;
//
//-(void)fetchAntiparasiticsDetails:(NSString*)treatmentName :(NSString*)treatmentType :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes;
//
//-(void)fetchMedAdminDetails:(NSString*)medicationName :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes;
//
//-(void)fetchVisitsSurgDetails:(NSString*)visitDate :(NSString*)veternarian :(NSString*)nextInspectionDate :(NSString*)description;


@end
