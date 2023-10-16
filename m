Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE73A7CAD2D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 17:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233616AbjJPPTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 11:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjJPPTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 11:19:00 -0400
Received: from mail-ej1-x661.google.com (mail-ej1-x661.google.com [IPv6:2a00:1450:4864:20::661])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EB4EA
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 08:18:58 -0700 (PDT)
Received: by mail-ej1-x661.google.com with SMTP id a640c23a62f3a-9becde9ea7bso421025766b.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697469536; x=1698074336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1PvA3B7aOGUvfbznNydB4PCLc2slbxhS4v2VBJk0qI=;
        b=cUsdBfDcRwHIgwtHzjTYzPNSoI/UxUAFzgfYomgSRSpVnuve+0u9Cw+7pdTSFk/CIE
         8KEbI2x5Sj5YlvpKNe3Q/46+5uEjsa7IWP9r5E5N9h2SxldxBAcw+6IV9zHbKohXG8nU
         Z44TuQoxqU1k7eYFK4GTLvm+zAtTe9EVWaZFtBR7U++CQBn8DOm1enHALGKJsjovOth3
         rHIYkBWx8+8R9ZT9KflczYLaPP1YGR189eQ+Cgku9kUcMMRWO5hPr1gq/ctuh5RWyFxQ
         PwF04qbdg3ciQULz/ntFkdbRMEyPmJOJ8/Qt36lEll2xNSnTaL+thm6IiyblEHnt9sv+
         UquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697469536; x=1698074336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1PvA3B7aOGUvfbznNydB4PCLc2slbxhS4v2VBJk0qI=;
        b=KF+/zFjEx9iuaMcO87thOs0HoATukZh3e2ahFnpMuruWztpkn+EfwNXpgDAeTP9h7S
         yiTRzuqfQ6SRrwKehXB5aT6bdO5IRHujllayT537UFAtRnUO015NFX6i4rx7XGFEHPpC
         zvJvE4xbEgQ/y+4Zkj7HwCnt5JN4twW8o7uU11yDHCSiJNyQBQcjX3rMY5QjuOdiwzLo
         OYGAgrf3mCcH3qTkPQnWinrKv5tpfAeB+I3k9UZ/d9qtvl2jYm0f4RGtg23zru5o0a5c
         5bkAKY4p+5onhBLTRK3kNCK7rYdr2OT0aDhnnvW7Lx411jLoUXrG6ZIHjsPvKjswbrin
         8HjA==
X-Gm-Message-State: AOJu0YwCjCsEQ13fI3vWTD9RQ7wNndIGNtgLmFGyEwbHDJXptlGVAfW3
        LrdIj95mV5hkXlQ2WIxywD2tWnC/36JVCmuobJv/91PDHYlCyw==
X-Google-Smtp-Source: AGHT+IH2a9QCLRCMb3nuvl+XrQWdeYgBYeefzc9q1j9ZUntthucttcor6+/m6CElEoVZvejBUBXnPiUpi/Ob
X-Received: by 2002:a17:907:801:b0:9ba:8ed:ea58 with SMTP id wv1-20020a170907080100b009ba08edea58mr7711791ejb.30.1697469536535;
        Mon, 16 Oct 2023 08:18:56 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id jp1-20020a170906f74100b00993b268eafdsm612951ejb.179.2023.10.16.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 08:18:56 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v4 1/1] bindings: python: optionally include module in sdist
Date:   Mon, 16 Oct 2023 16:18:48 +0100
Message-Id: <20231016151848.168209-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016151848.168209-1-phil@gadgetoid.com>
References: <20231016151848.168209-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Optionally vendor libgpiod source into sdist so that the
Python module can be built from source, even with a missing
or mismatched system libgpiod.

Add optional environment variable "LINK_SYSTEM_LIBGPIOD=1"
so that the sdist package can optionally be built and
linked against a compatible system libgpiod.

eg: LINK_SYSTEM_LIBGPIOD=1 pip install libgpiod

Update build to add an additional sdist target for upload
to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
triggers a vendored package build. "GPIOD_VERSION_STR" is
saved to "gpiod-version-str.txt" and included in the sdist
for standalone builds.

"GPIOD_VERSION_STR" must be specified in order to produce
a standalone buildable sdist package, this requirement
implicitly preserves the old build behaviour.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |   5 ++
 bindings/python/Makefile.am |   3 +
 bindings/python/setup.py    | 122 +++++++++++++++++++++++++++++++-----
 3 files changed, 114 insertions(+), 16 deletions(-)

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
index 079ceb1..7fadf52 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -16,6 +16,9 @@ all-local:
 	$(PYTHON) setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
 		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
+	GPIOD_VERSION_STR=$(VERSION_STR) \
+	$(PYTHON) setup.py sdist
+
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index df10e18..168c1af 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,10 +1,49 @@
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
+        pass
+    try:
+        return open("gpiod-version-str.txt", "r").read()
+    except OSError:
+        return None
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
+            if gpiod_version_str is not None:
+                open("gpiod-version-str.txt", "w").write(gpiod_version_str)
+            copytree("../../lib", "./lib")
+            copytree("../../include", "./include")
+        func(self)
+        if copy_src:
+            if gpiod_version_str is not None:
+                unlink("gpiod-version-str.txt")
+            rmtree("./lib")
+            rmtree("./include")
+
+    return wrapper
 
 
 class build_ext(orig_build_ext):
@@ -14,24 +53,78 @@ class build_ext(orig_build_ext):
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
+extra_compile_args = [
+    "-Wall",
+    "-Wextra",
+]
+
+libraries = ["gpiod"]
+include_dirs = ["gpiod"]
+
+if environ.get("LINK_SYSTEM_LIBGPIOD") == "1":
+    print("linking system libgpiod (requested by LINK_SYSTEM_LIBGPIOD)")
+elif get_gpiod_version_str() is None:
+    print("warning: linking system libgpiod (GPIOD_VERSION_STR not specified)")
+else:
+    print("vendoring libgpiod into standalone library")
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
+    extra_compile_args += [
+        '-DGPIOD_VERSION_STR="{}"'.format(get_gpiod_version_str()),
+    ]
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
+    extra_compile_args=extra_compile_args,
 )
 
 gpiosim_ext = Extension(
@@ -54,15 +147,12 @@ if environ.get("GPIOD_WITH_TESTS") == "1":
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

