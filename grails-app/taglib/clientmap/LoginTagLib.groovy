package clientmap

class LoginTagLib {
    def loginControl = {
        if(request.getSession(false) && session.user){
            out << "${link(action:"logout", controller:"user"){"Logout"}}"
        } else {
            out << "${link(action:"login", controller:"user"){"Login"}}"
        }
    }
    def formForUsers = {
        if(request.getSession(false) && session.user){
            out << "<form id=\"my_form\" enctype=\"multipart/form-data\" method=\"post\" action=\"/ClientMap/upload/upload\" class=\"nav navbar-form navbar-right\"> <input class=\"btn btn-default\" type=\"submit\" id=\"submit\" value=\"Upload\" /><div class=\"form-group\"><input name=\"file\" type=\"file\"/></div></form>"
        }
    }
}
