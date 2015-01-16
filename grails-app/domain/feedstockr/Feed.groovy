package feedstockr

class Feed {

    String url
    String description
    Boolean withAuth
    Integer selectedCount

    static constraints = {
        url(maxSize: 2048, url: true)
        description(maxSize: 2048)
        withAuth()
        selectedCount()
    }
}
