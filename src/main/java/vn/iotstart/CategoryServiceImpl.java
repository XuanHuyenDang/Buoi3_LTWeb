package vn.iotstart;

import java.io.File;
import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDAO categoryDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void edit(Category newCategory) {
        Category oldCategory = categoryDao.get(newCategory.getCateid());
        if (oldCategory != null) {
            oldCategory.setCatename(newCategory.getCatename());
            if (newCategory.getIcon() != null && !newCategory.getIcon().isEmpty()) {
                // Delete old image file if it exists
                String fileName = oldCategory.getIcon();
                if (fileName != null && !fileName.isEmpty()) {
                    final String dir = "D:\\upload";
                    File file = new File(dir + "\\category\\" + fileName);
                    if (file.exists()) {
                        try {
                            if (file.delete()) {
                                System.out.println("Deleted old icon file: " + file.getAbsolutePath());
                            } else {
                                System.err.println("Failed to delete old icon file: " + file.getAbsolutePath());
                            }
                        } catch (SecurityException e) {
                            System.err.println("Security exception while deleting file: " + e.getMessage());
                        }
                    }
                }
                oldCategory.setIcon(newCategory.getIcon());
            }
            categoryDao.edit(oldCategory);
        }
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDao.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDao.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public List<Category> search(String catename) {
        return categoryDao.search(catename);
    }
}