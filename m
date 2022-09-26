Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB175EA61E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 14:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbiIZMak (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 08:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239536AbiIZMaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 08:30:13 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2146C55AC
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:09:36 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id w2so6384755pfb.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LFTqU4xvWm4ZVAWqCXbZIt73vYr5gjNJa4wLaZGnjzI=;
        b=diR3Osup16ZswLz57Em+jP4unYfpuWOHXP1/xFaTh60FtGv3xUPJGWr+Ed7jgSEyhJ
         srCpnrLBbCbpOs7Hkg2pXxc8OWXR7WdeJuBViAH1944wVJ3B+1Py2wsJYmC0Zf0wl+5Q
         8vBbMikA8bupBQXOcwgDKNsNJqX5hYIzTBqVpz30NOunbXIee7J13AQYjsfYoTrtpELo
         zC7DBKQg+GP1VyA0KaSXduCA8CSBAdwQoHc51JvQ8pyfS1/JXLxcOLYB/v1vRcgQCD0s
         UcXkEXWBHbAn9t1hb/4q7lfV3cS/EUuTSJ5G3M7nSZCI7yZ/ZfoBaJf/69J+OfEYXCLV
         z4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LFTqU4xvWm4ZVAWqCXbZIt73vYr5gjNJa4wLaZGnjzI=;
        b=pQcrUCVlTUGASFfiR30uGWc3m8P7XBGigVM0xqL3vPzBwli560iXrjUB8E5HM0iORC
         O641FxhI1pZJKnyfl9M+zTaqoCijYlbGhErRhO2CWMoWoh+dSW12QcKZ1WnlH5Il0ECT
         Rj0/iEsltS0diswC5LZc4BeQEpVA/+UWvBDa7DL5wpotCkqfkHbBwh+RdEf1YnF6DAvR
         0DBLqr2i2CDOFiZ6vTpZLFV6VAng3/4bzVd27d3oAO3fhFEoSn3ReIQKKV/JhbfyWDkr
         Amtaiho7daeWbiHrm4+OIoe8y9dVRqh39q6AB0vZvp1jJKnaq4QjYstR8GXB3RuH5NYd
         GA5g==
X-Gm-Message-State: ACrzQf1FCCWYRLVTXaDDDbnBlreRzwWX2KNIHkUXOfNWviMionlSn+QE
        tF2rLxoCsy14tTFO0wkg7gLwTA==
X-Google-Smtp-Source: AMsMyM63FbxCh4Ikd6UvOvnGxjtlGypTwVSBAkI07w8qg8iOgRig6bFIfGc+qW981cw+4tnP9dxvsw==
X-Received: by 2002:a05:6a00:1d26:b0:54e:8c81:9f64 with SMTP id a38-20020a056a001d2600b0054e8c819f64mr23153400pfx.58.1664190508418;
        Mon, 26 Sep 2022 04:08:28 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902eb8800b0017515e598c5sm10854613plg.40.2022.09.26.04.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:08:27 -0700 (PDT)
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
Subject: [PATCH V6 1/8] libgpiod: Add libgpiod-sys rust crate
Date:   Mon, 26 Sep 2022 16:38:13 +0530
Message-Id: <d992cb3d7f18ee5013d44d3e4fa6528e7d35345e.1664189248.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1664189248.git.viresh.kumar@linaro.org>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds libgpiod-sys rust crate, which provides FFI (foreign function
interface) bindings for libgpiod APIs.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore                            |  5 ++++
 bindings/rust/Cargo.toml              |  5 ++++
 bindings/rust/libgpiod-sys/Cargo.toml | 15 ++++++++++
 bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
 5 files changed, 79 insertions(+)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs

diff --git a/.gitignore b/.gitignore
index 6c08415b390d..9f2fcf440c5d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -35,3 +35,8 @@ stamp-h1
 # profiling
 *.gcda
 *.gcno
+
+# Added by cargo
+
+target
+Cargo.lock
diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
new file mode 100644
index 000000000000..d0b3a3c88ff1
--- /dev/null
+++ b/bindings/rust/Cargo.toml
@@ -0,0 +1,5 @@
+[workspace]
+
+members = [
+    "libgpiod-sys",
+]
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
index 000000000000..98863686c7af
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -0,0 +1,41 @@
+#[cfg(feature = "generate")]
+extern crate bindgen;
+#[cfg(feature = "generate")]
+use std::env;
+#[cfg(feature = "generate")]
+use std::path::PathBuf;
+
+#[cfg(feature = "generate")]
+fn generate_bindings() {
+    // Tell cargo to invalidate the built crate whenever following files change
+    println!("cargo:rerun-if-changed=../../../include/gpiod.h");
+
+    // The bindgen::Builder is the main entry point
+    // to bindgen, and lets you build up options for
+    // the resulting bindings.
+    let bindings = bindgen::Builder::default()
+        // The input header we would like to generate
+        // bindings for.
+        .header("../../../include/gpiod.h")
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
+fn main() {
+    #[cfg(feature = "generate")]
+    generate_bindings();
+
+    println!("cargo:rustc-link-search=./../../lib/.libs/");
+    println!("cargo:rustc-link-lib=static=gpiod");
+}
diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
new file mode 100644
index 000000000000..1ca355b5f5ac
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#[allow(non_camel_case_types, non_upper_case_globals)]
+#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
+
+mod bindings_raw {
+    #[cfg(feature = "generate")]
+    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
+
+    #[cfg(not(feature = "generate"))]
+    include!("bindings.rs");
+}
+pub use bindings_raw::*;
-- 
2.31.1.272.g89b43f80a514

