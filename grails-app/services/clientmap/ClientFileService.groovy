package clientmap

import grails.transaction.Transactional

@Transactional
class ClientFileService {

    def save(Client client) {
        client.save flush: true
    }
}
