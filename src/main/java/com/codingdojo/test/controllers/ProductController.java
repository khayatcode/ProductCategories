package com.codingdojo.test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.test.models.Product;
import com.codingdojo.test.services.CategoryService;
import com.codingdojo.test.services.ProductService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/home")
	public String home(Model model) {
		model.addAttribute("products", productService.findAllProduct());
		model.addAttribute("categories", categoryService.findAllCategory());
		return "home.jsp";
	}
	
	@GetMapping("/product/create")
	public String renderCreateProduct(@ModelAttribute("product") Product product) {
		return "createProduct.jsp";
	}
	
	@PostMapping("/product/create/new")
	public String submitCreateProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("bindingResult", result);
			return "createProduct.jsp";
		}
		productService.createOrUpdateProduct(product);
		return "redirect:/home";
	}
	
	@GetMapping("/view/product/{id}")
	public String viewProduct(@PathVariable("id") Long id, Model model) {
		Product product = productService.findProductByID(id);
		model.addAttribute("product", product);
		model.addAttribute("productInCategory", categoryService.findProductInCategories(product));
		model.addAttribute("productInNotCategory", categoryService.findProductNotInCategories(product));
		
		return "viewProduct.jsp";
	}

	@PostMapping("/product/join/{id}")
	public String submitProductJoin(@PathVariable("id") Long productId, @RequestParam(value = "categories", required = false) Long categoryId, Model model) {
		if(categoryId == null) {
			Product product = productService.findProductByID(productId);
			model.addAttribute("product", product);
			model.addAttribute("productInCategory", categoryService.findProductInCategories(product));
			model.addAttribute("productInNotCategory", categoryService.findProductNotInCategories(product));
			model.addAttribute("errorMessage", "Your Submission was Invalid");
			return "viewProduct.jsp";
			
		}
		productService.addProductToCategory(categoryId, productId);
		return "redirect:/view/product/{id}";
	}


	


	
}
