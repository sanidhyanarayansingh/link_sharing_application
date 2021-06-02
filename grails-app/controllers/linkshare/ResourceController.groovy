package linkshare

class ResourceController {
    def index() { }
    def savelinkresource() {
        Usernew temp1=Usernew.findById(session.tempuserid)
        Topic t=Topic.findByTopicName(params.ltopic)
        LinkResource link = new LinkResource(url:params.link,description:params.description,topic:t,createdBy:temp1)
        link.save(flush:true,failOnError:true)
        ReadingItem r=new ReadingItem(isread:false,createdBy:temp1,resource:link)
        r.save(flush:true,failOnError:true)
        redirect(controller:'user' , action:'dashboard')
    }
    def savedocumentresource() {
        Usernew temp1=Usernew.findById(session.tempuserid)
        Topic t=Topic.findByTopicName(params.dtopic)
        def file1 = request.getFile("document")
        String dir1 = new Date()
        String dir2 = dir1.split(" ").join("")
        String dir = "/home/sanidhya/Desktop/Files/Grails/linkshare/DocumentResource/${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource dr = new DocumentResource(filepath: dir,description:params.docdescription,topic:t,createdBy:temp1)
        dr.save(flush:true , failOnError:true)
        redirect(controller:'user' , action:'dashboard')
    }
    def showpost()
    {
        Usernew temp1=Usernew.findById(session.tempuserid)
        Resource r=Resource.findById(params.rid)
        List <Topic> subscribedtopics = Subscription.findAllByCreatedBy(temp1)*.topic
        List <Topic> temp2=Topic.list(sort:"temp2.subscriptions.size()",order:"desc",max:5)
        render(view:"showpost",model:[loggeduser:temp1,res:r,subscribedtopics:subscribedtopics,trending:temp2])
    }
    def rating() {
        Usernew temp1=Usernew.findById(session.tempuserid)
        Resource r1=Resource.findById(params.rid)
        ResourceRating r=new ResourceRating(score:params.resrating,createdBy:temp1,resource:r1)
        r.save(flush:true,failOnError:true)
        redirect(controller:'resource' , action:'showpost' ,params: [rid:r1.id])
    }
    def read() {
        Usernew temp=Usernew.findById(session.tempuserid)
        Resource r=Resource.get(params.resid)
        ReadingItem item=new ReadingItem(isread:true,resource:r,createdBy:temp)
        item.save(flush:true,failOnError:true)
        redirect(controller: 'user' , action: 'dashboard')
    }
    def unread() {
        Usernew temp=Usernew.findById(session.tempuserid)
        Resource r=Resource.get(params.resid)
        ReadingItem item=new ReadingItem(isread:false,resource:r,createdBy:temp)
        item.save(flush:true,failOnError:true)
        redirect(controller: 'user' , action: 'dashboard')
    }

    def downloadDocumentResource(){
        Resource dResource=Resource.get(params.drId)
        def file = new File(dResource.filepath)
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.name}")
            response.outputStream << file.bytes
            return
        }
        redirect(controller:'resource' , action:'showpost' ,params: [rid:dResource.id])
    }

    def viewLinkResource() {
        Resource lres=Resource.get(params.linkid)
        def linkforpost= lres.url
        redirect(url: linkforpost)
    }

}