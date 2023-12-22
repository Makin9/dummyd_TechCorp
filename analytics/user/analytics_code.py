import pandas as pd

# ユーザーデータのファイルを読み込む
user_data_path = '/mnt/data/users.csv'
user_data = pd.read_csv(user_data_path)

# データの最初の数行を表示して内容を確認
print(user_data.head())


import datetime as dt

# データの基本統計情報とデータ型の確認
basic_info = user_data.describe(include='all')
data_types = user_data.dtypes

# 欠損値の確認
missing_values = user_data.isnull().sum()

# 現在の日付を取得
current_date = dt.datetime.now()

# 生年月日から年齢を計算
user_data['birth_date'] = pd.to_datetime(user_data['birth_date'], errors='coerce')
user_data['age'] = user_data['birth_date'].apply(lambda x: current_date.year - x.year if pd.notnull(x) else None)

# 年齢分布の確認
age_distribution = user_data['age'].describe()

# 登録日の時系列分析のための準備
user_data['registration_date'] = pd.to_datetime(user_data['registration_date'], errors='coerce')
registration_date_distribution = user_data['registration_date'].describe(datetime_is_numeric=True)

basic_info, data_types, missing_values, age_distribution, registration_date_distribution
