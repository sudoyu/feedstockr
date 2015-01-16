package feedstockr

import com.rometools.rome.feed.synd.*
import com.rometools.rome.io.*
import com.rometools.rome.feed.*

class CrawlerJob {
    def grailsApplication

    static triggers = {
        simple repeatInterval: 900000l // execute job once in 900 seconds
    }

    // execute job
    def execute() {
        Feed.findAllByWithAuth(false).each {
            crawl(it)
        }

        // authenticator for basic auth
        Authenticator.default = {
            [grailsApplication.config.http.user, grailsApplication.config.http.password.toCharArray()] as PasswordAuthentication
        } as Authenticator

        Feed.findAllByWithAuth(true).each {
            crawl(it)
        }
    }

    def crawl(Feed f) {
        SyndFeed feed = new SyndFeedInput().build(new XmlReader(new URL(f.url)));
        println feed.title

        feed.entries.each {
            if (!Entry.findByTitleAndPublishedDate(it.title.trim(), it.publishedDate)) {
                println it.publishedDate.toString() + " : " + it.link + " " + it.author
                new Entry([
                        title        : it.title.trim(),
                        link         : it.link,
                        publishedDate: it.publishedDate,
                        author       : it.author.trim(),
                        description  : it?.contents?.value, // it?.description?.value,
                        feed         : f
                ]).save(flush: true)
            }
        }
    }
}
