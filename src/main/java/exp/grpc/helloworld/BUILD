java_binary(
    name = "hello_client",
    srcs = ["HelloWorldClient.java"],
    main_class = "exp.grpc.helloworld.HelloWorldClient",
    deps = [
        "//protos:protos_java",
        "//libs:jars",
    ],
)

java_binary(
    name = "hello_server",
    srcs = ["HelloWorldServer.java"],
    main_class = "exp.grpc.helloworld.HelloWorldServer",
    deps = [
        "//protos:protos_java",
        "//libs:jars",
    ],
)