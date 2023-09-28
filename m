Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29FB47B1FD1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 16:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjI1Ohh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 10:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjI1Ohg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 10:37:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E144D136
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53639fb0ba4so636189a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695911853; x=1696516653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WODGD/gepLPbhfzAeHSaZzlAxaMM0w9oPhS08axsLk=;
        b=VwmAZHIGOhifK+8bWpDlLPHxpilRVDtaX0wkPdURheBilfJPD9rd98LyqsGV0KXZ6j
         M2VhWgAdR47sm46Ukkisxx65oixg40zTgYWf5aEMz9LoZEfUglpzWTfC2BxoqFqDu+mz
         3BV9+X7Pc6d0P2JM+UVRO/y60S3Cp4GpxEAhsba7BH9Pyp2aXR9NqVvS9VFNIOb2nCHD
         WHFVuLsWPXHkedlPJ6ofugQNdfnyWfirYs7Iobz71rXKyZ6faY9HoUt3YUKlm2fxeRcx
         8Vz52B73Z8dsbf+8OeFg4w+EEkk3WajCvYBONv8J8bRovCCaMBGjpaMeL0tAXwIrIPrW
         oNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911853; x=1696516653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WODGD/gepLPbhfzAeHSaZzlAxaMM0w9oPhS08axsLk=;
        b=LHRnZzwjuJfMciLfpbIBVFglNwl11qH7JVT+fm1xujitqzYAoMqJJjQvwKR3Unpj8p
         S6iakoWoXsuAZofItLUpWAxHgFWQCme9zaXojwqAmTGE8BHnGMkXL2JlaTSWWcLa3soD
         CO5tf9otOlpexLvxENqU+OvmqnZSxTTSCyNz1Gjqz/gEKgHTTkT2K01fgxbvAiFxlXy4
         nc6ByQpu3GGPAZuWISllMGj4uwCGlTC4ZA8aLSAUl51sBwI0T5ONkF7ME2j9wcymynLE
         +Lm8v9GPq0WkPJG25nzdz6wG1CXI4CSvzXdOHWblWEgBka2hyCpELM1wKO2DfYwhuepg
         ATgw==
X-Gm-Message-State: AOJu0Yw+JJcenTDNN0CVbaAzCDU11myh0J11AXgnmm+g4F5W8LbX/FCv
        JEQmlXsrcf8ku141e1rSmCg0Zg==
X-Google-Smtp-Source: AGHT+IE9iPN345uEaqu53oc3pY7GTp2qhW1fslqm1EMpg1vtbBX5+u9z7r0YUzJCzi/Wl8AOxYhrcQ==
X-Received: by 2002:aa7:c1c4:0:b0:531:1f3b:cb3b with SMTP id d4-20020aa7c1c4000000b005311f3bcb3bmr1366470edp.6.1695911853469;
        Thu, 28 Sep 2023 07:37:33 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005333922efb0sm9789688edr.78.2023.09.28.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 07:37:32 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 28 Sep 2023 16:37:28 +0200
Subject: [libgpiod][PATCH 1/3] doc: drop unneeded <p> tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-rust-send-trait-v1-1-30b4f59d13cb@linaro.org>
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
In-Reply-To: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695911851; l=2019;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=g3Dy1qiZHiiDC2hQfis0DEnXyaS70xPR1po/ulJVrEQ=;
 b=gXdXiIKzIdy9dnesUCsFEt+qXe1uMMnns/ZfrvaDsGW0H4cbDAnu0ZELvsbEiwACc380SdpsC
 0lLI7CwAMiXD+cRxzBQgboEGdlO0XRms8T3jBdebT5g+5SRcD0CTp4p
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Even before Doxygen gained Markdown support, empty lines were considered
as paragraphs. Changelogs indicate that this was the case since at least
the doxygen 1.2 series (where I found a mentiond that something around
this behaviour was fixed). So at least works in Doxygen versions
released after 2001 [1].

[1] https://sourceforge.net/p/doxygen/mailman/message/172899/

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 include/gpiod.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 71ae798..be51c3a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -22,11 +22,11 @@ extern "C" {
  * This is the complete documentation of the public API made available to
  * users of libgpiod.
  *
- * <p>The API is logically split into several sections. For each opaque data
+ * The API is logically split into several sections. For each opaque data
  * class, there's a set of functions for manipulating it. Together they can be
  * thought of as objects and their methods in OOP parlance.
  *
- * <p>General note on error handling: all functions exported by libgpiod that
+ * General note on error handling: all functions exported by libgpiod that
  * can fail, set errno to one of the error values defined in errno.h upon
  * failure. The way of notifying the caller that an error occurred varies
  * between functions, but in general a function that returns an int, returns -1
@@ -35,7 +35,7 @@ extern "C" {
  * codes for every function as they propagate errors from the underlying libc
  * functions.
  *
- * <p>In general libgpiod functions are NULL-aware. For functions that are
+ * In general libgpiod functions are NULL-aware. For functions that are
  * logically methods of data classes - ones that take a pointer to the object
  * of that class as the first argument - passing a NULL pointer will result in
  * the program aborting the execution. For non-methods, init functions and

-- 
2.41.0

