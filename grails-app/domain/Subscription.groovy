class Subscription {
    String seriousness
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy:Usernew,topic:Topic]
    static constraints = {
        dateCreated nullable:true
        lastUpdated nullable:true
    }
    /*Integer getSubsciptionCount(){
        def s = Subscription.createCriteria()
        def subscribers = s.count {
            eq("topic", this.topic)
        }
        return subscribers
    }*/
}
