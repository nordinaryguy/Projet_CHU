package fr.univangers.ester.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.univangers.ester.beans.User;

@WebFilter("/salarie/*")
public class SalarieFilter implements Filter {

    public static final String ACCES_CONNEXION  = "/connexion";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    
    public SalarieFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        /* Cast des objets request et response */
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        /* Récupération de la session depuis la requête */
        HttpSession session = req.getSession();

        User sessionUser = (User) session.getAttribute(ATT_SESSION_USER);
        if (sessionUser != null && sessionUser.isSalarie()) {
            /* Affichage de la page restreinte */
        	try {
        		chain.doFilter( req, res );
        	}catch(IllegalStateException e) {
        	
        	}
        	
        } else {
            /* Redirection vers la page publique */
        	req.getRequestDispatcher(ACCES_CONNEXION).forward( req, res );
        }
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
