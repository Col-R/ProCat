package com.cole.procat.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cole.procat.models.Category;
import com.cole.procat.models.Product;

@Repository
public interface ProductRepository extends CrudRepository <Product, Long>{
	List<Product> findAll();
}
