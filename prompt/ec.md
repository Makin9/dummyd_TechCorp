#はじめに
現在、ダミーデータの作成をしようと思っています。
ただ、自分で作成するには無理があります。
でも、あなたならそれができます。期待していますし、助けてほしいです。
できますか？

#メインタスク
- ダミーデータの作成

##Input
コチラからのインプットは以下です。
- ダミーデータの背景ストーリー
- ダミーデータの作成時のルール
- ダミーデータのデータモデル（DDL）

##Output
- 全てのデータモデルについてダミーデータを作成してください(csv形式)
- 1つのデータモデルごとに行数を指定します。
- データ生成後、ルールに対する自己評価・採点をしてください。
 
### ダミーデータの背景ストーリー
TechCorpの総合ストーリー

TechCorpは仮想企業です。
TechCorpは、B2C向けのECサイトとして業界に登場し、迅速にリーディングカンパニーとしての地位を築き上げました。この成功を基に、オンラインでの決済の利便性を追求するために「QR決済」と「クレジットカード」サービスを展開しました。これにより、オンラインでの購入がよりスムーズになりました。さらに、顧客のロイヤリティを高めるために「ポイントカード」サービスを開始。顧客の購入毎にポイントが蓄積され、それを次回の購入時に利用することができる仕組みを取り入れました。さらに、オフラインの店舗でも購入の手間を減らすための「モバイルオーダー」サービスを立ち上げました。

TechCorpは、顧客からの口コミやフィードバックを重要視しています。そのため、ECサイト上で商品に対する評価やコメントを投稿することができる機能を提供しており、これにより商品の品質向上や新商品の提案などに役立てています。また、インサイドセールスチームが存在し、大口顧客や新規顧客へのアプローチを行っています。アフィリエイトやパートナーシップを通じて新規トラフィックの獲得にも努めています。これらの営業・マーケティング活動は、CRMツールであるSalesforceを活用して一元管理されています。

### ダミーデータの作成時のルール
以下ルールを考慮してダミーデータを生成してください。
また、ダミーデータ生成時、テーマ（季節性・時事性）を提示してください。

1. **ユーザーIDは1~500で**
2. **ユーザーの繰り返し行動**
3. **nameなど名前については想像でいいので具体的に**
4. **プロダクトやユーザ、キャンペーンなどは通年を想定し、ランダム性を持たせ、一意にすること**
5. **時系列的なデータに対しては季節性の考慮する**
6. **時事的な要素**
7. **データの整合性**
8. **ランダム性の導入**
9.  **特定の日付の考慮**
10. **データの量**
11. **各テーブルのINDEX(ID)は連番にする**
12. **データ間の整合性を保つ**
13. **他のテーブルのIDを参照する場合、IDの組み合わせはランダムにする**


### ダミーデータのデータモデル（DDL）

~~~
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    store_id INT REFERENCES stores(store_id),
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(255),
    image_url TEXT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shipping_fee DECIMAL(10,2)
);

CREATE TABLE order_details (
    orderd_id SERIAL PRIMARY KEY, 
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    user_id INT REFERENCES users(user_id),
    review_content TEXT,
    stars INT CHECK (stars BETWEEN 1 AND 5),
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE carts (
    cart_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL
);

CREATE TABLE product_views (
    view_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    view_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    recommended_product_id INT REFERENCES products(product_id)
);

CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE user_behaviors (
    behavior_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    behavior_type VARCHAR(255) NOT NULL, -- 例: 'click', 'like', 'wishlist_add', 'cart_add'
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    can_qr_payment BOOLEAN,
    can_mobile_order BOOLEAN
);

-- GAを参照してデータを保存する
CREATE TABLE ga_sessions (
    session_id VARCHAR(255) PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    session_start TIMESTAMP NOT NULL,
    session_end TIMESTAMP NOT NULL,
    source VARCHAR(255),
    medium VARCHAR(255),
    device_category VARCHAR(50)
);

-- GAを参照してデータを保存する
CREATE TABLE ga_pageviews (
    view_id SERIAL PRIMARY KEY,
    session_id VARCHAR(255) REFERENCES ga_sessions(session_id),
    page_path TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    product_id INT REFERENCES products(product_id)
);

~~~


### ダミーデータのデータモデルごとの必要行数
- products : 300
- orders : 1000
- order_details : 1000
- reviews : 1000
- carts : 2000
- product_views : 3000
- recommendations : 3000
- campaigns : 500
- user_behaviors : 5000
- stores : 100
- ga_sessions : 5000
- ga_pageviews : 5000

### 少し多いので
度の順番で生成すべきか整理いただき、5回に分けて実施していきましょう
ワンステージ終わるごとに確認いただいてもいいですか？
userテーブルについては別で既にあります