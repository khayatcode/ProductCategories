package com.codingdojo.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Category;
import com.codingdojo.test.models.Product;
import com.codingdojo.test.repositories.CategoryRepository;
import com.codingdojo.test.repositories.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	// Find All
	public List<Product> findAllProduct(){
		return productRepo.findAll();
	}
	
	// Find One By ID
	public Product findProductByID(Long id) {
		return productRepo.findById(id).orElse(null);
	}
	
	// Create or Update
	public Product createOrUpdateProduct(Product product) {
		return productRepo.save(product);
	}
	
	// Delete
	
	public void deleteProduct(Long id) {
		productRepo.deleteById(id);
	}
	
	public void addProductToCategory(Long categoryId, Long productId) {
		Category thisCategory = categoryRepo.findById(categoryId).orElse(null);
		Product thisProduct = productRepo.findById(productId).orElse(null);
		
		if(thisCategory != null && thisProduct != null) {
			thisProduct.getCategories().add(thisCategory);
			
			productRepo.save(thisProduct);
		}
	}

	public List<Product> findCategoryInProducts(Category category) {
		return productRepo.findAllByCategories(category);
	}

	public List<Product> findCategoryNotInProducts(Category category) {
		return productRepo.findByCategoriesNotContains(category);
	}
	

}
