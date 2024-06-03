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

