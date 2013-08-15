import org.icepush.PushContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH


class FlowcheckFilters {

    def filters = {
        all(controller: 'MessageController', action: 'sendMessage') { // NOW you can easily customise this for a specific controller action

            after = {
                push 'notifyGroup' // This is how the push call is made to a specific group named notifyGroup
            }
        }
    }

    def push(String s) {    // yeah the function definition..
      
        PushContext.getInstance(SCH.servletContext).push s // Now we call the method getInstance on the                                                                                     //                                                                 class  PushContext provided by the plugin which needs
//                                                              a ServletContextHolder and we call the actual
 //                                                             push method of the plugin easy right ??
    }
}