# reviewsテーブルのダミーデータ生成関数
def create_reviews(num_reviews=100, product_ids=None, user_ids=None):
    reviews_data = []
    
    for review_id in range(1, num_reviews+1):
        product_id = random.choice(product_ids)
        user_id = random.choice(user_ids)
        review_content = fake.text()
        stars = random.randint(1, 5)
        post_date = fake.date_between(start_date='-1y', end_date='today')
        
        reviews_data.append([review_id, product_id, user_id, review_content, stars, post_date])
        
    return pd.DataFrame(reviews_data, columns=["review_id", "product_id", "user_id", "review_content", "stars", "post_date"])

# reviewsテーブルのダミーデータを生成
reviews_df = create_reviews(product_ids=products_df.index+1, user_ids=range(1, 112))
reviews_df.head()
