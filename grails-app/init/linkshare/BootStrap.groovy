package linkshare

class BootStrap {

    def init = { servletContext ->
        new Usernew(email:"admin@gmail.com",userName:"admin",password:"admin",firstName:"Ad",lastName:"min",admin:true,active:true).save()

    }
    def destroy = {
    }
}
