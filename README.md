- Vật lý
- Công nghệ (Visualization)
- Hypervisor tạo ra Virtual Machine(), cho phép host Machine tạo ra nhiều môi trường
- Virtual Machine () là 1 file clone toàn bộ các thành phần của Physical Machine(máy tính vật lý)
* Nhược điểm
- Tốn tài nguyên(resource của Server), cấp 2G là dùng đúng 2G, mà các instance khác không thể truy cập vào được
- Vì chiếm 1 phần nên tạo không được nhiều
- Mất thời gian
- Khó quản lý với số lượng lớn
I- Docker
 - Server là 1 máy tính
 - Dùng tới đâu sẽ lấy tới đấy tới đấy(1 container được quản lý bới docker host, cung cấp 2G nhưng ko dùng hết 2G thì thằng Instansce khác vẫn có thể dùng tài nguyên đó)
 - Cài đặt nhanh chóng, dễ dàng.
 - Có thể cài đặt trên nhiều môi trường
 - Kích thước nhỏ nên rút ngắn thời gian khởi tạo
 - Linh động trong việc thay đổi môi trường
 - Chiếm ít tài nguyên (resource) của server nên có thể tạo nhiều Instance(máy ảo, giống với Visual Machine) hơn

 - Docker là nền tảng bao gồm các tính năng giúp người dùng có thể run build các service bằng các sử dụng container
 - Container là một phương pháp ảo hóa cho phép chạy các ứng dụng cô lập với nhau trên cùng một hệ điều hành chủ (host OS)
 - Mỗi container bao gồm mã nguồn, runtime, công cụ hệ thống, thư viện và các thiết lập cần thiết để chạy ứng dụng đó
 - Với container, bạn có thể đóng gói toàn bộ ứng dụng và các phụ thuộc của nó (Python, thư viện, MongoDB) vào một image. Sau đó, bạn có thể tạo một container từ image đó và chạy nó trên bất kỳ máy nào có Docker cài đặt, mà không cần phải cấu hình lại môi trường.

 II- Kiến trúc
 1. Docker
   - Infranstructure(Phần cứng) -> Host Operating System(Hệ điều hành chính) -> Docker -> (APP a, APP b, APP c)
 2. Virtual Machine
  - Infranstructure (Phần cứng) -> Hypervisor (ảo hóa, tạo ra các máy ảo) -> Virtual Machine (Guest Operating- hệ điều hành, App A)
  - Infranstructure và Hypervisor hoạt động độc lập với nhau
  - Hypervisor cài trước cả hệ điều hành
  - Hypervisor ảo hóa Infranstructure(phần cứng) cung cấp tài nguyên cho Virtual Machine (chiếm đúng cái tài nguyên đấy luôn(2G, 1 ram v.v))
3. Kiến trúc của Docker
  a- Client
    - Cung cấp chức năng thay đổi các thành phần như: Container, Image, Network,.... bằng RestAPI, Socket để giao tiếp với server
  b- Docker_Host(Server)
    - Nhận request từ client để thực thi và chứa các thành phần quan trọng Container, Image
    - Docker deamon: là 1 process(xử lý) deamon dùng để quản lý (create- tạo, remove- xóa, build- xây dựng) Container, Image
    => Request -> Docker_deamon (thực thi các request)
  c- Registry
    - Nơi lưu trữ và chia sẻ ImageImage 

  CLIENT(docker build, pull, run...) -> Docker deamon(Docker_Host) -> Image(Docker_Host, có thể chạy qua Registry) -> Container (Docker_Host)
4. Linux
  - Cấu trúc theo dạng câu điểm khởi đầu là / (root)
  * Thư mục:
    - /root: thư mục cao nhất và tất cả các file nằm trong thư mục này.
    - /bin: thư mục chứa các file thực thi dạng binary và cũng là các chương trình mà User sẽ sử dụng trong hệ thống.
    - /sbin: giống /bin, thường sẽ là các chương trình quan trọng trong hệ thống để thực thi phải là SuperUser (thường sẽ thấy trước câu lệnh syntax là "sudo, su, ..." ).
    - /etc: thư mục chứa file cấu hình chương trình hệ thống.
    - /mnt: thư mục chứa các file mount tạm thời của hệ thống.
    - /tmp: thư mục chứa các file tạm thời bởi hệ thống hoặc User. Các file trong thư mục này sẽ bị xóa khi hệ thống shutdown.
  * Các lệnh thường sử dụng trong Linux
    - ssh tên_user@địa_chỉ_IP : truy cập vào User mới

    - sudo su: quay trở lại user root.
    - sudo apt install ten_package: tải packakage cần thiết



    - (-rwxs----: owner-group-other, owner(r, w, không có x), group(x, s), other(ko có quyền gì))
    - r(đọc): 4
    - w(ghi): 2
    - x(thực thi): 1
    - start -c '%a" f.txt: kiểm tra quyền người dùng đối với 1 tập file (VD 644: Người dùng có quyền đọc ghi, các user khác có quyền đọc)
    - Nguời dùng có quyền r(đọc) thì có quyền sao chép tập tin, tập tin sau khi sao chép sẽ thuộc sở hữu của người sao chép


    - chmod: phân quyền người dùng
    - chmod 777: tất cả các user trong hệ thống đều có full permissions(read, write, execute)
    - chown(tên_user_trao quyền tên_file): trao quyền sở hữu cho User khác

    - cat: đọc file
    - vi: sửa file
    - exit: thoát

    - useradd: tạo user (VD: sudo(Super user) useradd test1)
    - passwd: cấp mật khẩu cho User (VD: sudo passwd test1)
    - useradd -m test1 : tạo phân vùng mới cho User

