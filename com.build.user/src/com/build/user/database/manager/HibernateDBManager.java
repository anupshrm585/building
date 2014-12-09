package com.build.user.database.manager;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.build.connection.manager.HibernateSessionManager;

/**
 * This class is used for executing sql statements using hibernate
 * 
 * @author Anup
 * 
 */
@SuppressWarnings("serial")
public class HibernateDBManager implements Serializable{
	private SessionFactory factory = HibernateSessionManager.getInstance()
			.getSessionFactory();

	/**
	 * insertData(Object) used for inserting the data into database
	 * 
	 * @param obj
	 *            it is the DTO which holds the data
	 * @return returns the last insert id
	 */
	public Object insertData(Object obj) {
		Session session = factory.openSession();
		Transaction tx = null;
		Object id = null;
		try {
			tx = session.beginTransaction();
			id = session.save(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return id;
	}

	public int updateData(Object obj) {
		Session session = factory.openSession();
		Transaction tx = null;
		int result = 1;
		try {
			tx = session.beginTransaction();
			session.update(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			System.out.println(e.getClass().getName()+ " : " + e.getMessage());
		} finally {
			session.close();
		}
		return result;
	}

	public int deleteData(Object obj) {
		Session session = factory.openSession();
		Transaction tx = null;
		int result = 1;
		try {
			tx = session.beginTransaction();
			session.delete(obj);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			result=0;
			System.out.println(e.getClass().getName()+ " : " + e.getMessage());
		} finally {
			session.close();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getList(String query) {
		List<Object> records = null;
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query res = session.createQuery(query);
			records = res.list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			 System.out.println(e.getClass().getName()+ " : " + e.getMessage());
		} finally {
			session.close();
		}
		return records;
	}

	public void getResultSet(String query) {

	}

}
