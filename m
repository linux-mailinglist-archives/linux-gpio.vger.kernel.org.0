Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6134CE3FF
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Mar 2022 10:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiCEJlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Mar 2022 04:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiCEJlg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Mar 2022 04:41:36 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6331B23EE45
        for <linux-gpio@vger.kernel.org>; Sat,  5 Mar 2022 01:40:46 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id e13so9831002plh.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Mar 2022 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtUTnu/7w2LGChZ7i5FNvlnMnuo5AfPgEiQNsGN2QmM=;
        b=jTeoPkGa3nSP56qAp8B8Ti+I9JJ9Vx0fGGvWAPa7CbiW/5e4RKEXpwZ87X2pOODpR6
         oWFsBavqrwwhNUVyGVa9ZIq5nJ3X7eiWiH5XSjKnrS0pVs620Pd2OoSR2OMv42xLUXFZ
         4RMwln/gc9ebz5G1vPo4FxuWDiDuao5IcggBbevJlTuAEL19qtCH/kbwHUFg+Z8FSDIO
         uqqgkgX+xknaz2hSEZUvFbvRa/3kQDmbt5M+t9fn0DMWVHZpGuio5nqCgetKQYIuRMLM
         cWOhgMtKCg6jbgMOOL6qBnQ8bjywfoAGvOSUfaNKLuDuNMMFThIqSPHjm5DaVhnCUvL4
         ofLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtUTnu/7w2LGChZ7i5FNvlnMnuo5AfPgEiQNsGN2QmM=;
        b=ABOUfVCLRptBYbe1Sxr8yeQ2nL9EbopPEL409ykD+XrZkKVz5FS8eD8x88KNcwX8M+
         9lGCIwbNTMWORZcXkjsiOdsL+s0iN/+so6A61drRVSQ+AQb0cp+GqRBmNM1llR7nvarl
         n6/8BoiXO7mWr56QyvvO5fJtNh2CaEwzx/QasEZNO1FPGz92D92OBHVak3t6VKY6Mupf
         GF5oSuRbq6ibTW36MU2Qo2Q+6tSChBWat1enbMaZII2Aboo91CvazOW8Em/SE6fq9TZq
         WGcD97DwnG3DLnOhlBPd63OM5u96WSgTgRhAv2m79B+p++iSXH+E9ibXJTaXARrX++o1
         t/SA==
X-Gm-Message-State: AOAM5306A9/f3vI6OQN4G1QfnS42Q5KUU4y9F/NkP0JJ4orw16gdyqAA
        1xwJ0PoJYr9aFGe0N+GcTZF6aUPRFwwhMQ==
X-Google-Smtp-Source: ABdhPJy/6OXUAEi/6GQQ4ejKLb9qCBSYY8EF/IoFlYeyCKupuG/dCfj0OlWQRMmEmLkzQ7ipqGZx1Q==
X-Received: by 2002:a17:903:1208:b0:151:93fd:d868 with SMTP id l8-20020a170903120800b0015193fdd868mr2673797plh.121.1646473245404;
        Sat, 05 Mar 2022 01:40:45 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id k190-20020a633dc7000000b0037c921abb5bsm4173898pga.23.2022.03.05.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 01:40:44 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] doc: add configuration to generate doxygen documentation on readthedocs.
Date:   Sat,  5 Mar 2022 17:40:37 +0800
Message-Id: <20220305094037.46361-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having the libgpiod documentation available online would be helpful, so
add the configuration required to generate the existing doxygen C/C++
documentation on readthedocs.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

This is intended to be a minimal change that can be applied to both
master and v1.6.x and have zero impact on existing builds.
It has been tested on RTD using the current v1.6.3 release[1].
The approach used here is to replace any Sphinx documentation generated
by RTD with the doxygen documentation.
A subsequent patch for v2 can switch to using Breathe/Sphinx to include
the documentation for the Python bindings as well.  And relocate the
Sphinx configuration into the doc directory.

Cheers,
Kent.
[1] https://libgpiod.readthedocs.io/en/latest/

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
2.35.1

