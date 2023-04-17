Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76F76E4BC4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Apr 2023 16:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjDQOpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Apr 2023 10:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjDQOpS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Apr 2023 10:45:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635C810CF
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 07:45:16 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f09a3c8bbbso9583005e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Apr 2023 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681742715; x=1684334715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2AlY9+tXP13rSnxGZkcEKlB84WGxOM1uXS8e1yIMCSw=;
        b=5liSuOAD2auXwJy+r2WvUgUcxjDunZDbqm8DB0MjJQGR/3anWoJDiFLIO45G7ym7/H
         5Y15Yrni5agiAZXMdSyFI6kN1LScxLyq17HCK+yJc2dE2RtKq6AwO7ZZTMTiGBrTUwDs
         WhgAHi1BmXpmdjFavdRjHeI0Metob7OSoFQOl430qzqOfr7rNu3lBXpCSnIo8JO9jCJ4
         nykhT/zbf5qrkDa+5g43lDal98tGZImB+doRrmMwPHrL96hi58WqA+gnOZ5/L1uECN68
         KOV5m8ewoN0FEDHWfwjpagcOjFAUK5N0G7tJNDajcc/YmkPzHcLxADyJrW9mSyN7k50M
         9ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681742715; x=1684334715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AlY9+tXP13rSnxGZkcEKlB84WGxOM1uXS8e1yIMCSw=;
        b=ZKqTqTawpEPAAk1qqpQSRfv6tDjFq39S61Q1VS1nAprHzKXB1Lyq49rt90OsHYfbMg
         n1yyDfhoxaWP23p5mjivf+ki9zJF5AKNaBrzLmIwFfT1Hn6jDmLgxwjFyJTo1HtWMCEO
         x3VujFHmwiVm6rx1DGxd9o2TCYM+HjNE37ElG0tuPNEEh3w7CSvoOVNXkEM5JXZiROxq
         7VH3YWViE32/sWiq1j96d9OOA8Jpf6dlO9njqaixWCaJi0CQ1aN2HJU4Tp8zlWd9q9lj
         y2SMVNYtNetT/n061aiKACbhe0dlpzOYCqdNimNmczswOxxYr4Z3x3/srdF6aNZMVJCP
         ozKA==
X-Gm-Message-State: AAQBX9foV5lTznj51HdvHItspCP0HcDMme7Hm19fLmtWHZZzUMStkAjF
        zARLqcAuQKaKb6ypLAslfiQzhw==
X-Google-Smtp-Source: AKy350ZAk0s3syzXiPLgDdkhdwxMuOaLJXCnGUDD2xxA1VozcWtKKRoaLsa+TcT7PNSPw2UVP5eLZg==
X-Received: by 2002:a5d:564c:0:b0:2f9:e211:e869 with SMTP id j12-20020a5d564c000000b002f9e211e869mr3387591wrw.43.1681742714874;
        Mon, 17 Apr 2023 07:45:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:374a:ffae:fd26:4893])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc30a000000b003e20cf0408esm12117717wmj.40.2023.04.17.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:45:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joerg Faschingbauer <jf@faschingbauer.co.at>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] Revert "bindings: python: fix out-of-tree build"
Date:   Mon, 17 Apr 2023 16:45:07 +0200
Message-Id: <20230417144507.404968-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

This reverts commit addf968c7321132a8c659e06cc06c76534ec31f5.

We're moving towards being compatible with PEP 517 for building and
currently the following error happens when running setup.py build_py:

running build_py
error: Error: setup script specifies an absolute path:

    <snip>/libgpiod/bindings/python/./gpiod/ext/chip.c

setup() arguments must *always* be /-separated paths relative to the
setup.py directory, *never* absolute paths.

As the Makefile build should only be used for development purposes, I
think we can safely drop support for out-of-tree build. Python bindings
have no been spun out into their own tarball and are available to install
from pip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/Makefile.am |  5 +++--
 bindings/python/setup.py    | 23 ++++++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 7fed629..d04ec6d 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -11,12 +11,13 @@ endif
 
 all-local:
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
-	$(PYTHON) $(srcdir)/setup.py build_ext --inplace \
+	$(PYTHON) setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
 		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
 
 install-exec-local:
-	$(PYTHON) $(srcdir)/setup.py install --prefix=$(DESTDIR)$(prefix)
+	GPIOD_WITH_TESTS= \
+	$(PYTHON) setup.py install --prefix=$(DESTDIR)$(prefix)
 
 SUBDIRS = gpiod
 
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 5ddd5e0..a53d55f 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,21 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from os import environ, path
+from os import environ
 from setuptools import setup, Extension, find_packages
 
-def src(filename):
-    return path.join(path.dirname(__file__), filename)
-
 gpiod_ext = Extension(
     "gpiod._ext",
     sources=[
-        src("gpiod/ext/chip.c"),
-        src("gpiod/ext/common.c"),
-        src("gpiod/ext/line-config.c"),
-        src("gpiod/ext/line-settings.c"),
-        src("gpiod/ext/module.c"),
-        src("gpiod/ext/request.c"),
+        "gpiod/ext/chip.c",
+        "gpiod/ext/common.c",
+        "gpiod/ext/line-config.c",
+        "gpiod/ext/line-settings.c",
+        "gpiod/ext/module.c",
+        "gpiod/ext/request.c",
     ],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiod"],
@@ -24,7 +21,7 @@ gpiod_ext = Extension(
 
 gpiosim_ext = Extension(
     "tests.gpiosim._ext",
-    sources=[src("tests/gpiosim/ext.c")],
+    sources=["tests/gpiosim/ext.c"],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiosim"],
     extra_compile_args=["-Wall", "-Wextra"],
@@ -32,7 +29,7 @@ gpiosim_ext = Extension(
 
 procname_ext = Extension(
     "tests.procname._ext",
-    sources=[src("tests/procname/ext.c")],
+    sources=["tests/procname/ext.c"],
     define_macros=[("_GNU_SOURCE", "1")],
     extra_compile_args=["-Wall", "-Wextra"],
 )
@@ -42,7 +39,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open(src("gpiod/version.py"), "r") as fd:
+with open("gpiod/version.py", "r") as fd:
     exec(fd.read())
 
 setup(
-- 
2.37.2

