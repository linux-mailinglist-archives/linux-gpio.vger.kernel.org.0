Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E9F4613DD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 12:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbhK2LdC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 06:33:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241940AbhK2LbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 06:31:01 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167BBC08EAC9
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:42:31 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id o14so11826208plg.5
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y42wHLnBaM0UkhWxtkOYP/6OMdTpF5w+ZF85RKVObZY=;
        b=ONps0jn35Tt4C5oYgB6rpbnNSr3mdu9hIQ7l9kPnKb/Sqhu5PAYdmcHJzaDntzKSqR
         2xzHcElYdsaTaaXSEtBYPyqkNRR9AoA3cN5F8ahnSeU3ZSd1NgGIne3C+z2tGzrIl9Ox
         lplC9dYiY+R0iVidZoxoreALjlS/L8QeT5jyJg1zH6bYa72G2YX0mPDRvN7cpnDQvuxZ
         rpaCJv6yV/f5/bVJL0mf2ME5/l9Mc2lWb+n67FjQmT7gHNjg8g6RHNlhsJA+idVGnI+H
         I8/7vBvZpMirOWDTh/qdBXJVGWSrry3RD36uX5euseo+BBNLeguIBc8L6L9WOomELfPo
         PQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y42wHLnBaM0UkhWxtkOYP/6OMdTpF5w+ZF85RKVObZY=;
        b=qEaZ1qfK03d62LU74RfiNLReDdhFVP5k9f39YxkytANiFkQA+XjtBu+hVKDXb3mNlB
         0nfn7nzP7K2ABujSTEOyZxdanqUG2r108SUuFXtuPeL1h01SK5Ng+6HoOLymNf9l84GA
         LCLffkGethVJXjURLfG9nO64zc6u/+rGryfaJcjoZ9ht6kMzh78JSzOwiA1pn0GZqQ4T
         GUOVgGOWHgdLMU7RCmabS+aJfKYV9ANS5JVbiti3NafqTj0LIjHvBmLobM8OrUigCpxk
         LQIP2yoa01qqLalCtOH5B9vjipTd/R9/BKmdIuL5lF8GuI413TpdSd0nhCV4ytf/VhvF
         eo3Q==
X-Gm-Message-State: AOAM533JLdCfjTfkxCl0fmsd2VQRnTeFTvXKnwGAKP7RYrb6o7hjGqiL
        OtaUqOPq5ino7N/fS9+hBQ+8Vg==
X-Google-Smtp-Source: ABdhPJy1KUf7obEcx4a5ZtXHFGnGKG+aGeJAaIkV2YvnTQM1kOgbR0GiMGr/arBmYcokMsGJsSKFtQ==
X-Received: by 2002:a17:90b:4ad1:: with SMTP id mh17mr37273213pjb.33.1638182550582;
        Mon, 29 Nov 2021 02:42:30 -0800 (PST)
Received: from localhost ([122.171.9.64])
        by smtp.gmail.com with ESMTPSA id t3sm15457398pfj.207.2021.11.29.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 02:42:30 -0800 (PST)
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
Subject: [PATCH 1/2] libgpiod: Generate rust FFI bindings
Date:   Mon, 29 Nov 2021 16:12:22 +0530
Message-Id: <c1de18c2aa47be8dc30ec0674f61f50e478b64f0.1638182138.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1638182138.git.viresh.kumar@linaro.org>
References: <cover.1638182138.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Build FFI bindings for the libgpiod helpers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore                    |  6 ++++
 bindings/rust/Cargo.toml      | 12 +++++++
 bindings/rust/build.rs        | 60 +++++++++++++++++++++++++++++++++++
 bindings/rust/src/bindings.rs | 16 ++++++++++
 bindings/rust/src/lib.rs      |  0
 bindings/rust/wrapper.h       |  2 ++
 6 files changed, 96 insertions(+)
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/build.rs
 create mode 100644 bindings/rust/src/bindings.rs
 create mode 100644 bindings/rust/src/lib.rs
 create mode 100644 bindings/rust/wrapper.h

diff --git a/.gitignore b/.gitignore
index 2d7cc7fc0758..8b82ada3bc80 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,3 +29,9 @@ libtool
 *-libtool
 m4/
 stamp-h1
+
+# Added by cargo
+
+bindings/rust/target
+bindings/rust/Cargo.lock
+bindings/rust/bindings_gen.rs
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

