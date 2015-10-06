package clientmap

class User {
    String login
    String password
    String role = "user"
    static constraints = {
        login(blank: false, nullable: false, unique: true)
        password(blank: false, password: true)
        role(inList: ["admin", "user"])
    }
    static transients = ['admin']

    Boolean isAdmin() {
        return role == "admin"
    }
    def beforeInsert = {
        password = password.encodeAsSHA()
    }

    def beforeUpdate() {
        password = password.encodeAsSHA()
    }

    String toString() {
        login
    }
}
