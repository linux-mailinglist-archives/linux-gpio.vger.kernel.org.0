Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CBF712972
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 17:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243227AbjEZP2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 11:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbjEZP2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 11:28:12 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DF71A4
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 08:27:44 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso1608069a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685114862; x=1687706862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ynw6fRk/1Xi2DYUccYjKEA8zeWu7SA7M/va8O3n64r4=;
        b=WVo8EdbYLC4qycY16Krv/Fka5bKca33c1CF8YDgtt8Sz4El++JCONgbxiu93vCJ91V
         DW5Wp7fGrY+5ZZo84lblzaMWaJKLZIEFaiWK5SNkiMJfq8TXgawHqioVyPiatqKZjYL7
         8t2JXsjPysYDng534FFTuWP8/8uFJZ5MSPaXiGMjr8M+ADDb2IxU5Io9MoCogkeYLRUt
         WjkOpD1gZvMWRmESyJAElligRiaaI/a2c62pbeNqIRDdUqD+y/IQD7JFvp32ja/WXdmC
         Xi/t7W0I1ecaFJD1/xFMH5hkUYYZF0zwxDzrtExOCqoRZ6xBPn8C5enuOmKM9CZM41UM
         kKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685114862; x=1687706862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ynw6fRk/1Xi2DYUccYjKEA8zeWu7SA7M/va8O3n64r4=;
        b=cc10Ju2KJyeD/3iqRp+GtfmvzpDg4hzAHRNsYDYN8zR9iwb1DysdXlnbGKkDn3XO6U
         FnPYH/1WoKDcHJC9s3kIsgA2IS7xi7OAvDuolYkEf6D7TML/kAFmyso2pF6xEwN6OLAv
         8KVDWbs1nqInLrVmooYSD5JM0biPkhv7wYvMDoherIpTuHdjZjJwCc69Z3uOf8x7wk8Q
         JHG2bEdxbnYq06u4FYU2Eaxk1TyKTNGZuEY9fOmFnHUlF3IWf1St/e2RTGY9fzt6xU+8
         GJJzaaLAJXk6OQYMnRElAUnOLIv4DEvB78aauXlRqHVx88GNXCJ3K0VMYz9/zzKRA+V9
         BXAg==
X-Gm-Message-State: AC+VfDzZ224/Vjff+s2fwqFUTi0PNQ5vyfgPg95GFAvqaz9qiNYu1SKP
        AEt6avz2m66CTFhED3OlGvxZfA==
X-Google-Smtp-Source: ACHHUZ7g62F/QOPkltHSsxI9SzOdIMTiPecB/jjCpCzJY//c/C29XxQGjos1QmSAS4+y/oX1l9Mc6Q==
X-Received: by 2002:a17:907:86a2:b0:96a:2dd7:2ee0 with SMTP id qa34-20020a17090786a200b0096a2dd72ee0mr4900616ejc.5.1685114862379;
        Fri, 26 May 2023 08:27:42 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id m13-20020a170906160d00b0095342bfb701sm2305894ejd.16.2023.05.26.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:27:42 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 26 May 2023 17:27:33 +0200
Subject: [PATCH libgpiod v2 2/2] bindings: rust: build against pkg-config
 info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230522-crates-io-v2-2-d8de75e7f584@linaro.org>
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
In-Reply-To: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685114860; l=9034;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=H8/MUTQMwSwgIJWabjoYjzTmFQ3hHE7KAppn6UeDgqU=;
 b=42E6r6Qkxw4+b2X73+Bb/KfHOpLKBmLlipt/layKv6K4cD0I7822DVXcsDG0PBWhQ91d+HjdY
 kHpJpJwYqDKB6HU4WSEGujKFFNs6ZZ5UDayAH09uguVx+3K3Atyhg4e
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This change replaces building against "bundled" headers by always
building agains system headers (while following standard conventions to
allow users to specify the version to build against).

Reasoning:

Previously, the code generated the bindings based on the headers, but
then links against `-lgpiod` without further specifying where that is
coming from.

This results in some challenges and problems:

1. Packaging a Rust crate with `cargo package` requires the folder
   containing the Cargo.toml to be self-contained. Essentially, a tar
   ball with all the sources of that folder is created. Building against
   that tar ball fails, since the headers files passed to bindgen are
   a relative path pointing outside of that folder.

2. While, for example, the cxx bindings are built AND linked against
   the build results, the packaging situation for C++ libraries is a
   bit different compared to Rust libs. The C++ libs will likely get
   built as part of the larger libgpiod build and published together
   with the C variant.

   In Rust, the vast majority of people will want to build the glue-code
   during the compilation of the applications that consume this lib.

   This may lead to inconsistencies between the bundled headers and the
   libraries shipped by the user's distro. While ABI should hopefully
   be forward-compatible within the same MAJOR number of the .so,
   using too new headers will likely quickly lead to mismatches with
   symbols defined in the lib.

3. Trying to build the core lib as part of the Rust build quickly runs
   into similar packaging issues as the existing solution. The source
   code of the C lib would need to become part of some package
   (often people opt to pull it in as a submodule under their -sys crate
   or even create a separate -src package [1]). This clearly does not
   work well with the current setup...

Since building against system libs is probably? what 90%+ of the people
want, this change hopefully addresses the problems above. The
system-deps dependency honors pkg-config conventions, but also allows
users flexible ways to override the defaults [2]. Overall, this keeps
things simple while still allowing maximum flexibility.

Since the pkg-config interface is just telling us which include paths to
use, we switch back to a wrapper.h file that includes the real gpiod.h.

Once Rust bindings require a lower version floor, the version metadata
can also be updated to help telling users that their system library is
too old.

In order to support people hacking on the Rust bindings, building with
make will automatically set the right set of environment variables.
In case people want to customize it when building without `make`, a
reference to the system_deps documentation is given in the README.md.

[1] https://github.com/alexcrichton/openssl-src-rs
[2] https://docs.rs/system-deps/latest/system_deps/#overriding-build-flags

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 README                                |  4 +++-
 bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
 bindings/rust/libgpiod-sys/README.md  |  8 +++++++
 bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++------------
 bindings/rust/libgpiod-sys/wrapper.h  |  1 +
 bindings/rust/libgpiod/Makefile.am    |  8 ++++++-
 6 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/README b/README
index 85b6300..5764eee 100644
--- a/README
+++ b/README
@@ -218,7 +218,9 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in order to point the build
 system to the correct locations. During native builds, the configure script
 can auto-detect the location of the development files.
 
-Rust bindings require cargo support.
+Rust bindings require cargo support. When building the Rust bindings along the
+C library using make, they will be automatically configured to build against the
+build results of the C library.
 
 TESTING
 -------
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 2b20fa6..8b17039 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -18,3 +18,7 @@ edition = "2021"
 
 [build-dependencies]
 bindgen = "0.63"
+system-deps = "2.0"
+
+[package.metadata.system-deps]
+libgpiod = "2"
diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index 1cb3b0a..90198d8 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -8,6 +8,14 @@ SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 Automatically generated Rust FFI bindings via
 	[bindgen](https://github.com/rust-lang/rust-bindgen).
 
+## Build requirements
+
+A compatible variant of the C library needs to detectable using pkg-config.
+Alternatively, one can inform the build system about the location of the
+libs and headers by setting environment variables. The mechanism for that is
+documented in the
+[system_deps crate documentation](https://docs.rs/system-deps/6.1.0/system_deps/#overriding-build-flags).
+
 ## License
 
 This project is licensed under either of
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index 0ac2730..9e6a93c 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -1,25 +1,44 @@
 // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightText: 2022-2023 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
 
 use std::env;
 use std::path::PathBuf;
 
-fn generate_bindings() {
+fn main() {
+    // Probe dependency info based on the metadata from Cargo.toml
+    // (and potentially other sources like environment, pkg-config, ...)
+    // https://docs.rs/system-deps/latest/system_deps/#overriding-build-flags
+    let libs = system_deps::Config::new().probe().unwrap();
+
     // Tell cargo to invalidate the built crate whenever following files change
-    println!("cargo:rerun-if-changed=../../../include/gpiod.h");
+    println!("cargo:rerun-if-changed=wrapper.h");
 
     // The bindgen::Builder is the main entry point
     // to bindgen, and lets you build up options for
     // the resulting bindings.
-    let bindings = bindgen::Builder::default()
+    let mut builder = bindgen::Builder::default()
         // The input header we would like to generate
         // bindings for.
-        .header("../../../include/gpiod.h")
+        .header("wrapper.h")
         // Tell cargo to invalidate the built crate whenever any of the
         // included header files changed.
-        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
-        // Finish the builder and generate the bindings.
+        .parse_callbacks(Box::new(bindgen::CargoCallbacks));
+
+    // Inform bindgen about the include paths identified by system_deps.
+    for (_name, lib) in libs {
+        for include_path in lib.include_paths {
+            builder = builder.clang_arg("-I").clang_arg(
+                include_path
+                    .to_str()
+                    .expect("Failed to convert include_path to &str!"),
+            );
+        }
+    }
+
+    // Finish the builder and generate the bindings.
+    let bindings = builder
         .generate()
         // Unwrap the Result and panic on failure.
         .expect("Unable to generate bindings");
@@ -30,10 +49,3 @@ fn generate_bindings() {
         .write_to_file(out_path.join("bindings.rs"))
         .expect("Couldn't write bindings!");
 }
-
-fn main() {
-    generate_bindings();
-
-    println!("cargo:rustc-link-search=./../../lib/.libs/");
-    println!("cargo:rustc-link-lib=gpiod");
-}
diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
new file mode 100644
index 0000000..8a8bd41
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/wrapper.h
@@ -0,0 +1 @@
+#include <gpiod.h>
diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
index e9a10c1..92edbfc 100644
--- a/bindings/rust/libgpiod/Makefile.am
+++ b/bindings/rust/libgpiod/Makefile.am
@@ -2,7 +2,13 @@
 # SPDX-FileCopyrightText: 2022 Linaro Ltd.
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
-command = cargo build --release --lib
+# We do not want to build against the system libs when building with make. So we
+# specify the paths to the build directory of the C lib.
+command = SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1 \
+		SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="${PWD}/../../../lib/.libs/" \
+		SYSTEM_DEPS_LIBGPIOD_LIB=gpiod \
+		SYSTEM_DEPS_LIBGPIOD_INCLUDE="${PWD}/../../../include/"  \
+		cargo build --release --lib
 
 if WITH_TESTS
 command += --tests

-- 
2.40.0

