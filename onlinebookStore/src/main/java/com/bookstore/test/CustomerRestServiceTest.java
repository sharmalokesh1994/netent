package com.bookstore.test;

import org.junit.Test;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.bookstore.entity.Customer;
import com.bookstore.media.MediaSearch;
import com.bookstore.rest.exception.ObjResponseEntity;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;

public class CustomerRestServiceTest{
	
	RestTemplate restTemplate;
	
	@Before
	public void setup(){
		restTemplate= new RestTemplate();
	}
	
	@Test
	public void getCustomer(){
		
		Customer customer = restTemplate.getForObject("http://localhost:8080/onlinebookStore/api/customers/1",Customer.class);
		assertEquals(customer.getId(),1);
	}
	
	@Test
	public void getCustomer1(){		
		try{
			ObjResponseEntity obj = restTemplate.getForObject("http://localhost:8080/onlinebookStore/api/customers/1000",ObjResponseEntity.class);
			Assert.fail("failed");
		}catch(HttpClientErrorException e){
			
		}
	}
	
	// todo : we can write the test cases for other methods as well;
	// we can use mockito as well

}
