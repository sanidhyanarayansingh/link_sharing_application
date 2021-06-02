package linkshare

class AdminController {
    def index() { }
    def adminpage()
    {
        List <Usernew> temp=Usernew.list()
        Usernew loguser=Usernew.findById(session.tempuserid)
        render(view:"adminpage" , model:[listofusers:temp,loggeduser:loguser])
    }
    def changeactivation()
    {
        Usernew temp=Usernew.findById(params.user)
        if(temp.active == true)
        {
            temp.active=false ;
        }
        else
        {
            temp.active=true ;
        }
        temp.save(flush:true,failOnError:true)
        redirect(action:'adminpage')
    }
}
