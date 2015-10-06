package clientmap

class FooterTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def thisYear = {
        out << new Date().format("yyyy")
    }
}
