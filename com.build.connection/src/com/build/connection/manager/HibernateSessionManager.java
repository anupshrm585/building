package com.build.connection.manager;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.build.util.BaseUtility;


public class HibernateSessionManager {
	private static HibernateSessionManager connection=null;
	private static SessionFactory factory=null;
	private HibernateSessionManager(){}
	
	public static HibernateSessionManager getInstance(){
		synchronized (HibernateSessionManager.class) {
			if(BaseUtility.isEmpty(connection)){
				connection=new HibernateSessionManager();
			}
		}
		
		return connection;
			
	}
	
	public SessionFactory getSessionFactory(){
		if(BaseUtility.isEmpty(factory)){
			Configuration configuration = new Configuration();
	 	    configuration.configure("/com/build/connection/hibernate/xml/hibernate.cfg.xml");
	 	    ServiceRegistry registry = new StandardServiceRegistryBuilder()
	 	    				.applySettings(configuration.getProperties()).build();
			factory=configuration.buildSessionFactory(registry);
		}
		return factory;
	}
	
	
}
