Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA397D11EE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 16:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377604AbjJTO5Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 10:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377607AbjJTO5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 10:57:16 -0400
Received: from mail-wm1-x366.google.com (mail-wm1-x366.google.com [IPv6:2a00:1450:4864:20::366])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA72D60
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 07:57:13 -0700 (PDT)
Received: by mail-wm1-x366.google.com with SMTP id 5b1f17b1804b1-40790b0a224so7367345e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697813831; x=1698418631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG4f0osxNDPFO6DANq6tm/M5hSXrA6FHuJgTtXdXXCA=;
        b=FUxnKN/bJjYgThhGLOmrDsuemaB7eWz4OzG7bjnhAvCaIdA+rORtkjA+PmRARphivy
         1Kclr/KHsmofNpcrIDR+Os/4J8LTXUEiRQEcDyzIKKzODgd3vaU+bmooaki/jTNpYPIc
         1GjIDvzZBi7PAtg4c9q4zM67+CGuyaPNMZ6ok1mqtg8kp3VVCJDvlvBJQw40iaTtd7K9
         1IG1EB9+7SeD5lcrogh0sVU68yuym57U5lEQfVUz3GuNH/Cx9txhMQyLS0ACCfKqiINu
         CxAn5tce2zK1UFq9tsIQDUPcWH4lFajEtQUsfLs0CuDDirOz7i3okrVNA1Z17AtQd+wn
         CbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697813831; x=1698418631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG4f0osxNDPFO6DANq6tm/M5hSXrA6FHuJgTtXdXXCA=;
        b=b18ItGpoYXaaA2BosrbWTRIm6a9sYpmVNDwWsYb9zqKBGaxK5dGVBVRbbmNXylJL46
         dxHBKZ0Wn44Vb3x3HeMIPb/L29FGQu4C1pQFippEl9e8pz4iNI6i0P8BPNsmOOk3OOM1
         m05lTLwLQn4fwHhFWDeIIU1Cg8MCdrMXj1Wm1M+0uoXY2EJ1jiC2rmLZLgee7jkm+hK5
         azn3U/dUJb58LUWhsWCfRj/ZYSwKgBcZSFXnM3MLxiiJDuh2pqdEyrhvHdvhTBZySmxM
         35omTlVTLCgyFM4RvDKqbr5dFuzndELjC8xc2NVKr/cfE7mxdJzIE2hYWr4xiQorLdrF
         lkiw==
X-Gm-Message-State: AOJu0YwbPKI4QavW6/m9QuOVgDxGhuecdQELPwyoRy042Wb9HKm97csJ
        T2Eed6hb/O15LpekF6g7KMPW1ed5fikZQC4EH2gN2XYhaGs2jw==
X-Google-Smtp-Source: AGHT+IG4DLDhfFOmDLDAjIoBSF/RpwY1rWuDJv8zw+qGd+6wU1qwTRCwhWLgtSMXMRe2fGzhkPsbf9HW3Fqu
X-Received: by 2002:a05:600c:470d:b0:406:7d74:a2a6 with SMTP id v13-20020a05600c470d00b004067d74a2a6mr1675860wmo.24.1697813831147;
        Fri, 20 Oct 2023 07:57:11 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id o17-20020a05600c379100b004064e303457sm1065299wmr.45.2023.10.20.07.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:57:11 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH v6 1/1] bindings: python: optionally include module in sdist
Date:   Fri, 20 Oct 2023 15:57:04 +0100
Message-Id: <20231020145704.413229-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020145704.413229-1-phil@gadgetoid.com>
References: <20231020145704.413229-1-phil@gadgetoid.com>
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
version from mirrors.edge.kernel.org, verify the sha256 signature, unpack
it, and copy the lib and include directories into the package root so they
can be included in sdist or used to build a binary wheel.

eg: GPIOD_VERSION=2.0.2 python3 setup.py sdist

Will build a source distribution with gpiod version 2.0.2 source included.

It will also save the gpiod version into "gpiod-version.txt" so that it
can be passed to the build when the sdist is built by pip.

Requiring an explicit version ensures that the Python bindings - which
can be changed and versions independent of libgpiod - are built against a
stable libgpiod release.

In order to force a package with vendored gpiod source to link the system
libgpiod, the "LINK_SYSTEM_LIBGPIOD" environment variable can be used:

eg: LINK_SYSTEM_LIBGPIOD=1 pip install libgpiod

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |   5 +
 bindings/python/setup.py    | 190 +++++++++++++++++++++++++++++++++---
 2 files changed, 184 insertions(+), 11 deletions(-)

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
index df10e18..3aec52f 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,24 +1,195 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from os import environ, path
-from setuptools import setup, Extension, find_packages
+from os import getenv, path, unlink
+from shutil import copytree, rmtree
+
+from setuptools import Extension, find_packages, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
-from shutil import rmtree
+from setuptools.command.sdist import log
+from setuptools.command.sdist import sdist as orig_sdist
+from setuptools.errors import BaseError
+
+LINK_SYSTEM_LIBGPIOD = getenv("LINK_SYSTEM_LIBGPIOD") == "1"
+GPIOD_VERSION = getenv("GPIOD_VERSION")
+GPIOD_WITH_TESTS = getenv("GPIOD_WITH_TESTS") == "1"
+SRC_BASE_URL = "https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/"
+TAR_FILENAME = "libgpiod-{version}.tar.gz"
+ASC_FILENAME = "sha256sums.asc"
+SHA256_CHUNK_SIZE = 2048
+
+# __version__
+with open("gpiod/version.py", "r") as fd:
+    exec(fd.read())
+
+
+def sha256(filename):
+    """
+    Return a sha256sum for a specific filename, loading the file in chunks
+    to avoid potentially excessive memory use.
+    """
+    from hashlib import sha256
+
+    sha256sum = sha256()
+    with open(filename, "rb") as f:
+        for chunk in iter(lambda: f.read(SHA256_CHUNK_SIZE), b""):
+            sha256sum.update(chunk)
+
+    return sha256sum.hexdigest()
+
+
+def find_sha256sum(asc_file, tar_filename):
+    """
+    Search through a local copy of sha256sums.asc for a specific filename
+    and return the associated sha256 sum.
+    """
+    with open(asc_file, "r") as f:
+        for line in f:
+            if line[66:-1] == tar_filename:
+                return line.split("  ")[0]
+
+    raise BaseError(f"no signature found for {tar_filename}")
+
+
+def fetch_tarball(command):
+    """
+    Verify the requested GPIOD_VERSION tarball exists in sha256sums.asc,
+    fetch it from https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
+    and verify its sha256sum.
+
+    If the check passes, extract the tarball and copy the lib and include
+    dirs into our source tree.
+    """
+
+    # If no GPIOD_VERSION is specified in env, just run the command
+    if GPIOD_VERSION is None:
+        return command
+
+    # If GPIOD_VERSION is specified, apply the tarball wrapper
+    def wrapper(self):
+        # Just-in-time import of tarfile and urllib.request so these are
+        # not required for Yocto to build a vendored or linked package
+        import tarfile
+        from tempfile import TemporaryDirectory
+        from urllib.request import urlretrieve
+
+        # Early exit for build tree with dirty lib/include dirs
+        for check_dir in "lib", "include":
+            if path.isdir(f"./{check_dir}"):
+                raise BaseError(f"refusing to overwrite ./{check_dir}")
+
+        with TemporaryDirectory(prefix="libgpiod-") as temp_dir:
+            tarball_filename = TAR_FILENAME.format(version=GPIOD_VERSION)
+            tarball_url = f"{SRC_BASE_URL}{tarball_filename}"
+            asc_url = f"{SRC_BASE_URL}{ASC_FILENAME}"
+
+            log.info(f"fetching: {asc_url}")
+
+            asc_filename, _ = urlretrieve(asc_url, path.join(temp_dir, ASC_FILENAME))
+
+            tarball_sha256 = find_sha256sum(asc_filename, tarball_filename)
+
+            log.info(f"fetching: {tarball_url}")
+
+            downloaded_tarball, _ = urlretrieve(
+                tarball_url, path.join(temp_dir, tarball_filename)
+            )
+
+            log.info(f"verifying: {tarball_filename}")
+            if sha256(downloaded_tarball) != tarball_sha256:
+                raise BaseError(f"signature mismatch for {tarball_filename}")
+
+            # Unpack the downloaded tarball
+            log.info(f"unpacking: {tarball_filename}")
+            with tarfile.open(downloaded_tarball) as f:
+                f.extractall(temp_dir)
+
+            # Copy the include and lib directories we need to build libgpiod
+            base_dir = path.join(temp_dir, f"libgpiod-{GPIOD_VERSION}")
+            copytree(path.join(base_dir, "include"), "./include")
+            copytree(path.join(base_dir, "lib"), "./lib")
+
+        # Save the gpiod version for sdist
+        open("gpiod-version.txt", "w").write(GPIOD_VERSION)
+
+        # Run the command
+        command(self)
+
+        # Clean up the build directory
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
@@ -50,19 +221,16 @@ procname_ext = Extension(
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

