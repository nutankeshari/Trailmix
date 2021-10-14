public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(integer numb, String lastName) {
        List<Contact> lstContact = new List<Contact>();
        
        for(integer i = 0; i < numb; i++) {
            Contact objCon = new Contact();
            objCon.FirstName = 'Test '+i;
            objCon.LastName = lastName;
            
            lstContact.add(objCon);
        }
               
        return lstContact;
    }
}