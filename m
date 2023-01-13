Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B6566A55F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjAMVwZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjAMVwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:23 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10B889BD4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:22 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso18284289wms.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKu9LAcoRnaVXGMhpbfRSf4sOsGlFFiS1EsvYro8gCU=;
        b=NFX63P6lxhp+15PkMI8roN4WHyfypbukueL8oEZQN2ZZXc1uaa73m2TAz5p6b7uYwr
         tg0dPjwha7MNjf8pTsmH8RNwlnStvQVNdfqDHf8yQYWDdrOF9+xBRwAJisU3pPqrcRXm
         fJsj3Mae/oe8kgO2AoM5Gdd69AeZg/Zu6BrjWsDXTYhtNn4fwhAeL3jdbKYxUHZXUbR0
         aAe2udGXYOMieEodLURkQ7w6JMewsxv7HI5BaOxd5YNc3lKns6UgjWPosSUMNOJF0CSt
         F10t7gjXKxZMHQ2WsxAoXksViYjTh0pnUlZ+SrKwODXhiEh5qh37rC0JVzIvmLaU7aZ0
         z5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKu9LAcoRnaVXGMhpbfRSf4sOsGlFFiS1EsvYro8gCU=;
        b=XRMN87q2rycBPQY644rAb867VXXvhfKwINJf52ZWr3N5KSVq7ZdQojx5yVbOErmj98
         0/4qyOfm6lrV6/rhUitaH1feNxrTjgewRC3sdzw1AGp5M4wPNoDhnVLpndhj7bfnfdiH
         AmBfkDHgP7exOs1QbIIY8l1olQUBEAlA3xD4sflRCpL7uv6Ryu59zknys0Cs7zmYsyj4
         m51MgFVk5ldIeHed0fM43o7oEINUmseHH0GJ814/PVTI49FVjRmaC50x7tTFTiMEW81M
         hFL4Osxo/NhgoKUjBsQlj95GNUieBTylNMUe69qVDNJQo2xqTjSe1v9gx9xkhhm4k3gq
         f9mA==
X-Gm-Message-State: AFqh2kroroG8oL+0re1hveCt1PHPAKrvt0rxf6yr/VXcpyoEd5KcmH7j
        rF+au3rMOJFZnHxDgxMU6j1KgA==
X-Google-Smtp-Source: AMrXdXvBmufh+gmjWeqzs/wKYMyYMoEOSo7B5ZZ3QJYkpeCOPvBn1e2eAnclhaDPXNGSEIK/tWM2TA==
X-Received: by 2002:a05:600c:4e0c:b0:3d9:eedd:e7f1 with SMTP id b12-20020a05600c4e0c00b003d9eedde7f1mr972459wmq.12.1673646741028;
        Fri, 13 Jan 2023 13:52:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 05/16] doc: update docs for libgpiod v2
Date:   Fri, 13 Jan 2023 22:51:59 +0100
Message-Id: <20230113215210.616812-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update docs in gpiod.h wherever they're outdated or make incorrect
statements. While at it: fix formatting in some places.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/gpiod.h | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index dfc5334..8cede47 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -22,8 +22,9 @@ extern "C" {
  * This is the complete documentation of the public API made available to
  * users of libgpiod.
  *
- * <p>The API is logically split into several parts such as: GPIO chip & line
- * operators, GPIO events handling etc.
+ * <p>The API is logically split into several sections. For each opaque data
+ * class, there's a set of functions for manipulating it. Together they can be
+ * thought of as objects and their methods in OOP parlance.
  *
  * <p>General note on error handling: all functions exported by libgpiod that
  * can fail, set errno to one of the error values defined in errno.h upon
@@ -34,10 +35,13 @@ extern "C" {
  * codes for every function as they propagate errors from the underlying libc
  * functions.
  *
- * <p>In general libgpiod functions are not NULL-aware and it's expected that
- * users pass valid pointers to objects as arguments. An exception to this rule
- * are the functions that free/close/release resources - which work when passed
- * a NULL-pointer as argument. Other exceptions are documented.
+ * <p>In general libgpiod functions are NULL-aware. For functions that are
+ * logically methods of data classes - ones that take a pointer to the object
+ * of that class as the first argument - passing a NULL pointer will result in
+ * the program aborting the execution. For non-methods, init functions and
+ * methods that take a pointer as any of the subsequent arguments, the handling
+ * of a NULL-pointer depends on the implementation and may range from gracefully
+ * handling it, ignoring it or returning an error.
  */
 
 struct gpiod_chip;
@@ -260,7 +264,8 @@ enum gpiod_line_direction {
 	GPIOD_LINE_DIRECTION_AS_IS = 1,
 	/**< Request the line(s), but don't change direction. */
 	GPIOD_LINE_DIRECTION_INPUT,
-	/**< Direction is input - for reading the value of an externally driven GPIO line. */
+	/**< Direction is input - for reading the value of an externally driven
+	 *   GPIO line. */
 	GPIOD_LINE_DIRECTION_OUTPUT,
 	/**< Direction is output - for driving the GPIO line. */
 };
@@ -926,8 +931,8 @@ gpiod_line_request_get_value(struct gpiod_line_request *request,
  * @param offsets Array of offsets identifying the subset of requested lines
  *		  from which to read values.
  * @param values Array in which the values will be stored.  Must be sized
- *		 to hold \p num_values entries.  Each value is associated with the
- *		 line identified by the corresponding entry in \p offsets.
+ *		 to hold \p num_values entries. Each value is associated with
+ *		 the line identified by the corresponding entry in \p offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
-- 
2.37.2

