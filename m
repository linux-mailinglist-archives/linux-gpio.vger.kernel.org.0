Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8EB7E225B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 13:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjKFMxc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 07:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjKFMxb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 07:53:31 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE94123
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 04:53:25 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso642169066b.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699275204; x=1699880004; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eRPCKnAEb9qXYG2Rnh/iNymHhy3Hp3y5dWq1ukMEYQY=;
        b=TLCaCM7Qr2E/+cyc4Vhfd8Qe1Yne7fHRn6vMTA5YDHGsdbAtH0jfOsxjeSYz7CbyVh
         YB5NQrDb8XmAJ2gJYxg3HfbHEfoLPb5mXJv4qSxrhlfxikyO1eV3phSAGSCpRoJRDRX3
         Sslh7TwKTHlksf6d/AmuKtO+zqOK2BH02y7jAxbo9mljDXJq7TpaiuG2yMBBUQuy26Wc
         nzOooKweZhNfsxFIAa2mpE0m/KwOaLxWqigIy5hlSbY5AaKq52HNw4cy7JA3Doi+pijp
         T5HtNMBHMwisgZz7fq56Nq6A6ayRM5Lchh7YUaHaOz63vAt8o/AnBoJ6nAGSm4/AZTJj
         krOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275204; x=1699880004;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRPCKnAEb9qXYG2Rnh/iNymHhy3Hp3y5dWq1ukMEYQY=;
        b=XhG2sdAe7KcwRb1cQhqKL8XOA2TUu8AVJrmyCWf8n7B8vsVigmVCwdZBQx5dvhgw4g
         O8ZDFBb8oWgaA3g+FsMmCKyOqclXHF394V/H8yfybvE3PimoTxbE/va4tC1qzWx26ZV1
         6vMxVtTa19GEQNts0+wa6Ga5CYyG/v6dOuhpclb37JjscuONect/eI0ItuKcto2e3gEI
         Q+PFGPAAntzb0zPf2LTB7xlCIdS6PqxFisKPUh7yprSB+kE1nJjoE7DRuqjO3PqLF2TR
         ug6W3qWsD+v6L7eZ8B/2weExk9NFeUdBu3tT+9suxrI8skShfZ8d6suLK9ZTwSW3u2G2
         PrgQ==
X-Gm-Message-State: AOJu0Yx5kFv6S+Y/T6NNX9ha7OC0HwAQ6I76DyGriU7zM2OVMmajF1mr
        PZSphSwrmhSLVUTmnGkaXJ2WGQ==
X-Google-Smtp-Source: AGHT+IF6ck3d9i6ssRuVpJrJ3DPafAglFNsrSjavyFn+ufCCjdUrhgjOQL+tWuN2J3OBSM8wZBs43w==
X-Received: by 2002:a17:906:c78d:b0:9bd:ff07:a586 with SMTP id cw13-20020a170906c78d00b009bdff07a586mr9907940ejb.68.1699275204378;
        Mon, 06 Nov 2023 04:53:24 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d5bf:3200::f39])
        by smtp.gmail.com with ESMTPSA id pv5-20020a170907208500b0098f33157e7dsm4052546ejb.82.2023.11.06.04.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 04:53:24 -0800 (PST)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 06 Nov 2023 13:53:14 +0100
Subject: [PATCH] bindings: rust: expose v2.1 features as flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rust-bindings-v2_1-v1-1-d90b785a06c0@linaro.org>
X-B4-Tracking: v=1; b=H4sIALnhSGUC/x3MTQqAIBBA4avErBtQ+yG6SkRYjjUbC6ckiO6et
 PwW7z0gFJkE+uKBSImF95ChywKWzYaVkF02GGUqrVWL8ZITZw6OwyqYzKTRdt42naV6UTPk8Ij
 k+f6nw/i+H5s0PaNkAAAA
To:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699275203; l=4088;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=pGm+M/Yc+lyj1Yr+m4xJCRPAQZBd1fNZc/lVq21Zomk=;
 b=8ZxrBJhzucgYR9GMaMDS7U5sj0wrh9rMJQY9/erh+RNRc8OlOgKnjOFELed64A/tojr2Gxo16
 uN4zYsH/TL6B08nh5pyExbNY/K9orDDnAevfjImRVs/Q5iEma646hb9
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v2.1 provided a getter to read the chip name from a request.

This adds v2_1 as feature in order to raise the minimum requested version
to v2.1 for exposing the new API.

This is identical to the concept patch that was posted [1] when this
feature flag mechanism was proposed. Only the commit message was
reworded.

[1] https://lore.kernel.org/all/20231006-b4-bindings-old-version-fix-v1-2-a65f431afb97@linaro.org/

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
With v2.1 being released, I am updating feature flags as previously
sketched.

To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>
Cc: Erik Schilling <erik.schilling@linaro.org>
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
index 3ce05df..7ddf5fd 100644
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

---
base-commit: 8c8547bfddd58b66c1ed254072bd0cfab2f671b6
change-id: 20231106-rust-bindings-v2_1-a8fa58ae4c0b

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

