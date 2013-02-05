import com.matchi.fortnox.FortnoxException

class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "home", action: "index")
		"500"(view:'/error')
        "500"(controller: "home", action: "fortnoxError", exception: FortnoxException)
	}
}
