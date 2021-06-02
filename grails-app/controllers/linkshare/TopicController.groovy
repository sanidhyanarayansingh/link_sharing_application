package linkshare

class TopicController {
    def index() { }
    def savetopic()
    {
        Usernew temp1=Usernew.findById(session.tempuserid)
        Topic t=new Topic( topicName:params.tname , visibility:params.visib , createdBy:temp1)
        t.save(flush:true,failOnError:true)
        Subscription s=new Subscription(seriousness:"Very Serious",topic:t,createdBy:temp1)
        s.save(flush:true,failOnError:true)
        redirect(controller:'user' , action:'dashboard')
    }
    def show(){
        Usernew loguser=Usernew.findById(session.tempuserid)
        List <Topic> subscribedtopics = Subscription.findAllByCreatedBy(loguser)*.topic
        Topic t=Topic.findById(params.tid)
        render(view:"topicshow",model:[loggeduser:loguser,currtopic:t,listoftopics:subscribedtopics])
    }
}
