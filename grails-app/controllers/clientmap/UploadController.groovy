package clientmap

import org.springframework.web.multipart.MultipartFile

class UploadController {

    def mapService
    def clientFileService

    def index() {}

    def upload = {
        def clientCount = 0;
        def clientList = [];
        MultipartFile file = request.getFile('file')
        file.inputStream.toCsvReader(['separatorChar': ';']).eachLine { tokens ->
            def name = tokens[0] ?: "NA";
            def email = tokens[1] ?: "NA";
            def street = tokens[2] ?: "NA";
            def zip = tokens[3] ?: 0;
            clientList << new Client(name: name, email: email, street: street, zip: zip);
        }
        clientList.each {
            if (!it.email.equals("NA")) {
                Client client = Client.findByEmail(it.email);
                if (!client) {
                    def point = mapService.getLatLng(it.street + " " + it.zip);
                    if (point) {
                        it.lat = point.lat;
                        it.lng = point.lng;
                    }

                    clientFileService.save(it);
                    clientCount++;
                } else {
                    if (!client.name.equals(it.name) || !client.street.equals(it.street) || !client.zip.equals(it.zip)) {
                        client.name = it.name;
                        client.street = it.street;
                        client.zip = it.zip;
                        def point = mapService.getLatLng(client.street + " " + client.zip)
                        if (point) {
                            client.lat = point.lat
                            client.lng = point.lng
                        }

                        clientFileService.save(client);
                        clientCount++;

                    }
                }

            }
        }

        render "Total " + clientCount + " clients uploaded";
    }

}
