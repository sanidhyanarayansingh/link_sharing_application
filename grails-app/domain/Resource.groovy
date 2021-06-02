class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy : Usernew,topic : Topic ]
    static hasMany = [
            readingItems: ReadingItem,
            resourceRatings: ResourceRating
    ]
    static mapping = {
        table name : "ResourceNew"
    }


}
