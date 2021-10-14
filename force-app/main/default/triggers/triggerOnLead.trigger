trigger triggerOnLead on Lead (before update) {
   if(trigger.isUpdate && trigger.isBefore){
       for(Lead obj : Trigger.new){
           obj.LastName = 'Keshari';
       } 
   }
}