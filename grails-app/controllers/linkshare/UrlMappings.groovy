package linkshare

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"user")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
