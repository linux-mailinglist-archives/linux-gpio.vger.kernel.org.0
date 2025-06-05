Return-Path: <linux-gpio+bounces-21036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7A2ACEB8B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 10:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FFC3AAE4C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 08:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C56202C48;
	Thu,  5 Jun 2025 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eESJgLEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F061B3930
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111212; cv=none; b=hJCWkM4h9/Ctoo6LR6zezaZahd0TKU8o3JHtedW8ikfm2lij5y5PXDLUU+7pJ8zTlzoQAuO/wIvET2nwVnGXlUJNhQXTZGNxsDd9QD9vpQsu7v3OQ91Hj04N7mPe0doIwajQTFyUZ0WUWes5za37uglcz5KOR1Kdb82PWL7Nd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111212; c=relaxed/simple;
	bh=jQ5OeI/Ykl644c+ypJkBnoyL6wloBhJ3YTUTjUUMWKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoEKyEkc2muqViuhieWOZqBVIlPSiwSkBQNhfvI8xVEfAPr0KOVTd5O8096EFMc6ZOtFKZjp2PGPm4DciUAEhAxEK1TgeLBTF50gYUZgp+9vvu3+Sd4KbRBwcGNCD6kMtDy+t5VWJGTXez3CTe9NvM56YN8c3MC7abnwKs/JvbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eESJgLEl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce671a08so3839185e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749111209; x=1749716009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpY8tEEJgjIm39wpwodKCNU/ATFxGNJ0v16hKW9DeTA=;
        b=eESJgLElyU4I9wYTtSIsz/ra3490ssTh6iIQXF7uMs/JnHNatnb83n+ytafH2Cu5tw
         +CkUdZX0razI6TWT8uVNvJXlg98jXyHwvasaOp4PLHVC+YBib8Zy2sSNcjoceY9y29WL
         Mc4a2X/opjXW1HWsJoguQP1NVSnAX1eV0/xUTEWINVA5oDp/GlcaHrLHWF/FIgyFcXLv
         3PL0YHPE/H70nIw5Kp9HW/deCUt3TmK2IU997jsf5htmoyiUVWS3qrhOwYIItnmRB5sx
         WC1NhewiRWXSgJ/gufZkfE6FTs0vi+1Q0RqcCI7XEqEICE7hbko8UoYYzV+OTENJDBk+
         Oc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111209; x=1749716009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpY8tEEJgjIm39wpwodKCNU/ATFxGNJ0v16hKW9DeTA=;
        b=tNTwYQX6NxewXw5yVwpi6WJOR6xnbFj8M7wLZpR9uCQLGiPN/B9GkujWs8vxIf4tR5
         tvkkGOeIs2tolw9yg8H307wHhRrAHb88E7tBefQcF+CHSN0pTHT3CkHBDEH1MkdmM8i6
         xmIu0L0a2Dpenjy2RaTArzo4O0s8S/yeAMdDKmPDmuGREe+qd97cwquIPuHOg6COuIjN
         Hfy6ug0eUe9dnEKSOFVLbJWBvYB47N/KFePBd7e34AoexWAUljXNVSUatM7rNv3PFXKl
         0KbOK5BXQEl7BUOIDWjkQgirreOWEMKbMl/t7w9wUh8l4qkBJN9ILPwRa8X5LlbMpMrK
         u1ZQ==
X-Gm-Message-State: AOJu0YzUq6zZw0ZeeI96GgRs6Dj2H6VZD1qVMKObOpTwkX/XnbljVX7j
	pEOWyWK/64obLYeMoh26mq0mpSh5Ax8Zyr8//c825fq5HB8GOAxfujSZwluxnW1P2CW3TjKIUWS
	U34c8
X-Gm-Gg: ASbGnctxVL34yGKk7JXCMfIsCnNXYMvYDjSHyhqpfCH5h5C8eG+pPyzzq2OZgBPtJ5t
	Ekk2WW7K7HF4bBUaNZzVoi24cIBiWfvqZ12ICVoPajIJIQa/v0JqFH2QtZfhVjY8Tbsz2kykvdf
	TKf/F8cOuWQ7xzZ614rfCkrmxCEA4hrkhWDPEP4O63VtseDp/3gXnQYmYxckJwDZyt5u7/vZbnr
	T7L3aeciTH153A4TWHQ9C8GeX9shHKNB6kFRw8rcL243UxX0KYIPwJN3DRxtkxllwHHYTNorioo
	2fn54XTnfuW4kh4Bf+VFHP8ThLpHeby9zH7k4j0IYX4p
X-Google-Smtp-Source: AGHT+IFXKBNJ2fnUPEOl/8tZGTLaOZ/XNMxHZYKBpekGrhVrOGayZ/hXETsxdrCBrdKEXKUmhAK+8w==
X-Received: by 2002:a05:6000:1a85:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a51d923b56mr4986299f8f.22.1749111208914;
        Thu, 05 Jun 2025 01:13:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b79e:4a6:355b:c44a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb178ee2sm10010865e9.15.2025.06.05.01.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:13:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 05 Jun 2025 10:13:21 +0200
Subject: [PATCH libgpiod v2 3/3] doc: integrate rust docs into the sphinx
 build
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rust-docs-v2-3-883a0a3872c0@linaro.org>
References: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
In-Reply-To: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=I9Trcvmr1gnlRk7XpqLn1hTqVUy3KxPeaDu1JiXee7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQVGljNImxH6rnP+4RASR00HSZzdGNa/dmoVP2
 y9zzJf/D+uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEFRpQAKCRARpy6gFHHX
 ct4fD/9rtCkJQiOPa5Zdt8eS+52i21DQxKtwAvQwSSQU9CJd5RqXsb5g3WFWQMhtC9Q+8olwOYB
 uqQrshkyxW1m0YXshVImwTwSeeETAssMSPAC89gjjYtnIz2pVGoxkZd4bp/Psol/bUWzwVvQcRD
 ck7xyA0g6V/lrsi6WIV5UlpSvM/WEeeVPgbV5clm/62Qaa+jva6bMbjSxc55OUb+vaCcLQFwU3c
 RxeWMyKCUN/PvJM8QPENCXwbDJFWvJvbXE7FxPqEwmV21qI8FTs1kJKV2Oj+HUToT2HAVUmoheC
 hWcfBVxqEpqsDSX8icSCk9Myl8uWmJjirbLy0Xa3VzUOTKebBOMnuDdVlDqbRkr1P0QdLVj7O7n
 SDSEYV58J0ct7D0GmRXJrOZKwHLsgG5+eDUnsdNKKTza1uboT3wFpTTnhOkvhSZLutNv4uFFslC
 JCCW6utPn1mxQrGEIxnJHpIZ8NXkpVTUQDcsZdwQ9XVm2Dgldbi+Ew10DBZTrFrXNZw8y3cf7LE
 GyvU8txMTjrPXP0ZN6zwYYuXV9iPcbniNhyXimj794cfPc9zCpTg5KIRUJJfdAvD82bLzc8zY9X
 NRCOHIDIv/ln2J3QXjT2mIa0brA+GKjNJdRZjEboyX7ha793m4dwzBSU1NF1fQxS/1d3nvQb3Vf
 vL2vMcQoy8xGUcw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Follow the pattern we established with GLib bindings: generate a separate
set of docs for the rust bindings, make them part of the generated doc
bundle and point to the rust index.html from the dedicated sphinx page.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .readthedocs.yaml |  3 +++
 docs/conf.py      | 38 +++++++++++++++++++++++++++++++-------
 docs/rust_api.rst | 22 ++++++++++++++--------
 3 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index 5f4f5ac4954de70e060f1a7b2eafe3a731620c16..11ec1de1bddc5fe4525f9fdaffbb31781c0968d3 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -14,6 +14,7 @@ build:
   os: ubuntu-24.04
   tools:
     python: "3.12"
+    rust: "1.86"
   apt_packages:
       - autoconf
       - autoconf-archive
@@ -24,6 +25,8 @@ build:
       - gir1.2-glib-2.0-dev
       - gobject-introspection
       - graphviz
+      # Needed by rust bindgen for stdbool.h
+      - libclang-dev
       - libglib2.0-dev-bin
       - libgudev-1.0-dev
       - libtool
diff --git a/docs/conf.py b/docs/conf.py
index 04d1cea2a2175166555993c3e936e7cf1ebd0fe6..b41e78e95ab55183d2b8e48c160cca5118b70f58 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -54,15 +54,16 @@ except ImportError:
 
 html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 
+# We need to know where to put docs generated by gi-docgen and cargo but
+# app.outdir is only set once the builder is initialized. Let's delay running
+# gi-docgen until we're notified.
+#
+# For some reason on RTD we're in the docs/ directory while during a local
+# build, we're still in the top source directory.
+prefix = "../" if os.getenv("READTHEDOCS") == "True" else "./"
+
 
-# We need to know where to put docs generated by gi-docgen but app.outdir is
-# only set once the builder is initialized. Let's delay running gi-docgen
-# until we're notified.
 def make_glib_docs(app):
-    # For some reason on RTD we're in the docs/ directory while during a local
-    # build, we're still in the top source directory.
-    prefix = "../" if os.getenv("READTHEDOCS") == "True" else "./"
-
     subprocess.run(
         [
             "gi-docgen",
@@ -77,8 +78,31 @@ def make_glib_docs(app):
     )
 
 
+def make_rust_docs(app):
+    subprocess.run(
+        [
+            "cargo",
+            "doc",
+            "--manifest-path",
+            f"{prefix}/bindings/rust/libgpiod/Cargo.toml",
+            "--target-dir",
+            f"{app.outdir}/rust/",
+            "--no-deps",
+            "--package=libgpiod",
+        ],
+        check=True,
+        env=dict(
+            os.environ,
+            SYSTEM_DEPS_LIBGPIOD_LIB="gpiod",
+            SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG="1",
+            SYSTEM_DEPS_LIBGPIOD_INCLUDE="../../../include/",
+        ),
+    )
+
+
 def setup(app):
     app.connect("builder-inited", make_glib_docs)
+    app.connect("builder-inited", make_rust_docs)
 
 
 subprocess.run(["doxygen", "Doxyfile"])
diff --git a/docs/rust_api.rst b/docs/rust_api.rst
index 1408b5c2457309938e314d1c289b81d583d9cc09..dda20d0baadcf8d97832cd60a60a5d00f99affc9 100644
--- a/docs/rust_api.rst
+++ b/docs/rust_api.rst
@@ -5,19 +5,25 @@
 ..
    This file is part of libgpiod.
 
-Where are the Rust bindings?
-=============================
+   libgpiod Rust bindings documentation
 
-.. warning::
-   There's currently no good way of integrating rust documentation with sphinx.
-   Rust bindings should be documented on https://docs.rs/ but due to a yet
-   unsolved build problem, this is currently not the case. Please refer to the
-   in-source comments for now.
+libgpiod Rust bindings API
+==========================
 
-Rust bindings are available on https://crates.io/ as the ``libgpiod`` package.
+Rust bindings for libgpiod aim to provide a memory-safe interface to the
+low-level C API. They are available on https://crates.io/ as the ``libgpiod``
+package.
 
 .. note::
    When building the Rust bindings along the C library using make, they will
    be automatically configured to build against the build results of the
    C library. Building rust bindings requires cargo to be available on the
    system.
+
+.. warning::
+   The documentation for Rust bindings is generated using ``cargo doc`` and
+   cannot be easily integrated with sphinx documentation. Please navigate to
+   a separate section dedicated exclusively to the Rust part of the API.
+
+
+`Navigate to Rust bindings documentation <rust/doc/libgpiod/index.html>`_

-- 
2.48.1


