//
//  DBManager.m
//  DogCare
//
//  Created by wb27 on 11/19/15.
//  Copyright (c) 2015 WeaveBytes Infotech. All rights reserved.
//

#import "DBManager.h"


@implementation DBManager

-(id)init{
    
    if (self == [super init]) {
        
        self.docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.documentsDir = [self.docPaths objectAtIndex:0];
        self.dbPath = [self.documentsDir   stringByAppendingPathComponent:@"DogsCareDatabase.sqlite"];
        
    }
    return self;
}


#pragma mark - Methods create database tables -

-(void)createDogDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS DogsData (dog_id INTEGER  PRIMARY KEY DEFAULT NULL, dogName TEXT DEFAULT NULL, birthDate TEXT DEFAULT NULL, weight TEXT DEFAULT NULL, withers TEXT DEFAULT NULL, breed TEXT DEFAULT NULL, chipCode TEXT DEFAULT NULL, sex TEXT DEFAULT NULL)"];
    [database close];
}


-(void)createVaccinationDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS VaccinationData (vaccination_id INTEGER  PRIMARY KEY DEFAULT NULL, vaccinNameType TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, reminderDate TEXT DEFAULT NULL, notes TEXT DEFAULT NULL,FOREIGN KEY (vaccin_dog_id) REFERENCES DogsData (dog_id))"];
    [database close];
}

-(void)createAntiparasiticsDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS AntiParasiticsData (antiparasitics_id INTEGER  PRIMARY KEY DEFAULT NULL, treatmentName TEXT DEFAULT NULL, treatmentType TEXT DEFAULT NULL, firstAdminstrtnDate TEXT DEFAULT NULL, lastAdminstrtnDate TEXT DEFAULT NULL, frequency TEXT DEFAULT NULL, dose TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, notes TEXT DEFAULT NULL,FOREIGN KEY (antipartics_dog_id) REFERENCES DogsData (dog_id))"];
    [database close];
}

-(void)createMedAdminDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS MedicineAdministrtnData (medAdmin_id INTEGER  PRIMARY KEY DEFAULT NULL, medicationName TEXT DEFAULT NULL, firstAdminstrtnDate TEXT DEFAULT NULL, lastAdminstrtnDate TEXT DEFAULT NULL, frequency TEXT DEFAULT NULL, dose TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, notes TEXT DEFAULT NULL,FOREIGN KEY (medAdmin_dog_id) REFERENCES DogsData (dog_id))"];
    [database close];
}

-(void)createVisitsSurgDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"CREATE TABLE IF NOT EXISTS VisitsSurgriesData (visitsSurgrs_id INTEGER  PRIMARY KEY DEFAULT NULL, visitDate TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, nextInspectionDate TEXT DEFAULT NULL, description TEXT DEFAULT NULL,FOREIGN KEY (visitsSurg_dog_id) REFERENCES DogsData (dog_id))"];
    [database close];
}

#pragma mark - Methods save data in database tables -

-(void)saveDogDetails:(NSString *)dogName :(NSString *)birthDate :(NSString *)weight :(NSString *)withers :(NSString *)breed :(NSString *)chipCode :(NSString *)sex
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"INSERT INTO DogsData (dogName,birthDate,weight,withers,breed,chipCode,sex) VALUES (?,?,?,?,?,?,?)", dogName, birthDate, weight, withers, breed, chipCode, sex, nil];
    [database close];
}

-(void)saveVaccinationDetails:(NSString *)vaccinDate :(NSString *)VaccinNameType :(NSString *)veternarian :(NSString *)reminderDate :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"INSERT INTO VaccinationData (vaccinDate,VaccinNameType,veternarian,reminderDate,notes) VALUES (?,?,?,?,?)", vaccinDate, VaccinNameType, veternarian, reminderDate, notes, nil];
    [database close];
}

-(void)saveAntiparasiticsDetails:(NSString *)treatmentName :(NSString *)treatmentType :(NSString *)firstAdminstrtnDate :(NSString *)lastAdminstrtnDate :(NSString *)frequency :(NSString *)dose :(NSString *)veternarian :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"INSERT INTO AntiParasiticsData (treatmentName,treatmentType,firstAdminstrtnDate,lastAdminstrtnDate,frequency,dose,veternarian,notes) VALUES (?,?,?,?,?,?,?,?)", treatmentName, treatmentType, firstAdminstrtnDate, lastAdminstrtnDate, frequency, dose, veternarian, notes, nil];
    [database close];
}

-(void)saveMedAdminDetails:(NSString *)medicationName :(NSString *)firstAdminstrtnDate :(NSString *)lastAdminstrtnDate :(NSString *)frequency :(NSString *)dose :(NSString *)veternarian :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"INSERT INTO MedicineAdministrtnData (medicationName,firstAdminstrtnDate,lastAdminstrtnDate,frequency,dose,veternarian,notes) VALUES (?,?,?,?,?,?,?)", medicationName, firstAdminstrtnDate, lastAdminstrtnDate, frequency, dose, veternarian, notes, nil];
    [database close];
}

-(void)saveVisitsSurgDetails:(NSString *)visitDate :(NSString *)veternarian :(NSString *)nextInspectionDate :(NSString *)description :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    [database executeUpdate:@"INSERT INTO VisitsSurgriesData (visitDate,veternarian,nextInspectionDate,description) VALUES (?,?,?,?)", visitDate, veternarian, nextInspectionDate, description, nil];
    [database close];
}


#pragma mark - Methods fetch data from database tables -

-(void)fetchDogDetails:(NSString*)dogName :(NSString*)birthDate :(NSString*)weight :(NSString*)withers :(NSString*)breed :(NSString*)chip :(NSString*)sex :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM DogsData WHERE dog_id=?",dogInfoID];
    // Or with variables FMResultSet *results = [database executeQuery:@"SELECT * from tableName where fieldName= ?",[NSString stringWithFormat:@"%@", variableName]];
    while([results next]) {
        
        NSLog(@"%@",[results stringForColumn:@"dogName"]);
    }
    [database close];
}







@end
