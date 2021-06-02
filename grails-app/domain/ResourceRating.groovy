class ResourceRating {
    Integer score
    static belongsTo = [createdBy:Usernew,resource:Resource]
}
