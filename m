Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5D275B18D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjGTOsK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjGTOsJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:48:09 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7116A1731
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:04 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so7057995e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864483; x=1690469283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEeTm4tgLAY/wxS6usZ00FvAJIkc2XjlANbsv7waCck=;
        b=e1lDVxmlg7Al1vFARIq13fFIwaApdE++FHGu9d+2h1EtCGiwfw3i9gJ9AHTpvXc1ln
         Z7YJAWRFoZ4M7vUbGQZBjv1RkxHTeosKN/4FF9hyyWr5r5YfUoiy6aoXGap0U1FOFDZc
         dJLH+1q8rwQ4f9CaQT5gnoz3pUqLtRe/FR1LG77MdWE/2DGGu5/YbJCujRd2BfAq9vtg
         ziebJPVbEMYhZR8LYHlUSyE9j46N/FySTtiwngSsSlDcT948PA/AD6Z4fFuRAzitDdH9
         AE/6wUh8ykdn4dZNnzuIWiCQD4mu1XDJv1xtATNIGlj2xsikyy+kPiMB5fWdUSKi7crS
         IkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864483; x=1690469283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEeTm4tgLAY/wxS6usZ00FvAJIkc2XjlANbsv7waCck=;
        b=igT4myh2khQmXccD6dHfOoIx5irC1q9tvx7xzEoBu3C7WUdRnduXNL9dRuvHPpiHD6
         SMVgZl5z5R+EmExgpsVQAa9G4cur6nESqiBpOXRBUkNDLgDzmZURBLi/oql6HGz8JIGb
         81THrb1erN7hpuNmkqquV+h3KLlHORX9brp29+BBIwry+LJ+bKFogpMJVJVwXF84RjaH
         RlxBwLp1StXimc8lEYYpeeNznOYRHBroAroS/5eGfwRT9iRkolytAgZpdej7iuWO8z2X
         KF2i79c4LwsKZQxQNUcGg47PlSk46PtWgYiEXP1oX2QeCRuS+/pjvejZM9JA1KcFZ/aR
         N/Iw==
X-Gm-Message-State: ABy/qLae6w5m7AZZ80R5WdMjJKZmmc9s1HdODvHAxMIoYLz+vJuMM4ku
        ma83+JRRZCn6liOVq0tgGKrO/A==
X-Google-Smtp-Source: APBJJlHyW0fYMf6/3jZ0iIfNbyuS3mCUo8EDv3DLSZrlWHIzwJKCm41KtayPB7Ok0r0X0DpRQDE1IQ==
X-Received: by 2002:a05:600c:213:b0:3f6:91c:4e86 with SMTP id 19-20020a05600c021300b003f6091c4e86mr2018313wmi.3.1689864482941;
        Thu, 20 Jul 2023 07:48:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bd83:c166:7e2d:3d74])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1550906wrn.83.2023.07.20.07.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:48:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 5/5] bindings: rust: provide LineRequest::chip_name()
Date:   Thu, 20 Jul 2023 16:47:47 +0200
Message-Id: <20230720144747.73276-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720144747.73276-1-brgl@bgdev.pl>
References: <20230720144747.73276-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a wrapper around gpiod_line_request_get_chip_name() for Rust
bindings and add a test-case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/line_request.rs   | 16 ++++++++++++++++
 bindings/rust/libgpiod/tests/line_request.rs | 14 ++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 1140aa9..737c06f 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
+use std::ffi::CStr;
 use std::os::unix::prelude::AsRawFd;
 use std::time::Duration;
 
@@ -25,6 +26,21 @@ impl Request {
         Ok(Self { request })
     }
 
+    /// Get the name of the chip this request was made on.
+    pub fn chip_name(&self) -> Result<&str> {
+        // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
+        // as `&self`
+        let name = unsafe { gpiod::gpiod_line_request_get_chip_name(self.request) };
+
+        // SAFETY: The string is guaranteed to be valid, non-null and immutable
+        // by the C API for the lifetime of the `gpiod_line_request`. The
+        // `gpiod_line_request` is living as long as `&self`. The string is
+        // returned read-only with a lifetime of `&self`.
+        unsafe { CStr::from_ptr(name) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
     /// Get the number of lines in the request.
     pub fn num_lines(&self) -> usize {
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index d49874f..9af5226 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -59,6 +59,20 @@ mod line_request {
     mod verify {
         use super::*;
 
+        #[test]
+        fn chip_name() {
+            const GPIO: Offset = 2;
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[GPIO]);
+            config.request_lines().unwrap();
+
+            let arc = config.sim();
+            let sim = arc.lock().unwrap();
+            let chip_name = sim.chip_name().clone();
+
+            assert_eq!(config.request().chip_name().unwrap(), chip_name);
+        }
+
         #[test]
         fn custom_consumer() {
             const GPIO: Offset = 2;
-- 
2.39.2

