Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61E17BB21A
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 09:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjJFHYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 03:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjJFHYg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 03:24:36 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C614E9
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 00:24:33 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso316183566b.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696577072; x=1697181872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=if/WrUmwUFuAXP+TYQ6DFL1rpC0gab1v5RiN72QS+4c=;
        b=T2zTt094EBXV74zu/wQD5jijZmPZkTqxb2o+WUPTQqxy7+f0FDeq2NieOKAyP0WxJK
         bbFvBOTdFMUVARvk8882Qdsd8n+m7PqwjBqGEhSI7aDRJZ2DjYd0S1ccuZO9O5ORyMNG
         D1HWtITsUilYbd24MFvd8l5MxafxCF0Pckl+5AQ0mFLc85tGN9XI+YjkyROvbt3pUhcJ
         /69UidZVJ0Fi3zpzoyrgcQUP8UE9zVeR1FDilqbQMx5gpt5qmrkGc5pUHn5qv1VHVA4L
         l3pY22GHEirN0phWI+NZyvH/p5Ip3avunmrK+fODPxwP1zHEd7N8pE9cQyEupVcw+9yF
         38Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696577072; x=1697181872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=if/WrUmwUFuAXP+TYQ6DFL1rpC0gab1v5RiN72QS+4c=;
        b=gsPs3FEsas+wsJlt6M9WUkVBu5fYarS2OxW89pXZBrOXZ8fjOO1nM9+9o2TqI/JyBP
         WkSmYFlm0flbkpyTq1BzZjN3TdT9vkSHnsFTciyd+517z2YeOWlcM4gl+YHC8VvFQgD7
         9l5fnaaW4YtqMf4UdCab/AbVtCRh3Iu0PfubUq+6zjWPhqVpfc1oOw/IXJsk8LsIJp+d
         liOuOZNqTLAgjJI67rrlN+bDHybVTHeQ/UBA4J3KERkpXGuWu9p2H6xxeFxyb+RDB9mB
         12WWXATvks6TXnGkFrblIvUbLUG1Vu8w0xk4vZizmCIaLF/wDtoLQBzar/KJSxGZDAe0
         8oRg==
X-Gm-Message-State: AOJu0Yz+zlOTev1GxKaL9oxiPNO8NO3V/a+aMatMhJWl48CLbbfl0fTR
        cN7CsXAL6kEY7nExoraApx9XYg==
X-Google-Smtp-Source: AGHT+IHN2ICnFQ73TBYWwomq3IlINDt+UQzZka6xOwnGaDeGBtErxMFxbcP6owQFm1VIsccj/z3nPw==
X-Received: by 2002:a17:907:1dd2:b0:9a1:d087:e0c0 with SMTP id og18-20020a1709071dd200b009a1d087e0c0mr6468888ejc.42.1696577071634;
        Fri, 06 Oct 2023 00:24:31 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b009928b4e3b9fsm2394963eja.114.2023.10.06.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:24:31 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 06 Oct 2023 09:24:27 +0200
Subject: [libgpiod][PATCH 2/2] DONOTMERGE: bindings: rust: simulate v2.1
 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-b4-bindings-old-version-fix-v1-2-a65f431afb97@linaro.org>
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
In-Reply-To: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696577069; l=3237;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=m3OsgXmD8vXFhN8t3H37VIfRSxWj1p4yKCZVoXPvcTw=;
 b=fUcXQ8G7F1L6btGnkZ+IC7IMbSYxLxRgDa3dpXm6vU7nqaJoNxxhUCe1RDZCe3i8ev19ogai6
 y5kqOo0UWEyA2+p2Wma6vrQu7CAcOuFADhj/MRtrzE+RkcfQXpWIbmd
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

This is just a demo of a release bump to better illustrate what was
sketched in the previous commit.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml        | 9 +++++++--
 bindings/rust/libgpiod/Cargo.toml            | 3 ++-
 bindings/rust/libgpiod/README.md             | 1 +
 bindings/rust/libgpiod/src/line_request.rs   | 4 ++--
 bindings/rust/libgpiod/tests/line_request.rs | 2 +-
 5 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index b4d26e9..f90615d 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -18,11 +18,16 @@ exclude = [
     "Makefile.am",
 ]
 
+[features]
+v2_1 = []
+
 [dependencies]
 
 [build-dependencies]
 bindgen = "0.63"
 system-deps = "2.0"
 
-[package.metadata.system-deps]
-libgpiod = "2"
+[package.metadata.system-deps.libgpiod]
+name = "libgpiod"
+version = "2"
+v2_1 = { version = "2.1" }
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 3fd1d74..0d8745d 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -19,7 +19,8 @@ exclude = [
 ]
 
 [features]
-vnext = []
+v2_1 = ["libgpiod-sys/v2_1"]
+vnext = ["v2_1"]
 
 [dependencies]
 errno = "0.2.8"
diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
index c86b06e..1ef3743 100644
--- a/bindings/rust/libgpiod/README.md
+++ b/bindings/rust/libgpiod/README.md
@@ -28,6 +28,7 @@ C library will be exposed by default.
 Setting flags allows to increase the base version and export features of newer
 versions:
 
+- `v2_1`: Minimum version of `2.1.x`
 - `vnext`: The upcoming, still unreleased version of the C lib
 
 ## License
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index a7fe6d0..7ec6508 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -2,7 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-#[cfg(feature = "vnext")]
+#[cfg(feature = "v2_1")]
 use std::ffi::CStr;
 use std::os::unix::prelude::AsRawFd;
 use std::time::Duration;
@@ -32,7 +32,7 @@ impl Request {
     }
 
     /// Get the name of the chip this request was made on.
-    #[cfg(feature = "vnext")]
+    #[cfg(feature = "v2_1")]
     pub fn chip_name(&self) -> Result<&str> {
         // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
         // as `&self`
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index a936a1b..4e095a4 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -60,7 +60,7 @@ mod line_request {
         use super::*;
 
         #[test]
-        #[cfg(feature = "vnext")]
+        #[cfg(feature = "v2_1")]
         fn chip_name() {
             const GPIO: Offset = 2;
             let mut config = TestConfig::new(NGPIO).unwrap();

-- 
2.41.0

