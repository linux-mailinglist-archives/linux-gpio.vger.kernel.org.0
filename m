Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2C1759E71
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjGSTVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjGSTVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:12 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D601FC0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:11 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso76189595e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689794470; x=1690399270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+gm+qYKa1L0/EhrRIjsdKa1RHDSkybsYzUsyDLPbEg=;
        b=sG23YalEVK5/31K9p+iTP5UJWPHy353lMC4Ej0PK3wQd33+i+oVVGSkmb0Li7V8Ahw
         nFn1SjOQhDgqRyHmJuZba3fgdZajJJ6dceTpX6+X79A1Xz3lXaaJDcLC/0LBl99rRMti
         ziwGlBFKvjbovbkNmsORUFCBOXz/KFk9yV4fldhxj0J/0WDwQ4YPduEx3L93mqrZHAKM
         iRzdmt4m/fis3+uwH62IM6L9UazSbkk9Mv0MJ+IiDYEvEO4feok88QIztuKjN8cLDeXd
         5kGXCCcnIi58SCtBPfP7NdyO1pA/5LuSEUinwIcLRu7LpvZmxqxJ6wn1mS6/k9fiNtOm
         04JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794470; x=1690399270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+gm+qYKa1L0/EhrRIjsdKa1RHDSkybsYzUsyDLPbEg=;
        b=EMxWxpWybmn4L21MDFdked3jy8v59JBVKu8Kwu3M2F4Pdp9TL5eLl8xtN0fF90Z+/u
         zjKuXo1F/xJnmrhk6zWm1sqAWhw2M70aJOyCqE2m+OOCjJZAuAT//yElDDl6beAMI97n
         oHzThVEf375K+/55A2nRCGcGDAfCvZ15ZD866V8XYGmvMFEEc2zVuFO8vYY2qWT01rPJ
         /9/HYXR5ZPnivAC29X0qN/MofGtJ82hvCG+2RWo8G3RlfUl5OXQMeC9Kh5eFUOEB0tHY
         XPuZD9NOVRp/tX4uX4+GlEkhEfNw4cKs17/gfzOwQs29DBIkQRVKZlthg4hqrcn18olP
         lF9Q==
X-Gm-Message-State: ABy/qLaFmPRKIkAsT9SOKegG5DdffTEcgmzcP6SfjOfQlMzxp/DBTFdZ
        3fnWMF9X2DPHggFc31cbki1/pg==
X-Google-Smtp-Source: APBJJlHFXYaP3OP9Onccee1mzjS7IwdZzRZv+JlGA0nG/N0LUhyfncUjQvLQc5hkcfvsJmev2TwLRQ==
X-Received: by 2002:a7b:c3d0:0:b0:3fb:fef1:68b7 with SMTP id t16-20020a7bc3d0000000b003fbfef168b7mr6328072wmj.27.1689794469434;
        Wed, 19 Jul 2023 12:21:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f884:f48d:2867:5c1d])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2373454wmi.6.2023.07.19.12.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 5/5] bindings: rust: provide LineRequest::chip_path()
Date:   Wed, 19 Jul 2023 21:20:57 +0200
Message-Id: <20230719192057.172560-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719192057.172560-1-brgl@bgdev.pl>
References: <20230719192057.172560-1-brgl@bgdev.pl>
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

Provide a wrapper around gpiod_line_request_get_chip_path() for Rust
bindings and add a test-case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/line_request.rs   | 12 ++++++++++++
 bindings/rust/libgpiod/tests/line_request.rs | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 1140aa9..2caab14 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
+use std::ffi::CStr;
 use std::os::unix::prelude::AsRawFd;
 use std::time::Duration;
 
@@ -25,6 +26,17 @@ impl Request {
         Ok(Self { request })
     }
 
+    pub fn chip_path(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct LineRequest`.
+        let path = unsafe { gpiod::gpiod_line_request_get_chip_path(self.request) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        unsafe { CStr::from_ptr(path) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
     /// Get the number of lines in the request.
     pub fn num_lines(&self) -> usize {
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index d49874f..e4ed9c2 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -59,6 +59,19 @@ mod line_request {
     mod verify {
         use super::*;
 
+        #[test]
+        fn chip_path() {
+            const GPIO: Offset = 2;
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[GPIO]);
+            config.request_lines().unwrap();
+
+            let dev_path = config.sim().lock().unwrap().dev_path();
+            let s = dev_path.into_os_string().into_string().unwrap();
+
+            assert_eq!(config.request().chip_path().unwrap(), s);
+        }
+
         #[test]
         fn custom_consumer() {
             const GPIO: Offset = 2;
-- 
2.39.2

