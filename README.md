# MobileProject
## Ứng dụng MetaMask
Ứng dụng được phát triển trên Flutter với ngôn ngữ Dart, mô phỏng lại một số chức năng của ví MetaMask

### Cài đặt
1. Clone repo:
    ```
    git clone https://github.com/HoangDinh161/MobileProject
    ```
2. Cài đặt Flutter và Android Studio theo hướng dẫn trên trang chủ [Flutter](https://docs.flutter.dev/get-started/install)
3. Vì project có cài nhiều loại package nên khi cài đặt trước khi chạy thì thêm  args '--no-sound-null-safety' để run app.Run app tại file main.dart.

### Test
Link test project: [Test](https://github.com/HoangDinh161/MobileProject/tree/main/metamask_project/test)

### Demo app:
Trang bắt đầu khi khởi động App:

![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(337).png)
#### Tạo ví mới:
Tại trang bắt đầu bấm chọn “Create a new wallet”. Các màn hình dưới lần lượt thực hiện hiện theo thứ tự:
![EnterPasswprd](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(338).png)
![Confirm](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(345).png)
![Generatephrase](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(339).png)
![ConfirmPhrase](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(340).png)

Sau khi hoàn tất việc tạo mật khẩu, xác nhận 12 phrase trên, nhấn Continue mỗi bước, và sau khi xác nhận đã hợp lệ, ứng dụng chuyển đến màn hình Home:


![Home](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(341).png)
#### Nhập ví:
Tại trang bắt đầu, nhấn chọn Import wallet, sau đấy nhập đủ thông tin của các ô (12 phrase đã cung cấp từ lần đầu tiên tạo ví, và mật khẩu đã tạo trước đó), và nhấn Import:

![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(346).png)
#### Thêm Token:
Tại màn hình Home, nhấn chọn “Import Tokens”, tìm kiếm tọken muốn thêm, nhấn chọn token đó và nhấn Import.
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(342).png)
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(343).png)
#### Mua Token:
Tại trang Home, bấm button “Buy” trên menu. Tại trang Purchase, nhấn chọn “Buy”. Tiếp theo, chọn Token muốn mua và số lượng mong muốn và nhấn “Buy”.

![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(331).png)
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(332).png)

Sau khi hoàn thất, app sẽ quay về màn hình chính.
#### Thực hiện giao dịch
Chọn button Send tại màn hình chính. Nhập các thông tin cần thiết: địa chỉ người nhận, token muốn chuyển và số lượng.
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(334).png)
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(335).png)
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(336).png)
#### Xem Lịch sử giao dịch:
Tại màn hình chính, bấm vào menu tại góc bên trái, chọn Activity để xem lịch sử giao dịch.
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/Screenshot%20(347).png)
![](https://github.com/HoangDinh161/MobileProject/blob/2ecb9407677ce2d1514a994a06b46df50024d3d7/metamask_project/assets/demopic/transactionsimage.png)
