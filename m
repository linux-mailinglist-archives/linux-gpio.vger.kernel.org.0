Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C88016792FD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 09:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjAXIX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 03:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjAXIXz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 03:23:55 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71533BB
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 00:23:53 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 20so10671337pfu.13
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 00:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1xjl3by9JCjuXLrMDuKC6Y2q8tmisS9acrc57d1oV0=;
        b=yU1R8shEexpkn4T+LpLZjrKYfyCc3SMj1diP45IvplHuzZxBMW3FN6DVRqeKrtNmeB
         k9UH7y5uLlNTq1zqkdn2pIW7TQAoTEwVET8Ioaj8UwYh0gZz61q+HJixyNmbj8ss9zbY
         Whrsx5shZJvWHlhlXpfrQF1/rWIqTumHTg00OIJNjntILDcBfWuBwZ6+0oyry6AIS/Qm
         SAjpVKsN07ii83IK7hgYaXN/sAMQ1MQPYMxkg64QUPz5BZVJdikB9uOBxP/xu02/Sr6u
         5G8hB43Sp1YWKs9m6eXeg3RnXeXte5+i+mZofH5YSwsVVnKMTOqEKzPD+6lCSHakAlQf
         gg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1xjl3by9JCjuXLrMDuKC6Y2q8tmisS9acrc57d1oV0=;
        b=i7meKo7VY+oKrllPhIVw172U/VWLRks2NmZHQDGFbNXbpqw+nznH9stnIJDZVyGTCh
         loLGCQDY576dglT7VR8WOmQvYzFO29WeoKg1UyjarGpxzRylVqnqkBgRNl9HtY8fGQqw
         i9drMoXFJzoA9c7NWItjbNeIlpm0xd5mn46kMVvBFKndGnMPWJLwFA2ve6qBzYqk1CvG
         sINnaOZy8+VEMW9ffkVRBJSMytWBDgV1rayxl9ABoCaFcLftSyWg9uRCMkFoPvrbIqJK
         N69n6zrNuQ2pPyDEPeNtRJPt3ZyoMVg8edILdW+dcr2x/VjMz/44HybbUAqLPQuPS6q2
         1k6w==
X-Gm-Message-State: AFqh2kqZksVQ23o5+My+Nym/laS++CdxyGTsdas0acUL8h3ByM3oM9MI
        GdAatyfRiXdOAdtNNkD73xjbHQ==
X-Google-Smtp-Source: AMrXdXuaLqLrbDJlq5MaBHxh6QbpMus95eoKKNv2ZeRrYA98BP7J1Z9VxwnhJ1qW3Gws6R/sDkTVlg==
X-Received: by 2002:aa7:9557:0:b0:58a:66a8:edf5 with SMTP id w23-20020aa79557000000b0058a66a8edf5mr30112190pfq.3.1674548632901;
        Tue, 24 Jan 2023 00:23:52 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id x26-20020a62fb1a000000b005892ea4f092sm976709pfm.95.2023.01.24.00.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:23:52 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] rust: Align formatting to what's suggested by 'cargo fmt'
Date:   Tue, 24 Jan 2023 13:53:46 +0530
Message-Id: <9ecb05d3e4518c8ace2747274da5521a0abdcde3.1674548551.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
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

Align code to follow what 'cargo fmt' suggests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/gpiosim-sys/src/lib.rs | 13 +++++++------
 bindings/rust/libgpiod/src/chip.rs   |  5 ++---
 bindings/rust/libgpiod/src/lib.rs    |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index c3f5b3fb9fd4..e3630442e24b 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -2,7 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use libgpiod::{Error, Result, OperationType};
+use libgpiod::{Error, OperationType, Result};
 
 #[allow(non_camel_case_types, non_upper_case_globals)]
 #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
@@ -16,14 +16,14 @@ mod sim;
 pub use sim::*;
 
 use crate::{
-    gpiosim_value_GPIOSIM_VALUE_INACTIVE as GPIOSIM_VALUE_INACTIVE,
-    gpiosim_value_GPIOSIM_VALUE_ACTIVE as GPIOSIM_VALUE_ACTIVE,
-    gpiosim_value_GPIOSIM_VALUE_ERROR as GPIOSIM_VALUE_ERROR,
     gpiosim_direction_GPIOSIM_DIRECTION_INPUT as GPIOSIM_DIRECTION_INPUT,
     gpiosim_direction_GPIOSIM_DIRECTION_OUTPUT_HIGH as GPIOSIM_DIRECTION_OUTPUT_HIGH,
     gpiosim_direction_GPIOSIM_DIRECTION_OUTPUT_LOW as GPIOSIM_DIRECTION_OUTPUT_LOW,
-    gpiosim_pull_GPIOSIM_PULL_UP as GPIOSIM_PULL_UP,
     gpiosim_pull_GPIOSIM_PULL_DOWN as GPIOSIM_PULL_DOWN,
+    gpiosim_pull_GPIOSIM_PULL_UP as GPIOSIM_PULL_UP,
+    gpiosim_value_GPIOSIM_VALUE_ACTIVE as GPIOSIM_VALUE_ACTIVE,
+    gpiosim_value_GPIOSIM_VALUE_ERROR as GPIOSIM_VALUE_ERROR,
+    gpiosim_value_GPIOSIM_VALUE_INACTIVE as GPIOSIM_VALUE_INACTIVE,
 };
 
 /// Value settings.
@@ -42,7 +42,8 @@ impl Value {
             GPIOSIM_VALUE_ACTIVE => Value::Active,
             GPIOSIM_VALUE_ERROR => {
                 return Err(Error::OperationFailed(
-                    OperationType::SimBankGetVal, errno::errno()
+                    OperationType::SimBankGetVal,
+                    errno::errno(),
                 ))
             }
             _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 9c3c2b414170..f4554a116946 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -206,9 +206,8 @@ impl Chip {
 
         // SAFETY: The `gpiod_line_request` returned by libgpiod is guaranteed to live as long
         // as the `struct Request`.
-        let request = unsafe {
-            gpiod::gpiod_chip_request_lines(self.ichip.chip, req_cfg, lconfig.config)
-        };
+        let request =
+            unsafe { gpiod::gpiod_chip_request_lines(self.ichip.chip, req_cfg, lconfig.config) };
 
         if request.is_null() {
             return Err(Error::OperationFailed(
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index a5d018cab73e..4abfcf2ba405 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -35,6 +35,9 @@ use gpiod::{
     gpiod_line_bias_GPIOD_LINE_BIAS_PULL_DOWN as GPIOD_LINE_BIAS_PULL_DOWN,
     gpiod_line_bias_GPIOD_LINE_BIAS_PULL_UP as GPIOD_LINE_BIAS_PULL_UP,
     gpiod_line_bias_GPIOD_LINE_BIAS_UNKNOWN as GPIOD_LINE_BIAS_UNKNOWN,
+    gpiod_line_clock_GPIOD_LINE_CLOCK_HTE as GPIOD_LINE_CLOCK_HTE,
+    gpiod_line_clock_GPIOD_LINE_CLOCK_MONOTONIC as GPIOD_LINE_CLOCK_MONOTONIC,
+    gpiod_line_clock_GPIOD_LINE_CLOCK_REALTIME as GPIOD_LINE_CLOCK_REALTIME,
     gpiod_line_direction_GPIOD_LINE_DIRECTION_AS_IS as GPIOD_LINE_DIRECTION_AS_IS,
     gpiod_line_direction_GPIOD_LINE_DIRECTION_INPUT as GPIOD_LINE_DIRECTION_INPUT,
     gpiod_line_direction_GPIOD_LINE_DIRECTION_OUTPUT as GPIOD_LINE_DIRECTION_OUTPUT,
@@ -45,12 +48,9 @@ use gpiod::{
     gpiod_line_edge_GPIOD_LINE_EDGE_FALLING as GPIOD_LINE_EDGE_FALLING,
     gpiod_line_edge_GPIOD_LINE_EDGE_NONE as GPIOD_LINE_EDGE_NONE,
     gpiod_line_edge_GPIOD_LINE_EDGE_RISING as GPIOD_LINE_EDGE_RISING,
-    gpiod_line_clock_GPIOD_LINE_CLOCK_HTE as GPIOD_LINE_CLOCK_HTE,
-    gpiod_line_clock_GPIOD_LINE_CLOCK_MONOTONIC as GPIOD_LINE_CLOCK_MONOTONIC,
-    gpiod_line_clock_GPIOD_LINE_CLOCK_REALTIME as GPIOD_LINE_CLOCK_REALTIME,
     gpiod_line_value_GPIOD_LINE_VALUE_ACTIVE as GPIOD_LINE_VALUE_ACTIVE,
-    gpiod_line_value_GPIOD_LINE_VALUE_INACTIVE as GPIOD_LINE_VALUE_INACTIVE,
     gpiod_line_value_GPIOD_LINE_VALUE_ERROR as GPIOD_LINE_VALUE_ERROR,
+    gpiod_line_value_GPIOD_LINE_VALUE_INACTIVE as GPIOD_LINE_VALUE_INACTIVE,
 };
 
 /// Operation types, used with OperationFailed() Error.
-- 
2.31.1.272.g89b43f80a514

