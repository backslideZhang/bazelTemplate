package(default_visibility = ["//visibility:public"])

load("/tools/build_rules/grpc_java_rule", "gen_java_grpc_lib")

gen_java_grpc_lib(
    name = "protos_java",
    srcs = glob(["**/*.proto"]),
    java_package = "io.grpc.examples",
    services = ["MemberManager","Greeter"],
)
