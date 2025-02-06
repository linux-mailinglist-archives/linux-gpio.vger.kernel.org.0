Return-Path: <linux-gpio+bounces-15457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD2A2A867
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB8A1888EFA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB2222D4E5;
	Thu,  6 Feb 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lEC4aTqW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29622D4D5
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844552; cv=none; b=e+or0vIjsg0xEoRafN0HfseAsp+FOSkf2VO+XDwT/YwfmL3oQ5z1UiWe/CGvhlDkM2SXOhF224Z7roDoHVomYob1L/0cMXMjfA880vQjkhfVzaIDoRe5WnVh/kwBdBs/ArQCg4TJXdfV12yVGv4BVL4tEWRjPwtfITlc6R/6pKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844552; c=relaxed/simple;
	bh=C83/n0dzhy10SzcX9pFT1a0HqaZLjXcgxsTq8ErvNNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1QMmsG0Wf3SIby6tipE7yKkl18I0eA97j+/RiVRRxHfegQau6IYP8TnGtzd3cUwViUc35tYD6QFhJObpqZyPWKttyE2zYuqIiEBCnk2HdckNq2HpgYbq5FCWgGymVq65xbzcosChrtbkG8DckVBxUtLK+yei/VkvxlzsA7ZSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lEC4aTqW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so5260325e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844549; x=1739449349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xx4xbYPphWqOiZSyil4D9RJUGzOHeo3JsF0Q9TNJ/k4=;
        b=lEC4aTqW84vxEFDkEc/e3aJKVN+xyuh1+UEClXpEnoQXuM2WFSQ6sPXCNLLvsvimFm
         B3fq/LHiKODEJ3G7rQ/6iS9SBHXNu5D5UW91oETK2zvU3rMu7KGtfzvZMFsBrLZBsml8
         emeLn/oFH7ktI4nf5ZxUzl7DpKvSzldv1PDy1GqSqQ3+6jgRcBTx0J6W7H5oWJ5RhVeq
         6mU/GqAH9FKniMGL7pr7Mtg157Gcnf69KBdpsswANuvzvvEmz1Z+k82sAft/e1y+lwBZ
         2lkqJNFvg5b6YFBbE1aFvik9yAE/1AzVbY3FqD+F0bV210KsdnVTsrdkunFSN8DESfLV
         TsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844549; x=1739449349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx4xbYPphWqOiZSyil4D9RJUGzOHeo3JsF0Q9TNJ/k4=;
        b=CqEPAK7zBXcno2UR9IUpz85+oiFnvV6TIzbKHEPGDQwLQqzNsYgTmp73dY3SBWOneO
         SDCch816bLTkML2+1OtxPNlTcFnKguzrVKzHdFUKNs2kykMvpbp7DpVTvky5qOSyxVLZ
         yLYWr/om0mVTJNbyoa+EmSDAY5WNAfO9+I8qHKkTwMC0OggUsmOjt6bStyWTPQlxTSLz
         4fPbdqHRl/W5YrqEZASMWON1/jmVC8cw2olGA6tk9ifLzSCGu1YjJ6LIK/ow9KEMHcLO
         VsU+POJd0+uF5KA5PRUeL3OqKnQjBHh45Q2MGxy8iDyka60+eXJ9q5oTNCtdr+Zzc4zM
         89+w==
X-Forwarded-Encrypted: i=1; AJvYcCWvYh9tMs0Cg4gX6hqvwHrcoCfE8GXXi7jYLx3BGSHkZnBb8CY4wmoy14h3w5oRlHugRtE6cr4swTqm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7YtxPTeGdk59PhRViiAp1I+wqNT/3mwRF2VMzb1vRR3JjKdIa
	t27RRQ/+BeuetrYg1NE/AqWngIjVBM2BKopCAQ8npEzvD9CQODcUaXCWwKwI608=
X-Gm-Gg: ASbGncsPD4e6QEhl4lYR4dXtRbDh59zsmUGLAx6jdBVpDbC7QUJrdpwkMq7WDLY2edh
	ORZZ8SLYIfMbCXDPxd0YOhAn1fnoifGL286fLkdIewZmweMJPBLKwClzjIws1G4apSxHDQsu1HC
	ut4GtyPnernB1HIOPxb+JO2vN14WCd5IKbd2K4zOQWtejyxIazI1m5tP4LiwzdtzIC0mXxNgjQA
	edrwYRpfZtCGVbOjd6i0/1UX4ykxZcSsdK1IlKTyuqGXo6omFC/LCBf0o4XZEAYg8v44EwQQPs/
	LSXCJw==
X-Google-Smtp-Source: AGHT+IH/5r7BQwdc+Av7FdsUZUrw4aaA5DCbbDH7chItUBtUuVfb7qkxdeLmxx8flU5vO7L3qRrX5g==
X-Received: by 2002:a05:600c:4fcf:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-4390d43f12cmr65818915e9.16.1738844548945;
        Thu, 06 Feb 2025 04:22:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:10 +0100
Subject: [PATCH libgpiod v3 13/16] doc: add documentation for GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-13-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4247;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WiXLRks1OFxSdHV21Ymo3Cnsw8xD/7Ijy0sn6TXuRJY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKl0Nu7eGIKxQ9F98nI5xAev4pLG/4CmsLsuG
 pG7fS94mRSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpdAAKCRARpy6gFHHX
 cmiKD/49K3XipoNINerkgl09uCc6d0kAdC6lCHKyY2yUELjK/i9ShD2gGg3rhMe5JhkKh6ZRv/f
 gJVYw6uxO3b0oyi7nDIFq0METaSnEZ/Jl/9gxxVL6wPqWn0k0JtCYeQHJ8HRJuOwQglpy+llMho
 rt/loDHqlBmXTaN4uDUVcCUuTYVo0dwqqbbYG/pJQiMocjxDgEdWgG3A8xzaUL62DDPIHj1SWOg
 jiEzJqgOVt7YuEMwrpBeqZ2KbZN9DLhX+7qfpmU/BRGk9yg2RRkEi0dZ5yItToTbxljq51zUSiS
 jaXYenn19YAik1rb0w2KWo36l/QjtVMXpUZJ+ExR3GqJvcX0wTBFMIyZdHq4cS9ImNfUxzg90Yi
 EttSuHVeMCJ6OLtLM639li0LXZYrJRvsulEsy6+Y1JptEUXWXBaQm8YLOC3Y4VqCiKFqO35mPQ8
 HoQPBJK/G8RLlXcXWr1Z8CjLD8B+rAPbiWLjszdlwAjvkzesDh6XRDMUPKbxngtiEE9JR6WSLe/
 qpyhC/JYXnck7VW5w+L1Q7nSsWmkmGNox6uLRs+iHBUnaM1414MwxengKaXk8B18SgmuHCUahA+
 HUWGD18WX+z6TEHhBHVgWJkBtHAQru7PNXC3x/fqPXioiQFp6G564bDsIgy/RjaOU8qXxYPzQ9+
 s+C0fZeXUCH5zRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GObject docs are generated with gi-docgen and there doesn't seem to
be an easy way of converting them to sphinx. Let's put the GLib docs
statically into the sphinx output and reference them from the bindings
chapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .readthedocs.yaml |  9 ++++++++-
 docs/Makefile.am  |  1 +
 docs/bindings.rst |  1 +
 docs/conf.py      | 38 ++++++++++++++++++++++++++++++++++++++
 docs/glib_api.rst | 23 +++++++++++++++++++++++
 5 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index 510b5c1..97086fa 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -11,13 +11,20 @@
 version: 2
 
 build:
-  os: ubuntu-22.04
+  os: ubuntu-24.04
   tools:
     python: "3.12"
   apt_packages:
+      - autoconf
+      - autoconf-archive
       # doxygen is available by default, but just in case.
       - doxygen
+      - gi-docgen
+      - gir1.2-glib-2.0-dev
+      - gobject-introspection
       - graphviz
+      - libtool
+      - pkg-config
 
 sphinx:
    configuration: docs/conf.py
diff --git a/docs/Makefile.am b/docs/Makefile.am
index dd3e6ac..ef9ebf2 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -32,6 +32,7 @@ DOCS_DEPS = \
 	cpp_request_config.rst \
 	Doxyfile \
 	index.rst \
+	glib_api.rst \
 	python_api.rst \
 	python_chip_info.rst \
 	python_chip.rst \
diff --git a/docs/bindings.rst b/docs/bindings.rst
index ed7ec69..73f1262 100644
--- a/docs/bindings.rst
+++ b/docs/bindings.rst
@@ -19,3 +19,4 @@ C library.
 
    cpp_api
    python_api
+   glib_api
diff --git a/docs/conf.py b/docs/conf.py
index 3d0209a..33fc89f 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -62,8 +62,46 @@ def autodoc_skip_init(app, what, name, obj, would_skip, options):
     return would_skip
 
 
+# We need to know where to put docs generated by gi-docgen but app.outdir is
+# only set once the builder is initialized. Let's delay running gi-docgen
+# until we're notified.
+def make_glib_docs(app):
+    # For some reason on RTD we're in the docs/ directory while during a local
+    # build, we're still in the top source directory.
+    prefix = "../" if os.getenv("READTHEDOCS") == "True" else ""
+
+    subprocess.run(
+        [
+            "gi-docgen",
+            "generate",
+            "--config",
+            f"{prefix}bindings/glib/gi-docgen.toml",
+            f"{prefix}bindings/glib/Gpiodglib-1.0.gir",
+            "--output-dir",
+            f"{app.outdir}",
+        ],
+        check=True,
+    )
+
+
 def setup(app):
     app.connect("autodoc-skip-member", autodoc_skip_init)
+    app.connect("builder-inited", make_glib_docs)
 
 
 subprocess.run(["doxygen", "Doxyfile"])
+
+cwd = os.getcwd()
+os.chdir("..")
+subprocess.run(["autoreconf", "-ifv"], check=True)
+subprocess.run(
+    [
+        "./configure",
+        "--enable-tools",
+        "--enable-bindings-glib",
+        "--enable-introspection",
+    ],
+    check=True,
+)
+subprocess.run(["make", "-j"], check=True)
+os.chdir(cwd)
diff --git a/docs/glib_api.rst b/docs/glib_api.rst
new file mode 100644
index 0000000..307f5f7
--- /dev/null
+++ b/docs/glib_api.rst
@@ -0,0 +1,23 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod GObject API documentation
+
+libgpiod GObject bindings API
+=============================
+
+**GObject bindings** for libgpiod provide a high-level, object-oriented
+interface to interact with GPIO (General Purpose Input/Output) lines on Linux
+systems. These bindings leverage the **GObject framework**, commonly used in
+GNOME and GTK+ applications, to wrap the lower-level C API of libgpiod.
+
+.. warning::
+   The documentation for GObject bindings is generated using gi-docgen and
+   cannot be easily integrated with sphinx documentation. Please navigate to
+   a separate section dedicated exclusively to the GLib part of the API.
+
+`Navigate to GObject bindings documentation <Gpiodglib-1.0/index.html>`_

-- 
2.45.2


