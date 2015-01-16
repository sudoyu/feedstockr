package feedstockr

class Entry {
    String title
    String link
    String author
    String description
    Date publishedDate
    Date dateCreated

    static belongsTo = [feed: Feed]
    static constraints = {
        title(maxSize: 2048)
        link(maxSize: 2048, url: true, nullable: true)
        author(maxSize: 1024, nullable: true)
        description(maxSize: 2048, nullable: true)
        publishedDate()
        dateCreated()
    }
}
