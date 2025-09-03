package vn.iotstart;

import java.util.List;

public interface CategoryDAO {
	Category get(String name);

	Category get(int id);

	List<Category> search(String keyword);

	List<Category> getAll();

	void insert(Category category);

	void edit(Category category);

	void delete(int id);
	List<Category> getByUserId(int userId);
}