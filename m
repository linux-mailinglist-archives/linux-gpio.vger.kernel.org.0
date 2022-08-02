Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFCC587C30
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 14:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbiHBMS0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 08:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234024AbiHBMS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 08:18:26 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91594F18E
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 05:18:21 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h132so12187539pgc.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwhuAp3W7cu4b7rXJywkLPtcj3qj9jo5db4QI6rcIPg=;
        b=Vi+G8Z1LulR85fUuoO9Tov7kUe2wT+RhlbBhFf4JvlbDDzNyKfKZDIIHwwMrVRxFpN
         r18UDfBnB6quabp7Jykcd92Mm7jcKl49ZZjLm+p32cXDsW1iboDNDo93zWyAD8U9mNpY
         +d0jtmE9dGcYcc8WKhejQBRt8Xri3AQa9w8DYvSm4DT5ocN+Z6qe+31aMyQE3fbnvUVy
         KzqB4mqlXEhfQXXORvue4HuAG5qx2neckHzYLs/G3LwlEmZnTiakb9Y3wud8XRmu+QlP
         sqW/GdEunfwCBorWPetDrs1PfIa9rayHEnUoiJSZU41fk6TNHWXp8qN2LY98ZenrinYb
         +EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwhuAp3W7cu4b7rXJywkLPtcj3qj9jo5db4QI6rcIPg=;
        b=470SACoBzlO4rm3rqMPS2i6cKTou/76NctXKH0bqA93VkVKHqHgXIFmKasLbPwP0QG
         Ru1wDmx4tpiaHicjBqTbg/dAoVJyEhyx9WGmEE8L0kgBor2vrHx6RwL36u+KdUIK9bMM
         +0dUqqczCYsw2kxMRjWweDDfqvPMHnRrdDdbyioI5LJS1ojlJpzGqs0PA8AURa+ltdU3
         O+o8IDvAP3p7YNw1Z5fctAN+msFP8b7Cd+RIg55KoGhRIURQiT86vTk6Gp6kNEdQQIKY
         8wVG7WazlvFO2eh/44x1em1sEPnw2QtvH6BsRvmTMtsZgN86WBwKDsgT+G03EBsFd1f4
         Rh0w==
X-Gm-Message-State: ACgBeo2SNGIcUjBHjl75OfaEK1qQI67Yva1RJCX/LKT8CFjiyqM+CtAd
        2Bpsa9JSz9SdDR3m57HSzZzzkg==
X-Google-Smtp-Source: AA6agR7CL4fHgojVnwug471JQITk02JMGCviWCRFVHdRbWFs3JHmeQ6LSV5v0ysoNd6iSyDHrraE4A==
X-Received: by 2002:a05:6a00:2288:b0:52d:dbdf:318e with SMTP id f8-20020a056a00228800b0052ddbdf318emr2853737pfe.62.1659442701354;
        Tue, 02 Aug 2022 05:18:21 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id h6-20020a17090a130600b001f4d711e165sm7084667pja.11.2022.08.02.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 05:18:21 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V5 1/8] libgpiod: Add libgpiod-sys rust crate
Date:   Tue,  2 Aug 2022 17:48:05 +0530
Message-Id: <5319a3efc633e15993ba339972d139d6ec376cc6.1659442066.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659442066.git.viresh.kumar@linaro.org>
References: <cover.1659442066.git.viresh.kumar@linaro.org>
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

