# sacloud-gitops-template

> **⚠️ このリポジトリはテンプレートです。必ず `Use this template` からご自身のリポジトリを作成して利用してください。**

GitHub Actions 上で Terraform を実行し、  
さくらのクラウドを GitOps で管理するためのテンプレートリポジトリです。

---

## 利用方法

### 1. テンプレートリポジトリからリポジトリを作成
`Use this template` → `Create a new repository` を選択しリポジトリを作成します。  
`Choose visibility` は **Private** が推奨です。

---

### 2. シークレット・変数の設定

Terraform の実行に必要な環境変数を設定します。  
作成したリポジトリの **Settings → Secrets and variables → Actions** から  
`Repository Secrets & Variables` にシークレットと変数を設定します。

- https://docs.github.com/ja/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets  
- https://docs.github.com/ja/actions/how-tos/write-workflows/choose-what-workflows-do/use-variables  

#### Secrets
| 環境変数                                  | 値                                                       |
|---------------------------------------|---------------------------------------------------------|
| SAKURACLOUD_STORAGE_ACCESS_KEY_ID     | さくらのクラウド オブジェクトストレージのアクセスキー ID     |
| SAKURACLOUD_STORAGE_SECRET_ACCESS_KEY | さくらのクラウド オブジェクトストレージのシークレットアクセスキー |
| SAKURACLOUD_ACCESS_TOKEN              | さくらのクラウド API キーのアクセストークン                 |
| SAKURACLOUD_ACCESS_TOKEN_SECRET       | さくらのクラウド API キーのアクセストークンシークレット       |

#### Variables
| 環境変数             | 値    | 説明                |
|------------------|------|-------------------|
| SAKURACLOUD_ZONE | is1b | リソースの作成先ゾーン |

---

### 3. Terraform Backend の S3 バケット名を変更

`./terraform/provider.tf` 内の `bucket = "sacloud-terraform"` を、  
ご自身の利用するバケット名に変更してください。

変更後、Push → Pull Request → マージします。

```shell
git checkout -b feat/change-bucket-name
# edit provider.tf
git add provider.tf
git commit -m "Change bucket name"
git push origin feat/change-bucket-name
