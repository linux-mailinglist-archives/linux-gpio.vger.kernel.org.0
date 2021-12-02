Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE9446623D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 12:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357300AbhLBL0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 06:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346343AbhLBL0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 06:26:22 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAC4C06174A
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 03:22:59 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y8so20013705plg.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qb7XHcV9bdfS0ofwmwIWQSLRIlkuHKmeKdMEIPGzvpw=;
        b=WNGWDGh5OLceO9bq/R9GUeqYyuTcn4smrkAlNTim5/y1OvVYOXDqIZjQf1lRRy9sSo
         OkBakBRbcqpDjdVGmObT2QXHP8tdq/OmAc+f4xi5vL5g+Q9sAxxQdXNRZ+QwVzxaRznF
         /+3MwgecUfIpSqiRrUaLn4U15ToW6WrZoE1V3bhzFoydZbZutpqAH2bKh2ctUTDWl11D
         6s2+vWUvqqghe5uM/ZOlYEbShelFNmjbZmZENgMQnQo0XHBq8I8e8cl8TohoUT35r3ZX
         mUtaslz+SgTnTfMF+BIW8nF9iIyYEDJT+9uTSVUTqWiLNwk8H7/RapQcF71qI5AwdQld
         uQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qb7XHcV9bdfS0ofwmwIWQSLRIlkuHKmeKdMEIPGzvpw=;
        b=nZX8TtVbGkPny/wqIXVsiilmand/HJEIRhnSPuYjY5BFL2RA/NGQGrwKlNgYdwkZnk
         +nn9sKO2miYNYNMpnTDbzCmc6K8/0seOEeQ4hbcO4G4EkMC1JNYvH0ROeiw5+FoLvRmn
         sgYAZ0PeaD4YxNH2ceZR+fTUew9pqRqTSIEC6Vhik8dQSzSTBeDAzzE9nduxmEdF1PET
         pXXD+KA7tOpqFFe8nEiortPMvJVa/ZX9RAEp7Pa2dRPMCmF+OqCX5RIv2ocFcvHk3nht
         z0EIPoPOOBSyqGgD4yOxUb9V1aj2W+uv/51EpVQuatf5nTDIt0i/zrWHdUs3pFDj7bwD
         1OCw==
X-Gm-Message-State: AOAM5338C++l4Q39vgjkEzmzLyoKyp6Qj8ipXB/yxvx/QRQteh9TAjHN
        JTQul18Z2Lsov0jXQwegjHHTpg==
X-Google-Smtp-Source: ABdhPJzQH24dkCX3tAQirxcmEWlHuKWkShX+OtaG3KB7sSyUVIvrnzV6dLJS5gp9R8KQdi8wkzeEbg==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id pg14mr5176397pjb.143.1638444179499;
        Thu, 02 Dec 2021 03:22:59 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id z4sm3340744pfh.15.2021.12.02.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:22:59 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: [PATCH V2 1/4] libgpiod: Generate rust FFI bindings
Date:   Thu,  2 Dec 2021 16:52:46 +0530
Message-Id: <7c02af9b06fcfdbfd2c6096992c9f7dc047cd643.1638443930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1638443930.git.viresh.kumar@linaro.org>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Build FFI bindings for the libgpiod helpers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore                    |  5 +++
 bindings/rust/Cargo.toml      | 12 +++++++
 bindings/rust/build.rs        | 60 +++++++++++++++++++++++++++++++++++
 bindings/rust/src/bindings.rs | 16 ++++++++++
 bindings/rust/src/lib.rs      |  0
 bindings/rust/wrapper.h       |  2 ++
 6 files changed, 95 insertions(+)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/build.rs
 create mode 100644 bindings/rust/src/bindings.rs
 create mode 100644 bindings/rust/src/lib.rs
 create mode 100644 bindings/rust/wrapper.h

diff --git a/.gitignore b/.gitignore
index 2d7cc7fc0758..0d3a842734bf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,3 +29,8 @@ libtool
 *-libtool
 m4/
 stamp-h1
+
+# Added by cargo
+
+bindings/rust/target
+bindings/rust/Cargo.lock
diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
new file mode 100644
index 000000000000..62f3d52ddb0f
--- /dev/null
+++ b/bindings/rust/Cargo.toml
@@ -0,0 +1,12 @@
+[package]
+name = "libgpiod"
+version = "0.1.0"
+edition = "2021"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[dependencies]
+
+[build-dependencies]
+bindgen = "0.59.1"
+cc = "1.0.46"
diff --git a/bindings/rust/build.rs b/bindings/rust/build.rs
new file mode 100644
index 000000000000..cd776332bbb9
--- /dev/null
+++ b/bindings/rust/build.rs
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
+    println!("cargo:rerun-if-changed=../../lib/");
+
+    let files = vec![
+        "../../lib/chip.c",
+        "../../lib/edge-event.c",
+        "../../lib/info-event.c",
+        "../../lib/internal.c",
+        "../../lib/line-config.c",
+        "../../lib/line-info.c",
+        "../../lib/line-request.c",
+        "../../lib/misc.c",
+        "../../lib/request-config.c",
+    ];
+
+    // Use the `cc` crate to build a C file and statically link it.
+    cc::Build::new()
+        .files(files)
+        .define("_GNU_SOURCE", None)
+        .define("GPIOD_VERSION_STR", "\"libgpio-rust\"")
+        .include("../../include")
+        .compile("gpiod");
+}
+
+fn main() {
+    generate_bindings();
+    build_gpiod();
+}
diff --git a/bindings/rust/src/bindings.rs b/bindings/rust/src/bindings.rs
new file mode 100644
index 000000000000..7d6caa7d9c11
--- /dev/null
+++ b/bindings/rust/src/bindings.rs
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
diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/bindings/rust/wrapper.h b/bindings/rust/wrapper.h
new file mode 100644
index 000000000000..50dc5f4db406
--- /dev/null
+++ b/bindings/rust/wrapper.h
@@ -0,0 +1,2 @@
+#include <string.h>
+#include "../../include/gpiod.h"
-- 
2.31.1.272.g89b43f80a514

