Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E00C7BB219
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 09:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjJFHYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 03:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjJFHYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 03:24:35 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C84CA
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 00:24:32 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9adca291f99so311130466b.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696577071; x=1697181871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgOnqDtHwQ7h8p/R01B58Kl1a7Klb09gudZ6n02NOho=;
        b=fEs/Zcrq38vQf+3AfJm5L+qXWKX8DF0KZm5vSknyJGLOkA6/gbKVp+y3DscLi/FxaS
         jNSa7AvIWmH4vHurmCYQweL7TJ+TMqFj27YFUPPT0i8t3qfAepTfRpZxL497rNgjc2dz
         0Y6JvtapDY6hf0CGJhd+7yVM83kdAoM0Gw1n/IRrFXQucEFR3BMdNrExyn4UbCle2dwQ
         JOFrTjD2kXS3vGpC8+Qk/WmtvyS3/taCv6GtWilzDg5BOjTdx3qEPDEtM7wSxbXKsuwG
         7yYOvPp29wLnGadObmLqWO6qP0NwSKX0UmErsa3QLtN3FvLHBTaQtZJ6NEO/lVdzIJ9z
         Ar2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696577071; x=1697181871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgOnqDtHwQ7h8p/R01B58Kl1a7Klb09gudZ6n02NOho=;
        b=CSL5QV9+PdzIKphtviqwN5H+wbC4zCnBtSygnpx5BoNf8VLyX4hhZC8NX9FDezaP9A
         y3aIYSdO/qh9EishtSsOQz94kCHPEj2/eC+3XLqftg3er2es3VU1vJOcD74K+ayZDvXC
         pXswa408Ou2qPC7hLdExWaYURnr8p2Wkrr00sjv/ElxdRMKlmqbo18uVbjojksged2pQ
         UcQnJTC3fkc3MCH5EPzFe/nZ/aS29PHCsxOL8paQ0MwWz/dM+1j4FqyiGX/RtPBYdzHA
         1m0i7qYLqQeh/Zj2wDBSBHU/Rndb/amkF8ed8TbxSTYpzUiG+ZhNMA3dYtW5Fq79pSdm
         uctA==
X-Gm-Message-State: AOJu0Yy8eh1I1rdA4nlrNSU5UbjjJoF3eV6Djz+qBH6zOvMCXubgr3Mq
        YJFUoNXcy0tdfe8X0xsEJeo1OQ==
X-Google-Smtp-Source: AGHT+IH59Kjq51CdReP9LPYl8HRuBWwl6HV954S7s59BqaojAPMmbGKpaxDgvv2eV/xiSI0nVjKabQ==
X-Received: by 2002:a17:906:530b:b0:9a9:9c6c:c4ef with SMTP id h11-20020a170906530b00b009a99c6cc4efmr6522492ejo.23.1696577070913;
        Fri, 06 Oct 2023 00:24:30 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b009928b4e3b9fsm2394963eja.114.2023.10.06.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:24:30 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 06 Oct 2023 09:24:26 +0200
Subject: [libgpiod][PATCH 1/2] bindings: rust: feature gate unreleased
 features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-b4-bindings-old-version-fix-v1-1-a65f431afb97@linaro.org>
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
In-Reply-To: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696577069; l=4315;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=Af7w3grDk1o85odIatDfXZ6tJDlO6vC+GJr6NWVKej8=;
 b=WnthAk2Zdp/6RBz+yx2WHaILDQKwpUNPK0olypQyCuDwvonM4l4Nsop7o8+8mt2yWjZuo+x2u
 qgT2gKBrjt9AZT/PnOf/ZUAdaUPZMgCvUJu8nANbZlCeU6z4QrSlrcH
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

`gpiod_line_request_get_chip_name()` is not released yet. Still, libgpiod-sys
will just happily generate bindings for it if it sees the definition in the
header file.

This guards the unreleased features behind an optional feature `vnext`.

To sketch the process of what happens once these features get into an
assumed "2.1" release:

libgpiod-sys will get updated with a `v2_1` feature. That feature would
then raise the minimum version that is attempted to query from pkg-
config. An identical feature will then be introduced on the `libgpiod`
crate and `vnext` guards will be changed to `v2_1` guards. The `vnext`
feature will then be updated to require the new `v2_1` feature.

Eventually, we will probably raise the minimum supported version for the
rust bindings and drop all the version gates before that.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml            |  3 +++
 bindings/rust/libgpiod/Makefile.am           |  2 +-
 bindings/rust/libgpiod/README.md             | 13 +++++++++++++
 bindings/rust/libgpiod/src/line_request.rs   |  2 ++
 bindings/rust/libgpiod/tests/line_request.rs |  1 +
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 3be4aa0..3fd1d74 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -18,6 +18,9 @@ exclude = [
     "Makefile.am",
 ]
 
+[features]
+vnext = []
+
 [dependencies]
 errno = "0.2.8"
 intmap = "2.0.0"
diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
index 92edbfc..619e36c 100644
--- a/bindings/rust/libgpiod/Makefile.am
+++ b/bindings/rust/libgpiod/Makefile.am
@@ -8,7 +8,7 @@ command = SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1 \
 		SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="${PWD}/../../../lib/.libs/" \
 		SYSTEM_DEPS_LIBGPIOD_LIB=gpiod \
 		SYSTEM_DEPS_LIBGPIOD_INCLUDE="${PWD}/../../../include/"  \
-		cargo build --release --lib
+		cargo build --features=vnext --release --lib
 
 if WITH_TESTS
 command += --tests
diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
index 8d514e7..c86b06e 100644
--- a/bindings/rust/libgpiod/README.md
+++ b/bindings/rust/libgpiod/README.md
@@ -17,6 +17,19 @@ By default, `libgpiod-sys` builds against the libgpiod version identified via
 `pkg-config`. See the `README.md` of `libgpiod-sys` for options to override
 that.
 
+Currently at least libgpiod 2.0 is required with the default feature set.
+
+## Features
+
+The Rust bindings will usually be built against whatever libgpiod version a
+system provides. Hence, only the functionality of the oldest supported libgpiod
+C library will be exposed by default.
+
+Setting flags allows to increase the base version and export features of newer
+versions:
+
+- `vnext`: The upcoming, still unreleased version of the C lib
+
 ## License
 
 This project is licensed under either of
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 64ef05d..a7fe6d0 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
+#[cfg(feature = "vnext")]
 use std::ffi::CStr;
 use std::os::unix::prelude::AsRawFd;
 use std::time::Duration;
@@ -31,6 +32,7 @@ impl Request {
     }
 
     /// Get the name of the chip this request was made on.
+    #[cfg(feature = "vnext")]
     pub fn chip_name(&self) -> Result<&str> {
         // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
         // as `&self`
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index e0ae200..a936a1b 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -60,6 +60,7 @@ mod line_request {
         use super::*;
 
         #[test]
+        #[cfg(feature = "vnext")]
         fn chip_name() {
             const GPIO: Offset = 2;
             let mut config = TestConfig::new(NGPIO).unwrap();

-- 
2.41.0

