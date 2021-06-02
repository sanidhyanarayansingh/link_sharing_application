package linkshare

class SubscriptionController {
    def index() { }
    def subs() {
        Usernew u=Usernew.findById(params.loggeduser)
        Topic t=Topic.findById(params.tid)
        Subscription s=new Subscription(seriousness:"Serious",topic:t,createdBy:u)
        s.save(flush:true,failOnError:true)
        redirect(controller:'user' , action:'dashboard')
    }

    def deletesubscription () {
        Usernew u = Usernew.findById(session.tempuserid)
        Topic t=Topic.findById(params.subsribedtopicid)
        Subscription s=Subscription.findByCreatedByAndTopic(u,t);
        s.delete(flush:true,failOnError:true)
        redirect(controller:'user' , action:'dashboard')
    }

    def changeserious () {
        Usernew u = Usernew.findById(session.tempuserid)
        Topic t=Topic.findById(params.subsribedtopicid)
        Subscription s=Subscription.findByCreatedByAndTopic(u,t);
        s.seriousness=params.seriousness
        s.save(flush:true,failOnError:true)
        redirect(controller:'user' , action:'dashboard')
    }

}
