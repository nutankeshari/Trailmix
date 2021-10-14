trigger AccountTrigger on Account (Before Insert, After Insert, Before Update, After Update) {
    new AccountTriggerHandler().run();
}