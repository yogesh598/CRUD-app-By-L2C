package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	//inject dependency injection
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	//@Transactional , annotation removed because we are handling at service layer
	public List<Customer> getCustomers() {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create query
		Query<Customer> theQuery = 
				currentSession.createQuery("from Customer order by lastName",Customer.class);
		
		//execute the query and get the results
		List<Customer> customers = theQuery.getResultList(); 
		
		// return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {

		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//save the customer
		currentSession.saveOrUpdate(theCustomer);
	}

	@Override
	public Customer getCustomers(int theId) {

		//get the current sessiom from the hibernate
		Session currentSession = sessionFactory.getCurrentSession();
		
		//retrieve the object from db using primary key
		Customer theCustomer = currentSession.get(Customer.class,theId);
		
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {

		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete the customer with primary key form db
		Query theQuery = 
				currentSession.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId",theId);
		
		theQuery.executeUpdate();	//to perform delete or update operation
		
	}

}
