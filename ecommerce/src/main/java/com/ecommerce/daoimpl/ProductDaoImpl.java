package com.ecommerce.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecommerce.dao.Iproductdao;
import com.ecommerce.model.Product;
import com.google.gson.Gson;

@Repository
public class ProductDaoImpl implements Iproductdao {

	ProductDaoImpl()
	{
		System.out.println("Hello From DAO");
	}
	
	@Autowired
	SessionFactory sessionFactory;
	
	public void insertProduct(Product prod)
	{
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		session.save(prod);
		t.commit();
		session.close();
		System.out.println("Session Closed");
	}
	
	public int getID()
	{
		Session session = sessionFactory.openSession();
		Object obj = session.createQuery("select max(productId) FROM Product").uniqueResult();
		if( obj == null)
		{
			obj = 1;
		}
		Integer id = (Integer)obj;
		int idToReturn = id.intValue();
		session.close();
		return idToReturn;
	}

	public String getProductBySupplier(int id) {
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Query qry = session.createQuery("FROM Product p WHERE p.productSupplierId=:id ");
		qry.setParameter("id", id);
		List productList = (List)qry.list();
		
		Gson gson = new Gson();
		String productInJson = gson.toJson(productList);
		t.commit();
		session.close();
		return productInJson;
	
	}

	public String getProductInfo(int id) {
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		Query qry = session.createQuery("From Product p where p.productId=:id");
		qry.setParameter("id", id);
		Object o = qry.uniqueResult();
		if( o == null)
		{
				System.out.println("No Product found with id "+id);
		}
		Product product = (Product)o;
			
		Gson gson = new Gson();
		String productDetails = gson.toJson(product);
		session.close();
		
		return productDetails;
	}

	public void updateProduct(Product prod) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		session.update(prod);
		t.commit();
		session.close();
	}

	public void deleteProduct(int id) {
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Product ProductCobj = (Product)session.get(Product.class, id);
		session.delete(ProductCobj);
		t.commit();
		session.close();

	}

	public String getAllProduct() {
	
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product");
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String listOfProduct = gson.toJson(list);
		session.close();
		return listOfProduct;
		
	}

	public String getDemandedProduct(String category, String forWhom) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("FROM Product p WHERE p.productCategory=:cat AND p.productSex=:forWhom");
		qry.setParameter("cat", category);
		qry.setParameter("forWhom", forWhom);
		List prodList = (List)qry.list();
		
		Gson gson = new Gson();
		String productList = gson.toJson(prodList);
		session.close();
		return productList;
		
	}

	public String getAllBrands() {
	
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("select distinct p.productBrand from Product p" );
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String listOfBrands = gson.toJson(list);
		session.close();
		return listOfBrands;
	}

	public String getDemandedProduct(String string, String string2, String string3) {
		
		System.out.println(string + ""+ string2+""+ string3);
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p Where p.productCategory=:category And (p.productSex=:string2 Or p.productSex=:string3) ");
		qry.setParameter("category", string);
		qry.setParameter("string2", string2);
		qry.setParameter("string3", string3);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String prodList = gson.toJson(list);
		
		System.out.println("Hehehehehhe" + prodList);
		session.close();
		return prodList;
	}

	public String getAllProductsByNameAndBrand() {
		
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("SELECT p.productId, p.productBrand, p.productName FROM Product p");
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String completeList = gson.toJson(list);
		session.close();
		return completeList;
	}

	public String getProductByForCategoryBrand(String forWhom, String cat, String brand) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p where p.productCategory=:cat AND p.productSex=:forWhom AND p.productBrand=:brand");
		qry.setParameter("cat", cat);
		qry.setParameter("forWhom", forWhom);
		qry.setParameter("brand", brand);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String prodList = gson.toJson(list);
		session.close();
		return prodList;
	}

	public String getProductByCategoryAndBrand(String cat, String brand) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p where p.productBrand =:brand AND p.productCategory=:cat");
		qry.setParameter("brand", brand);
		qry.setParameter("cat", cat);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String productList = gson.toJson(list);
		session.close();
		return productList;
		
	}

	public String getProductByBrandAndForWhom(String brand, String forWhom) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p Where p.productBrand=:brand AND p.productSex=:forWhom ");
		qry.setParameter("brand", brand );
		qry.setParameter("forWhom" , forWhom);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String productList = gson.toJson(list);
		session.close();
		return productList;
	}

	public String getProductByBrand(String brand) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p where p.productBrand=:brand");
		qry.setParameter("brand", brand);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String productList = gson.toJson(list);
		session.close();
		return productList;
	}

	public String getProductByCategory(String cat) {
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p where p.productCategory=:cat");
		qry.setParameter("cat", cat);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String productList = gson.toJson(list);
		session.close();
		return productList;
	}

	public String getProductForWhom(String forWhom) {
	
		Session session = sessionFactory.openSession();
		Query qry = session.createQuery("From Product p where p.productSex=:forWhom");
		qry.setParameter("forWhom", forWhom);
		List list = (List)qry.list();
		
		Gson gson = new Gson();
		String productList = gson.toJson(list);
		session.close();
		return productList;
		
	}

	
	
	
	
}
