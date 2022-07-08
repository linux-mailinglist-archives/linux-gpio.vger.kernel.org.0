Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C44B56B8A4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237622AbiGHLfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237345AbiGHLfJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:09 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E07D88F26
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:08 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 73so6720867pgb.10
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbSHZnDrI1cUI+LHg8aFjHKSoTAP5G9hjPbqfKkCd3M=;
        b=wklQlmjMzzjJMzHov8N+18Wm7CHsTBgcpmBF6L2Y4IRr96ii/FKaVURT9oFIsSluMR
         fc0BZRm0X1+1my/P91M0SlYIqkzYGM1ZXyf/ywK9N09aKfbmTuU0ElxFoooWpIWXzCjs
         BPr8k2plqfbMxYFTBF4xerG3XLCb+kr7MsnaXX1pQpjcctWQJYKNKBzJKmkrJxCIB8Wp
         6PifjT54DtlJHtz2rJWKBG3x60xyf00ZBztjgeq5nbDeQNFCvpiVXb48Czx8pXkHtpKZ
         KSCPv58mxG6uhG6rglvLXR4MMnnKCqpYlBi6+jH87bYgEaUVhtCBlLMff/LcIs3KJz3u
         CvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbSHZnDrI1cUI+LHg8aFjHKSoTAP5G9hjPbqfKkCd3M=;
        b=54wM5f/3IbL3qS78vGL+Yf7r1HndNuhPNoNRaNJCzMyCgK0PHJ6HrJgmoNEfTpEIXn
         nA1o5QvLyDNsyk4lcEZ3sYgNzfn7yb/qYm9QDVxy6+l7jMb3fwtIh6pUollU4hSULh0z
         vb+5BobWqpSCFA9yTTbaUK3fDsGBcqHEIz4S/BsYdjSF9PwkbZ9AI2tcochl8+u4wHfQ
         ebcTlNidvuiEMyv/DrHwuDbs3Wd0phQVLe7M1UH9DIuP3mNft3Ql+fUM0W9HpljjjXJt
         nsk3l3lxrCBs4xvcFpkT0kxTT4odPPNTlmzG1eDSzXAnpO8/IiLVUPF4VvfoOulLDqRg
         e0og==
X-Gm-Message-State: AJIora/ud4fgIlBr7AQ4onoSZVudXh2a9w5/I0lyY/UxQhdSvdYEUbIs
        Efdjf0ZkjrhzPYXj33TpUoOdkA==
X-Google-Smtp-Source: AGRyM1u5H+8Br87bG7zA2/eyQtN25IehkwfmJa7IGFRfEVtgCY/Ya+aT8tsVel023AWadQ+NORaPLA==
X-Received: by 2002:a63:4c57:0:b0:40d:d28e:bfb1 with SMTP id m23-20020a634c57000000b0040dd28ebfb1mr3087209pgl.77.1657280108011;
        Fri, 08 Jul 2022 04:35:08 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id y144-20020a626496000000b0052aaf7fe731sm1461830pfb.45.2022.07.08.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:07 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Date:   Fri,  8 Jul 2022 17:04:54 +0530
Message-Id: <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1657279685.git.viresh.kumar@linaro.org>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds libgpiod-sys rust crate, which provides FFI (foreign function
interface) bindings for libgpiod APIs.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore                            |  5 ++
 bindings/rust/libgpiod-sys/Cargo.toml | 15 ++++++
 bindings/rust/libgpiod-sys/build.rs   | 69 +++++++++++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs | 20 ++++++++
 bindings/rust/libgpiod-sys/wrapper.h  |  2 +
 5 files changed, 111 insertions(+)
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
 create mode 100644 bindings/rust/libgpiod-sys/wrapper.h

diff --git a/.gitignore b/.gitignore
index 58e1c5fc7e00..9541482d5efb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -33,3 +33,8 @@ stamp-h1
 # profiling
 *.gcda
 *.gcno
+
+# Added by cargo
+
+target
+Cargo.lock
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
new file mode 100644
index 000000000000..77f82719d269
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -0,0 +1,15 @@
+[package]
+name = "libgpiod-sys"
+version = "0.1.0"
+edition = "2018"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[dependencies]
+
+[features]
+generate = [ "bindgen" ]
+
+[build-dependencies]
+bindgen = { version = "0.59.1", optional = true }
+cc = "1.0.46"
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
new file mode 100644
index 000000000000..bbcd30f79d23
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -0,0 +1,69 @@
+#[cfg(feature = "generate")]
+extern crate bindgen;
+#[cfg(feature = "generate")]
+use std::env;
+#[cfg(feature = "generate")]
+use std::path::PathBuf;
+
+#[cfg(feature = "generate")]
+fn generate_bindings(files: &Vec<&str>) {
+    // Tell cargo to invalidate the built crate whenever following files change
+    println!("cargo:rerun-if-changed=wrapper.h");
+
+    for file in files {
+        println!("cargo:rerun-if-changed={}", file);
+    }
+
+    // The bindgen::Builder is the main entry point
+    // to bindgen, and lets you build up options for
+    // the resulting bindings.
+    let bindings = bindgen::Builder::default()
+        // The input header we would like to generate
+        // bindings for.
+        .header("wrapper.h")
+        // Tell cargo to invalidate the built crate whenever any of the
+        // included header files changed.
+        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
+        // Finish the builder and generate the bindings.
+        .generate()
+        // Unwrap the Result and panic on failure.
+        .expect("Unable to generate bindings");
+
+    // Write the bindings to the $OUT_DIR/bindings.rs file.
+    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
+    bindings
+        .write_to_file(out_path.join("bindings.rs"))
+        .expect("Couldn't write bindings!");
+}
+
+fn build_gpiod(files: Vec<&str>) {
+    // Tell Cargo that if the given file changes, to rerun this build script.
+    println!("cargo:rerun-if-changed=../../../lib/");
+
+    // Use the `cc` crate to build a C file and statically link it.
+    cc::Build::new()
+        .files(files)
+        .define("_GNU_SOURCE", None)
+        .define("GPIOD_VERSION_STR", "\"libgpio-sys\"")
+        .include("../../../include")
+        .compile("gpiod");
+}
+
+fn main() {
+    let files = vec![
+        "../../../lib/chip.c",
+        "../../../lib/chip-info.c",
+        "../../../lib/edge-event.c",
+        "../../../lib/info-event.c",
+        "../../../lib/internal.c",
+        "../../../lib/line-config.c",
+        "../../../lib/line-info.c",
+        "../../../lib/line-request.c",
+        "../../../lib/misc.c",
+        "../../../lib/request-config.c",
+    ];
+
+    #[cfg(feature = "generate")]
+    generate_bindings(&files);
+    build_gpiod(files);
+}
diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
new file mode 100644
index 000000000000..3384863a567c
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#[allow(
+    clippy::all,
+    deref_nullptr,
+    dead_code,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes
+)]
+
+mod bindings_raw {
+    #[cfg(feature = "generate")]
+    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
+
+    #[cfg(not(feature = "generate"))]
+    include!("bindings.rs");
+}
+pub use bindings_raw::*;
diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
new file mode 100644
index 000000000000..7bc1158b7d90
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/wrapper.h
@@ -0,0 +1,2 @@
+#include <string.h>
+#include "../../../include/gpiod.h"
-- 
2.31.1.272.g89b43f80a514

