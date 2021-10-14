trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
List< BatchLeadConvertErrors__c> batchLeadConvertErrorRecords = new List< BatchLeadConvertErrors__c>();
for(BatchApexErrorEvent event:Trigger.new) {
batchLeadConvertErrorRecords.add(new BatchLeadConvertErrors__c(
Records__c=event.jobscope, StackTrace__c=event.StackTrace,
AsyncApexJobId__c =
event.AsyncApexJobId ));
}
insert batchLeadConvertErrorRecords;
}