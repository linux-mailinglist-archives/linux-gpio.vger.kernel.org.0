Return-Path: <linux-gpio+bounces-20981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB504ACDB76
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 11:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F383A4258
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 09:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25E228D834;
	Wed,  4 Jun 2025 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RG0bXh2G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E828C87F
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030850; cv=none; b=uzyYUS0X6XtuOSUuu0wVLxehmR4BbIxUDfwTLdso5aW/0cBa5xa72kDKyVvGEF8ZYvn4IRg07NY8phrTXQG2AmFpGgItsSbsGfkU4h/WU6lDHzG8Yg5R2REaT9qAZVlyMilBUjmCgwN6aypGXLLGQkL9KiW6fg/eAXwRZE9OkkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030850; c=relaxed/simple;
	bh=QPmBf/rmYabTeJ+x+CP9CQ0fkWpbA+VdNDiaXuVeh0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnhRS5KSzMap7eRMu3p7hIAypdi0yATCWOH/ydvKpmyHcfTx+950t7yCkg6oFNSHT9BUe21J8bQ5vjgL6zf1uPLzpiKIoDR/uyfQDjjKvOj6ln1pL9kG+anGWOKZ4jZTl7Jbd7Avi3jHifq0gCEu0mSH81sMW6JYIypvqvUofpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RG0bXh2G; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a374f727dbso5760707f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749030847; x=1749635647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivI4PcXajN57DzYDf/UqWKt6D2FPI4jGGNO7JE5WEbQ=;
        b=RG0bXh2G5z2O+vdikV4hZS3OaJBHiWpdRdFbPEL4pwkjIj5RkGpaxJ3AJVnkZu5QDH
         wSn618Ow9EeWZsf2CrUO+GDOcx+HaJQAPjQpqF2MxzR0cequrE6hoxN26J6bwkYbPrx9
         oMlqKuDii+cscCXjHwaqptY2B+Fn9R9MYDkWBXbKuZZTXgUI25mSzUlpQT7RXoICsW/Q
         8x2xLTTx9K+ksSAOQaXNEW9N+OrktVKD47jnfQPPZZvCcKbzm38RyIlbwMEkw2p1VA+v
         Z/ATsz5ZyMrpyNZYF+6s5yUzFNu0l9BaZoq8txrkWqgqFi9FOU5ijJMdO7yqrZzIPpJ3
         pNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030847; x=1749635647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivI4PcXajN57DzYDf/UqWKt6D2FPI4jGGNO7JE5WEbQ=;
        b=oVoAUCV1hRa6jAUHYJZ/WVe/6wh6S8zmbPg5bBeTaxVopsDmTEPs4XSHvhG5TaihwV
         WRZfdLG0i3xsLYqF4G40y0VyjxmL/afuh9a//bqJUojFmOXUM8q6xbj1XJf5lYUCDb7z
         OSOwpRanlkkiqwwsDG7bLsTL3B3ZnxQyt63zBMnB8uHdD6Y+n/iAAN4tMjKwH+zQdYUS
         CJZs1fRhxpr7hXssoB2Potxl1U+6BcXO3zf0PJ8YUn7wnXe6/35mPI3J5DrwqNwdlpDV
         id3UbkXxtFTzHRyBGPbcGwCwi1heuIi2XTUrEy9rtw69UXAZ11HngJQAjtnfo+fG6Om+
         5RfA==
X-Gm-Message-State: AOJu0YymT0nQr0YMp3RJQS6KHVpJuURhlcRYxaHWbPpNz4YR1dVSWz3n
	7J5PYav2ulGj5EXAS4KGCM3qq9OBCQTECkqaEw4TsMVgiEk3NgHMka0Yh/sl4+Qd82M=
X-Gm-Gg: ASbGncvsUvWrq36tzVqjPbttvR8J+MbjHG2iJIEYJSMc0p6kSHu0uwnrQqS3Z8EYofi
	lwryzBmqmoqsSEl5ZRa74f6KlGWUN4VxxGOs1eDH0xp1IgGoT+wGlDzr3Ws8VWHT+/rgDXDeocA
	xizQW4U99IbR3pUxiwne6JR4gr8C0DQwRHZzTXa+Z0/V99VSg2DzKy0y62jH3q1Z6JFfdF/AM3v
	saqWBHy4KWUoMO3dJCUHzz3rZjry/mW5GYweZIZb1IuYToNi/oPEKWDEnak3MaLmP4R/g+8XfRG
	H6mgHKTj8aT+gUnYXoEkKTvU1hjUV9yB6kNYq27oF9mcvb9TY/ek2IFi
X-Google-Smtp-Source: AGHT+IF7czPSSLPdnm7XXMom2/pVpL5YEgh9LnPAoKDTYPjYRB/hPjaCqlq8Xrnju7kj3YeUUWp7pg==
X-Received: by 2002:a05:6000:2507:b0:3a5:1240:6802 with SMTP id ffacd0b85a97d-3a51d97a9d8mr1721530f8f.57.1749030846672;
        Wed, 04 Jun 2025 02:54:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e8d2:e71d:f170:23e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971e4sm21525640f8f.65.2025.06.04.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:54:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 04 Jun 2025 11:53:57 +0200
Subject: [PATCH libgpiod 3/3] doc: integrate rust docs into the sphinx
 build
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-rust-docs-v1-3-8ff23924a917@linaro.org>
References: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
In-Reply-To: <20250604-rust-docs-v1-0-8ff23924a917@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=B5CthQ97xzMMWXpqHGvdfBcc3IUxvBGWzZtxhmDSiwU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQBe7apMTmN6C9saHDe7euvcVvaXd+tsJaW2hM
 z6lZDiZZPOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEAXuwAKCRARpy6gFHHX
 cr2iD/9OXV4GnvcqwGX9ixBgjPFetTvYH5i82KmPzgpUlB8BQne+vzGkBcUEhES0/OdzcIZvEqX
 ado++VRv9G22H5txSCgLpywiiGL7RGIS3g4MQnkj5rq5Tiq2VeWDjACYjKED++QC4sFnn/XVpnM
 dMKBXAv4aQT6TsS6ys4qKGj46ibPPR13E24Va2pwYExUuES7sQ7+02s6bt/EJMYMAnK6HigAoTZ
 2ppqsoIAjDFwY7PjDU6Ui4Lc8RbZvLq5RGE2+r3OQUAxJh2e63SEsbKIEEeAD+V/V1xColelznr
 AxPphvyvvw6L4YJSDJJRa26CLyo680kgTJagOsEl7Rzq/uZ+xFJPyPZc4TOlXfqK+KGOW7SUQJZ
 OeAeSm4qTKvz9NoU5gfblI+Oq1DC1VJ88cjikinqvCYXg9JF2HPr8xfJnItmjkH0I8AdHU5wHpF
 Wl0hfqR4VH4yGWI6OfqC8pAInDKzbnZ6IIY1rfFDihY39Gl79mKk+yJh15SzB3yX0e5nhUXSSrG
 TycGrFiQT+VQsCdvXmjeYfzR4rY8XaMD93hrbESJ51hdtmYnS+UFELJ8CBPnbnGhaug8m5jwtg/
 tes5dl+93Cr8B3piVbCtZJCOMTvliCLVDGvJwsjiqpQDH4GSeBxKlEeIMbO/mQpQPNNT+sxddiv
 PytiOpHks/IU9lw==
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
index 5f4f5ac4954de70e060f1a7b2eafe3a731620c16..d81900c9ad9a60d8530b58e38add3a3a353da718 100644
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
+      # Needed for stdbool.h in rust build
+      - libclang-dev
       - libglib2.0-dev-bin
       - libgudev-1.0-dev
       - libtool
diff --git a/docs/conf.py b/docs/conf.py
index 04d1cea2a2175166555993c3e936e7cf1ebd0fe6..8c7bed234c98990f01adaec6ca3d6db2c3171c65 100644
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
+        ],
+        check=True,
+        env=dict(
+            os.environ,
+            LD_LIBRARY_PATH="../../../lib/.libs/",
+            SYSTEM_DEPS_LIBGPIOD_LIB="gpiod",
+            SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG="1",
+            SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="../../../lib/.libs/",
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


