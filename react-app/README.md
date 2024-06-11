A- HỆ ĐIỀU HÀNH
  - Là phần trung gian giao tiếp giữa người dùng và phần cứng
  - Hardware(Phần cứng) <-> Operating system(Lớp trung gian) <-> Application(Ứng dụng) <-> User(Người dùng)
B- HỆ ĐIỀU HÀNH LINUX
- Vật lý
- Công nghệ (Visualization)
- Hypervisor tạo ra Virtual Machine(), cho phép host Machine tạo ra nhiều môi trường
- Virtual Machine () là 1 file clone toàn bộ các thành phần của Physical Machine(máy tính vật lý)
* Nhược điểm
- Tốn tài nguyên(resource của Server), cấp 2G là dùng đúng 2G, mà các instance khác không thể truy cập vào được
- Vì chiếm 1 phần nên tạo không được nhiều
- Mất thời gian
- Khó quản lý với số lượng lớn
1. Linux
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
    - Nơi lưu trữ và chia sẻ Image

  CLIENT(docker build, pull, run...) -> Docker deamon(Docker_Host) -> Image(Docker_Host, có thể chạy qua Registry) -> Container (Docker_Host)
4. Các thành phần trong docker
 a. Các thành phần trong Docker
    - Container: là một instansce được tạo ra từ Image. Container sẽ package source code, dependency từ đó có thể run app
      * Bao gồm: Source code, Dependency & Configuration, Bin/libs
      * Có thể chạy được ở nhiều môi trường
    
    - Image: là một template chỉ dẫn và các thiết lập cần thiết để tạo ra Container. Một Image có thể được tạo ra dựa trên 1 Image khác có sẵn.  - Image được tạo ra bới Dockerfile
    - Image chỉ có thể đọc không thể thay đổi
    - Image được tạo thành từ nhiều Image Layer khác nhau theo dạng Stack và từng Layer xếp trồng lên nhau
    - Image gốc được gọi là Base Image
    - Các Image Layer chỉ read không write
    - Khi tạo Container từ Image thì Container có thể write

    - Dockerfile là các file chứa các câu lệnh hướng dẫn và các thiết lập cần thiết
    - Từ Dockerfile có thể build thành Image
    - Cache Layer: khi Dockker phát hiện 1 Layer có sự thay đổi, thì Docker chỉ Run Layer đó, những Layer khác không cần run lại mà chỉ sử dụng cache trước đó
    - Một Layer xếp bên trên thay đổi thì toàn bộ Layer xếp bên dưới cũng được build lại theo
    - Một Layer xếp trước đó thay đổi, khi build lại các Layer phía sau sẽ phải build lại

    - Form được sử  dụng để build Image từ 1 Image chỉ định
    - Là Instruction khai báo đầu tiên trong Dockerfile
    - Trong 1 Dockerfile có thể có nhiều From Instruction để tạo nhiều Image
    - Form cuối cùng của file sẽ được lưu lại, còn phía trên sẽ được clear đi

    - Argument là instruction duy nhất đừng trước From
    - Có thể khai báo nhiều ARG trong 1 Dockerfile
    - Dùng để tạo ARG trong quá trình build Image

    - ENV dùng để khai báo biến môi trường khi Build Image và sử dụng trong Container
    - Có thể khai báo nhiều ENV trông một Dockerfile
    - Sử dụng trong khi Container Running

    - METADATA

    - Các câu lệnh
      * RUN: chạy các câu lệnh được khai báo trong quá trình build Image
      * CMD: dùng thể thực thi các câu lệnh khai báo. Instruction này sẽ Set câu lệnh thực thi mặc định cho Container, câu lệnh chỉ được thực thi 1 lần duy nhât
      * ENTRYPOINT: dùng để thực thi các câu lệnh khai báo và sẽ chỉ thực thi một lần duy nhất khi RUN
      * ADD: dùng để copy file hoăcj thư mục từ source đến destination của Container
      * COPY: giống ADD
                                    ADD                          COPY
      có thể copy                   Y                             Y
      copy từ local                 Y                             Y
      copy tuẻ URL remote           Y                             N
      Cache Layer                   N                             Y

      * EXPOSE: dùng để chỉ định Port được mở từ Container, mở cổng theo đạng TCP hoặc UDP, mặc định là TCP
      * WORKDIR: di chuyển thư mục, có thể khai báo nhiều trong Dockerfile, thường khai báo kèm với instruction RUN COPY
      * USER: set USER mặc định trong quá trình build Image, USER cực kì quan trọng trong vấn đề SECURE, những instruction như RUN sẽ sử dụng USER để cấp quyền execute command
    
    - Thành phần trong Docker
      - Network: là thành phần thiết lập mạng cho Container. Giúp các Container có thể giao tiếp với nhau
      - Volume: là một nơi lưu trữ và sử dụng để backup và migrate data của Container
      - Mount: VD: map data từ host Machine sang Container

    - docker ps: list ra danh sách các docker đang chạy
    - docker stop ten_container: dừng một container đang chạy
    - docker container rm tên_container : xóa container

    - docker images: kiểm tra toàn bộ docker images
    - docker image rm image_Id : xoá images
    - docker image | grep ten_image : tìm image 
    - docker images | Select-String ten_image: giống  với grep (PowerShell window)

    - docker run -it -d --name nginx_1 nginx : đặt tên cho container + run container
    -  docker run -it -d -p 80:80 --name nginx_1 nginx: map port mới không dùng port mặc định của docker

    - docker run --name some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql: chaỵ run mysql
    - docker container rm -f some-mysql: xoá khi container đang chạy, không cần stop
    - docker ps -a: lấy ra toàn bộ chương trình đã chạy
    - docker container start nginx_1: start container
    - docker exec -it nginx_1 /bin/bash : truy cập vào nginx

    - docker network list: danh sach cac netword dang co

    - apt-get update : update container
    - apt-get install iputils-ping -y: tải các option liên quan

    - docker inspect nginx_2: lấy các thành phần bên trong của container
    - ping dia_chi_ip : kết nối đến nginx_2 trong cùng 1 network thì mới có thẻ giao tiếp cùng nhau
    - docker network disconnect bridge ten_container : disconnect container 

    - docker network create n-nginx: tạo mới một network
    - docker network connect n-nginx nginx_1: connect 2 container lại với nhau

    - volume, bindmount tmps
    - Volume thích hợp cho việc lưu trữ dữ liệu lâu dài và chia sẻ giữa các container.
    - Bind mount cho phép truy cập trực tiếp vào dữ liệu từ hệ thống file của máy chủ.
    - Tmpfs mount thích hợp cho dữ liệu tạm thời cần hiệu suất cao và không cần lưu trữ lâu dài.


    -  mkdir data: tạo thư mục mới

    - docker run -it -d --name nginx -v ./data:/var/log nginx : v ./data:/var/log: Tạo một bind mount, gắn kết thư mục ./data trên máy chủ (host) vào thư mục /var/log trong container.

    - docker run: tạo mới + chạy container
    - docker start: chạy một container đã dừng 
    



 b. Docker Hub
