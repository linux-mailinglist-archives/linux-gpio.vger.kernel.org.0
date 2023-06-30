Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F20743AA6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjF3LTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbjF3LTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:19:04 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151C12D69
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb9ae4cef6so2794888e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688123940; x=1690715940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdp2jklKIUHlbGZ+iyT7OxyoQgFVKjMZj0ce2OdO9AQ=;
        b=qqT+Surz21lrxAxQeKSE5lumODcHwazDghZALK4qbCGcGPu1iClzdnxz5+z2czJ3E+
         EfNdkqeVq4D/6lg60vnfUFuYpW4tyMewrLR0HD+DFy7AoEYp6bb+yTiwZ+LZSV5//P+u
         5iy/vaDB5G3HnK4pnNIntW1c3RVZ5R6htaEAZhU+oSqlFFPfCJa9UL6SLFMQ78hnk3Eq
         V4+DmxS2YQngFKg5TtMhULajGLfCZksrD5rWDmhVqEn66rXwROGazJPIeN2uIW1RVtrm
         AjlAzi+j0Q+t3SdKuWR76wFnmfqPGwOtDkDtPixhHHcvGBMSIMZSozGwZdFZZQLcjaEc
         PTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123940; x=1690715940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdp2jklKIUHlbGZ+iyT7OxyoQgFVKjMZj0ce2OdO9AQ=;
        b=hw+0+I3IAN2BhEzZYelPqABWnf4DvFub//2EKXxgVDoqdSODOgWn5OsDVdno/dQItK
         Q4rfCcM/3MHg3AjcI8GsMPZ7QzbX+oiOsTQOblhCA2VsdKVf2N+zr17k/hFw1a7osSL3
         7ypjxF2KzrghScUEoe02QhtErAD86zWuLBOZZ+UAOP8nyrjY5J9fl4WRBWur+NnrKj81
         a1vpFkTap9hGbkdwr36ZI4gQluB8FIg/PaKnDlBP/FuQZQ0kmKcl5sJVXqdr8C8gRo9S
         XPM8YY9cadIibzOYzyPLB2gOe9jo88anQ+Che/Z4wXtN+a+9o2UsdXzDixi6zOGpaDJ7
         MNXA==
X-Gm-Message-State: ABy/qLZQLpCArbpi8wSLnNgMU24g/9qIGEY/SKGzXDw9eJ03y0isjQ5C
        N7CJK0LzIlwL65r6K8G36cgU+Q==
X-Google-Smtp-Source: APBJJlGGLEWrDt4KkkoXmw3JLUy6bDdcu+l5qeP3EEIYJMev2fUMNoDRD2L6/80oxNOZ0Z8x9n6snA==
X-Received: by 2002:a05:6512:39c3:b0:4f9:570c:7b28 with SMTP id k3-20020a05651239c300b004f9570c7b28mr2557331lfu.32.1688123940146;
        Fri, 30 Jun 2023 04:19:00 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm4621917wml.15.2023.06.30.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:18:59 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 30 Jun 2023 13:18:45 +0200
Subject: [libgpiod][PATCH v2 2/4] bindings: rust: clippy: silence
 false-positives on casts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-clippy-v2-2-f44447925ad6@linaro.org>
References: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
In-Reply-To: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688123937; l=2121;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=/7Zaz4hVCiSuNFycSloWAx0XowWxCP5nKw8JqJQfp8Q=;
 b=2hit4+Nru8pDNC5jytEPDV1S7CXj9kB+hqZSPHjbsrBkBfDaPa+PO0kfp7cg/5+L4TNQm9yTN
 LqkoePRrgjgBU31vZC3T24gbRvuuVrghTVNnT5+MFcygQonvCgZ5kli
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

clippy falsely complains about these lines. The problem is known, but
unfixed [1]. So lets silence the warning until a fix is widely available.

clippy version: clippy 0.1.70 (90c5418 2023-05-31).

[1] https://github.com/rust-lang/rust-clippy/issues/10555

Reported-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/line_info.rs     | 3 +++
 bindings/rust/libgpiod/src/line_settings.rs | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 702f1b4..c4f488c 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -142,6 +142,9 @@ impl Info {
 
     /// Get the debounce period of the line.
     pub fn debounce_period(&self) -> Duration {
+        // c_ulong may be 32bit OR 64bit, clippy reports a false-positive here:
+        // https://github.com/rust-lang/rust-clippy/issues/10555
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
         Duration::from_micros(unsafe {
             gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 79ee2f5..f0b3e9c 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -218,6 +218,9 @@ impl Settings {
 
     /// Get the debounce period.
     pub fn debounce_period(&self) -> Result<Duration> {
+        // c_ulong may be 32bit OR 64bit, clippy reports a false-positive here:
+        // https://github.com/rust-lang/rust-clippy/issues/10555
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         Ok(Duration::from_micros(unsafe {
             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings) as u64

-- 
2.41.0

