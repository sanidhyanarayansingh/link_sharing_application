class Usernew {
    String email
    String userName
    String password
    String firstName
    String lastName
    byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [
            topics : Topic,
            subscriptions: Subscription,
            resources: Resource,
            readingItems:ReadingItem,
            resourceRatings:ResourceRating
    ]
    static constraints = {
        email(unique: true, email: true, blank: false)
        userName(unique: true, blank: false)
        password(blank: false)
        firstName(blank: false)
        lastName(blank: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)
    }
}