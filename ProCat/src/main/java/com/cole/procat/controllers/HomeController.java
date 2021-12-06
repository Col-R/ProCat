package com.cole.procat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.cole.procat.models.Product;
import com.cole.procat.services.CategoryService;
import com.cole.procat.services.ProductService;

@Controller
public class HomeController {
	@Autowired
	private CategoryService cService;
	private ProductService pService;
	
	@GetMapping("/products/new")
	public String newProduct(@ModelAttribute("product")Product product) {
		return "add_product.jsp";
	}
	@PostMapping("/addProduct")
	public String addProduct(@ModelAttribute("product")Product product) {
		this.pService.createProduct(product);
		return "redirect:/products/new";
	}
	
	
	@GetMapping("categories/new")
	public String newCategory() {
		return "add_category.jsp";
	}
}
