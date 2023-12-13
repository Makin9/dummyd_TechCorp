from datetime import timedelta, datetime

# ordersテーブルとorder_detailsテーブルのダミーデータ生成関数
def create_orders_and_details(num_orders=100, product_ids=None):
    orders_data = []
    order_details_data = []
    
    for order_id in range(1, num_orders+1):
        user_id = random.randint(1, 111)
        order_date = fake.date_between(start_date='-1y', end_date='today')
        shipping_fee = round(random.uniform(5, 20), 2)
        
        orders_data.append([order_id, user_id, order_date, shipping_fee])
        
        num_products_in_order = random.randint(1, 5)
        for _ in range(num_products_in_order):
            product_id = random.choice(product_ids)
            quantity = random.randint(1, 10)
            price = round(random.uniform(1, 1000), 2)  # 仮の価格
            order_details_data.append([order_id, product_id, quantity, price])
            
    orders_df = pd.DataFrame(orders_data, columns=["order_id", "user_id", "order_date", "shipping_fee"])
    order_details_df = pd.DataFrame(order_details_data, columns=["order_id", "product_id", "quantity", "price"])
    
    return orders_df, order_details_df

# ordersテーブルとorder_detailsテーブルのダミーデータを生成
orders_df, order_details_df = create_orders_and_details(product_ids=products_df.index+1)
orders_df.head(), order_details_df.head()
