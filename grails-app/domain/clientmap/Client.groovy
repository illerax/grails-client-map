package clientmap

class Client {
    String name;
    String email;
    String street;
    int zip;
    BigDecimal lat;
    BigDecimal lng;
    static constraints = {
        name(maxSize: 50)
        email(blank: false, nullable: false, email: true, unique: true)
        street()
        zip(min: 0)
        lat(blank: true, nullable: true)
        lng(blank: true, nullable: true)
    }
}
