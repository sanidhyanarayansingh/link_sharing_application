package linkshare

class UserController {
    static defaultAction = "home"

    def index() {}

    def home() {
        List<Resource> temp = Resource.createCriteria().list(max:5) {
            topic {eq("visibility","Public") }
            order("lastUpdated","desc")
        }
        List <Resource> topposts=Resource.createCriteria().list(max:5){     //for finding top posts on the basis of ratings
            topic {eq("visibility","Public") }
            resourceRatings{order("score","desc") }
        }
        render(view: 'home', model: [resources: temp, topres: topposts])
    }

    def dashboard() {
        Usernew loguser = Usernew.findById(session.tempuserid)
        List<Topic> temp2 = Topic.list(sort: "temp2.subscriptions.count()", order: "desc", max: 5)
        List <Topic> subscribedtopics = Subscription.findAllByCreatedBy(loguser)*.topic    //subscribed topics of the loguser
        /*List<Resource> subscribedposts=Resource.createCriteria().list(){                    // posts of subscribed topics
            'in'("topic.id",subscribedtopics*.id)
        }*/
        render(view: "dashboard", model: [loggeduser: loguser,subscribedtopics: subscribedtopics,trending: temp2])  //subscribedposts:subscribedposts])
    }

    def logout() {
        session.invalidate()
        redirect(action: "loginuser")
    }

    def save() {
        Usernew user = new Usernew(firstName: params.firstname, lastName: params.lastname, password: params.password, email: params.emailid, isAdmin: false, active: true, userName: params.uname)
        user.photo = params.photo.bytes
        user.save(flush: true, failOnError: true)
        forward(action: 'home')
    }

    def loginuser() {
        Usernew users = Usernew.findByEmailAndPassword(params.emailid, params.password)
        Usernew users1 = Usernew.findByUserNameAndPassword(params.username, params.password)
        if (users != null || users1 != null) {
            //session create
            if (users == null && users1.active == true) {
                session.tempuserid = users1.id
                redirect(action: 'dashboard')
            } else if (users1 == null && users.active == true) {
                session.tempuserid = users.id
                redirect(action: 'dashboard')
            } else{
                flash.error = "Account Deactivated , contact the Admin"
                redirect(action:'home')
            }
        } else {
            flash.error = "Wrong Credentials "
            redirect(action: 'home')
        }
    }

    def viewImage() {
        def u = Usernew.findById(params.tempid)
        byte[] imageInByte = u.photo
        response.contentType = 'image/jpg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }

    def editpage() {
        Usernew u = Usernew.findById(session.tempuserid)
        List <Topic> subscribedtopics = Subscription.findAllByCreatedBy(u)*.topic
        List <Topic> topicmade=Topic.findAllByCreatedBy(u)
        render(view: "editprofile", model: [loggeduser: u,subscribedtopics: subscribedtopics,topicmade:topicmade])
    }

    def update() {
        Usernew u = Usernew.findById(session.tempuserid)
        u.firstName = params.firstname
        u.lastName = params.lastname
        u.photo = params.photo.bytes
        u.save(flush: true, failOnError: true)
        redirect(action: 'editpage')
    }

    def updatepassword() {
        Usernew u = Usernew.findById(session.tempuserid)
        u.password = params.password
        u.save(flush: true, failOnError: true)
        redirect(action: 'editpage')
    }

    def search() {
        Usernew u = Usernew.findById(session.tempuserid)
        def searchedtext = params.searchtext
        println searchedtext
        List <Resource> temp = Resource.createCriteria().list() {
            topic{eq("visibility", "Public")}
            ilike('description',"%"+searchedtext+"%")
        }
        List <Topic> subscribedtopics = Subscription.findAllByCreatedBy(u)*.topic
        List<Topic> temp2 = Topic.list(sort: "temp2.subscriptions.size()", order: "desc", max: 5)
        List <Resource> temp3=Resource.createCriteria().list(max:5){
            topic {eq("visibility","Public") }
            resourceRatings{order("score","desc") }
        }

        render(view: "searchpage", model: [loggeduser: u, relatedresource: temp, listoftopics: subscribedtopics, trending: temp2, topres: temp3, searchedtext: searchedtext])
    }

    def sendinvite() {
        def subj = "Subscribe to the listed topic"
        sendMail {
            to params.emailid
            subject subj
            text params.invitetopic
        }
        redirect(action: 'dashboard')
    }
    def forgotpassword() {
        Usernew u=Usernew.findByUserName(params.username)
        def p =new Random().with {(1..6).collect {(('a'..'z')).join()[ nextInt((('a'..'z')).join().length())]}.join()}
        u.password=p
        u.save(flush:true,failOnError:true)
        sendMail {
            to params.email
            subject "Forgotten Password Mail"
            text p
        }
        redirect(action: 'home')
    }
    def showuser () {
        Usernew u = Usernew.findById(session.tempuserid)
        def showid=params.showid
        Usernew showprofile = Usernew.findById(params.showid)
        List <Topic> subscribedtopics = Subscription.findAllByCreatedBy(u)*.topic
        List <Topic> topicofuserpage = Topic.createCriteria().list() {
            eq("visibility","Public")
            createdBy{eq("id",showprofile.id)}
        }
        List <Resource> resourceofuserpage = Resource.createCriteria().list() {
            topic{eq("visibility","Public")}
            createdBy{eq("id",showprofile.id)}
        }
        render(view:'showuser',model:[loggeduser:u,userprofile:showprofile,subscribedtopics:subscribedtopics,showtopics:topicofuserpage,showres:resourceofuserpage])
    }
}
