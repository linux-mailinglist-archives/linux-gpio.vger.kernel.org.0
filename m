Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB9B66A55E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjAMVwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjAMVwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:23 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCEF89BCE
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:20 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ja17so16103817wmb.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx/vmoqXDJzlG1fFQqvSxnzJDDAgyKL8zbXzXS4i5rM=;
        b=hzKBKxMUnrtI5vGDEahfP25dhgv+049XsUJl3hkyg9Juyc216mIXjt6Auf/FDIqEWp
         D2k/geWWN2S5vfcjujd9Cfc/Qv27UkKet+p7mcVtHcT70AlUE288KYdA0LBTZpIbUzfh
         2biXJ4XzoaAUaxegZA4Th5CusKGzCGASw5Yk7W5ZYRccSBKHOm77FROgyksAUCffYasc
         k2nRvRdNIdmpJgUqQFFyPnfdd1dgaWD8sfIu64AUabmVjLvTrR/GDb5QmrF3bw18+bl5
         c6AfIDee6x6rc/eYZCgVps6fS7w85s3Py5vR/AccDzxorZp269HREyGoPpgXmHnsp05s
         NRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx/vmoqXDJzlG1fFQqvSxnzJDDAgyKL8zbXzXS4i5rM=;
        b=O52sCBXO7Vd59jSZqvELfFY6dM0UtccEVskwDdG6wL66Yh0mwy6dSVNEGsC7TWIp/7
         PG6bl8oU7Xr+eQAXupmRcRA1xyU5th4K6UsXwXe6S45yBtzgRvIqamfVMuVhfoNugSOt
         60g27qGh1fgj2lTp4y6kbf2UpRYMHtNW288grfDEQPVGykm5Nz0svrqgzqiv1doIY8zB
         HzJi7c16EutwuDYXfl/F/E8LZPSJl4Shb0coA/Cdf10s376avfoVxhepJUXiOUnJgxam
         qseiSZTMeBMSbIk7bhW7bfdjYNRzOAhZ4YRFEZddi0RWZnGfI9PNyybmr/7KPQf2jHoW
         +Rzg==
X-Gm-Message-State: AFqh2koteH+yceuisuZACkHodzhbyA7GL8eBgMGCTMhhduWocv+N4u9v
        WCiRl228a33EflGH2mA8/myLAqbOFxP1SMx7
X-Google-Smtp-Source: AMrXdXt3Vt7hZvdVLU/+Bysc7h2hkK+VL5VzjMp1CG9Ts4FPpAlClcp2kHABmLHC88GzvMxa6Gw1nw==
X-Received: by 2002:a05:600c:755:b0:3d9:7065:5b9c with SMTP id j21-20020a05600c075500b003d970655b9cmr994820wmn.6.1673646738994;
        Fri, 13 Jan 2023 13:52:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 03/16] build: unify the coding style of source files lists in Makefiles
Date:   Fri, 13 Jan 2023 22:51:57 +0100
Message-Id: <20230113215210.616812-4-brgl@bgdev.pl>
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

Use the most common and readable convention for listing source files
in Makefiles wherever it's not consistent yet.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/Makefile.am          | 32 +++++++++++++--------------
 bindings/cxx/examples/Makefile.am | 12 +++++------
 bindings/cxx/tests/Makefile.am    | 36 +++++++++++++++----------------
 lib/Makefile.am                   | 27 ++++++++++++-----------
 man/Makefile.am                   |  8 ++++++-
 tests/Makefile.am                 | 34 ++++++++++++++---------------
 6 files changed, 78 insertions(+), 71 deletions(-)

diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index f719072..f2fc884 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -2,22 +2,22 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES =	\
-	chip.cpp		\
-	chip-info.cpp		\
-	edge-event-buffer.cpp	\
-	edge-event.cpp		\
-	exception.cpp		\
-	info-event.cpp		\
-	internal.cpp		\
-	internal.hpp		\
-	line.cpp		\
-	line-config.cpp		\
-	line-info.cpp		\
-	line-request.cpp	\
-	line-settings.cpp	\
-	misc.cpp		\
-	request-builder.cpp	\
+libgpiodcxx_la_SOURCES = \
+	chip.cpp \
+	chip-info.cpp \
+	edge-event-buffer.cpp \
+	edge-event.cpp \
+	exception.cpp \
+	info-event.cpp \
+	internal.cpp \
+	internal.hpp \
+	line.cpp \
+	line-config.cpp \
+	line-info.cpp \
+	line-request.cpp \
+	line-settings.cpp \
+	misc.cpp \
+	request-builder.cpp \
 	request-config.cpp
 
 libgpiodcxx_la_CXXFLAGS = -Wall -Wextra -g -std=gnu++17
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index c7ec3cf..e4136f5 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -6,12 +6,12 @@ AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17
 AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
 
 noinst_PROGRAMS = \
-		gpiodetectcxx \
-		gpiofindcxx \
-		gpiogetcxx \
-		gpioinfocxx \
-		gpiomoncxx \
-		gpiosetcxx
+	gpiodetectcxx \
+	gpiofindcxx \
+	gpiogetcxx \
+	gpioinfocxx \
+	gpiomoncxx \
+	gpiosetcxx
 
 gpiodetectcxx_SOURCES = gpiodetectcxx.cpp
 
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index 4971dd4..924a3cd 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -12,21 +12,21 @@ AM_LDFLAGS += -pthread
 
 bin_PROGRAMS = gpiod-cxx-test
 
-gpiod_cxx_test_SOURCES =			\
-		check-kernel.cpp		\
-		gpiod-cxx-test-main.cpp		\
-		gpiosim.cpp			\
-		gpiosim.hpp			\
-		helpers.cpp			\
-		helpers.hpp			\
-		tests-chip.cpp			\
-		tests-chip-info.cpp		\
-		tests-edge-event.cpp		\
-		tests-info-event.cpp		\
-		tests-line.cpp			\
-		tests-line-config.cpp		\
-		tests-line-info.cpp		\
-		tests-line-request.cpp		\
-		tests-line-settings.cpp		\
-		tests-misc.cpp			\
-		tests-request-config.cpp
\ No newline at end of file
+gpiod_cxx_test_SOURCES = \
+	check-kernel.cpp \
+	gpiod-cxx-test-main.cpp \
+	gpiosim.cpp \
+	gpiosim.hpp \
+	helpers.cpp \
+	helpers.hpp \
+	tests-chip.cpp \
+	tests-chip-info.cpp \
+	tests-edge-event.cpp \
+	tests-info-event.cpp \
+	tests-line.cpp \
+	tests-line-config.cpp \
+	tests-line-info.cpp \
+	tests-line-request.cpp \
+	tests-line-settings.cpp \
+	tests-misc.cpp \
+	tests-request-config.cpp
diff --git a/lib/Makefile.am b/lib/Makefile.am
index dd90abd..3e7114b 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,19 +2,20 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES =	chip.c \
-			chip-info.c \
-			edge-event.c \
-			info-event.c \
-			internal.h \
-			internal.c \
-			line-config.c \
-			line-info.c \
-			line-request.c \
-			line-settings.c \
-			misc.c \
-			request-config.c \
-			uapi/gpio.h
+libgpiod_la_SOURCES = \
+	chip.c \
+	chip-info.c \
+	edge-event.c \
+	info-event.c \
+	internal.h \
+	internal.c \
+	line-config.c \
+	line-info.c \
+	line-request.c \
+	line-settings.c \
+	misc.c \
+	request-config.c \
+	uapi/gpio.h
 
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
diff --git a/man/Makefile.am b/man/Makefile.am
index 201a52b..1b52e0f 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -3,7 +3,13 @@
 
 if WITH_MANPAGES
 
-dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiomon.man gpionotify.man
+dist_man1_MANS = \
+	gpiodetect.man \
+	gpioinfo.man \
+	gpioget.man \
+	gpioset.man \
+	gpiomon.man \
+	gpionotify.man
 
 %.man: $(top_builddir)/tools/$(*F)
 	help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 4dd5297..0fdbe5b 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -14,20 +14,20 @@ LDADD += $(GLIB_LIBS) $(GOBJECT_LIBS)
 
 bin_PROGRAMS = gpiod-test
 
-gpiod_test_SOURCES =			\
-		gpiod-test.c		\
-		gpiod-test.h		\
-		gpiod-test-helpers.c	\
-		gpiod-test-helpers.h	\
-		gpiod-test-sim.c	\
-		gpiod-test-sim.h	\
-		tests-chip.c		\
-		tests-chip-info.c	\
-		tests-edge-event.c	\
-		tests-info-event.c	\
-		tests-line-config.c	\
-		tests-line-info.c	\
-		tests-line-request.c	\
-		tests-line-settings.c	\
-		tests-misc.c		\
-		tests-request-config.c
+gpiod_test_SOURCES = \
+	gpiod-test.c \
+	gpiod-test.h \
+	gpiod-test-helpers.c \
+	gpiod-test-helpers.h \
+	gpiod-test-sim.c \
+	gpiod-test-sim.h \
+	tests-chip.c \
+	tests-chip-info.c \
+	tests-edge-event.c \
+	tests-info-event.c \
+	tests-line-config.c \
+	tests-line-info.c \
+	tests-line-request.c \
+	tests-line-settings.c \
+	tests-misc.c \
+	tests-request-config.c
-- 
2.37.2

