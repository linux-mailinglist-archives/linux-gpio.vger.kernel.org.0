Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714B772A801
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jun 2023 04:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjFJCCA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 22:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjFJCB7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 22:01:59 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05E53AAF
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 19:01:57 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25691a1b2b8so935820a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 19:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686362517; x=1688954517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYnDBNSsBaBkOUrQAuni/3hAVUSA3nJEzMr0BKHVSSI=;
        b=Heo1G5vdB2BMDNKdi/f2O+/sJ7S6934H7xiaitjkTTizwv1ExKyi0f+fND9WOg88eK
         jcmvduAZLQB3+Yknp9bp/MxEpd5sugbzZK22bcFcQhwg9XmvvY9D7SPjMIgGS3WUjOQP
         e3E+PtGjO/brHkyNqPS7Cryyyhy4llZFi0/Xb7IYZGwCUK9XImNaNna/0dW+zuFumnl6
         1ogUKPeRCB2F9tjQx3rdlIIxp5lYt4cRI0Ns4dUQuZWTCKjZQ4YoiT+Hgpo9GmlcMu1L
         9IP5xS7YAqG4Re2juAM7ls7/Y8OQQ5+ZELReAk0Cdp3HXonvbI376uavgvXh91OjCXVG
         1H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686362517; x=1688954517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYnDBNSsBaBkOUrQAuni/3hAVUSA3nJEzMr0BKHVSSI=;
        b=Je/Sozpe8JtS4kuMsaoLhOr/sZKaOqj1OuqdheFt9eiG1ha4WHJ5zMbO220zqFsHTB
         4YPAiy2N8y2pxie5Ny0g4f1+TBWZ4rWn3tnUMyv3r2bGVOSz8pRjNGU5o/5M4ejyVbX5
         SqYcU9I/LxzHqN95o5PHr5yMkSqptLI8rrdxTl6wn/hRU9Lc5jtQXVRz6MJz9ol/5za7
         oarcnzbcUGoQbXFiM+D5+V/DVS9AAL9k2gPvKNI3w4O0AfjmV7a/2vvC9tmPUYy7DSmM
         R/1e34TutYOVHSHmQ4qdAe4i1m9AjYs9sHoD6xF+c8bwTskm5+o11cx501Bj5qixgzwP
         zTSg==
X-Gm-Message-State: AC+VfDyTw+MPjMBTQ5kNlS2ZEyopYNVv4m03PDnkOZX0UZj+phVrCpk4
        vy3jDCP97zexiP1tP7JpNllt5gQyv0w=
X-Google-Smtp-Source: ACHHUZ4IjqMNVcszu91Bs3LhoQ0BC+W9BxYVJJ6uGcS0hNtOS03VpzaoW2yjeNh3TZbln4mTmoW5/w==
X-Received: by 2002:a17:90a:5201:b0:256:807e:6bd with SMTP id v1-20020a17090a520100b00256807e06bdmr2271000pjh.28.1686362516902;
        Fri, 09 Jun 2023 19:01:56 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id pt1-20020a17090b3d0100b002500df72713sm5377002pjb.7.2023.06.09.19.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 19:01:56 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] doc: add configuration to generate doxygen documentation on readthedocs.
Date:   Sat, 10 Jun 2023 10:01:48 +0800
Message-Id: <20230610020148.8973-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having the libgpiod documentation available online would be helpful, so
add the configuration required to generate the existing docygen C/C++
documentation on readthedocs.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Speaking of readthedocs - it looks like the config to generate the
documentation there hasn't made it's way into master, so here it is.

It might be due for an update, as it is over a year old now, but this is
what is currently deployed.

Cheers,
Kent.

 .readthedocs.yaml | 29 ++++++++++++++++++++
 sphinx/conf.py    | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 sphinx/index.rst  | 24 ++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 .readthedocs.yaml
 create mode 100644 sphinx/conf.py
 create mode 100644 sphinx/index.rst

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
new file mode 100644
index 0000000..976496c
--- /dev/null
+++ b/.readthedocs.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+
+#
+# This file is part of libgpiod.
+#
+# Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
+#
+# Read the Docs configuration file
+# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details
+
+version: 2
+
+build:
+  os: ubuntu-20.04
+  tools:
+    python: "3.9"
+  # doxygen is available by default, but just in case.
+  # others are definitely missing.
+  apt_packages:
+      - autoconf
+      - autoconf-archive
+      - libtool
+      - m4
+      - doxygen
+      - graphviz
+
+sphinx:
+   configuration: sphinx/conf.py
+
diff --git a/sphinx/conf.py b/sphinx/conf.py
new file mode 100644
index 0000000..7022ff9
--- /dev/null
+++ b/sphinx/conf.py
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+
+#
+# This file is part of libgpiod.
+#
+# Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
+#
+# Configuration file for the Sphinx documentation builder.
+#
+# This file only contains a selection of the most common options. For a full
+# list see the documentation:
+# https://www.sphinx-doc.org/en/master/usage/configuration.html
+
+import subprocess
+
+subprocess.run('cd .. ; ./autogen.sh ; make doc', shell=True)
+
+# -- Path setup --------------------------------------------------------------
+
+# If extensions (or modules to document with autodoc) are in another directory,
+# add these directories to sys.path here. If the directory is relative to the
+# documentation root, use os.path.abspath to make it absolute, like shown here.
+#
+# import os
+# import sys
+# sys.path.insert(0, os.path.abspath('.'))
+
+
+# -- Project information -----------------------------------------------------
+
+project = 'libgpiod'
+copyright = '2022, Bartosz Golaszewski'
+author = 'Bartosz Golaszewski'
+
+# The full version, including alpha/beta/rc tags
+release = subprocess.run(
+            ['git', 'describe', '--dirty'],
+            capture_output=True).stdout.decode().strip()
+
+# -- General configuration ---------------------------------------------------
+
+# Add any Sphinx extension module names here, as strings. They can be
+# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
+# ones.
+extensions = [
+]
+
+# Add any paths that contain templates here, relative to this directory.
+templates_path = []
+
+# List of patterns, relative to source directory, that match files and
+# directories to ignore when looking for source files.
+# This pattern also affects html_static_path and html_extra_path.
+exclude_patterns = []
+
+
+# -- Options for HTML output -------------------------------------------------
+
+# The theme to use for HTML and HTML Help pages.  See the documentation for
+# a list of builtin themes.
+#
+html_theme = 'alabaster'
+
+# Add any paths that contain custom static files (such as style sheets) here,
+# relative to this directory. They are copied after the builtin static files,
+# so a file named "default.css" will overwrite the builtin "default.css".
+html_static_path = []
+
+html_extra_path = ['../doc/html']
+
diff --git a/sphinx/index.rst b/sphinx/index.rst
new file mode 100644
index 0000000..e38fad7
--- /dev/null
+++ b/sphinx/index.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: LGPL-2.1-or-later
+
+..
+   This file is part of libgpiod.
+
+   Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
+
+   libgpiod documentation master file.
+
+Welcome to libgpiod's documentation!
+====================================
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Contents:
+
+
+
+Indices and tables
+==================
+
+* :ref:`genindex`
+* :ref:`modindex`
+* :ref:`search`
-- 
2.40.1

