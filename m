Return-Path: <linux-gpio+bounces-13202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 869949D62D2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 18:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D9BAB249C2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 17:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A1339A1;
	Fri, 22 Nov 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="hi2BMbQd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B51CD3F
	for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2024 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295794; cv=none; b=kXw6o4vFUUcJ8xi5HHhpqtZtOCkhkNyAMa9y9P0tDxvJZP3nkqq9kOACdValb0sEFWBGo9ogZM3H1EggHBOI2t8pneSR4M2vwBeqNbAUR/ZRDkzDc3V5Y4MEShilYEfLlPSPoeo+EbevxaqS6kV8J7Sd0TL851nTyu20qmGNMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295794; c=relaxed/simple;
	bh=As+S2HIcqDK6J9q5LmIvoMMmR56boqQ0D/RskL91u+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mkog/3+G2k8y2KwYR9p7ZPRjHHYz+RbzNjFLeFbQMB8vzLbaGovksQ4BifI3xsMLdIViwLX5uSQGL3iFbk/vZbyc6P3nO6YpJ7L6UDdeAETVlwhnJailzZC8hY5dHa2V6zDuPKR+0ncD3sBtaICeIUmJsyXe7AKKVwAN7Z3DRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=hi2BMbQd; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 89A872018C;
	Fri, 22 Nov 2024 11:10:46 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1732295446; bh=As+S2HIcqDK6J9q5LmIvoMMmR56boqQ0D/RskL91u+g=;
	h=From:To:Cc:Subject:Date:From;
	b=hi2BMbQdQ7Dq47+m93qxYBUJIyR1Nx+ZsBxBXgLUk4SxKU9pn8GzxxyleRM1YhOhy
	 q4PzFoYvjCaoiZMtK0oR3FnAdAxdjpof14nC/fOtDUsTac7VQvSCOmrgyevWc1lYor
	 ZHPG0WR/LoltLrbpeYY3KgVP2xMnroBab38zDjnk=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH] bindings: python: migrate metadata to pyproject.toml
Date: Fri, 22 Nov 2024 11:10:27 -0600
Message-Id: <20241122171027.762311-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PEP 621 [0] designated pyproject.toml as the standard place to store
project metadata.

Setuptools, the build system used by this project, has support for
reading metadata from this location. As such, migrate the majority of
the metadata out of `setup.py`.

For now, the external modules are left declared in `setup.py` because
support within pyproject.toml is still experimental [1].

New metadata has been added/updated, namely:
  * Add Trove classifiers
  * Add a link to the issues page
  * Update license from LGPL-2.1 to LGPL-2.1+ to match SPDX identifier

[0]: https://peps.python.org/pep-0621/
[1]: https://setuptools.pypa.io/en/stable/userguide/ext_modules.html#pyproject-toml
Closes: https://github.com/brgl/libgpiod/issues/107
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/pyproject.toml | 43 +++++++++++++++++++++++++++++++++-
 bindings/python/setup.py       | 20 +---------------
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index d6f5f9b..dbc0c7d 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -2,7 +2,48 @@
 # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
 
 [build-system]
-requires = ["setuptools", "wheel", "packaging"]
+requires = ["setuptools>=69.0.0", "wheel", "packaging"]
+build-backend = "setuptools.build_meta"
+
+[project]
+name = "gpiod"
+dynamic = ["version"]
+description = "Python bindings for libgpiod"
+readme = "README.md"
+license = {text = "LGPL-2.1-or-later"}
+requires-python = ">=3.9.0"
+authors = [
+  {name = "Bartosz Golaszewski", email = "brgl@bgdev.pl"},
+]
+classifiers = [
+  "Development Status :: 5 - Production/Stable",
+  "License :: OSI Approved :: GNU Lesser General Public License v2 or later (LGPLv2+)",
+  "Operating System :: POSIX :: Linux",
+  "Typing :: Typed",
+  "Programming Language :: Python",
+  "Programming Language :: Python :: 3",
+  "Programming Language :: Python :: 3 :: Only",
+  "Programming Language :: Python :: 3.9",
+  "Programming Language :: Python :: 3.10",
+  "Programming Language :: Python :: 3.11",
+  "Programming Language :: Python :: 3.12",
+  "Programming Language :: Python :: 3.13",
+]
+
+[project.urls]
+Homepage = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
+Issues = "https://github.com/brgl/libgpiod/issues/"
+
+[tool.setuptools]
+platforms = ["linux"]
+include-package-data = false
+
+[tool.setuptools.dynamic]
+version = {attr = "gpiod.version.__version__"}
+
+[tool.setuptools.packages.find]
+include = ["gpiod"]
+namespaces = false
 
 [tool.mypy]
 python_version = "3.9"
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 0d518af..1af4709 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -4,7 +4,7 @@
 from os import getenv, path, unlink
 from shutil import copytree, rmtree
 
-from setuptools import Extension, find_packages, setup
+from setuptools import Extension, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
 from setuptools.command.sdist import log
 from setuptools.command.sdist import sdist as orig_sdist
@@ -18,11 +18,6 @@ TAR_FILENAME = "libgpiod-{version}.tar.gz"
 ASC_FILENAME = "sha256sums.asc"
 SHA256_CHUNK_SIZE = 2048
 
-# __version__
-with open("gpiod/version.py", "r") as fd:
-    exec(fd.read())
-
-
 def sha256(filename):
     """
     Return a sha256sum for a specific filename, loading the file in chunks
@@ -225,19 +220,6 @@ gpiod_ext = Extension(
 )
 
 setup(
-    name="gpiod",
-    url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
-    packages=find_packages(exclude=["tests", "tests.*"]),
-    package_data={"gpiod": ["py.typed", "_ext.pyi"]},
-    python_requires=">=3.9.0",
     ext_modules=[gpiod_ext],
     cmdclass={"build_ext": build_ext, "sdist": sdist},
-    version=__version__,
-    author="Bartosz Golaszewski",
-    author_email="brgl@bgdev.pl",
-    description="Python bindings for libgpiod",
-    long_description=open("README.md", "r").read(),
-    long_description_content_type="text/markdown",
-    platforms=["linux"],
-    license="LGPLv2.1",
 )
-- 
2.34.1


