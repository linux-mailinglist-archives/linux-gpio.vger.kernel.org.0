Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54906134D9
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiJaLrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiJaLre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:47:34 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D1AE0D7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:32 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so15655698pjc.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNKElcrmbNIZeC7S7h4x4lyXqk1EBxG4YOO2/1GJ8UM=;
        b=WJAszw8IxGPNBuI2fmj3LYakpXR/KP0nigCG0akXzKhLkrLz8bRx5ebWnAh31UOYp5
         2UOa2ObOCUqL8iwJ18V0KkN/KjgOj+U4/yPYrPyStMHBWhVb8FyDggwa6stKnVcpKc5H
         LEAdvjFVzhxAikHZi91XPiAK9ORhln/FdDA4HoFiuDXx3ZnSlwqJidqiTsb2iT/rwuud
         blkFl1SEsa81MAbnoRmyz9VAQ4rg4EjR11MvAFjiqkLlpY/i/iz9py4pb4jBvJdIBaU4
         3rvOHJCT0UNodCLtSb73hSausq5iMlCv355tEK+JnYpMzr2mGq7YnTTCMJeVzpkTNa4a
         TjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNKElcrmbNIZeC7S7h4x4lyXqk1EBxG4YOO2/1GJ8UM=;
        b=OyPIIRkeTDfSDeUwUOcEnCovZnTsv9GnPqEs8FBC2Wb7Q2UqdEQnV9yc63+iXF66Ka
         6lZZAFwupC3FpZOKac4gGR8/pWVGqAkObknO96+dYof5N8wS7Tq5CNKeuws1Pz/RVFYf
         8LvK6GhU6bxH9SUcMSxOs/1udv5ZIRAhI4jfkCIZiJEi1ChAB5H2qM79ZGn5Wfx/dZ3f
         9Il8trsA4iv38Yqse9y3QFGOoRiSet9gG4d718zk0YPbQPbeO3FhViVR5bb5yj3P0BUw
         dx8LR+GSPgMYm64tysgJ/5FsIMDWDNpZq+m51zbmzMqAiW7C/U/lNPB1mR0aaaAdYOFF
         u5hQ==
X-Gm-Message-State: ACrzQf2k1YTCVCMo09XZgnZQiQFxSz/1N7AgzS0fItqayantK3WvhFAD
        qTvZUY/RN+jdn68jQCRh8ieP3Q==
X-Google-Smtp-Source: AMsMyM50LiRY5jEDRxRPKyhamt8HFb3J5o7V0PlellRKUZ4igyy8SNNAfLZhaWO3j1VdFkPG41qLTA==
X-Received: by 2002:a17:902:7d8b:b0:187:3030:ab02 with SMTP id a11-20020a1709027d8b00b001873030ab02mr514544plm.80.1667216852399;
        Mon, 31 Oct 2022 04:47:32 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id o125-20020a625a83000000b00560e5da42d5sm4395642pfb.201.2022.10.31.04.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:32 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod v2][PATCH V8 1/9] bindings: rust: Add libgpiod-sys rust crate
Date:   Mon, 31 Oct 2022 17:17:09 +0530
Message-Id: <8762a113cf8540e4dd56e45b187925b06f8b72c5.1667215380.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667215380.git.viresh.kumar@linaro.org>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
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
 bindings/rust/libgpiod-sys/Cargo.toml | 22 ++++++++++++++
 bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
 5 files changed, 86 insertions(+)
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
index 000000000000..c7bbcc798920
--- /dev/null
+++ b/bindings/rust/Cargo.toml
@@ -0,0 +1,5 @@
+[workspace]
+
+members = [
+    "libgpiod-sys"
+]
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
new file mode 100644
index 000000000000..716dde551263
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -0,0 +1,22 @@
+[package]
+name = "libgpiod-sys"
+version = "0.1.0"
+authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
+description = "libgpiod public header bindings"
+repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
+categories = ["external-ffi-bindings", "os::linux-apis"]
+rust-version = "1.56"
+keywords = ["libgpiod", "gpio"]
+license = "Apache-2.0 OR BSD-3-Clause"
+edition = "2021"
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
index 000000000000..a1d1db19afe3
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
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

