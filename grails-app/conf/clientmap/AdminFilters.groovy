package clientmap

class AdminFilters {
    def filters = {
        adminOnly(controller:'(user|upload)', action:"(index|create|edit|update|delete|save|show)") {
            before = {
                if(!session?.user?.admin){
                    flash.message = "Sorry, admin only"
                    redirect(controller:"user", action:"login")
                    return false
                }
            }
        }
        registeredOnly(controller:'(client)', action:"(index|show|search)") {
            before = {
                if(!session?.user){
                    flash.message = "Sorry, registered users only"
                    redirect(controller:"user", action:"login")
                    return false
                }
            }
        }
        adminEdit(controller:'(client)', action:"(create|edit|update|delete|save)") {
            before = {
                if(!session?.user?.admin){
                    flash.message = "Sorry, admin only"
                    redirect(controller:"client", action:"index")
                    return false
                }
            }
        }
    }
}
