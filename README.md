# WEB課題

## DEMO
URL: https://profile-prototype.herokuapp.com

URL(user example): https://profile-prototype.herokuapp.com/users/1/profile
スキルボタンをクリックすることで+1することが出来る

## 仕様


### 必須

- [x] スキルは、自分に追加することができる。
- [x] 他のユーザのプロフィールページで、その人にスキルを新しく追加することができる。また、既に追加されているスキルに+1することができる。
- [x] プロフィールでは+1された回数が表示されていて、+1が多い順に表示されている。
- [x] N+1問題が発生しないようにする。
- [x] 動作確認のため、Herokuなどを利用し、パブリックな環境にdeployしてください。

### オプショナル

余裕があれば以下にも挑戦してください。

- [ ] JavaScriptで、スキルの追加時などにページ全体の再読み込みが発生しないUIをつくる。
- [ ] +1の回数が多い上位6件は、それぞれ最大10人まで+1した人が表示されている。
- [ ] 他の人につけた+1をキャンセルすることができる。
- [ ] 他の人が自分につけたスキルを隠す/消すことができる。
- [ ] 同じスキルが付いている人の一覧を見ることができる。
- [ ] スキルの追加時にautocompleteでスキル名が補完されるUI。
