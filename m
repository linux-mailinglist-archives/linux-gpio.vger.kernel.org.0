Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12DB61EFBC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 10:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiKGJ5p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 04:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiKGJ5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 04:57:45 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F56F17598
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 01:57:44 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id io19so10581877plb.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MAKuN26Xb3OfwOkrTuAtD8LOXrUtseWf36A0bwTJig=;
        b=ov1QyMc6idnr+ujIHDiwbI97cLwZCB1dMSQClL36IdguAVuJXr6DU04nVNn3AgG39U
         bgmST7XZfZ1wtpl5Kqm3Sf/p2h3rqG0rCa4yyDDSBmau4OoU1soUeFI0k0gAS0c4qLRr
         cU4UTSofTvdhHdR/E/mr5mgz5Sve3UY5bPgQSSbGpCfSDxfP+lMuX/GbpQF6BZfQd8DG
         VeJDK2UClC14lApoRZzrhlr6A4f8BXfvxz6uZnJ30M5BupYfYHfIunXqQzcRAg3nO7Lx
         RrlmoyHlMjRCj1xiUaF2OXi9N8D59ZvBW4v2YP8uh8zVJgUGdpOH7LE60ROntpFKOQA4
         aubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MAKuN26Xb3OfwOkrTuAtD8LOXrUtseWf36A0bwTJig=;
        b=peJ3mYDu56FJ7qcakM5nxEN5VgpMieTp4K+0IiEi2JYJchz7F4FzFS9ohdj7nbn4zP
         ofhCDfoPytzHQtOSLow+TeS82gmT7cDd2A2q1YXdZH9rD9kf4Opj7megl+aHF9MwGAKk
         U9NJ4dooLdrCEtjSHCPAQcDw/KcUAOahlNEi1ZypYWc1KD+OiO0QMEDi+J0/pj+n2fBw
         iAQQSL4A4tNXrLA2SjBQEV6K9+0LJlkNk0WU0Pe2AAfFIoGS80AZ5BcotqDRFV8d2VG+
         1JFjNvCM9LC8YtZUOSietZbrN390uoHgoK3dBFHyDg4XYc+iD7BrFo46nalhieiTsE2M
         BC6w==
X-Gm-Message-State: ACrzQf2p8rDqUiphiqdgmgrTCFkbdMJX3ppJZ+5yQY662uuxeXQkjSbz
        8I9GzyR5Hr+RzG2vv1Rpj9jftQ==
X-Google-Smtp-Source: AMsMyM5GUGLhsy2NbagBYXJ6iqorkiNBFEZ4GmVf3fTu5Ns3iPXqEEgo3BQqxWD9BOwRw8DoCT7vkg==
X-Received: by 2002:a17:90a:ce89:b0:213:167c:81e1 with SMTP id g9-20020a17090ace8900b00213167c81e1mr68419438pju.38.1667815063801;
        Mon, 07 Nov 2022 01:57:43 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id a32-20020a634d20000000b0046fe658a903sm3793350pgb.94.2022.11.07.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:57:43 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod][PATCH V9 1/8] bindings: rust: Add libgpiod-sys rust crate
Date:   Mon,  7 Nov 2022 15:27:27 +0530
Message-Id: <2a943ded955e634fc76022dd3bccdb0e8f8b4313.1667815011.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667815011.git.viresh.kumar@linaro.org>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
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
 bindings/rust/libgpiod-sys/Cargo.toml | 20 +++++++++++++
 bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
 5 files changed, 84 insertions(+)
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
index 000000000000..47d0c2a7311c
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -0,0 +1,20 @@
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

