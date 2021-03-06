package com.cole.procat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cole.procat.models.Category;
import com.cole.procat.models.Product;
import com.cole.procat.repositories.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository pRepo;
	
	public List<Product> getAllProducts(){
		return this.pRepo.findAll();
	}
	// get one product
	public Product getOneProduct(Long id) {
		return this.pRepo.findById(id).orElse(null);
	}
	// create product
	public Product createProduct(Product product) {
		return this.pRepo.save(product);
	}
	public List<Product> findProdNotInCat(Category category){
		return this.pRepo.findByCategoriesNotContains(category);
	}
	public void addCategoryToProduct(Product product, Category category) {
		List<Category> existingCats = product.getCategories();
		existingCats.add(category);
		this.pRepo.save(product);
	}
}
