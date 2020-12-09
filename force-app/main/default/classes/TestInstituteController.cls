@isTest
private class TestInstituteController {
    
/*    @isTest static void TestShowMentor() {
        InstituteController instituteController = new InstituteController();
        instituteController.showMentorStatus = false;
       
        if(instituteController.showMentorStatus == true) {
            instituteController.ShowMentor();
            System.assert(instituteController.showMentorStatus ,false);
        }
        
        if(instituteController.showMentorStatus == false) {
            instituteController.ShowMentor();
        	System.assert(instituteController.showMentorStatus ,true);
        }
    }
*/
    
    @isTest static void TestGetInstitutes() {
        Boolean flag = true;
        Boolean instituteFound;
    	InstituteController instituteController = new InstituteController();
        List<Institute__c> institutes = new List<Institute__c>{new Institute__c(Name = 'Select Institute'),
            new Institute__c(Name = 'Sharda University'),
            new Institute__c(Name = 'GL Bajaj')};
        insert institutes;
        for (Institute__c institute : institutes) {
            for ( SelectOption selectOption: instituteController.getInstitutes() ) {
                instituteFound = false;
                //System.debug(String.valueOf(selectOption.getValue()) + String.valueOf(institute));
                if (String.valueOf(selectOption.getValue()) == String.valueOf(institute.Name)){
                    instituteFound = true; 
                    break;
                }                
            }
            if(instituteFound == false){
                flag = false;
            }            
        }
        System.assert(flag, true);
    }
        
    
    @isTest static void TestSelectInstitute() {
        
        Boolean flag;
        InstituteController instituteController = new InstituteController();
        List<Institute__c> institutesList = new List<Institute__c> {
            new Institute__c(Name = 'Select Institute'),
            new Institute__c(Name = 'Sharda University'),
            new Institute__c(Name = 'GL Bajaj')
            };
                
        insert institutesList;
        
        List<Mentor__c> mentorsList = new List<Mentor__c> {
            new Mentor__c(Name = 'Harshit', Designation__c = 'Ass. Prof', institute__c = institutesList[1].Id),
                new Mentor__c(Name = 'Amit', Designation__c = 'Prof', Institute__c = institutesList[2].Id),
                new Mentor__c(Name = 'Pankaj', Designation__c = 'Ass. Faculty', Institute__c = institutesList[2].Id)     
        };

        insert mentorsList;
        
        instituteController.selectedInstitute = 'Sharda University';
        
        instituteController.SelectInstitute();
        
        flag = true;
        
        for ( Mentor mentor : instituteController.mentorsList ) {
            if(mentor.institute != instituteController.selectedInstitute) {
                flag = false;
            }
        }
        
        System.assert(flag, true);
        
    }
    
 	@isTest static void TestMentorInstanceCall() {
        
        InstituteController instituteController = new InstituteController();
        List<Mentor__c> studentsInstitutes;
        
        List<Institute__c> institutesList = new List<Institute__c> {
            new Institute__c(Name = 'Select Institute'),
            new Institute__c(Name = 'Sharda University'),
            new Institute__c(Name = 'GL Bajaj')
            };
                
		insert institutesList;
		
		//System.debug(institutesList);
                
        List<Mentor__c> mentorsList= new List<Mentor__c> {
            new Mentor__c(Name = 'Harshit', Designation__c = 'Ass. Prof', institute__c = institutesList[1].Id),
                new Mentor__c(Name = 'Amit', Designation__c = 'Prof', Institute__c = institutesList[2].Id),
                new Mentor__c(Name = 'Pankaj', Designation__c = 'Ass. Faculty', Institute__c = institutesList[2].Id)     
		};
        
		insert mentorsList;
        
        List<Student__c> studentsList = new List<Student__c> {
            new Student__c (Name = 'Nikhil', City__c = 'Noida', Class__c = 'BTECH', State__c = 'UP',
                                                                       Mentor__c = mentorsList[2].Id),
            new Student__c (Name = 'Chaitanya', City__c = 'Hathras', Class__c = 'MTECH', State__c = 'Agra', 
                            Mentor__c = mentorsList[1].Id),
            new Student__c (Name = 'Sourav', City__c = 'Orrigas', Class__c = 'MTECH Arch', State__c = 'Orrisa',
                           Mentor__c = mentorsList[0].Id),
            new Student__c (Name = 'Abhishek', City__c = 'Jodhpur', Class__c = 'FTECH', State__c = 'Rajasthan',
                            Mentor__c = mentorsList[0].Id)
                };
                    
		
        instituteController.selectedInstitute = 'GL Bajaj';
        
        instituteController.SelectInstitute();
        
        instituteController.selectedMentor = 'Amit';
        
		insert studentsList;
        
        System.debug(studentsList);
        
        System.debug(instituteController.selectedMentor);
        System.debug(instituteController.selectedInstitute);
		System.debug('mentors' + instituteController.mentors);
        
        instituteController.MentorInstanceCall();
        System.debug(instituteController.students);
        System.debug(studentsList);
        
        Boolean flag = true;
        
        for (Student__c studentResult : instituteController.students) {
			System.debug(studentResult.Mentor__c + '  ' + mentorsList[1].Id);            
            if(studentResult.Mentor__c != mentorsList[1].Id ){
                flag = false;
            }
        }
        
        System.assert(flag, true);
    }   
}