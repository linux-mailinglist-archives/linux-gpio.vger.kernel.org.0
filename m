Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AC566CED5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 19:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbjAPS31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 13:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbjAPS2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 13:28:41 -0500
Received: from mx07lb.world4you.com (mx07lb.world4you.com [81.19.149.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F5D10CD
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 10:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=faschingbauer.co.at; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jsn7JCq8m9YMYo4GKIEnPXZFthHeDpMsg7QQK4Xf3x4=; b=BIth6P1MZUiqwd5mLoIO+mDatb
        QfrrWugxeX6u5ppRHICVW/dC5eN1Zp+mk/36K2Q24vm/IY1kbojYQvy+/7u0ZMz/76NWVxB6/RQOx
        j+oL5IcBG4ToOVuvXwi9dI5ayGp4K4MG2epAN/0OctmqIVyLpoxlZyrGRRpIzpeK2yTI=;
Received: from [213.225.9.96] (helo=fedora..)
        by mx07lb.world4you.com with esmtpa (Exim 4.94.2)
        (envelope-from <jf@faschingbauer.co.at>)
        id 1pHU0j-0001CT-Pl; Mon, 16 Jan 2023 19:15:09 +0100
From:   jf@faschingbauer.co.at
To:     bartosz.golaszewski@linaro.org
Cc:     linux-gpio@vger.kernel.org,
        Joerg Faschingbauer <jf@faschingbauer.co.at>
Subject: [PATCH] bindings: python: fix out-of-source build
Date:   Mon, 16 Jan 2023 19:14:39 +0100
Message-Id: <20230116181439.171563-1-jf@faschingbauer.co.at>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Joerg Faschingbauer <jf@faschingbauer.co.at>

Makefile.am delegates the build of the python extension to its
setup.py file, which references the extension .c files relative to the
source dir. This makes it impossible to build in a directory that is
different from the source directory (for example, for PC and ARM but
from the same source).

* Modify Makefile.am to pass automake's $(srcdir) into setup.py via
  GPIOD_SRCDIR environment variable.
* Modify setup.py to pick up .c files relative from that directory.
---
 bindings/python/Makefile.am |  6 ++++--
 bindings/python/setup.py    | 23 ++++++++++++++---------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 3212a8f..6c2f99b 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -12,13 +12,15 @@ endif
 all-local:
 	GPIOD_VERSION_STRING=$(VERSION_STR) \
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
-	$(PYTHON) setup.py build_ext --inplace \
+	GPIOD_SRCDIR=$(srcdir) \
+	$(PYTHON) $(srcdir)/setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
 		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
-	$(PYTHON) setup.py install --prefix=$(prefix)
+	GPIOD_SRCDIR=$(srcdir) \
+	$(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
 
 SUBDIRS = gpiod
 
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index a951069..3ab01e1 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -2,17 +2,22 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from os import environ
+import os.path
 from setuptools import setup, Extension, find_packages
 
+srcdir = environ.get('GPIOD_SRCDIR', '.')
+def src(path):
+    return os.path.join(srcdir, path)
+
 gpiod_ext = Extension(
     "gpiod._ext",
     sources=[
-        "gpiod/ext/chip.c",
-        "gpiod/ext/common.c",
-        "gpiod/ext/line-config.c",
-        "gpiod/ext/line-settings.c",
-        "gpiod/ext/module.c",
-        "gpiod/ext/request.c",
+        src("gpiod/ext/chip.c"),
+        src("gpiod/ext/common.c"),
+        src("gpiod/ext/line-config.c"),
+        src("gpiod/ext/line-settings.c"),
+        src("gpiod/ext/module.c"),
+        src("gpiod/ext/request.c"),
     ],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiod"],
@@ -21,7 +26,7 @@ gpiod_ext = Extension(
 
 gpiosim_ext = Extension(
     "tests.gpiosim._ext",
-    sources=["tests/gpiosim/ext.c"],
+    sources=[src("tests/gpiosim/ext.c")],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiosim"],
     extra_compile_args=["-Wall", "-Wextra"],
@@ -29,7 +34,7 @@ gpiosim_ext = Extension(
 
 procname_ext = Extension(
     "tests.procname._ext",
-    sources=["tests/procname/ext.c"],
+    sources=[src("tests/procname/ext.c")],
     define_macros=[("_GNU_SOURCE", "1")],
     extra_compile_args=["-Wall", "-Wextra"],
 )
@@ -39,7 +44,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open("gpiod/version.py", "r") as fd:
+with open(src("gpiod/version.py"), "r") as fd:
     exec(fd.read())
 
 setup(
-- 
2.38.1

