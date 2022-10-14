Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E88AF5FECAF
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 12:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiJNKrh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 06:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiJNKrd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 06:47:33 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16480160841
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:33 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so4429622pjl.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFTqU4xvWm4ZVAWqCXbZIt73vYr5gjNJa4wLaZGnjzI=;
        b=Tu4hvz2tGAiKPI328/eHSeUTdYozFykAxF2M6RZRERTy3YcFSmwOlbFbiEbJyErgC2
         G+ZayU8FDS1ptLe2FEN8eaO9Ibg960GqwX37K/vKN98KzXHK3pbGLwn+fhFQiNKn3Y2F
         rXxplX8RGPEW0LVXX9NDpklyz3P93yOvXM4otSEuefiCzxhcnfYO3XBHSqmtAwstleEN
         m0OGggaJ+1jnDJC98pNFT5B7Mlu2NVZ2bwgWepFbEHdiSrziaGf6SnyA6baEYHtocpN2
         5gBeluHH0XhiXrYdZMpZL2aJDngVuf4rkp2YtbULf25WhQKDupV5CJF/ra8SDrLTzGF0
         VxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFTqU4xvWm4ZVAWqCXbZIt73vYr5gjNJa4wLaZGnjzI=;
        b=OK9xyLNiHi1oA4A7GuYmQErs9vlVaerYPLi/sXZlWI/6henF106sGh7B3339MYfrC5
         Te3+ZJiPj4w+Xzv3ChkSkOt/KmgCQKWWNW18TAZjWcNeraoYNvY/gcRvlw93xM7XiCVu
         wCmRyVvQ8tfDX9jrjGqFA7TXzHKx2pd3wgMaPGwiINR/NtVnjOsdRvPePKsoVWQh6JSr
         UiROj/frd97j9ioEZe+tS9VF9Kbd4IOKGM0no4l9Mla8k14abW011hbonqDceQKyBSxC
         9YivHUwS8RGb84SctGmvdgH2YYYymZGI7XR3tMXQ42wq45DCsMFipS0LvRiUhEe88Ire
         CXXA==
X-Gm-Message-State: ACrzQf398ee/VnodlbA58EDGqhvj5XEJfrJHivGZK5PQR0Tlr7KatzNW
        N5YR25f7SkLjcSE5n4QCHh6VfQ==
X-Google-Smtp-Source: AMsMyM4xwHGTv7ezCB4tGBEk9m3Ejb9GkstvNZcIbM+DFVK9Eb0j7S3FZHrcklmv52qdywS5cSMunw==
X-Received: by 2002:a17:903:40c3:b0:180:cfb7:827b with SMTP id t3-20020a17090340c300b00180cfb7827bmr4740429pld.0.1665744452601;
        Fri, 14 Oct 2022 03:47:32 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id s21-20020a170903201500b0016c9e5f290esm1440859pla.10.2022.10.14.03.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 03:47:31 -0700 (PDT)
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
Subject: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Date:   Fri, 14 Oct 2022 16:17:18 +0530
Message-Id: <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1665744170.git.viresh.kumar@linaro.org>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
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

