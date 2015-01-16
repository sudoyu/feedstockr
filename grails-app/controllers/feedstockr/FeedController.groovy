package feedstockr

class FeedController {
    static scaffold = Feed

    def feedstockr() {
        def entries
        def entryCount
        if (!params.offset) {
            params.offset = 0
        }
        if (params.feed) {
            entries = Entry.findAllByFeed(Feed.get(params.feed), [sort: "publishedDate", order: "desc", max: 50, offset: params.offset])
            entryCount = Entry.findAllByFeed(Feed.get(params.feed))
        } else {
            entries = Entry.listOrderByPublishedDate(order: "desc", max: 50, offset: params.offset)
            entryCount = Entry.count()
        }
        def feeds = Feed.findAllByWithAuth(false)
        def feedsWithAuth = Feed.findAllByWithAuth(true)
        return [entries: entries, entryCount: entryCount, feeds: feeds, feedsWithAuth: feedsWithAuth]
    }
}
