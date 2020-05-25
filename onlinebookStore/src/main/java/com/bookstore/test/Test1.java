package com.bookstore.test;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.client.RestTemplate;

//import org.springframework.web.client.RestTemplate;

import com.bookstore.media.MediaSearch;

public class Test1 {
	
	public static void main(String args[]) throws Exception{
		
		RestTemplate restTemplate = new RestTemplate();
		List<MediaSearch> list = Arrays.asList(restTemplate.getForObject("https://jsonplaceholder.typicode.com/posts",MediaSearch[].class));
		
		for(Object m : list){
			//System.out.println(m.getClass());
			if(((MediaSearch)m).getTitle().contains("nam") || ((MediaSearch)m).getBody().contains("nam")){
				System.out.println( ((MediaSearch)m).getTitle() );
			}
			
		}
		
	}
	

}
