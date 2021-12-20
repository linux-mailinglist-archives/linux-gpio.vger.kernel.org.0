Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C56347A872
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 12:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhLTLRL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 06:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhLTLRL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 06:17:11 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAACC061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:10 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id a11-20020a17090a854b00b001b11aae38d6so9829522pjw.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/rub05lOF1YPvV9qK3aV1FfJQJ3anYu0aofP9QN1U8Y=;
        b=X71YdgqWYtMJF6sa8WFamNrc4QNUJoy54BX9z23HJIdT3AqVS4EH2QpN2rjV2oc6T4
         aRLPcNk0PMLDllNCpA8DjigtjR6K5S7x2KVQzgdCcs7qoHLq01XNzL2ZJMJMZGrKswNq
         XAnn9+UXvNtD16CJOrzYVx6YyM/CjPK8AGJz3oKU6M1x7hFyYfrFEPqpadFeRytmKin2
         X4BXyVzsf/QHaC5aWlDuEjrDrohtqtoZu6PivzR/JyiX1LAsMVp3kgLlNWopLgw1QDJl
         uTMLn0c7pTUeitbdIFGdFNRpcaLr59QqSwHeT4/8uZTb4XQDa0AWKMC1joq9V3N9r5bV
         ii0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/rub05lOF1YPvV9qK3aV1FfJQJ3anYu0aofP9QN1U8Y=;
        b=QjIe8i198XFBHvRtoXTMF6gjDhStHjR1RPLcfbPx1UJ09zJQL8FzD/nN/iWqjggPx0
         VCaqa/PHLydWMYtSb7wKqEI2uA/ryX40pSh2B8ceBhSEcI/On700q2oBTSKBznU2yYHV
         3jmqzOBNY79TzfkcpbrM+4TOZvA2EYIlkDl1R/kTLuc/zdx3L7+1H0KlbBto8X1MvLHM
         +uGnJaSE3DFmelRlbS/Z37umd2aWt2sYDu/8auVWPTGlohLNlPjeb+yKsybTooP6JRad
         5v4QRHodb5R5wNVVCRpv/a6uAcECB1LySwg9wPh3IwyqJ5cawIID1uA3uF1xaw/3jQkL
         2AfQ==
X-Gm-Message-State: AOAM531YP74ZKDRfaBVKsQz5B27J8/QaoYMdkmuAblNY0n/1+dj5pJ17
        ypj0Ual1gciq5MN1A3EpRI2TrA==
X-Google-Smtp-Source: ABdhPJxEADIBp07L0R+ruwelHH6TDj6Xg6PJ/AvX/L0OocVRDXjbFtRzzWNjqxLLlQcYPT27nCrlcA==
X-Received: by 2002:a17:90a:578b:: with SMTP id g11mr10511282pji.76.1639999030334;
        Mon, 20 Dec 2021 03:17:10 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id m67sm10970100pfb.36.2021.12.20.03.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:17:09 -0800 (PST)
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
Subject: [PATCH V3 1/4] libgpiod: Add libgpiod-sys rust crate
Date:   Mon, 20 Dec 2021 16:41:35 +0530
Message-Id: <e37e09cf26a5325a764cb0a8df8813a99d0c868d.1639997241.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1639997241.git.viresh.kumar@linaro.org>
References: <cover.1639997241.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds libgpiod-sys rust crate, which provides FFI (foreign function
interface) bindings for libgpiod APIs.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore                            |  5 +++
 bindings/rust/libgpiod-sys/Cargo.toml | 12 ++++++
 bindings/rust/libgpiod-sys/build.rs   | 60 +++++++++++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs | 16 +++++++
 bindings/rust/libgpiod-sys/wrapper.h  |  2 +
 5 files changed, 95 insertions(+)
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
 create mode 100644 bindings/rust/libgpiod-sys/wrapper.h

diff --git a/.gitignore b/.gitignore
index 2d7cc7fc0758..3a80a65c087e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,3 +29,8 @@ libtool
 *-libtool
 m4/
 stamp-h1
+
+# Added by cargo
+
+target
+Cargo.lock
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
new file mode 100644
index 000000000000..a9c7b01365b2
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -0,0 +1,12 @@
+[package]
+name = "libgpiod-sys"
+version = "0.1.0"
+edition = "2018"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[dependencies]
+
+[build-dependencies]
+bindgen = "0.59.1"
+cc = "1.0.46"
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
new file mode 100644
index 000000000000..6e84378781ef
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -0,0 +1,60 @@
+extern crate bindgen;
+
+use std::env;
+use std::path::PathBuf;
+
+fn generate_bindings() {
+    // Tell cargo to invalidate the built crate whenever the wrapper changes
+    println!("cargo:rerun-if-changed=wrapper.h");
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
+fn build_gpiod() {
+    // Tell Cargo that if the given file changes, to rerun this build script.
+    println!("cargo:rerun-if-changed=../../../lib/");
+
+    let files = vec![
+        "../../../lib/chip.c",
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
+    generate_bindings();
+    build_gpiod();
+}
diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
new file mode 100644
index 000000000000..7d6caa7d9c11
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -0,0 +1,16 @@
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
+    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
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

