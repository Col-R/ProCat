package com.cole.procat.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cole.procat.models.Category;
import com.cole.procat.models.Product;
import com.cole.procat.services.CategoryService;
import com.cole.procat.services.ProductService;

@Controller
public class HomeController {
	@Autowired
	private CategoryService cService;
	@Autowired
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
	
	
	@GetMapping("/categories/new")
	public String newCategory(@ModelAttribute("category")Category category) {
		return "add_category.jsp";
	}
	@PostMapping("/addCategory")
	public String addCategory(@ModelAttribute("category")Category category) {
		this.cService.createCategory(category);
		return "redirect:/categories/new";
	}
	
	@GetMapping("products/{id}")
	public String showProduct(@PathVariable("id")Long id, Model viewModel) {
		Product prodShow = this.pService.getOneProduct(id);
		viewModel.addAttribute("notInProd", this.cService.findCatNotInProd(prodShow));
		viewModel.addAttribute("product", prodShow);
		return "show_product.jsp";
	}
	@PostMapping("/addCat/{id}")
	public String addCatToProd(@RequestParam("cats")Long cat_id, @PathVariable("id")Long product_id){
		Product productToAdd = this.pService.getOneProduct(product_id);
		Category categoryToAdd=this.cService.getOneCategory(cat_id);
		this.pService.addCategoryToProduct(productToAdd, categoryToAdd);
		return "redirect:/products/{id}";
	}
	
	@GetMapping("categories/{id}")
	public String showCategory(@PathVariable("id")Long id, Model viewModel) {
		Category catShow = this.cService.getOneCategory(id);
		viewModel.addAttribute("category", catShow);
		viewModel.addAttribute("notInCat", this.pService.findProdNotInCat(catShow));
		return "show_category.jsp";
	}
	@PostMapping("addProd/{id}")
	public String showProdToCat(@PathVariable("id")Long cat_id, @RequestParam("prod")Long product_id) {
		Category categoryToAdd = this.cService.getOneCategory(cat_id);
		Product productToAdd = this.pService.getOneProduct(product_id);
		this.cService.addProductToCategory(productToAdd, categoryToAdd);
		return "redirect:/categories/{id}";
	}

}

