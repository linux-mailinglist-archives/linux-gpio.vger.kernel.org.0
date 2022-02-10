Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A024A4B0FBB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 15:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242611AbiBJOIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 09:08:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbiBJOH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 09:07:59 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4058EC1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:08:00 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id e3so9894610wra.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrx53oVpxMHk4EUeLiaSYthlKCeV/H07d4qbKSUjpkg=;
        b=yd9WM4A5KNmv9+/cdOU1vgL2Dx2p85CxoMO76x7TiOYcWtX3LM+wOzD7th5lS0QXG/
         mmAh4rEwG9EMWA7BsR3gEZv9NMJS6goQ9CRjLSx943nSEmG6G2gAGRWYn6SY5Z7c5oIy
         yaU/sGTLSnJHklmdQyHrk4ONp+I/8RoZJzc2L6tZj5uMNRs83ttTNI/U1VZjW/yEyQKg
         axJ2Xq0wulWkuFg5u7gIC6sORqgndPlnpM4Q8Ppf5uV9fDWE1lzfuZ4x0epdWQtM/tBI
         Wsln0PZ+9/4m+kvEAMJP5RVazn7ZVvGhGlh/WiQENW5YB3r7uy9jRFJkQa0f1IysAUs1
         cY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrx53oVpxMHk4EUeLiaSYthlKCeV/H07d4qbKSUjpkg=;
        b=g9xqcAo4VhCmpf0gX3SZj4c7WXV5SAABSUR1ltPaQZHmfLUaEJckAyCmLwp0zhJbNf
         Aewc3PCfwBHr8OHAB7OcIpB7foXIQfre7QFG59ecEYxsIZ/CnUdlZUPKMuHXzy1IxnWm
         t9wdUOlQbQbImxFsLGW1BUfkm98AE9jCRjHnmCjD1Vq8M7tOHfMsZrYdD7IevgNOpFD0
         Ab9wzKa6fhAzs7zkh5H6+mU4+voctVgDSFgFOpAlJW8Kgq+YL5sPT6qTtTmOxZSlnc2R
         BSY5rBjjMkqXBEARu+3ilq61I3Mmkj8MxW3D3XlHw/+6O4Os/WXNrGVb9SXLKv0ycgE4
         0OhQ==
X-Gm-Message-State: AOAM530bNhCJbc71EmqulEVKayokC+wIn2rQaoKlHOD5kiUUG8tvAqyi
        PkdTv8+MLJuBxPZNmbrRx+zVrA==
X-Google-Smtp-Source: ABdhPJzRSShnDoZhhV2V/gjHeXRuuZnKtxVBQPZNcN5D/R58gib1dmxYf03Nf4FJZuLyjjsBJlbr4A==
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr2628915wrp.219.1644502078790;
        Thu, 10 Feb 2022 06:07:58 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm18322879wrq.72.2022.02.10.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:07:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 3/4] build: add a configure option for enabling gcov profiling
Date:   Thu, 10 Feb 2022 15:07:44 +0100
Message-Id: <20220210140745.1059087-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220210140745.1059087-1-brgl@bgdev.pl>
References: <20220210140745.1059087-1-brgl@bgdev.pl>
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

Add a configure switch that adds the relevant gcov options to the
compiler flags for the core library and tests.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .gitignore        |  4 ++++
 configure.ac      | 10 ++++++++++
 lib/Makefile.am   |  1 +
 tests/Makefile.am |  1 +
 4 files changed, 16 insertions(+)

diff --git a/.gitignore b/.gitignore
index 2d7cc7f..58e1c5f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,3 +29,7 @@ libtool
 *-libtool
 m4/
 stamp-h1
+
+# profiling
+*.gcda
+*.gcno
diff --git a/configure.ac b/configure.ac
index 8e74104..dc09d70 100644
--- a/configure.ac
+++ b/configure.ac
@@ -122,6 +122,16 @@ AC_ARG_ENABLE([tests],
 	[with_tests=false])
 AM_CONDITIONAL([WITH_TESTS], [test "x$with_tests" = xtrue])
 
+AC_ARG_ENABLE([profiling],
+	[AS_HELP_STRING([--enable-profiling],
+		[enable gcov profiling on the core library and tests [default=no]])],
+	[if test "x$enableval" = xyes; then with_profiling=true; fi],
+	[with_profiling=false])
+if test "x$with_profiling" = xtrue
+then
+	AC_SUBST(PROFILING_FLAGS, ["-fprofile-arcs -ftest-coverage"])
+fi
+
 AC_DEFUN([FUNC_NOT_FOUND_TESTS],
 	[ERR_NOT_FOUND([$1()], [tests])])
 
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 5423f72..5219855 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -17,6 +17,7 @@ libgpiod_la_SOURCES =	chip.c \
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
+libgpiod_la_CFLAGS += $(PROFILING_FLAGS)
 libgpiod_la_LDFLAGS = -version-info $(subst .,:,$(ABI_VERSION))
 
 pkgconfigdir = $(libdir)/pkgconfig
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 7bf5e3f..8ec51e9 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -7,6 +7,7 @@ AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim/
 AM_CFLAGS += -include $(top_builddir)/config.h
 AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS)
 AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
+AM_CFLAGS += $(PROFILING_FLAGS)
 AM_LDFLAGS = -pthread
 LDADD = $(top_builddir)/lib/libgpiod.la
 LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-- 
2.30.1

