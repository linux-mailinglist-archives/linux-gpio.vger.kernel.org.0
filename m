Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8F27CE977
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 22:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjJRU5j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 16:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjJRU5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 16:57:39 -0400
Received: from mail-lj1-x261.google.com (mail-lj1-x261.google.com [IPv6:2a00:1450:4864:20::261])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A87FFA
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 13:57:36 -0700 (PDT)
Received: by mail-lj1-x261.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so95491251fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697662655; x=1698267455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1q/VH9RSxB+yV6R333BiXTdqjCwuOooj5gLHEV8h598=;
        b=R31IFmvChvaz8tTiBTNCWsstM6yU9VmKN8GGLJ/UID8AV/W9/2pPe6McpPPjFyGgZj
         nwuV9T5Wo+R9e7niJ+H7eTLrUov437Nhcyiy/k6cBTCPAhpevTPNqjZu4c9JJQZJ77qI
         wmEpLJ7+QsD/lLbZ/isOMHtv+kpCIRwSLwAZdx76l0HuRHvEdTjrfyNNTvnZ5rBU+dSw
         d8w7CwFvb6ddhTxTKaxM1qSQMkKbqhxXEutMNSSaalnAaXvdiyF/VwkpVdI3+g+Z1b2U
         LlPvkBQmv3eJS/QMfolU5bzpP2ltPgoOhg5hnpBIpyriVDwqFWyyJgDfDNj9H+9pn04M
         vA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697662655; x=1698267455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1q/VH9RSxB+yV6R333BiXTdqjCwuOooj5gLHEV8h598=;
        b=UUWodD5x/eMx83EVCmo0H6bpfqU6CWyRFrRLVBIPfIff1EzXEtTMXCp1Ezprv/PEYV
         iRUpFTc7shpjH1MF7Yl+BvSL9Z4nTDhjqX6D9UE9ZbBCJq7x4m8BNNvqndumRkJGE2LJ
         Nceh4jgv+774bMqaodMaW4GomkI/Mq7FM0Y0ezog05EW5+jaZP4uqA1srWuoayoKmvTr
         5iqLpxY5UY0LeYIsDPSsN+H2MxNGzVntwkdaxYcGGTsAVWMq9h/gImu2qB8CE+Laq9bG
         pX/cN4UtIyUgdtd1M0dIQlxGTVSllSUua0cwoHIi+p7ORkDzkermzYON0uz1mwnrsS6R
         zJoA==
X-Gm-Message-State: AOJu0YyP77z+o1i2EQPwutVJgjBQD1nFvglJcFS9LD47UPiE2zea4eF6
        EyBvwxZGs9noOjo6VTHs9t5W/lhbXKQmuCbuGWYfG7VKl/6VMA==
X-Google-Smtp-Source: AGHT+IEaBEFS38KPJXHpLNr49iQ8FPGLvvjakFYZH0ZQScawKEX5P4Mw93+5egQmQkGhnzqKPF7xb41K4zaS
X-Received: by 2002:ac2:5215:0:b0:507:9a06:7dbe with SMTP id a21-20020ac25215000000b005079a067dbemr96922lfl.21.1697662654529;
        Wed, 18 Oct 2023 13:57:34 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id j18-20020a056512399200b0050460f3dd0csm927117lfu.115.2023.10.18.13.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 13:57:34 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v5 1/1] bindings: python: optionally include module in sdist
Date:   Wed, 18 Oct 2023 21:57:28 +0100
Message-Id: <20231018205728.284068-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018205728.284068-1-phil@gadgetoid.com>
References: <20231018205728.284068-1-phil@gadgetoid.com>
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

Optionally vendor libgpiod source into sdist so that the Python module can
be built from source, even with a missing or mismatched system libgpiod.

Add two new environment variables "LINK_SYSTEM_LIBGPIOD" and
"GPIOD_VERSION" to control what kind of package setup.py will build.

In order to build an sdist or wheel package with a vendored libgpiod a
version must be specified via the "GPIOD_VERSION" environment variable.

This will instruct setup.py to fetch the tarball matching the requested
version from git.kernel.org, unpack it, and copy the lib and include
directories into the package root so they can be included in sdist or used
to build a binary wheel.

eg: GPIOD_VERSION=2.0.2 python3 setup.py sdist

Will build a source distribution with gpiod version 2.0.2 source included.

It will also save the gpiod version into "gpiod-version.txt" so that it can
be passed to the build when the sdist is built by pip.

Requiring an explicit version ensures that the Python bindings - which
can be changed and versions independent of libgpiod -  are built against a
stable libgpiod release.

In order to force a package with vendored gpiod source to link the system
libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:

eg: LINK_SYSTEM_LIBGPIOD=1 pip install libgpiod

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |   5 ++
 bindings/python/setup.py    | 131 +++++++++++++++++++++++++++++++++---
 2 files changed, 125 insertions(+), 11 deletions(-)

diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index c7124d4..0aa9079 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -2,6 +2,7 @@
 # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 include setup.py
+include gpiod-version.txt
 
 recursive-include gpiod *.py
 recursive-include tests *.py
@@ -11,3 +12,7 @@ recursive-include gpiod/ext *.h
 
 recursive-include tests/gpiosim *.c
 recursive-include tests/procname *.c
+
+recursive-include lib *.c
+recursive-include lib *.h
+recursive-include include *.h
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index df10e18..f0d5c1f 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,24 +1,136 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from os import environ, path
-from setuptools import setup, Extension, find_packages
+import tarfile
+from os import getenv, path, unlink
+from shutil import copytree, rmtree
+from urllib.request import urlretrieve
+
+from setuptools import Extension, find_packages, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
-from shutil import rmtree
+from setuptools.command.sdist import sdist as orig_sdist
+
+LINK_SYSTEM_LIBGPIOD = getenv("LINK_SYSTEM_LIBGPIOD") == "1"
+GPIOD_VERSION = getenv("GPIOD_VERSION")
+GPIOD_WITH_TESTS = getenv("GPIOD_WITH_TESTS") == "1"
+SRC_BASE_URL = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/snapshot/"
+SRC_FILENAME = "libgpiod-{version}.tar.gz"
+
+# __version__
+with open("gpiod/version.py", "r") as fd:
+    exec(fd.read())
+
+
+def fetch_tarball(func):
+    # If no GPIOD_VERSION is specified in env, just run the task
+    if GPIOD_VERSION is None:
+        return func
+
+    # If GPIOD_VERSION is specified, fetch the requested version tarball
+    # and create gpiod-version.txt so the sdist package knows what version
+    # it's building.
+    def wrapper(self):
+        TARBALL = SRC_FILENAME.format(version=GPIOD_VERSION)
+
+        print(f"fetching: {SRC_BASE_URL + TARBALL}")
+
+        filename, headers = urlretrieve(SRC_BASE_URL + TARBALL, TARBALL)
+
+        if not tarfile.is_tarfile(filename):
+            print(f"error: refusing to build sdist (invalid tarball {TARBALL})")
+            return
+
+        # Unpack the downloaded tarball
+        print(f"unpacking: {filename}")
+        file = tarfile.open(filename)
+        file.extractall(".")
+        file.close()
+        unlink(filename)
+
+        # Copy the include and lib directories we need to build libgpiod
+        copytree(f"libgpiod-{GPIOD_VERSION}/include/", "./include")
+        copytree(f"libgpiod-{GPIOD_VERSION}/lib/", "./lib")
+        rmtree(f"libgpiod-{GPIOD_VERSION}")
+
+        # Save the gpiod version for sdist
+        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
+
+        func(self)
+
+        rmtree("./lib", ignore_errors=True)
+        rmtree("./include", ignore_errors=True)
+        unlink("gpiod-version.txt")
+
+    return wrapper
 
 
 class build_ext(orig_build_ext):
     """
-    setuptools install all C extentions even if they're excluded in setup().
-    As a workaround - remove the tests directory right after all extensions
-    were built (and possibly copied to the source directory if inplace is set).
+    Wrap build_ext to amend the module sources and settings to build
+    the bindings and gpiod into a combined module when a version is
+    specified and LINK_SYSTEM_LIBGPIOD=1 is not present in env.
+
+    run is wrapped with @fetch_tarball in order to fetch the sources
+    needed to build binary wheels when GPIOD_VERSION is specified, eg:
+
+    GPIOD_VERSION="2.0.2" python3 -m build .
     """
 
+    @fetch_tarball
     def run(self):
+        # Try to get the gpiod version from the .txt file included in sdist
+        try:
+            gpiod_version = open("gpiod-version.txt", "r").read()
+        except OSError:
+            gpiod_version = GPIOD_VERSION
+
+        if gpiod_version and not LINK_SYSTEM_LIBGPIOD:
+            # When building the extension from an sdist with a vendored
+            # amend gpiod._ext sources and settings accordingly.
+            gpiod_ext = self.ext_map["gpiod._ext"]
+            gpiod_ext.sources += [
+                "lib/chip.c",
+                "lib/chip-info.c",
+                "lib/edge-event.c",
+                "lib/info-event.c",
+                "lib/internal.c",
+                "lib/line-config.c",
+                "lib/line-info.c",
+                "lib/line-request.c",
+                "lib/line-settings.c",
+                "lib/misc.c",
+                "lib/request-config.c",
+            ]
+            gpiod_ext.libraries = []
+            gpiod_ext.include_dirs = ["include", "lib", "gpiod/ext"]
+            gpiod_ext.extra_compile_args.append(
+                f'-DGPIOD_VERSION_STR="{gpiod_version}"',
+            )
+
         super().run()
+
+        # We don't ever want the module tests directory in our package
+        # since this might include gpiosim._ext or procname._ext from a
+        # previous dirty build tree.
         rmtree(path.join(self.build_lib, "tests"), ignore_errors=True)
 
 
+class sdist(orig_sdist):
+    """
+    Wrap sdist in order to fetch the libgpiod source files for vendoring
+    into a source distribution.
+
+    run is wrapped with @fetch_tarball in order to fetch the sources
+    needed to build binary wheels when GPIOD_VERSION is specified, eg:
+
+    GPIOD_VERSION="2.0.2" python3 -m build . --sdist
+    """
+
+    @fetch_tarball
+    def run(self):
+        super().run()
+
+
 gpiod_ext = Extension(
     "gpiod._ext",
     sources=[
@@ -50,19 +162,16 @@ procname_ext = Extension(
 )
 
 extensions = [gpiod_ext]
-if environ.get("GPIOD_WITH_TESTS") == "1":
+if GPIOD_WITH_TESTS:
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

