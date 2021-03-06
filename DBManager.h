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

-(void)createNotesTable;


//methods to save data in tables

-(void)saveDogDetails:(NSString*)dogName :(NSString*)birthDate :(NSString*)weight :(NSString*)withers :(NSString*)breed :(NSString*)chipCode :(NSString*)sex;

-(void)saveVaccinationDetails:(NSString*)vaccinDate :(NSString*)VaccinNameType :(NSString*)veternarian :(NSString*)reminderDate :(NSString*)notes :(int)dogInfoID;

-(void)saveAntiparasiticsDetails:(NSString*)treatmentName :(NSString*)treatmentType :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes :(int)dogInfoID;

-(void)saveMedAdminDetails:(NSString*)medicationName :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes :(int)dogInfoID;

-(void)saveVisitsSurgDetails:(NSString*)visitDate :(NSString*)veternarian :(NSString*)nextInspectionDate :(NSString*)description :(int)dogInfoID;

-(void)saveNotesDetails:(NSString*)notes :(int)dogInfoID;


//methods to fetch data from tables

-(NSMutableArray*)fetchDogsTitles;

-(NSMutableArray*)fetchVaccinationTitles:(int)dogInfoID;

-(NSMutableArray*)fetchAntiprsticsTitles:(int)dogInfoID;

-(NSMutableArray*)fetchMedicineAdminTitles:(int)dogInfoID;

-(NSMutableArray*)fetchVisitsSurgriesDates:(int)dogInfoID;

-(NSMutableArray*)fetchNotesList:(int)dogInfoID;

-(void)fetchDogDetails:(NSString*)dogName;

-(NSMutableArray*)fetchVaccinationDetails:(int)dogInfoID;

-(NSMutableArray*)fetchAntiparasiticsDetails:(int)dogInfoID;

-(NSMutableArray*)fetchMedAdminDetails:(int)dogInfoID;

-(NSMutableArray*)fetchVisitsSurgDetails:(int)dogInfoID;

-(NSMutableArray*)fetchNotesDetails:(int)dogInfoID;

//methods to update data in tables

-(void)updateDogDetails:(NSString*)dogName :(NSString*)birthDate :(NSString*)weight :(NSString*)withers :(NSString*)breed :(NSString*)chip :(NSString*)sex :(int)dogInfoID;

-(void)updateVaccinationDetails:(NSString*)vaccinDate :(NSString*)VaccinNameType :(NSString*)veternarian :(NSString*)reminderDate :(NSString*)notes  :(int)dogInfoID;

-(void)updateAntiparasiticsDetails:(NSString*)treatmentName :(NSString*)treatmentType :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes  :(int)dogInfoID;

-(void)updateMedAdminDetails:(NSString*)medicationName :(NSString*)firstAdminstrtnDate :(NSString*)lastAdminstrtnDate :(NSString*)frequency :(NSString*)dose :(NSString*)veternarian :(NSString*)notes  :(int)dogInfoID;

-(void)updateVisitsSurgDetails:(NSString*)visitDate :(NSString*)veternarian :(NSString*)nextInspectionDate :(NSString*)description :(int)dogInfoID;

-(void)updateNotesDetails:(NSString*)notes :(int)dogInfoID;

//methods to delete data from tables

-(void)removeDogDetails:(int)dogInfoID;

-(void)removeVaccinationDetails:(int)dogInfoID;

-(void)removeAntiparasiticsDetails:(int)dogInfoID;

-(void)removeMedAdminDetails:(int)dogInfoID;

-(void)removeVisitsSurgDetails:(int)dogInfoID;

-(void)removeNotesDetails:(int)dogInfoID;


@end
