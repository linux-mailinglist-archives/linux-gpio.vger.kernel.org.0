Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398137C7850
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 23:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347412AbjJLVC5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 17:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442372AbjJLVC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 17:02:56 -0400
Received: from mail-wm1-x361.google.com (mail-wm1-x361.google.com [IPv6:2a00:1450:4864:20::361])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA8ABB
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 14:02:51 -0700 (PDT)
Received: by mail-wm1-x361.google.com with SMTP id 5b1f17b1804b1-4065f29e933so16728805e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 14:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697144570; x=1697749370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV1MLXoSVHpabbiqLyt2YycMm4ihe1CRcqKSmP+RTm4=;
        b=gkh02C1z6WNtr8T2tAR9gGQu1R5TddrZGFJlKRP6QFfO9JUva7AYbNqoZAUEU3woNR
         lMwbKbqMdNPeToW8djay8bQDxcNbV45fsYs8Q8Yvo73wSIeIpzbt5p+X0sssu075nowM
         GjcsUaHrFfsOhZsw8gI9Y/JgjQhhBnYPsapHfVUpqtiRLEonwZdZ7U5j6A/YJRLWvQAL
         skXTny+Pe82jFf9WEJpj7I+2EFB1uWUiOIbunXkX1tAWy057uF4EzalviCnN0G0Pofru
         QIouxHWi1vTGGOsKffckaeQKFa13Gq/bDdh0ZhBQKErwXRS0o7TjbUrTVu0TLg1F+eiV
         SRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697144570; x=1697749370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV1MLXoSVHpabbiqLyt2YycMm4ihe1CRcqKSmP+RTm4=;
        b=No7JMvK0qMHgumt2c/83vPJmw4y/GuuuyxiMQA07QYabXgLWxpH5yYIehWRatcabjf
         Mux/G/Oubu3bOm5qahnHrif4iWah/R2Ohjh52PPEaW2fvWHGUm9FGpSglPWdFmKjclRs
         Nlsa8nSQx20Z5Dyrwy4pH3fILQD8lPh+rCkIX1v9tTSb5fkSZbqxJudH7la1af7leYJj
         Pmwd13tGsq3IQ8lLAr/uwmD8DblYGaQhE9ma09KvtaHLrOy4q5c0AAF2aaSHO4zXXlA2
         9LoxjN9eLIkFH3QaZJUIF9gPCID4fLpJRKzonF/hqzzTd2HPHeCGY6F7aIDfdmrTecd0
         k4mg==
X-Gm-Message-State: AOJu0Yz6NC76NCAze3xn7wXzf3o5C3q0M5YKM10SPcEQxFtGapCZUQOA
        aAmhMwraqzUJ3cMnKSGxOaa4AHXOo4Hxm8uVGA8xVjNBHPvgzw==
X-Google-Smtp-Source: AGHT+IGTi3XvaeuTshAcWvWQA4ftzFOrdtK2R5Z8S3q9JSarWrLhSWPfs8tAgNwBE7IIy0FPbNBJSlE5V/Tl
X-Received: by 2002:a7b:c851:0:b0:406:5301:4320 with SMTP id c17-20020a7bc851000000b0040653014320mr22503187wml.16.1697144569652;
        Thu, 12 Oct 2023 14:02:49 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id k13-20020a05600c0b4d00b004073d6c3626sm103194wmr.28.2023.10.12.14.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 14:02:49 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v2 1/2] bindings: python: optionally include module in sdist
Date:   Thu, 12 Oct 2023 22:02:27 +0100
Message-Id: <20231012210228.101513-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012210228.101513-1-phil@gadgetoid.com>
References: <20231012210228.101513-1-phil@gadgetoid.com>
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

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |  4 ++
 bindings/python/setup.py    | 95 +++++++++++++++++++++++++++++++------
 2 files changed, 84 insertions(+), 15 deletions(-)

diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index c7124d4..eff8977 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -11,3 +11,7 @@ recursive-include gpiod/ext *.h
 
 recursive-include tests/gpiosim *.c
 recursive-include tests/procname *.c
+
+recursive-include lib *.c
+recursive-include lib *.h
+recursive-include include *.h
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index fd674aa..e3b571c 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -4,7 +4,30 @@
 from os import environ, path
 from setuptools import setup, Extension, find_packages
 from setuptools.command.build_ext import build_ext as orig_build_ext
-from shutil import rmtree
+from setuptools.command.sdist import sdist as orig_sdist
+from shutil import rmtree, copytree
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
+            copytree("../../lib", "./lib")
+            copytree("../../include", "./include")
+        func(self)
+        if copy_src:
+            rmtree("./lib")
+            rmtree("./include")
+
+    return wrapper
 
 
 class build_ext(orig_build_ext):
@@ -14,24 +37,69 @@ class build_ext(orig_build_ext):
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
+        '-DGPIOD_VERSION_STR="{}"'.format(__version__),
+    ],
 )
 
 gpiosim_ext = Extension(
@@ -54,15 +122,12 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
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

