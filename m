Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E4A72D725
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 03:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbjFMBwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 21:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbjFMBwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 21:52:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FD713E
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 18:52:13 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-65131e85be4so5422251b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 18:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686621132; x=1689213132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sARGqTtYjSz2iNNet/l9XJZEkElUhtMmKTnD9PHd4ac=;
        b=KDlFXE06Od1jWqqCTwDjlOFT2HqfsJUUZiyALMtPo+DUaAqLmJ3Sp0P1vDK4WAW5IK
         o9NeaYOnKlSS6+VK5DZrNeM1rTkQMbv1zjHPt3xk2P4L6qvIyL0mv89zdiYwGwhT79y4
         6ZpwpnhmOAnnvdhhg5vSTi8jbMBnJEcFWtzJj3SLlgIsHjVcvGOHHH6wbnhgG0fPjKYI
         subYzBzhf3xqTlPq/fmuaWedfZ8Kj/8MpXmT0tFbd0G37efyb+JQmQBI6qwcav0ph61W
         oXWSP3ZxUB/PEWLs+38xuwtT3+/F0oz3KOzieLTUT/aAG3bvTBf/5NhtG9TzuKbRIJPM
         H1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686621132; x=1689213132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sARGqTtYjSz2iNNet/l9XJZEkElUhtMmKTnD9PHd4ac=;
        b=eKPJsOiJv+m/q5d37E7boZSNYAUvFuEqof9ofijZymLU0fPOLZH3PJmiyzo1PUFM+O
         ehgh/DBOgQGNGwE65UkJ/T0GgL1IuBoD4D/juqBBBAFpKC6chTRo+t1xh8epyXXzkU/f
         YUR4rkGqUpDFZuqcrm8HxBvvj/7PqwhjY0k0pxpATEJpd3Plp8R723onbagxLQbZkLYw
         yr7cvTVk9LiYO1j1hwJbxvA+Zkk/+zrOcBITePOy2RijTZh8ahUZhbGpHWTfRM1ksQUo
         E9Mof3i1OxsUuRPRA4iWosbPysCvRVCDg0/4nst1YfbfWXU59ZiLXg1cKRpUb25JsBMh
         C9jA==
X-Gm-Message-State: AC+VfDwrWcjKK1mxw06D4ylZaMWtOz1hHAH4n6IiEH5Kf2nibdGq6JiP
        /MZIXADNgB4VfdVEilTODjtXR8tE4L8=
X-Google-Smtp-Source: ACHHUZ7o/1qLSRCHWtVm3erDYAkjF400vArTYKzYrUxj9zSp/bVBKV1g4GOE1JpLqKU/Kr3N98+QTA==
X-Received: by 2002:a05:6a21:99aa:b0:118:eeef:2a25 with SMTP id ve42-20020a056a2199aa00b00118eeef2a25mr14300175pzb.34.1686621132319;
        Mon, 12 Jun 2023 18:52:12 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id h15-20020aa786cf000000b006519b6ba20bsm7499786pfo.3.2023.06.12.18.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 18:52:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2] doc: add configuration to generate doxygen documentation on readthedocs.
Date:   Tue, 13 Jun 2023 09:52:03 +0800
Message-Id: <20230613015203.10268-1-warthog618@gmail.com>
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
Changes v1 -> v2:
 - update copyright headers to be reuse compliant.
 - update to contemporary rtd build environment

 .readthedocs.yaml | 28 +++++++++++++++++++
 sphinx/conf.py    | 69 +++++++++++++++++++++++++++++++++++++++++++++++
 sphinx/index.rst  | 24 +++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 .readthedocs.yaml
 create mode 100644 sphinx/conf.py
 create mode 100644 sphinx/index.rst

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
new file mode 100644
index 0000000..f62273e
--- /dev/null
+++ b/.readthedocs.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+
+#
+# This file is part of libgpiod.
+#
+# Read the Docs configuration file
+# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details
+
+version: 2
+
+build:
+  os: ubuntu-22.04
+  tools:
+    python: "3.11"
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
index 0000000..b21ddab
--- /dev/null
+++ b/sphinx/conf.py
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+
+#
+# This file is part of libgpiod.
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
index 0000000..c26d068
--- /dev/null
+++ b/sphinx/index.rst
@@ -0,0 +1,24 @@
+..
+   SPDX-License-Identifier: LGPL-2.1-or-later
+   SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+
+..
+   This file is part of libgpiod.
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

