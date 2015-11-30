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
    BOOL isCreated = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS DogsData (dog_id INTEGER  PRIMARY KEY DEFAULT NULL, dogName TEXT DEFAULT NULL, birthDate TEXT DEFAULT NULL, weight TEXT DEFAULT NULL, withers TEXT DEFAULT NULL, breed TEXT DEFAULT NULL, chipCode TEXT DEFAULT NULL, sex TEXT DEFAULT NULL)"];
    [database close];
    
    if(isCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Failed to created table");
    }
}


-(void)createVaccinationDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isCreated = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS VaccinationData (vaccination_id INTEGER  PRIMARY KEY DEFAULT NULL, vaccinDate TEXT DEFAULT NULL, vaccinNameType TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, reminderDate TEXT DEFAULT NULL, notes TEXT DEFAULT NULL, vaccin_frgn_id INTEGER DEFAULT NULL, FOREIGN KEY(vaccin_frgn_id) REFERENCES DogsData (dog_id))"];
    [database close];
    
    if(isCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Failed to created table");
    }
}

-(void)createAntiparasiticsDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isCreated = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS AntiParasiticsData (antiparasitics_id INTEGER  PRIMARY KEY DEFAULT NULL, treatmentName TEXT DEFAULT NULL, treatmentType TEXT DEFAULT NULL, firstAdminstrtnDate TEXT DEFAULT NULL, lastAdminstrtnDate TEXT DEFAULT NULL, frequency TEXT DEFAULT NULL, dose TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, notes TEXT DEFAULT NULL, antptic_frgn_id INTEGER DEFAULT NULL, FOREIGN KEY (antptic_frgn_id) REFERENCES DogsData (dog_id))"];
    [database close];
    
    if(isCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Failed to created table");
    }
}

-(void)createMedAdminDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isCreated = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS MedicineAdministrtnData (medAdmin_id INTEGER  PRIMARY KEY DEFAULT NULL, medicationName TEXT DEFAULT NULL, firstAdminstrtnDate TEXT DEFAULT NULL, lastAdminstrtnDate TEXT DEFAULT NULL, frequency TEXT DEFAULT NULL, dose TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, notes TEXT DEFAULT NULL, medAdmstrtn_frgn_id INTEGER DEFAULT NULL, FOREIGN KEY (medAdmstrtn_frgn_id) REFERENCES DogsData (dog_id))"];
    [database close];
    
    if(isCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Failed to created table");
    }
}

-(void)createVisitsSurgDetailsTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isCreated = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS VisitsSurgriesData (visitsSurgrs_id INTEGER  PRIMARY KEY DEFAULT NULL, visitDate TEXT DEFAULT NULL, veternarian TEXT DEFAULT NULL, nextInspectionDate TEXT DEFAULT NULL, description TEXT DEFAULT NULL, visitSurgrs_frgn_id INTEGER DEFAULT NULL, FOREIGN KEY (visitSurgrs_frgn_id) REFERENCES DogsData (dog_id))"];
    [database close];
    
    if(isCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Failed to created table");
    }
}


-(void)createNotesTable
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isCreated = [database executeUpdate:@"CREATE TABLE IF NOT EXISTS NotesDescriptnData (notes_id INTEGER  PRIMARY KEY DEFAULT NULL, noteDescrptn TEXT DEFAULT NULL, notes_frgn_id INTEGER DEFAULT NULL, FOREIGN KEY (notes_frgn_id) REFERENCES DogsData (dog_id))"];
    [database close];
    
    if(isCreated)
    {
        NSLog(@"Table created successfully");
    }
    else
    {
        NSLog(@"Failed to created table");
    }
}


#pragma mark - Methods save data in database tables -

-(void)saveDogDetails:(NSString *)dogName :(NSString *)birthDate :(NSString *)weight :(NSString *)withers :(NSString *)breed :(NSString *)chipCode :(NSString *)sex
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isInserted = [database executeUpdate:@"INSERT INTO DogsData (dogName,birthDate,weight,withers,breed,chipCode,sex) VALUES (?,?,?,?,?,?,?)", dogName, birthDate, weight, withers, breed, chipCode, sex, nil];
    [database close];
    
    if(isInserted)
    {
        NSLog(@"Inserted Successfully");
    }
    else
    {
        NSLog(@"Error occured while inserting");
    }
    
}

-(void)saveVaccinationDetails:(NSString *)vaccinDate :(NSString *)VaccinNameType :(NSString *)veternarian :(NSString *)reminderDate :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isInserted = [database executeUpdate:@"INSERT INTO VaccinationData (vaccinDate,VaccinNameType,veternarian,reminderDate,notes,vaccin_frgn_id) VALUES (?,?,?,?,?,?)", vaccinDate, VaccinNameType, veternarian, reminderDate, notes, [NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isInserted)
    {
        NSLog(@"Inserted Successfully");
    }
    else
    {
        NSLog(@"Error occured while inserting");
    }
}

-(void)saveAntiparasiticsDetails:(NSString *)treatmentName :(NSString *)treatmentType :(NSString *)firstAdminstrtnDate :(NSString *)lastAdminstrtnDate :(NSString *)frequency :(NSString *)dose :(NSString *)veternarian :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isInserted = [database executeUpdate:@"INSERT INTO AntiParasiticsData (treatmentName,treatmentType,firstAdminstrtnDate,lastAdminstrtnDate,frequency,dose,veternarian,notes,antptic_frgn_id) VALUES (?,?,?,?,?,?,?,?,?)", treatmentName, treatmentType, firstAdminstrtnDate, lastAdminstrtnDate, frequency, dose, veternarian, notes, [NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isInserted)
    {
        NSLog(@"Inserted Successfully");
    }
    else
    {
        NSLog(@"Error occured while inserting");
    }
}

-(void)saveMedAdminDetails:(NSString *)medicationName :(NSString *)firstAdminstrtnDate :(NSString *)lastAdminstrtnDate :(NSString *)frequency :(NSString *)dose :(NSString *)veternarian :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isInserted = [database executeUpdate:@"INSERT INTO MedicineAdministrtnData (medicationName,firstAdminstrtnDate,lastAdminstrtnDate,frequency,dose,veternarian,notes,medAdmstrtn_frgn_id) VALUES (?,?,?,?,?,?,?,?)", medicationName, firstAdminstrtnDate, lastAdminstrtnDate, frequency, dose, veternarian, notes, [NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isInserted)
    {
        NSLog(@"Inserted Successfully");
    }
    else
    {
        NSLog(@"Error occured while inserting");
    }
}

-(void)saveVisitsSurgDetails:(NSString *)visitDate :(NSString *)veternarian :(NSString *)nextInspectionDate :(NSString *)description :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isInserted = [database executeUpdate:@"INSERT INTO VisitsSurgriesData (visitDate,veternarian,nextInspectionDate,description,visitSurgrs_frgn_id) VALUES (?,?,?,?,?)", visitDate, veternarian, nextInspectionDate, description, [NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isInserted)
    {
        NSLog(@"Inserted Successfully");
    }
    else
    {
        NSLog(@"Error occured while inserting");
    }
}


-(void)saveNotesDetails:(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isInserted = [database executeUpdate:@"INSERT INTO NotesDescriptnData (noteDescrptn,notes_frgn_id) VALUES (?,?)", notes, [NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isInserted)
    {
        NSLog(@"Inserted Successfully");
    }
    else
    {
        NSLog(@"Error occured while inserting");
    }
}


#pragma mark - Methods fetch data from database tables -

-(NSMutableArray*)fetchDogsTitles
{
    NSMutableArray *dogsTitles = [[NSMutableArray alloc]init];
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT dogName FROM DogsData"];
    
    while([results next]) {
        
       [dogsTitles addObject:[results stringForColumn:@"dogName"]];
        
    }
    [database close];
    
    
    return dogsTitles;
}


-(void)fetchDogDetails:(NSString*)dogName
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM DogsData WHERE dogName=?",dogName];
    
    while([results next]) {
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setInteger:[results intForColumn:@"dog_id"] forKey:@"dogInfoId"];
        [defaults setObject:[results stringForColumn:@"dogName"] forKey:@"dogTitle"];
        [defaults setObject:[results stringForColumn:@"birthDate"] forKey:@"dogDOB"];
        [defaults setObject:[results stringForColumn:@"weight"] forKey:@"dogWeight"];
        [defaults setObject:[results stringForColumn:@"withers"] forKey:@"dogWither"];
        [defaults setObject:[results stringForColumn:@"chipCode"] forKey:@"dogChipCode"];
        [defaults setObject:[results stringForColumn:@"breed"] forKey:@"dogBreed"];
        [defaults setObject:[results stringForColumn:@"sex"] forKey:@"dogGender"];

    }
    
    [database close];
    
}

-(NSMutableArray*)fetchVaccinationTitles:(int)dogInfoID
{
    NSMutableArray *vaccinTitles = [[NSMutableArray alloc]init];
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT VaccinNameType FROM VaccinationData WHERE vaccin_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        [vaccinTitles addObject:[results stringForColumn:@"VaccinNameType"]];
        
    }
    [database close];
    
    return vaccinTitles;
}

-(NSMutableArray*)fetchVaccinationDetails:(int)dogInfoID
{
    NSMutableArray *resltsAry = [[NSMutableArray alloc]init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM VaccinationData WHERE vaccin_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        [resultArray addObject:[results stringForColumn:@"vaccination_id"]];
        [resultArray addObject:[results stringForColumn:@"vaccinDate"]];
        [resultArray addObject:[results stringForColumn:@"VaccinNameType"]];
        [resultArray addObject:[results stringForColumn:@"veternarian"]];
        [resultArray addObject:[results stringForColumn:@"reminderDate"]];
        [resultArray addObject:[results stringForColumn:@"notes"]];
        
        NSLog(@"%@", resultArray);
        
        [resltsAry addObject:resultArray];
        
        
    }
    
    [database close];
    
    return resltsAry;
}

-(NSMutableArray*)fetchAntiprsticsTitles:(int)dogInfoID
{
    NSMutableArray *antiprsticTitles = [[NSMutableArray alloc]init];
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT treatmentName FROM AntiParasiticsData WHERE antptic_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        [antiprsticTitles addObject:[results stringForColumn:@"treatmentName"]];
        
    }
    [database close];
    
    return antiprsticTitles;
}

-(NSMutableArray*)fetchAntiparasiticsDetails:(int)dogInfoID
{
    NSMutableArray *allResltsAry = [[NSMutableArray alloc]init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM AntiParasiticsData WHERE antptic_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        [resultArray addObject:[results stringForColumn:@"antiparasitics_id"]];
        [resultArray addObject:[results stringForColumn:@"treatmentName"]];
        [resultArray addObject:[results stringForColumn:@"treatmentType"]];
        [resultArray addObject:[results stringForColumn:@"firstAdminstrtnDate"]];
        [resultArray addObject:[results stringForColumn:@"lastAdminstrtnDate"]];
        [resultArray addObject:[results stringForColumn:@"frequency"]];
        [resultArray addObject:[results stringForColumn:@"dose"]];
        [resultArray addObject:[results stringForColumn:@"veternarian"]];
        [resultArray addObject:[results stringForColumn:@"notes"]];
        
        NSLog(@"%@", resultArray);
        
        [allResltsAry addObject:resultArray];
    }
    [database close];
    
    return allResltsAry;
    
}

-(NSMutableArray*)fetchMedicineAdminTitles:(int)dogInfoID
{
    NSMutableArray *medAdmnrtnTitles = [[NSMutableArray alloc]init];
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT medicationName FROM MedicineAdministrtnData WHERE medAdmstrtn_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        [medAdmnrtnTitles addObject:[results stringForColumn:@"medicationName"]];
        
    }
    [database close];
    
    return medAdmnrtnTitles;
}

-(NSMutableArray*)fetchMedAdminDetails:(int)dogInfoID
{
    NSMutableArray *allResltsAry = [[NSMutableArray alloc]init];
    
    
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM MedicineAdministrtnData WHERE medAdmstrtn_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        
        [resultArray addObject:[results stringForColumn:@"medAdmin_id"]];
        [resultArray addObject:[results stringForColumn:@"medicationName"]];
        [resultArray addObject:[results stringForColumn:@"firstAdminstrtnDate"]];
        [resultArray addObject:[results stringForColumn:@"lastAdminstrtnDate"]];
        [resultArray addObject:[results stringForColumn:@"frequency"]];
        [resultArray addObject:[results stringForColumn:@"dose"]];
        [resultArray addObject:[results stringForColumn:@"veternarian"]];
        [resultArray addObject:[results stringForColumn:@"notes"]];
        
        NSLog(@"%@", resultArray);
        
        [allResltsAry addObject:resultArray];
    }
    [database close];
    
    return allResltsAry;
    
}

-(NSMutableArray*)fetchVisitsSurgriesDates:(int)dogInfoID
{
    NSMutableArray *visitDates = [[NSMutableArray alloc]init];
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT visitDate FROM VisitsSurgriesData WHERE visitSurgrs_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        [visitDates addObject:[results stringForColumn:@"visitDate"]];
        
    }
    [database close];
    
    return visitDates;
}

-(NSMutableArray*)fetchVisitsSurgDetails:(int)dogInfoID
{
    NSMutableArray *allResltsAry = [[NSMutableArray alloc]init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM VisitsSurgriesData WHERE visitSurgrs_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        [resultArray addObject:[results stringForColumn:@"visitsSurgrs_id"]];
        [resultArray addObject:[results stringForColumn:@"visitDate"]];
        [resultArray addObject:[results stringForColumn:@"veternarian"]];
        [resultArray addObject:[results stringForColumn:@"nextInspectionDate"]];
        [resultArray addObject:[results stringForColumn:@"description"]];
        
        NSLog(@"%@", resultArray);
        
        [allResltsAry addObject:resultArray];
    }
    
    [database close];
    
    return allResltsAry;
    
}


-(NSMutableArray*)fetchNotesList:(int)dogInfoID
{
    NSMutableArray *notesList = [[NSMutableArray alloc]init];
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT noteDescrptn FROM NotesDescriptnData WHERE notes_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        [notesList addObject:[results stringForColumn:@"noteDescrptn"]];
        
    }
    [database close];
    
    return notesList;
}


-(NSMutableArray*)fetchNotesDetails:(int)dogInfoID
{
    NSMutableArray *allResltsAry = [[NSMutableArray alloc]init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    FMResultSet *results = [database executeQuery:@"SELECT * FROM NotesDescriptnData WHERE notes_frgn_id=?", [NSNumber numberWithInt:dogInfoID]];
    
    while([results next]) {
        
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        [resultArray addObject:[results stringForColumn:@"notes_id"]];
        [resultArray addObject:[results stringForColumn:@"noteDescrptn"]];
        
        NSLog(@"%@", resultArray);
        
        [allResltsAry addObject:resultArray];
    }
    
    [database close];
    
    return allResltsAry;
}



#pragma mark - Methods update data from database tables -

-(void)updateDogDetails:(NSString *)dogName :(NSString *)birthDate :(NSString *)weight :(NSString *)withers :(NSString *)breed :(NSString *)chipCode :(NSString *)sex :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isUpdated = [database executeUpdate:@"UPDATE DogsData SET dogName=?,birthDate=?,weight=?,withers=?,breed=?,chipCode=?,sex=? WHERE dog_id=?",dogName,birthDate,weight,withers,breed,chipCode,sex,[NSNumber numberWithInt:dogInfoID]];
    [database close];
    
    if(isUpdated)
    {
        NSLog(@"Updated Successfully");
    }
    else
    {
        NSLog(@"Error occured while Updating");
    }
    
}

-(void)updateVaccinationDetails:(NSString *)vaccinDate :(NSString *)VaccinNameType :(NSString *)veternarian :(NSString *)reminderDate :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isUpdated = [database executeUpdate:@"UPDATE VaccinationData SET vaccinDate=?,VaccinNameType=?,veternarian=?,reminderDate=?,notes=? WHERE vaccination_id=?",vaccinDate,VaccinNameType,veternarian,reminderDate,notes,[NSNumber numberWithInt:dogInfoID]];
    [database close];
    
    if(isUpdated)
    {
        NSLog(@"Updated Successfully");
    }
    else
    {
        NSLog(@"Error occured while Updating");
    }
}

-(void)updateAntiparasiticsDetails:(NSString *)treatmentName :(NSString *)treatmentType :(NSString *)firstAdminstrtnDate :(NSString *)lastAdminstrtnDate :(NSString *)frequency :(NSString *)dose :(NSString *)veternarian :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isUpdated = [database executeUpdate:@"UPDATE AntiParasiticsData SET treatmentName=?,treatmentType=?,firstAdminstrtnDate=?,lastAdminstrtnDate=?,frequency=?,dose=?,veternarian=?,notes=? WHERE antiparasitics_id=?",treatmentName,treatmentType,firstAdminstrtnDate,lastAdminstrtnDate,frequency,dose,veternarian,notes,[NSNumber numberWithInt:dogInfoID]];
    [database close];
    
    if(isUpdated)
    {
        NSLog(@"Updated Successfully");
    }
    else
    {
        NSLog(@"Error occured while Updating");
    }
}

-(void)updateMedAdminDetails:(NSString *)medicationName :(NSString *)firstAdminstrtnDate :(NSString *)lastAdminstrtnDate :(NSString *)frequency :(NSString *)dose :(NSString *)veternarian :(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isUpdated = [database executeUpdate:@"UPDATE MedicineAdministrtnData SET medicationName=?,firstAdminstrtnDate=?,lastAdminstrtnDate=?,frequency=?,dose=?,veternarian=?,notes=? WHERE medAdmin_id=?",medicationName,firstAdminstrtnDate,lastAdminstrtnDate,frequency,dose,veternarian,notes,[NSNumber numberWithInt:dogInfoID]];
    [database close];
    
    if(isUpdated)
    {
        NSLog(@"Updated Successfully");
    }
    else
    {
        NSLog(@"Error occured while Updating");
    }
    
}

-(void)updateVisitsSurgDetails:(NSString *)visitDate :(NSString *)veternarian :(NSString *)nextInspectionDate :(NSString *)description :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isUpdated = [database executeUpdate:@"UPDATE VisitsSurgriesData SET visitDate=?,veternarian=?,nextInspectionDate=?,description=? WHERE visitsSurgrs_id=?",visitDate,veternarian,nextInspectionDate,description,[NSNumber numberWithInt:dogInfoID]];
    [database close];
    
    if(isUpdated)
    {
        NSLog(@"Updated Successfully");
    }
    else
    {
        NSLog(@"Error occured while Updating");
    }
}

-(void)updateNotesDetails:(NSString *)notes :(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isUpdated = [database executeUpdate:@"UPDATE NotesDescriptnData SET noteDescrptn=? WHERE notes_id=?",notes,[NSNumber numberWithInt:dogInfoID]];
    [database close];
    
    if(isUpdated)
    {
        NSLog(@"Updated Successfully");
    }
    else
    {
        NSLog(@"Error occured while Updating");
    }
}


#pragma mark - Methods delete data from database tables -


-(void)removeDogDetails:(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    
    NSLog(@"%d", dogInfoID);
    
    BOOL isDeleted = [database executeUpdate:@"DELETE FROM DogsData WHERE dog_id=?" ,[NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isDeleted)
    {
        NSLog(@"*********** Deleted Successfully **********");
    }
    else
    {
        NSLog(@"*********** Error occured while Deleting **********");
    }
}

-(void)removeVaccinationDetails:(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isDeleted = [database executeUpdate:@"DELETE FROM VaccinationData WHERE vaccin_frgn_id=?" ,[NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isDeleted)
    {
        NSLog(@"*********** Deleted Successfully **********");
    }
    else
    {
        NSLog(@"*********** Error occured while Deleting **********");
    }
}

-(void)removeAntiparasiticsDetails:(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isDeleted = [database executeUpdate:@"DELETE FROM AntiParasiticsData WHERE antptic_frgn_id=?" ,[NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isDeleted)
    {
        NSLog(@"*********** Deleted Successfully **********");
    }
    else
    {
        NSLog(@"*********** Error occured while Deleting **********");
    }
}

-(void)removeMedAdminDetails:(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isDeleted = [database executeUpdate:@"DELETE FROM MedicineAdministrtnData WHERE medAdmstrtn_frgn_id=?"  ,[NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isDeleted)
    {
        NSLog(@"*********** Deleted Successfully **********");
    }
    else
    {
        NSLog(@"*********** Error occured while Deleting **********");
    }
}

-(void)removeVisitsSurgDetails:(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isDeleted = [database executeUpdate:@"DELETE FROM VisitsSurgriesData WHERE visitSurgrs_frgn_id=?" ,[NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isDeleted)
    {
        NSLog(@"*********** Deleted Successfully **********");
    }
    else
    {
        NSLog(@"*********** Error occured while Deleting **********");
    }
}

-(void)removeNotesDetails:(int)dogInfoID
{
    FMDatabase *database = [FMDatabase databaseWithPath:self.dbPath];
    [database open];
    BOOL isDeleted = [database executeUpdate:@"DELETE FROM NotesDescriptnData WHERE notes_frgn_id=?" ,[NSNumber numberWithInt:dogInfoID], nil];
    [database close];
    
    if(isDeleted)
    {
        NSLog(@"*********** Deleted Successfully **********");
    }
    else
    {
        NSLog(@"*********** Error occured while Deleting **********");
    }
}




@end
