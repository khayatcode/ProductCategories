package com.codingdojo.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Category;
import com.codingdojo.test.models.Product;
import com.codingdojo.test.repositories.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	// Find All
	public List<Category> findAllCategory(){
		return categoryRepo.findAll();
	}
	
	// Find One
	public Category findCategoryByID(Long id) {
		return categoryRepo.findById(id).orElse(null);
	}
	
	// Create or Update
	public Category createOrUpdateCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	// Delete
	public void deleteCategory(Long id) {
		categoryRepo.deleteById(id);
	}
	// Retrieves a list of all categories for a particular product
	public List<Category> findProductInCategories(Product product) {
		return categoryRepo.findAllByProducts(product);
	}

	// Retrieves a list of all categories for a particular product does not belong to

	public List<Category> findProductNotInCategories(Product product) {
		return categoryRepo.findByProductsNotContains(product);
	}
	
}
