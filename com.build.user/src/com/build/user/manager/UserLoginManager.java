package com.build.user.manager;

import javax.servlet.http.HttpServletRequest;

import com.build.pojo.DTO.LoginDTO;
import com.build.util.BaseUtility;
/**
 * UserLoginManager helps in managing user login and maintaining the session for a user
 * @author Anup
 *
 */
public class UserLoginManager {

	private static UserLoginManager userLoginManager = null;

	private UserLoginManager() {
	}

	public static UserLoginManager getInstance() {
		synchronized (UserLoginManager.class)
	      {
			if (BaseUtility.isEmpty(userLoginManager)) {
				userLoginManager = new UserLoginManager();
			}
	      }
		
		return userLoginManager;
	}
/**
 * Sets the login flag as Y and creates a session
 * @param request
 * @param loginDTO
 * @return
 */
	public LoginDTO doLogin(HttpServletRequest request,LoginDTO loginDTO) {
		if (!isSession(request)) {
			loginDTO.setLoggedIn(true);
			request.getSession(true).setAttribute("loginDTO", loginDTO);
			return loginDTO;
		}
		return null;
	}
	
	/**
	 * Invalidates the the session
	 * @param request
	 * @return
	 */

	public boolean doLogout(HttpServletRequest request) {
		if (isSession(request)) {
			request.getSession(false).removeAttribute("loginDTO");
			request.getSession(false).invalidate();
			return true;
		}
		return false;
	}

	/**
	 * Helps in retrieving the session value
	 * @param request
	 * @param attr
	 * @return
	 */
	public Object getSessionValue(HttpServletRequest request, String attr) {
		if (this.isSession(request)) {
			return request.getSession(false).getAttribute(attr);
		}
		return null;
	}

	public boolean isSession(HttpServletRequest request) {
		if (BaseUtility.isNotEmpty(request.getSession(false))) {
			return true;
		}
		return false;

	}
}
