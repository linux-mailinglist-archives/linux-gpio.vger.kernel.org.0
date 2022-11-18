Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 755A262F2DF
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 11:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241789AbiKRKpz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 05:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241788AbiKRKpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 05:45:25 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9909970AC
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:08 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id h193so4640066pgc.10
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCnV4M/bWZCJzk7Pe3pJbBiHKn9/ivVh97ayAYI0VZM=;
        b=xfIXFWEHymvu31vkoFQ7yD5kNv6FDysOXDDiamoGR4+DVSqMUXy/fUG1OgmWseD1Uf
         0ROsLCWJw8qCe4pKe27yzDE3z0xfcb3dgruiAOrsYscMaNnh/zGjbniZeNURJ69duxFw
         b2qUoXwMB7f1AYxtko6Yz8E1feM+/jUQghMWuvdFZc4HTpxsr0KPFXs730ukviuH3LcU
         YFsq6yh6um6iHAWKLF7IcQKOM8HUaZWH4cV9AvWlDi95dFoWAlUTAVcQIiuaVJamuiGx
         Yy5VYJVWDPKUpzvkakg/G75RZdNyRMAr/OJ+tYXbgmhhCBpG1SrdmyDiLgrhdcsvacIl
         Lo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCnV4M/bWZCJzk7Pe3pJbBiHKn9/ivVh97ayAYI0VZM=;
        b=XrEeYzgOO8c7jUzMvTDf2WVeBpoWEYxZkKmvuX1awws8jgZ9oWalK8q0xzwBTWLusl
         QB7ePWU7E0zWJervQCRaa2jh3MW3Q1i1SuwKpV04Qd6m+VrzhAIFbjdETDHUA6Jj4VHX
         SsSiD9WJBTgLHlLapFGBU1MvHrsp1aVb0URQyWuqiAJ5s+B3DFHTBK9850jqFwDEGDOX
         GUdJXcs8TQVjdMWgIlnYV2AzKS+cUreQGKTZiq98voDBCIKcuUO42Agr4g9ksqUdR/Cv
         dk57S0k2ey1v0H0OOmnZ1mnvIEEJCWDZGhqmXsusqbWsz3n9Jn+an6P5odKN7XDMTxXR
         WNgg==
X-Gm-Message-State: ANoB5pm1pdPGq7aLr/aLZYc5+mckPJA12edJ4ECwy2EIl50q6mn/ftz9
        2vzl71XtvESpuPzMUEz06dobMA==
X-Google-Smtp-Source: AA0mqf4orijkFqzUWT0fiAdTsa4BO6h8B3j06OoMsVLr3C+cGAvFVlsEg0wjbLagOYoaAyV7AVuUAQ==
X-Received: by 2002:a63:1062:0:b0:470:a47:996a with SMTP id 34-20020a631062000000b004700a47996amr6138750pgq.377.1668768308005;
        Fri, 18 Nov 2022 02:45:08 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id j7-20020a170903024700b00178aaf6247bsm3369202plh.21.2022.11.18.02.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 02:45:07 -0800 (PST)
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
Subject: [libgpiod][PATCH V10 1/6] bindings: rust: Add libgpiod-sys rust crate
Date:   Fri, 18 Nov 2022 16:14:37 +0530
Message-Id: <7033d165595079799351384f8b45883401af0ff2.1668768040.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1668768040.git.viresh.kumar@linaro.org>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
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

Reviewed-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/.gitignore              |  4 +++
 bindings/rust/Cargo.toml              |  9 ++++++
 bindings/rust/libgpiod-sys/Cargo.toml | 21 ++++++++++++++
 bindings/rust/libgpiod-sys/README.md  | 14 +++++++++
 bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
 bindings/rust/libgpiod-sys/src/lib.rs | 11 +++++++
 6 files changed, 100 insertions(+)
 create mode 100644 bindings/rust/.gitignore
 create mode 100644 bindings/rust/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
 create mode 100644 bindings/rust/libgpiod-sys/README.md
 create mode 100644 bindings/rust/libgpiod-sys/build.rs
 create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs

diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
new file mode 100644
index 000000000000..95054d9da312
--- /dev/null
+++ b/bindings/rust/.gitignore
@@ -0,0 +1,4 @@
+# Added by cargo
+
+target
+Cargo.lock
diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
new file mode 100644
index 000000000000..e3e253a4cf5e
--- /dev/null
+++ b/bindings/rust/Cargo.toml
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+[workspace]
+
+members = [
+    "libgpiod-sys"
+]
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
new file mode 100644
index 000000000000..479184da3f7b
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
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
+[build-dependencies]
+bindgen = "0.59.1"
+cc = "1.0.46"
diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
new file mode 100644
index 000000000000..7e6e643ab2ab
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+# Generated libgpiod-sys Rust FFI bindings
+Automatically generated Rust FFI bindings via
+	[bindgen](https://github.com/rust-lang/rust-bindgen).
+
+## License
+
+This project is licensed under either of
+
+- [Apache License](http://www.apache.org/licenses/LICENSE-2.0), Version 2.0
+- [BSD-3-Clause License](https://opensource.org/licenses/BSD-3-Clause)
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
new file mode 100644
index 000000000000..274069eb9e9d
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+extern crate bindgen;
+
+use std::env;
+use std::path::PathBuf;
+
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
+    generate_bindings();
+
+    println!("cargo:rustc-link-search=./../../lib/.libs/");
+    println!("cargo:rustc-link-lib=static=gpiod");
+}
diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
new file mode 100644
index 000000000000..68526910c8ee
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/lib.rs
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+#[allow(non_camel_case_types, non_upper_case_globals)]
+#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
+
+mod bindings_raw {
+    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
+}
+pub use bindings_raw::*;
-- 
2.31.1.272.g89b43f80a514

