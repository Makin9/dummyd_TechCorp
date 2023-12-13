import random
import pandas as pd
from faker import Faker

# Faker インスタンスの生成
fake = Faker()

# productsテーブルのダミーデータ生成関数
def create_products(num_rows=100):
    products_data = []
    categories = ["Electronics", "Furniture", "Clothing", "Food"]
    
    for _ in range(num_rows):
        product_name = fake.word().capitalize()
        price = round(random.uniform(1, 1000), 2)
        category = random.choice(categories)
        image_url = f"https://example.com/images/{product_name}.jpg"
        
        products_data.append([product_name, price, category, image_url])
        
    return pd.DataFrame(products_data, columns=["product_name", "price", "category", "image_url"])

# productsテーブルのダミーデータを生成
products_df = create_products()
products_df.head()
