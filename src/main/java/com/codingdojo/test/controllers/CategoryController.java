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

import com.codingdojo.test.models.Category;
import com.codingdojo.test.services.CategoryService;
import com.codingdojo.test.services.ProductService;

import jakarta.validation.Valid;

@Controller
public class CategoryController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/category/create")
	public String renderCreateCategory(@ModelAttribute("category") Category category) {
		return "createCategory.jsp";
	}
	
	@PostMapping("/category/create/new")
	public String submitCreateProduct(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("bindingResult", result);
			return "createCategory.jsp";
		}
		categoryService.createOrUpdateCategory(category);
		return "redirect:/home";
	}
	
	@GetMapping("/view/category/{id}")
	public String viewCategory(@PathVariable("id") Long id, Model model) {
		Category category = categoryService.findCategoryByID(id);
		model.addAttribute("category", category);
		model.addAttribute("categoryInProduct", productService.findCategoryInProducts(category));
		model.addAttribute("categoryInNotProduct", productService.findCategoryNotInProducts(category));

		return "viewCategory.jsp";
	}

	@PostMapping("/category/join/{id}")
	public String submitCategoryJoin(@PathVariable("id") Long categoryId, @RequestParam(value="products" , required = false) Long productId, Model model) {
		if(productId == null) {
			Category category = categoryService.findCategoryByID(categoryId);
			model.addAttribute("category", category);
			model.addAttribute("categoryInProduct", productService.findCategoryInProducts(category));
			model.addAttribute("categoryInNotProduct", productService.findCategoryNotInProducts(category));
			model.addAttribute("errorMessage", "Your Submission was Invalid");
			return "viewCategory.jsp";
		}
		productService.addProductToCategory(categoryId, productId);
		return "redirect:/view/category/{id}";
	}

}
