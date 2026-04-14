➜  spring-hello-rest-maven-layered-upstream-exp ./run-all.sh      
=== Starting 10 Spring app instances sharing libjavabaselayer.so ===

  Started hello-english on port 8080 (PID 917696)
  Started hello-french on port 8081 (PID 917698)
  Started hello-german on port 8082 (PID 917700)
  Started hello-spanish on port 8083 (PID 917702)
  Started hello-italian on port 8084 (PID 917704)
  Started hello-japanese on port 8085 (PID 917706)
  Started hello-ukrainian on port 8086 (PID 917708)
  Started hello-portuguese on port 8087 (PID 917710)
  Started hello-korean on port 8088 (PID 917712)
  Started hello-swiss on port 8089 (PID 917717)

Waiting for all endpoints to come up...

All 10 app instances are running. Endpoints:
  curl http://127.0.0.1:8080/hello/english
  curl http://127.0.0.1:8081/hello/french
  curl http://127.0.0.1:8082/hello/german
  curl http://127.0.0.1:8083/hello/spanish
  curl http://127.0.0.1:8084/hello/italian
  curl http://127.0.0.1:8085/hello/japanese
  curl http://127.0.0.1:8086/hello/ukrainian
  curl http://127.0.0.1:8087/hello/portuguese
  curl http://127.0.0.1:8088/hello/korean
  curl http://127.0.0.1:8089/hello/swiss

Memory usage (refreshes every 10s). Press Ctrl+C to stop all apps.
  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37664 KB  (PID 917700)
  hello-spanish    110744 KB 37895 KB  (PID 917702)
  hello-italian    110668 KB 37833 KB  (PID 917704)
  hello-japanese   110796 KB 37888 KB  (PID 917706)
  hello-ukrainian  112544 KB 38125 KB  (PID 917708)
  hello-portuguese 112728 KB 38092 KB  (PID 917710)
  hello-korean     112216 KB 38131 KB  (PID 917712)
  hello-swiss      112092 KB 38001 KB  (PID 917717)
  TOTAL            1111668 KB 379553 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37664 KB  (PID 917700)
  hello-spanish    110744 KB 37896 KB  (PID 917702)
  hello-italian    110668 KB 37835 KB  (PID 917704)
  hello-japanese   110796 KB 37888 KB  (PID 917706)
  hello-ukrainian  112544 KB 38125 KB  (PID 917708)
  hello-portuguese 112728 KB 38095 KB  (PID 917710)
  hello-korean     112216 KB 38133 KB  (PID 917712)
  hello-swiss      112092 KB 38002 KB  (PID 917717)
  TOTAL            1111668 KB 379562 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38071 KB  (PID 917696)
  hello-french     109376 KB 37849 KB  (PID 917698)
  hello-german     108800 KB 37662 KB  (PID 917700)
  hello-spanish    110744 KB 37893 KB  (PID 917702)
  hello-italian    110668 KB 37833 KB  (PID 917704)
  hello-japanese   110796 KB 37885 KB  (PID 917706)
  hello-ukrainian  112544 KB 38121 KB  (PID 917708)
  hello-portuguese 112728 KB 38090 KB  (PID 917710)
  hello-korean     112216 KB 38131 KB  (PID 917712)
  hello-swiss      112092 KB 38000 KB  (PID 917717)
  TOTAL            1111668 KB 379535 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38073 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37665 KB  (PID 917700)
  hello-spanish    110744 KB 37897 KB  (PID 917702)
  hello-italian    110668 KB 37835 KB  (PID 917704)
  hello-japanese   110796 KB 37891 KB  (PID 917706)
  hello-ukrainian  112544 KB 38124 KB  (PID 917708)
  hello-portuguese 112728 KB 38095 KB  (PID 917710)
  hello-korean     112216 KB 38134 KB  (PID 917712)
  hello-swiss      112092 KB 38003 KB  (PID 917717)
  TOTAL            1111668 KB 379569 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38075 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37666 KB  (PID 917700)
  hello-spanish    110744 KB 37898 KB  (PID 917702)
  hello-italian    110668 KB 37836 KB  (PID 917704)
  hello-japanese   110796 KB 37890 KB  (PID 917706)
  hello-ukrainian  112544 KB 38126 KB  (PID 917708)
  hello-portuguese 112728 KB 38094 KB  (PID 917710)
  hello-korean     112216 KB 38134 KB  (PID 917712)
  hello-swiss      112092 KB 38004 KB  (PID 917717)
  TOTAL            1111668 KB 379575 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38071 KB  (PID 917696)
  hello-french     109376 KB 37849 KB  (PID 917698)
  hello-german     108800 KB 37663 KB  (PID 917700)
  hello-spanish    110744 KB 37893 KB  (PID 917702)
  hello-italian    110668 KB 37833 KB  (PID 917704)
  hello-japanese   110796 KB 37886 KB  (PID 917706)
  hello-ukrainian  112544 KB 38120 KB  (PID 917708)
  hello-portuguese 112728 KB 38092 KB  (PID 917710)
  hello-korean     112216 KB 38131 KB  (PID 917712)
  hello-swiss      112092 KB 38001 KB  (PID 917717)
  TOTAL            1111668 KB 379539 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37664 KB  (PID 917700)
  hello-spanish    110744 KB 37896 KB  (PID 917702)
  hello-italian    110668 KB 37834 KB  (PID 917704)
  hello-japanese   110796 KB 37892 KB  (PID 917706)
  hello-ukrainian  112544 KB 38124 KB  (PID 917708)
  hello-portuguese 112728 KB 38093 KB  (PID 917710)
  hello-korean     112216 KB 38139 KB  (PID 917712)
  hello-swiss      112092 KB 38002 KB  (PID 917717)
  TOTAL            1111668 KB 379568 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37664 KB  (PID 917700)
  hello-spanish    110744 KB 37896 KB  (PID 917702)
  hello-italian    110668 KB 37836 KB  (PID 917704)
  hello-japanese   110796 KB 37891 KB  (PID 917706)
  hello-ukrainian  112544 KB 38124 KB  (PID 917708)
  hello-portuguese 112728 KB 38094 KB  (PID 917710)
  hello-korean     112216 KB 38138 KB  (PID 917712)
  hello-swiss      112092 KB 38003 KB  (PID 917717)
  TOTAL            1111668 KB 379570 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37851 KB  (PID 917698)
  hello-german     108800 KB 37663 KB  (PID 917700)
  hello-spanish    110744 KB 37895 KB  (PID 917702)
  hello-italian    110668 KB 37835 KB  (PID 917704)
  hello-japanese   110796 KB 37888 KB  (PID 917706)
  hello-ukrainian  112544 KB 38123 KB  (PID 917708)
  hello-portuguese 112728 KB 38092 KB  (PID 917710)
  hello-korean     112216 KB 38135 KB  (PID 917712)
  hello-swiss      112092 KB 38002 KB  (PID 917717)
  TOTAL            1111668 KB 379556 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37852 KB  (PID 917698)
  hello-german     108800 KB 37663 KB  (PID 917700)
  hello-spanish    110744 KB 37896 KB  (PID 917702)
  hello-italian    110668 KB 37835 KB  (PID 917704)
  hello-japanese   110796 KB 37889 KB  (PID 917706)
  hello-ukrainian  112544 KB 38123 KB  (PID 917708)
  hello-portuguese 112728 KB 38093 KB  (PID 917710)
  hello-korean     112216 KB 38135 KB  (PID 917712)
  hello-swiss      112092 KB 38001 KB  (PID 917717)
  TOTAL            1111668 KB 379559 KB

  APP                   RSS      PSS PID
  hello-english    111704 KB 38072 KB  (PID 917696)
  hello-french     109376 KB 37850 KB  (PID 917698)
  hello-german     108800 KB 37663 KB  (PID 917700)
  hello-spanish    110744 KB 37896 KB  (PID 917702)
  hello-italian    110668 KB 37834 KB  (PID 917704)
  hello-japanese   110796 KB 37887 KB  (PID 917706)
  hello-ukrainian  112544 KB 38124 KB  (PID 917708)
  hello-portuguese 112728 KB 38093 KB  (PID 917710)
  hello-korean     112216 KB 38135 KB  (PID 917712)
  hello-swiss      112092 KB 38000 KB  (PID 917717)
  TOTAL            1111668 KB 379554 KB

^C
Stopping all apps...

Stopping all apps...