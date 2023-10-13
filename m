Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1936A7C8462
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 13:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjJML2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 07:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjJML2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 07:28:19 -0400
Received: from mail-ej1-x664.google.com (mail-ej1-x664.google.com [IPv6:2a00:1450:4864:20::664])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174FABD
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 04:28:17 -0700 (PDT)
Received: by mail-ej1-x664.google.com with SMTP id a640c23a62f3a-9b974955474so309756266b.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697196495; x=1697801295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLlF47vzqy5MkooJ8s6sSKMOMIss3V3x7gjemdSAiOc=;
        b=H/mSedxQkURnHVDuyMxEw9pdLrEgXGCe/1P09caxP4EvTSEFBc56xyxEX+6ExHXI5F
         pQltlUUH3NWwAjLoBzvTmR1nmf//GhARN5evB/2dKsylB67YcJQbxn8dAhDPhtOKhzO7
         JvZMzc5jfGzlCU2ZHHiT1X2ltZLrOMKQmYcy5b1vBkLXxByj4dBXLGpx1YqglR3iZmSo
         hvfn2nx41WT650SoC7+it1rOjNxkdA6br2nS/ae3x5bjfg1tmSNJ47n1htCoJmjiQsCc
         DAuDbFZeUQS30t4grSHNNT51hO9zXlIsmsQUL0Jsu1hlV+xBpAvZ7TQUpRqVUBg+b9lD
         0HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697196495; x=1697801295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLlF47vzqy5MkooJ8s6sSKMOMIss3V3x7gjemdSAiOc=;
        b=a9djIMSdwA0K4t1OwKHmiSRT8hX9d/3MR+EYcoe+kn4AiYwxSR5Egt1T6jgeKqDBXg
         FC5B9tdCBqgVsFJtQEBdM4ZQn2skxgNsLLa05halIeuM/v7dJW1sdGWo/02wd0yDuS12
         KvqVKQJxUz8H5SpYtvgIHaPluaUDyPhqakLWOrK5Tx/4hxSGMB3GdVHTVbe9BKc2oHmg
         b24BU2jZx+wGcvmf4VnQEsKa+pLHouz/0gUCK9B3q35d04zufaIQA0Lbws/6cxWxcdVW
         1HBsrbLanUuRDRrH60jDfJHOZzjgk/zQjypbdffzR1vzvbXGOxi2RqnmZsJvogHswW9u
         tMvQ==
X-Gm-Message-State: AOJu0YztLVHe293SjVYwdgW4oIb2NpcaWIS4jgwylOeLGgkgNjeDEZRW
        wXF6t/6vKakpCI892Jsq4C4yIy7SX/iMkvFPy9SuU7iHEnk16Q==
X-Google-Smtp-Source: AGHT+IHnwkYZVc5EEPE0d8RET3tvADg/BoZZrcEwGmEleZhnPP8aSCdqDliCRZIi9uK2xi+1uVtCsEWNRVZF
X-Received: by 2002:a17:906:7949:b0:9bd:ff07:a586 with SMTP id l9-20020a170906794900b009bdff07a586mr119315ejo.68.1697196495022;
        Fri, 13 Oct 2023 04:28:15 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id o16-20020a17090611d000b009ae04f2db7fsm2270534eja.86.2023.10.13.04.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:28:15 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v3 1/1] bindings: python: optionally include module in sdist
Date:   Fri, 13 Oct 2023 12:28:12 +0100
Message-Id: <20231013112812.148021-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013112812.148021-1-phil@gadgetoid.com>
References: <20231013112812.148021-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Build libgpiod into Python module for build_ext or bdist_wheel.

Include libgpiod source in sdist so that the Python module
can be built from source by end users, even with a missing
or mismatched system libgpiod.

Add optional environment variable "LINK_SYSTEM_LIBGPIOD=1" to
generate a module via build_ext or bdist_wheel that links
against system libgpiod.

Update build to pass "GPIOD_VERSION_STR" as an environment
variable when calling setup.py. This is saved to
"gpiod-version-str.txt" and included in the sdist for
standalone builds.

The old make/make install behaviour is preserved by
supplying "LINK_SYSTEM_LIBGPIOD=1" and an additional sdist
package is built and saved into dist/ for upload to pypi.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |   5 ++
 bindings/python/Makefile.am |   5 ++
 bindings/python/setup.py    | 107 ++++++++++++++++++++++++++++++------
 3 files changed, 101 insertions(+), 16 deletions(-)

diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index c7124d4..acf9391 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -2,6 +2,7 @@
 # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 include setup.py
+include gpiod-version-str.txt
 
 recursive-include gpiod *.py
 recursive-include tests *.py
@@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
 
 recursive-include tests/gpiosim *.c
 recursive-include tests/procname *.c
+
+recursive-include lib *.c
+recursive-include lib *.h
+recursive-include include *.h
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 079ceb1..fda8f94 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -12,10 +12,15 @@ BUILD_TESTS = 1
 endif
 
 all-local:
+	GPIOD_VERSION_STR=$(VERSION_STR) \
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
+	LINK_SYSTEM_LIBGPIOD=1 \
 	$(PYTHON) setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
 		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
+	GPIOD_VERSION_STR=$(VERSION_STR) \
+	$(PYTHON) setup.py sdist
+
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index df10e18..878c38d 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,10 +1,43 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from os import environ, path
+from os import environ, path, unlink
 from setuptools import setup, Extension, find_packages
 from setuptools.command.build_ext import build_ext as orig_build_ext
-from shutil import rmtree
+from setuptools.command.sdist import sdist as orig_sdist
+from shutil import rmtree, copytree
+
+
+def get_gpiod_version_str():
+    try:
+        return environ["GPIOD_VERSION_STR"]
+    except KeyError:
+        return open("gpiod-version-str.txt", "r").read()
+
+
+def copy_libgpiod_files(func):
+    """
+    In order to include the lib and include directories in the sdist
+    we must temporarily copy them up into the python bindings directory.
+
+    If "./lib" exists we are building from an sdist package and will not
+    try to copy the files again.
+    """
+
+    def wrapper(self):
+        copy_src = not path.exists("./lib")
+        if copy_src:
+            gpiod_version_str = get_gpiod_version_str()
+            open("gpiod-version-str.txt", "w").write(gpiod_version_str)
+            copytree("../../lib", "./lib")
+            copytree("../../include", "./include")
+        func(self)
+        if copy_src:
+            unlink("gpiod-version-str.txt")
+            rmtree("./lib")
+            rmtree("./include")
+
+    return wrapper
 
 
 class build_ext(orig_build_ext):
@@ -14,24 +47,69 @@ class build_ext(orig_build_ext):
     were built (and possibly copied to the source directory if inplace is set).
     """
 
+    @copy_libgpiod_files
     def run(self):
         super().run()
         rmtree(path.join(self.build_lib, "tests"), ignore_errors=True)
 
 
+class sdist(orig_sdist):
+    """
+    Wrap sdist so that we can copy the lib and include files into . where
+    MANIFEST.in will include them in the source package.
+    """
+
+    @copy_libgpiod_files
+    def run(self):
+        super().run()
+
+
+with open("gpiod/version.py", "r") as fd:
+    exec(fd.read())
+
+sources = [
+    # gpiod Python bindings
+    "gpiod/ext/chip.c",
+    "gpiod/ext/common.c",
+    "gpiod/ext/line-config.c",
+    "gpiod/ext/line-settings.c",
+    "gpiod/ext/module.c",
+    "gpiod/ext/request.c",
+]
+
+if environ.get("LINK_SYSTEM_LIBGPIOD") == "1":
+    libraries = ["gpiod"]
+    include_dirs = ["gpiod"]
+else:
+    sources += [
+        # gpiod library
+        "lib/chip.c",
+        "lib/chip-info.c",
+        "lib/edge-event.c",
+        "lib/info-event.c",
+        "lib/internal.c",
+        "lib/line-config.c",
+        "lib/line-info.c",
+        "lib/line-request.c",
+        "lib/line-settings.c",
+        "lib/misc.c",
+        "lib/request-config.c",
+    ]
+    libraries = []
+    include_dirs = ["include", "lib", "gpiod/ext"]
+
+
 gpiod_ext = Extension(
     "gpiod._ext",
-    sources=[
-        "gpiod/ext/chip.c",
-        "gpiod/ext/common.c",
-        "gpiod/ext/line-config.c",
-        "gpiod/ext/line-settings.c",
-        "gpiod/ext/module.c",
-        "gpiod/ext/request.c",
-    ],
+    libraries=libraries,
+    sources=sources,
     define_macros=[("_GNU_SOURCE", "1")],
-    libraries=["gpiod"],
-    extra_compile_args=["-Wall", "-Wextra"],
+    include_dirs=include_dirs,
+    extra_compile_args=[
+        "-Wall",
+        "-Wextra",
+        '-DGPIOD_VERSION_STR="{}"'.format(get_gpiod_version_str()),
+    ],
 )
 
 gpiosim_ext = Extension(
@@ -54,15 +132,12 @@ if environ.get("GPIOD_WITH_TESTS") == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open("gpiod/version.py", "r") as fd:
-    exec(fd.read())
-
 setup(
     name="libgpiod",
     packages=find_packages(exclude=["tests", "tests.*"]),
     python_requires=">=3.9.0",
     ext_modules=extensions,
-    cmdclass={"build_ext": build_ext},
+    cmdclass={"build_ext": build_ext, "sdist": sdist},
     version=__version__,
     author="Bartosz Golaszewski",
     author_email="brgl@bgdev.pl",
-- 
2.34.1

