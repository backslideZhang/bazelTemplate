def gen_java_pb(name, srcs, java_package):
    java_package_path = java_package.replace('.','/') + '/'
    outs = [(java_package_path + f[0].upper() + f[1:-6]+".java") for f in srcs]
    native.genrule(
        name = name,
        srcs = srcs,
        outs = outs,
        tools = ["//third_party/protobuf:protoc"],
        cmd = "$(location //third_party/protobuf:protoc) -Iprotos $(SRCS) --java_out=$(@D)",
    )

def gen_java_grpc(name, srcs, java_package, services):
    java_package_path = java_package.replace('.','/') + '/'
    plugin_location = "//tools/bin:grpc_java_plugin"
    outs = [(java_package_path + service + "Grpc.java") for service in services]
    native.genrule(
        name = name,
        srcs = srcs,
        outs = outs,
        tools = ["//third_party/protobuf:protoc", plugin_location],
        cmd = "$(location //third_party/protobuf:protoc) -Iprotos $(SRCS) --grpc_out=$(@D) --plugin=protoc-gen-grpc=$(location "+plugin_location+")",
    )

def gen_java_grpc_lib(name, srcs, java_package, services):
    java_package_path = java_package.replace('.','/') + '/'
    gen_java_pb(
        name = name+"_pb_files",
        srcs = srcs,
        java_package = java_package,
    )
    gen_java_grpc(
        name = name+"_grpc_files",
        srcs = srcs,
        java_package = java_package,
        services = services,
    )
    native.java_library(
        name = name,
        srcs = [":"+name+"_pb_files",":"+name+"_grpc_files"],
        deps = ["//libs:jars"],
    )
