Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE92B70DB6E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbjEWL0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 07:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235598AbjEWL01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 07:26:27 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7074120
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:23 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96652cb7673so1143358266b.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684841182; x=1687433182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOy9xIiG8gh5AExeZkXTRpX85BoP9eilfC7RfJuFSrk=;
        b=PuAQV78w/Ee0iZeCcAtNBxf+DPmdevTI1d/IPb034oBCsw/6o4IO2Js8/npb8ftYhw
         0RWzlYfHLC45cuqRv57xRBuMskiiiysxBuvEudwzCyWpSLI1oYsohrxlPPy1dniW3PB1
         ZWYsF3ddU4+obrUMV9xZCcqk/WGB2NvNSPRTuenQnJnmbBU3iqODf1mvw2Z0BygfR+4H
         ixWYsZ0NLMpoUAoR7NeZCnln8dsFkDelm9XWlvtmT+T1Ic+U9vzfQ8CAeQyOcsyRrxy1
         gHZXh/tC7PxXFPcI3xQKIw12R6pnMnNsqcS9pIgRV+hy5sXxEmX7zqHoIiPZ5iCGA3/y
         tS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841182; x=1687433182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOy9xIiG8gh5AExeZkXTRpX85BoP9eilfC7RfJuFSrk=;
        b=BCt2cD3E59IalpTEruUWDI3nRxuC3vcmVaLSckgqsPzMzWMqaVEwhunmcENt7Dg4nD
         dLEZAxYTWHoOBhYCbDYj6vCuQAl3djocBx7BpRzgsAcvfWkd7pvIjjh/aScjcIqTsimm
         qKRrD4z7p5K/4/Yw2wOaJxLMSuMqwnrc9DosG9B+yhlIrCshoO11TU2O4Y//ZDQ/WyCc
         n4ugfni7T/8u8LoKVQt8fiW52A9kSy7jKeZ9P3Xc4jFTpbrrvyO9q+ZpMHaM2Gu/4JSH
         RDxgAKNWqwY8gzl7Y/zn5CslB/Ch579w3WFQVPyF2riymAa3lsfqlhVp5K0a9Ku+0V7V
         xnZg==
X-Gm-Message-State: AC+VfDzpo+YPAh1ezsyWL1oUIkpr5FWyg0uP2oL73fhsIANeUKVRQm6N
        xmUh82ySVL3UJj6ynxsgK6+3SQ==
X-Google-Smtp-Source: ACHHUZ78IRd+3jzO5OTwlwgS9pTwsSeznXmTvFPNoYhbkDdQiN0SAcsI5Hb2iWiMDsTmjT4fv3vJOw==
X-Received: by 2002:a17:907:6287:b0:965:d18b:f03a with SMTP id nd7-20020a170907628700b00965d18bf03amr13628252ejc.58.1684841182393;
        Tue, 23 May 2023 04:26:22 -0700 (PDT)
Received: from [192.168.1.149] (i5C7409D3.versanet.de. [92.116.9.211])
        by smtp.gmail.com with ESMTPSA id gv3-20020a1709072bc300b0094f3b18044bsm4342911ejc.218.2023.05.23.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:26:22 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Tue, 23 May 2023 13:25:48 +0200
Subject: [PATCH libgpiod RFC 3/3] bindings: rust: build against pkg-config
 info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230522-crates-io-v1-3-42eeee775eb6@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
In-Reply-To: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684841179; l=7423;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=+9qrdhsqceKESpwBJJaS5PqIz7cMrhRgMOWCKpGkbqY=;
 b=DMSlxTg9WJ9xqDofTztJKJLee/UfyVZ5WUVJFxVzxEePo5SBDfSiIbpZBfl1oBQfgx0htgwdL
 I6le+UiM3AbAiwCOl6T9plfI0oFyUhXBSIk1Um2gvEb2lM4utqpXyYs
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

Drawback:

People hacking on the Rust bindings, need to either have a reasonably
up-to-date system lib, previously install the lib to some folder and
specify PKG_CONFIG_PATH or set the relevant SYSTEM_DEPS_* environment
variables. Instructions for developers are documented in the README.

[1] https://github.com/alexcrichton/openssl-src-rs
[2] https://docs.rs/system-deps/latest/system_deps/#overriding-build-flags

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 README                                | 13 +++++++++++-
 bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
 bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++------------
 3 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/README b/README
index b71739e..8780b09 100644
--- a/README
+++ b/README
@@ -218,7 +218,18 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in order to point the build
 system to the correct locations. During native builds, the configure script
 can auto-detect the location of the development files.
 
-Rust bindings require cargo support.
+Rust bindings require cargo support. Additionally, a compatible variant of the C
+library needs to detectable using pkg-config. Alternatively, one can inform the
+build system about the location of the libs and headers by setting environment
+variables. For example, after building the C lib, one should be able to build
+the bindings using:
+
+    cd bindings/rust/libgpiod-sys/
+    env SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1 \
+        SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="../../../.libs/" \
+        SYSTEM_DEPS_LIBGPIOD_LIB=gpiod \
+        SYSTEM_DEPS_LIBGPIOD_INCLUDE="../../../include/" \
+        cargo build
 
 TESTING
 -------
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index cb8dc70..d945e02 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -18,3 +18,7 @@ edition = "2021"
 
 [build-dependencies]
 bindgen = "0.63"
+system-deps = "2.0"
+
+[package.metadata.system-deps]
+libgpiod = "2"
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index b1333f1..189a12a 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -1,25 +1,44 @@
 // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightText: 2022-2023 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
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

-- 
2.40.0

