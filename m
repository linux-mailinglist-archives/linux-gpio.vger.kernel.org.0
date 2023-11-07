Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889437E4B29
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 22:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjKGVwI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Nov 2023 16:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbjKGVwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2023 16:52:07 -0500
Received: from mail-ed1-x562.google.com (mail-ed1-x562.google.com [IPv6:2a00:1450:4864:20::562])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455F410D0
        for <linux-gpio@vger.kernel.org>; Tue,  7 Nov 2023 13:52:05 -0800 (PST)
Received: by mail-ed1-x562.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so10708026a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Nov 2023 13:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699393923; x=1699998723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifqLkmsV7IiUh9jGAyLpUq5mxPJlx3qrRbFREmldKrY=;
        b=W/H6uQhVUkaN2t+S7aMufwp7k9488zh5ufJGuM3DK3Vh7AO1qDsulJebV9Q5Cg/jUY
         l5r/x8/1WLzjWGvTlxaIVsXPKM1JhPpaA6/Q53NFyhu05RRLeGPw8BhVuRxMyg8iL3Pz
         yedbf1J7BtDWahv4OsX+MSpfgZ+reSl15KaMEr+LE4sevfCxbAcq9LY0JchzgXtxy7Fm
         V54CuU2iQsY2pouqEA72krUAkRNOyxOZQGeQpnCkjhSR1b1XnEJ3nteI7q4Am52UjUzP
         vTYOpoMZ0Fmj1ds+Y3byGxkJUNb2FZ3EdXSnEVp6jAZd2Z3nSGxOOUvc3yf0Sh04d/l1
         4++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393923; x=1699998723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifqLkmsV7IiUh9jGAyLpUq5mxPJlx3qrRbFREmldKrY=;
        b=eSf5uwRv6JxdgqSUrgUV4Dk/Am1uxMReln2Y8nJXhVcUw/+2zFrt4tJWh0ICx1POey
         n14af3ndK9EK2qAzxXkizGxVGdcRxLLiFCS+IQZx7aP25Vseu+8dY2F/kV3P1QQj3Csy
         n/sTbJhb2Bh8QM+cq4GoXPSxbQJGDER/SkqYpcP7YGEut9P3DXg4/vDY7PO8nN4yoSFS
         XdGKlfDeA4nbVyrp3Fc+WqPyUsTZ8v2SX9ajWQ1aHwmA8VXpUzEBEftJJCcDKDN1fQKg
         IbUaZc14JY53xu02m9k/681vLv2rLFMEu8h7jhfUphFleFCA42gTfr7euQqWayFOus4D
         PtjQ==
X-Gm-Message-State: AOJu0YxqpI8Yc5LIDgM3BGGEywCrdvAs/OfMCNk8Sy44avRJ+/ZAVaCR
        FTqzTum5Q7ACG8NV7N+KhmQ04Ir1uAtV4d/nZdlDwafiaxheuA==
X-Google-Smtp-Source: AGHT+IEOUl709JZM5TloKLTjAINdyJ5uigOyWSn3ztmsdh0ET/DxNLcL4xI1sXQ9hJFFoSE4kHID8jjpAX/N
X-Received: by 2002:a17:907:1b02:b0:9ae:82b4:e309 with SMTP id mp2-20020a1709071b0200b009ae82b4e309mr18226175ejc.0.1699393923147;
        Tue, 07 Nov 2023 13:52:03 -0800 (PST)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id j9-20020a170906050900b009a5f5d570b9sm77259eja.206.2023.11.07.13.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 13:52:03 -0800 (PST)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 1/1] bindings: python: standalone build tooling for tests
Date:   Tue,  7 Nov 2023 21:51:56 +0000
Message-Id: <20231107215156.2961942-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107215156.2961942-1-phil@gadgetoid.com>
References: <20231107215156.2961942-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move extension definitions and tooling for building tests into
`build_tests.py` and update Makefile.am to call it with appropriate path
prefixes.

`build_tests.py` will perform a standalone build of the text extensions,
keeping any build noise in a temporary directory and copying the final
built modules automatically out to `tests/gpiosim` and `tests/procname`.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/Makefile.am    | 25 +++++++----
 bindings/python/build_tests.py | 79 ++++++++++++++++++++++++++++++++++
 bindings/python/setup.py       | 28 +-----------
 3 files changed, 97 insertions(+), 35 deletions(-)
 create mode 100644 bindings/python/build_tests.py

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 079ceb1..36fb66a 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -7,19 +7,28 @@ EXTRA_DIST = \
 
 if WITH_TESTS
 
-BUILD_TESTS = 1
+python-tests:
+	TOP_SRCDIR=$(abs_top_builddir) \
+	TOP_BUILDDIR=$(abs_top_builddir) \
+	$(PYTHON) build_tests.py
+
+else
+
+python-tests:
 
 endif
 
-all-local:
-	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
-	$(PYTHON) setup.py build_ext --inplace \
-		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
-		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
+clean-local:
+	rm -rf dist
+
+all-local: python-tests
+	CFLAGS="-I$(abs_top_srcdir)/include/ -I$(abs_top_srcdir)/tests/gpiosim \
+	-L$(abs_top_builddir)/lib/.libs/ -L$(abs_top_builddir)/tests/gpiosim/.libs/" \
+	$(PYTHON) -m build
 
 install-exec-local:
-	GPIOD_WITH_TESTS= \
-	$(PYTHON) setup.py install --prefix=$(DESTDIR)$(prefix)
+	$(PYTHON) -m pip install dist/*.whl \
+	--prefix=$(DESTDIR)$(prefix)
 
 SUBDIRS = gpiod
 
diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests.py
new file mode 100644
index 0000000..b984307
--- /dev/null
+++ b/bindings/python/build_tests.py
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
+
+"""
+Bring up just enough of setuptools/distutils in order to build the gpiod
+test module C extensions.
+
+Set "build_temp" and "build_lib" so that our source directory is not
+polluted with artefacts in build/
+
+Builds:
+
+    tests/gpiosim/_ext.<target>.so
+    tests/procname/_ext.<target>.so
+
+"""
+
+import tempfile
+from os import getenv, path
+
+from setuptools import Distribution, Extension
+from setuptools.command.build_ext import build_ext
+
+TOP_SRCDIR = getenv("TOP_SRCDIR", "../../")
+TOP_BUILDDIR = getenv("TOP_BUILDDIR", "../../")
+
+# __version__
+with open("gpiod/version.py", "r") as fd:
+    exec(fd.read())
+
+
+gpiosim_ext = Extension(
+    "tests.gpiosim._ext",
+    sources=["tests/gpiosim/ext.c"],
+    define_macros=[("_GNU_SOURCE", "1")],
+    libraries=["gpiosim"],
+    extra_compile_args=["-Wall", "-Wextra"],
+    include_dirs=[
+        path.join(TOP_SRCDIR, "include"),
+        path.join(TOP_SRCDIR, "tests/gpiosim"),
+    ],
+    library_dirs=[
+        path.join(TOP_BUILDDIR, "lib/.libs"),
+        path.join(TOP_BUILDDIR, "tests/gpiosim/.libs"),
+    ],
+)
+
+procname_ext = Extension(
+    "tests.procname._ext",
+    sources=["tests/procname/ext.c"],
+    define_macros=[("_GNU_SOURCE", "1")],
+    extra_compile_args=["-Wall", "-Wextra"],
+)
+
+dist = Distribution(
+    {
+        "name": "gpiod",
+        "ext_modules": [gpiosim_ext, procname_ext],
+        "version": __version__,
+        "platforms": ["linux"],
+    }
+)
+
+try:
+    from setuptools.logging import configure
+
+    configure()
+except ImportError:
+    from distutils.log import set_verbosity, DEBUG
+
+    set_verbosity(DEBUG)
+
+with tempfile.TemporaryDirectory(prefix="libgpiod-") as temp_dir:
+    command = build_ext(dist)
+    command.inplace = True
+    command.build_temp = temp_dir
+    command.build_lib = temp_dir
+    command.finalize_options()
+    command.run()
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index e8704d5..9607a28 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -13,7 +13,6 @@ from setuptools.errors import BaseError
 LINK_SYSTEM_LIBGPIOD = getenv("LINK_SYSTEM_LIBGPIOD") == "1"
 LIBGPIOD_MINIMUM_VERSION = "2.1"
 LIBGPIOD_VERSION = getenv("LIBGPIOD_VERSION")
-GPIOD_WITH_TESTS = getenv("GPIOD_WITH_TESTS") == "1"
 SRC_BASE_URL = "https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/"
 TAR_FILENAME = "libgpiod-{version}.tar.gz"
 ASC_FILENAME = "sha256sums.asc"
@@ -189,11 +188,6 @@ class build_ext(orig_build_ext):
 
         super().run()
 
-        # We don't ever want the module tests directory in our package
-        # since this might include gpiosim._ext or procname._ext from a
-        # previous dirty build tree.
-        rmtree(path.join(self.build_lib, "tests"), ignore_errors=True)
-
 
 class sdist(orig_sdist):
     """
@@ -226,32 +220,12 @@ gpiod_ext = Extension(
     extra_compile_args=["-Wall", "-Wextra"],
 )
 
-gpiosim_ext = Extension(
-    "tests.gpiosim._ext",
-    sources=["tests/gpiosim/ext.c"],
-    define_macros=[("_GNU_SOURCE", "1")],
-    libraries=["gpiosim"],
-    extra_compile_args=["-Wall", "-Wextra"],
-)
-
-procname_ext = Extension(
-    "tests.procname._ext",
-    sources=["tests/procname/ext.c"],
-    define_macros=[("_GNU_SOURCE", "1")],
-    extra_compile_args=["-Wall", "-Wextra"],
-)
-
-extensions = [gpiod_ext]
-if GPIOD_WITH_TESTS:
-    extensions.append(gpiosim_ext)
-    extensions.append(procname_ext)
-
 setup(
     name="gpiod",
     url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
     packages=find_packages(exclude=["tests", "tests.*"]),
     python_requires=">=3.9.0",
-    ext_modules=extensions,
+    ext_modules=[gpiod_ext],
     cmdclass={"build_ext": build_ext, "sdist": sdist},
     version=__version__,
     author="Bartosz Golaszewski",
-- 
2.34.1

