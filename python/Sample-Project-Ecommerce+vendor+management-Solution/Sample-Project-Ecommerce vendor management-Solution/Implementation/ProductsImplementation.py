from Abstractions.Products import Products
from Models.ProductModel import ProductModel
from Models.VendorSessionModel import VendorSessionModel


class ProductsImplementation(Products):

    def __init__(self, username):
        self.product_model = ProductModel()
        self.vendor_session = VendorSessionModel()
        self._username = username

    def add_product(self, product_name, product_type, available_quantity, unit_price):
        if not self.vendor_session.check_login(self._username):
            print("Please signup or login first.")
            return False
        
        self.product_model.add_product(product_name, product_type, available_quantity, unit_price)
        print(product_name + " added successfully!")
        return True
            
    def search_product_by_name(self, product_name):
        if not self.vendor_session.check_login(self._username):
            print("Please signup or login first.")
            return False

        retrieved_product = self.product_model.search_product(product_name)
        return retrieved_product


    def get_all_products(self):
        if not self.vendor_session.check_login(self._username):
            print("Please signup or login first.")
            return False

        products = self.product_model.all_products()
        return products

