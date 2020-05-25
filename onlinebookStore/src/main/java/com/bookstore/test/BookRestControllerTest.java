package com.bookstore.test;

import static org.junit.Assert.assertEquals;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.bookstore.entity.Book;
import com.bookstore.rest.exception.ObjResponseEntity;

public class BookRestControllerTest {

RestTemplate restTemplate;
	
	@Before
	public void setup(){
		restTemplate= new RestTemplate();
	}
	
	@Test
	public void getBook(){
		
		Book book = restTemplate.getForObject("http://localhost:8080/onlinebookStore/api/book/isbn/1234",Book.class);
		assertEquals(book.getIsbn(),"1234");
	}
	
	@Test
	public void getBook1(){		
		try{
			ObjResponseEntity obj = restTemplate.getForObject("http://localhost:8080/onlinebookStore/api/book/isbn/1234000",ObjResponseEntity.class);
			Assert.fail("failed");
		}catch(HttpClientErrorException e){
			
		}
	}
	
	// todo : we can write the test cases for other methods as well;
	// we can use mockito as well
	
}
