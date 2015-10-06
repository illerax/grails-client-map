package clientmap

class MapService {

    def getLatLng(String address) {
        def lat = 0
        def lng = 0
        def result = [lat: 0, lng: 0]
        withHttp(uri: "http://maps.googleapis.com") {
            def html = get(path: '/maps/api/geocode/json', query: [address: address])
            if (html.results != null && html.results.size() > 0) {
                def partial = html.results[0]
                if (partial.geometry != null && partial.geometry.location != null) {
                    lat = partial.geometry.location.lat
                    lng = partial.geometry.location.lng
                    result = [lat: Double.valueOf(lat.toString()), lng: Double.valueOf(lng.toString())]
                }
            }
        }
        return result
    }
}
