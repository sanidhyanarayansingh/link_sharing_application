class Topic {

    String topicName
    Usernew createdBy
    Date dateCreated
    Date lastUpdated
    String visibility

    static belongsTo = [createdBy : Usernew]

    static hasMany = [
            subscriptions: Subscription ,
            resources: Resource
    ]

    static constraints = {
        topicName(blank: false, unique: ['createdBy'])
    }
}

