# cartsテーブルのダミーデータ生成関数
def create_carts(num_carts=100, product_ids=None, user_ids=None):
    carts_data = []
    
    for cart_id in range(1, num_carts+1):
        user_id = random.choice(user_ids)
        product_id = random.choice(product_ids)
        quantity = random.randint(1, 10)
        
        carts_data.append([cart_id, user_id, product_id, quantity])
        
    return pd.DataFrame(carts_data, columns=["cart_id", "user_id", "product_id", "quantity"])

# cartsテーブルのダミーデータを生成
carts_df = create_carts(product_ids=products_df.index+1, user_ids=range(1, 112))
carts_df.head()
