Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02020695960
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Feb 2023 07:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjBNGpp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Feb 2023 01:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbjBNGpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2023 01:45:44 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15805FF06
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 22:45:43 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id o13so14210731pjg.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 22:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWrs7PRMa7vxvB/SNvTJOOYXUMLn8sKYdP6YwzCMrY4=;
        b=Z+drAdYsTjUan+kehz72olmV82tFm38ZfHGVYwigm4V/egKWL7CvYj3GIlvxN5BX1g
         X6mLBQiwOoQ/Uaj+gVfWtNJkG5m3vWiVv0DUnxNAiw/O4H/zVDPTKx+sERoenEGsMFBi
         61V0YTnuDw133yhitYj5lxsF0OImA8lCcikMpQ9LcU0uguKxT7R/axM4dUH44UsC3Tjz
         dV7xtfYoUVgC9ng4f3YkDTRtjNnX8A3jLTg2hTxpuqL/PKL0NyI/Iuipq3bHwKIS1lP7
         gljoH6EWhsN/z84VHrgbXTk1okGuGakflSbZWty8GWbeNM4KtjfNN1eYVUjuKfuH1vu7
         0ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWrs7PRMa7vxvB/SNvTJOOYXUMLn8sKYdP6YwzCMrY4=;
        b=nkGb3kMuJhrT1X6XTIwt8dGOLRvgWpYUwVlqpbHvT9SqlOXdUC5s5m71gp+OqskhvP
         DUrpZwpF8NeLRYofNJslHq42YD42LwmF8tdAJUxVFsC0Y02jkJaRq6WiB/DXs+pf8mVK
         ZYCL2T/wEJ8nYKWzhKV+8aPO5N7FZyF+gR4vd2X+JhfbgQ4uROKqfrIYm+BEZNkaAcMC
         MQEOWj4paUOKWoD3hn6XRJ60C5LFf55rgOGhGwTNWA+5X4/rItQ/mBygGQlBJFzlAx6K
         7jgb0VPw2DQz6AqOBP01/jHwwBaVCYm1hbZ9/Gv05K+WiOXJpsCVeK0JFMMVWqgIuSMW
         +GkQ==
X-Gm-Message-State: AO0yUKWqhZS1A7nkpUhmrjIoiwKOYT4nBlV+56aOt+2bNSL2FBSNySjE
        qkVqo4UBmxJj/4CqQa5sq6Z+NQ==
X-Google-Smtp-Source: AK7set/66dBzw/ye+plGo0Y8LP74WVv/z4l3CNXHnECYSP8jaKX4Svkeq2fVXTHrM59zoBbflF5Vog==
X-Received: by 2002:a17:903:20d3:b0:19a:9221:c716 with SMTP id i19-20020a17090320d300b0019a9221c716mr1205214plb.25.1676357142509;
        Mon, 13 Feb 2023 22:45:42 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id v16-20020a17090331d000b00198f1de408csm9282398ple.268.2023.02.13.22.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 22:45:41 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/2] bindings: rust: Align formatting to what's suggested by 'cargo fmt'
Date:   Tue, 14 Feb 2023 12:15:34 +0530
Message-Id: <24d754e5d765de80f99d8f8942d7ffeea8f3110c.1676357080.git.viresh.kumar@linaro.org>
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
 bindings/rust/libgpiod/src/line_config.rs    | 13 ++++++++++---
 bindings/rust/libgpiod/tests/line_config.rs  |  4 ++--
 bindings/rust/libgpiod/tests/line_request.rs |  6 ++++--
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 6ddcec336da2..3848a3a68304 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -55,7 +55,11 @@ impl Config {
     }
 
     /// Add line settings for a set of offsets.
-    pub fn add_line_settings(&mut self, offsets: &[Offset], settings: Settings) -> Result<&mut Self> {
+    pub fn add_line_settings(
+        &mut self,
+        offsets: &[Offset],
+        settings: Settings,
+    ) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
         let ret = unsafe {
             gpiod::gpiod_line_config_add_line_settings(
@@ -84,8 +88,11 @@ impl Config {
         }
 
         let ret = unsafe {
-            gpiod::gpiod_line_config_set_output_values(self.config, mapped_values.as_ptr(),
-                                                       values.len() as u64)
+            gpiod::gpiod_line_config_set_output_values(
+                self.config,
+                mapped_values.as_ptr(),
+                values.len() as u64,
+            )
         };
 
         if ret == -1 {
diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
index 6e8962cf686c..b5a04ef8949a 100644
--- a/bindings/rust/libgpiod/tests/line_config.rs
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -5,11 +5,11 @@
 mod common;
 
 mod line_config {
+    use gpiosim_sys::Sim;
     use libgpiod::chip::Chip;
     use libgpiod::line::{
         self, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
     };
-    use gpiosim_sys::Sim;
 
     #[test]
     fn settings() {
@@ -93,7 +93,7 @@ mod line_config {
                 Value::Active,
                 Value::InActive,
                 Value::Active,
-                Value::InActive
+                Value::InActive,
             ])
             .unwrap();
 
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 8ec497f83406..d60e15a7a106 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -181,7 +181,8 @@ mod line_request {
             assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
 
             // Set all values
-            config.request()
+            config
+                .request()
                 .set_values(&[
                     Value::Active,
                     Value::InActive,
@@ -193,7 +194,8 @@ mod line_request {
             assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
             assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
-            config.request()
+            config
+                .request()
                 .set_values(&[
                     Value::InActive,
                     Value::InActive,
-- 
2.31.1.272.g89b43f80a514

