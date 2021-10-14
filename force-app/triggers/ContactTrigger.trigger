trigger ContactTrigger on Contact (Before insert, After Insert, Before update, After Update) {
    new ContactTriggerHandler().run();   
}