Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09BC743BD8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjF3M2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjF3M23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:28:29 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C462E19B5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:28:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so7891735e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688128107; x=1690720107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RekjfWWo8VbnYQss2qAr2/EN4cFn8FMfZc8nSZkPQ=;
        b=xtD/rwWij28SovRHZFxG5a9r6Uuh7O6dGFvmnd1lI2k/3VTn7CeBVPYq3wYm/R9kGK
         gjFLrvr8af57Y32t3b5D9Ol8X5VGCJBfWq+j3oCQSh48ZmFcjhb2KzGlHEH1f/cQXvEg
         k7KCztPUf95bu2RTToe3glkPXHQhNcCTyW2YKYWzxqNC+/ghiGo6NCYUmPR5GG43OGn3
         DXIDMYh9o0nFjqpafdcAmAtTw7uDfXFja3QJbGopGP/+HKZkGbnTInf8yAvvKCOAq7V1
         rFCKcViFRFF+J5ByqUsgr9pMdupBVcou4JWUgvoOKYbtFSMja3HsWCXPPjQQVVSJzbeu
         IddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688128107; x=1690720107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7RekjfWWo8VbnYQss2qAr2/EN4cFn8FMfZc8nSZkPQ=;
        b=VEHYGdwY7l0lZUQz1EvRcNqVsPmYv2pebiDXY5a/+LynUH0VFpzjIt6GxVL4gvMKCP
         oXrCLuNs60zTBgrtvYyvZsXGa/5GP1DsDK5WdhT2kzMeqJmFAbV2N5I/31mzznjp5+6M
         JjfSjTIsLe6kLH2gTfGrNkMJxcUD05kd1B6ju4t6MxzzFQyybGoG5QCzCmbdSNBdxKvl
         0xBRDdLZTsv4r91ett2o/IduF/MqNCqJEJ7RHvEwq2aCQyIUHYCFC4PvqA6uoZVzFU8a
         vP3dhPTJ+yuDRi3fNOcbAjQ2rAw0VcO93yKwH+DI7d+iTdBD/assOkHgXKvtt7hVy/XS
         Jttw==
X-Gm-Message-State: AC+VfDxBWWxoU75bS0Umo1hSgnN3ZevqEuasfC9pDPfGZ0D03m0qWsFV
        r/Vap3ZValCyd8WgkvnyTJL/iA==
X-Google-Smtp-Source: ACHHUZ5p0kh4GnTeAZR98FncGpoCnuXz7jxNoBRUm4/Zw34bqaDIPyoGKIYwIOSvGJVSsOA2PtIjHQ==
X-Received: by 2002:a05:600c:3655:b0:3f7:e48b:974d with SMTP id y21-20020a05600c365500b003f7e48b974dmr1929538wmq.27.1688128107208;
        Fri, 30 Jun 2023 05:28:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7302:c906:33b6:6f53])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c229800b003fa98908014sm13588822wmf.8.2023.06.30.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:28:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] build: remove redundant SOURCES assignments
Date:   Fri, 30 Jun 2023 14:28:25 +0200
Message-Id: <20230630122825.117902-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For any given target (let's say foobar), automake defaults to looking for
foobar.c if foobar_SOURCES are not specified. Remove redundant assignments
as we've seen multiple hidden typos in makefiles already.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 examples/Makefile.am      | 26 --------------------------
 tests/gpiosim/Makefile.am |  1 -
 tools/Makefile.am         | 12 ------------
 3 files changed, 39 deletions(-)

diff --git a/examples/Makefile.am b/examples/Makefile.am
index daf902b..ed01dbc 100644
--- a/examples/Makefile.am
+++ b/examples/Makefile.am
@@ -20,29 +20,3 @@ noinst_PROGRAMS = \
 	watch_line_rising \
 	watch_line_value \
 	watch_multiple_line_values
-
-async_watch_line_value_SOURCES = async_watch_line_value.c
-
-find_line_by_name_SOURCES = find_line_by_name.c
-
-get_chip_info_SOURCES = get_chip_info.c
-
-get_line_info_SOURCES = get_line_info.c
-
-get_line_value_SOURCES = get_line_value.c
-
-get_multiple_line_values_SOURCES = get_multiple_line_values.c
-
-reconfigure_input_to_output_SOURCES = reconfigure_input_to_output.c
-
-toggle_line_value_SOURCES = toggle_line_value.c
-
-toggle_multiple_line_value_SOURCES = toggle_multiple_line_value.c
-
-watch_line_info_SOURCES = watch_line_info.c
-
-watch_line_rising_SOURCES = watch_line_rising.c
-
-watch_line_value_SOURCES = watch_line_value.c
-
-watch_multiple_line_values_SOURCES = watch_multiple_line_values.c
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
index 05dce79..5888873 100644
--- a/tests/gpiosim/Makefile.am
+++ b/tests/gpiosim/Makefile.am
@@ -12,5 +12,4 @@ libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(MOUNT_CFLAGS)
 libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
 libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS) -pthread
 
-gpiosim_selftest_SOURCES = gpiosim-selftest.c
 gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 92a819f..40ea3a3 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -18,18 +18,6 @@ endif
 
 bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpionotify
 
-gpiodetect_SOURCES = gpiodetect.c
-
-gpioinfo_SOURCES = gpioinfo.c
-
-gpioget_SOURCES = gpioget.c
-
-gpioset_SOURCES = gpioset.c
-
-gpiomon_SOURCES = gpiomon.c
-
-gpionotify_SOURCES = gpionotify.c
-
 if WITH_TESTS
 
 noinst_SCRIPTS = gpio-tools-test.bash
-- 
2.39.2

