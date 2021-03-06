package com.cole.procat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cole.procat.models.Category;
import com.cole.procat.models.Product;
import com.cole.procat.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository cRepo;
	
	public List<Category> getAllCategories(){
		return this.cRepo.findAll();
	}
	// get one category
	public Category getOneCategory(Long id) {
		return this.cRepo.findById(id).orElse(null);
	}
	// create Category
	public Category createCategory(Category category) {
		return this.cRepo.save(category);
	}
	public List<Category> findCatNotInProd(Product product){
		return this.cRepo.findByProductsNotContains(product);
	}
	public void addProductToCategory(Product product, Category category) {
		List<Product> existingProds = category.getProducts();
		existingProds.add(product);
		this.cRepo.save(category);
	}
}
