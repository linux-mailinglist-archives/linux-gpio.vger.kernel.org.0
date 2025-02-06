Return-Path: <linux-gpio+bounces-15458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DF4A2A868
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C4E1889308
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF08222DF88;
	Thu,  6 Feb 2025 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M11cr4E5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20822D4F0
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844553; cv=none; b=U0xpfpydy0iWaX2xLSV0csGGNH86s9v7r658H6+hx/kXMPXMaBF4LKcoSsV6SdKD+hsLrEe1x+NeZqxwA9pbfO4CNydwKMyT8JvAd6KBSbF8Moo5modrsAui9i2f4GGRu/Aq/nAH3Dc6c4Kgkq03gaYH2NogM/a6y4CNCI1+NBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844553; c=relaxed/simple;
	bh=JayJQKl8QyM1y03imMMb3+krWrXZlOrW9T8eiTIiFpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rC6QLR2Oo/2QdcDRw2feRzcUDhcaoSmbTipSkpRcU7ds2mJyRnUimiER1J6of3NmwpwbC9ujHVy2m1JvqDuljIXBM/hoyBBmz4NV9RnApgjq/o3Mg372T00Iq5ir23iWgUIpAMs/5D7T2YRKNB/nBRXXvNP64gTQuiiAwIu/qCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M11cr4E5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4368a293339so9128145e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844550; x=1739449350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCdNJEl2czQbOdGVTb4tBPEJedPychSdvsrDKPt3tZI=;
        b=M11cr4E5d/EyIGqFNUb+4i2ppJVZkvcB5JQl56BQnGXZmNU2MAaUTmJBccxWJul1fG
         78bJpuVq8wvutX4wLkrtN/Z38W4MeUGw8tJ6TDWvXxOLoVuzuOEQ5/bW/KZWvPVCR73B
         1Ukfwq+s4+WZb1NGh+7hvLuiZ4BlXBFT00b94fgYd3/phD5iZtT0/VRrpoYmOPwWh/4F
         3xqPzqekVgkNwfWB5o0jDjEuVJYfClUkFA9TOEFcQC5IJ7YQ9SC7V9xUjhVIHnXN+Ws7
         E50FOoCWMgDomluN7JEsNSUQo4w6zkWbprW81BxK653gi/KburyoGCTgTj/P0p53MD+m
         9F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844550; x=1739449350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCdNJEl2czQbOdGVTb4tBPEJedPychSdvsrDKPt3tZI=;
        b=LiIKiJ+OFm2Tyir+6ts300U2ljdS+xmq0/03uNnzmn1WxIlmht+kYPw/TrHYaxDJhj
         DzPYBkRclztrYcv2GoFJWqSR6ziK6jvcFnD5RlmRcOiaL1JOyLXPxFxeIp1ThAr51wjh
         sKTqWfhCLlilVNJkX/o89pAteVGetS1KI0mX8WJSt2paFg0Psxk/vIGOzpWag6KzlXsd
         m9So1QtVulZ8W097PK6STirA9t8sQ3D9MHMyx+Dr+DEscEFRea5HZPfqLRA0JDePeSV8
         6A6T/V59fTXL1wS5WGa34RFAzI7idE/khlgKdyH/kJ1rXeihzlpxWXEMB5g+RuN+lEyQ
         mPmw==
X-Forwarded-Encrypted: i=1; AJvYcCUso+sB67Olp1c3WtXxjoyh0SWPJgsSK3KlqRciVEHO7C80gofFf4TPblAQylolUQ9GDO4SIsLTGPb4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf3pAYH7NtHb8qo+C6BEaV4/sL/vFejgwId3ZMtMWP36IrJ5Vr
	lqDn5AkAvOjReGnTvg9XJ4DK5+oksjJZ5dyFnLWv8U8kTv4A05SqYv4wSokyQQI=
X-Gm-Gg: ASbGncvh7BjfevQ7B6XAdJBbfElOPKlkIbKwZkxwIbqc582o0BstoQ+xqa6yqacVH4V
	U2qesJ2rA53E787XvClQUI9mJtbX72KcSQXdpILLMzsacI1F7ROYG1VzGSZ3s530hVMsr8MwXwD
	vbhThsejvJqkL0FykU+DqVLXR6zw3it43a3TVDxY6QRzW7lSkYy3QK8kfkRP/Ju2gvX8j+16oEr
	ZOTFoCiggIbi6vqNtJiLd181fUSIJtKzKidOpiCEnmNk5MM1sbD7idLhLaa8o0pp7R95/I47uZX
	VROBhw==
X-Google-Smtp-Source: AGHT+IEPGUrA4z8KiPHY+gmH2GT3EO3P/+hS9jOUPUEwJfeGhIMgpO2YYGej7V+DrbEcTvJOUzLB4A==
X-Received: by 2002:a05:600c:4f87:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-4390d569847mr49804185e9.24.1738844550094;
        Thu, 06 Feb 2025 04:22:30 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:11 +0100
Subject: [PATCH libgpiod v3 14/16] doc: add documentation for gpio-tools
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-14-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5208;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FFQGQE+U+3PHlEYdijSCavIj74kLd24iZQFFrmUiQ6Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKl0u0DpFvo0e11exfgZFINR7gazG6k/2l6kx
 AS0OKDS2O2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpdAAKCRARpy6gFHHX
 cix4D/4nK3Td/iSDzwvANuxFA66Jmn201K6PLYiZujEA96oxbRm0UE+NgNPw3eu0UAshEpxXUEw
 rB+adS1n3zzNAxWkenRsHWQsJFCnWfeHfibxtiGlV9C+kzeaCnZvwajSKPE5B4AG+8yzB6kFll8
 TaslcVZJcaTVC3o3oQtVl6ksSueb/Qe9jRwRTOkBDRW/LeOTwlXGxPTAGb9X+xv2dqmHKOwJf5J
 L3knqK5smBjnlD2LU198z0jqzQcM/oGNWkre5/c016xSbvuXc9Y47cXsewSwOlhzHIUDcb768Fo
 O/C/ZGSbOgP43ZQ5VLdLzn3LLg3CIhtEVpdhiqvFXDDgZZ3kL/6KXefdMsRU+gX50lg7lj2F/dM
 DGgRG9rAMnZmoFiqfHNnt6JAR93ufhZ8rFfO+2oP5ys+ob8aA4Qio+EHwatTpmLL4cqeQmDiKv4
 HyZ0rvVBFaIoIeeZtA74tMWWAOJ79ZvVNuxT6AhfmQbn5TpG6rXDPQsLquDYglGH61yio8/Kjcl
 y263DOrsQPpfovFljOQkHsIrzSjdM2h0oz4tLd3q6LVX09U0Y0O+sxQSMbSMXJo0XZdpv+SkZ2w
 zHI+RHg/WsZ+x4hN/xvz7+enH5J0dFrdlnCJQaoO2SuxTw3WVJpIATR1Lxy73yu8UC8z4Wxhw9Z
 QSKsi90Fq4HYV+A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We already generate man pages for gpio-tools. Let's use man2html to make
them part of the sphinx docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .readthedocs.yaml   |  2 ++
 configure.ac        | 32 +++++++++++++++++++-------------
 docs/.gitignore     |  8 ++++++++
 docs/Makefile.am    |  1 +
 docs/conf.py        | 22 ++++++++++++++++++++++
 docs/gpio_tools.rst | 25 +++++++++++++++++++++++++
 docs/index.rst      |  1 +
 7 files changed, 78 insertions(+), 13 deletions(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index 97086fa..c2b0a7f 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -19,11 +19,13 @@ build:
       - autoconf-archive
       # doxygen is available by default, but just in case.
       - doxygen
+      - help2man
       - gi-docgen
       - gir1.2-glib-2.0-dev
       - gobject-introspection
       - graphviz
       - libtool
+      - pandoc
       - pkg-config
 
 sphinx:
diff --git a/configure.ac b/configure.ac
index 8eec855..af5d53d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -327,18 +327,6 @@ then
 		      AC_MSG_ERROR([systemdsystemunitdir not found - needed to enable systemd support]))
 fi
 
-AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
-AC_CHECK_PROG([has_sphinx], [sphinx-build], [true], [false])
-AM_CONDITIONAL([WITH_DOCS], [test "x$has_doxygen" = xtrue && test "x$has_sphinx" = xtrue])
-if test "x$has_doxygen" = xfalse
-then
-	AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
-fi
-if test "x$has_sphinx" = xfalse
-then
-	AC_MSG_NOTICE([sphinx-build not found - documentation cannot be generated])
-fi
-
 if test "x$cross_compiling" = xno
 then
 	AC_CHECK_PROG([has_help2man], [help2man], [true], [false])
@@ -346,7 +334,25 @@ fi
 AM_CONDITIONAL([WITH_MANPAGES], [test "x$has_help2man" = xtrue])
 if test "x$has_help2man" = xfalse
 then
-	AC_MSG_NOTICE([help2man not found - man pages cannot be generated automatically])
+	AC_MSG_NOTICE([help2man not found - man pages and documentation cannot be generated])
+fi
+
+AC_DEFUN([DOC_PROG_NOT_FOUND], [AC_MSG_NOTICE([$1 not found - documentation cannot be generated])])
+AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
+AC_CHECK_PROG([has_sphinx], [sphinx-build], [true], [false])
+AC_CHECK_PROG([has_pandoc], [pandoc], [true], [false])
+AM_CONDITIONAL([WITH_DOCS], [test "x$has_doxygen" = xtrue && test "x$has_sphinx" = xtrue && test "x$has_pandoc" = xtrue && test "x$has_help2man" = xtrue])
+if test "x$has_doxygen" = xfalse
+then
+	DOC_PROG_NOT_FOUND(["doxygen"])
+fi
+if test "x$has_sphinx" = xfalse
+then
+	DOC_PROG_NOT_FOUND(["sphinx-build"])
+fi
+if test "x$has_pandoc" = xfalse
+then
+	DOC_PROG_NOT_FOUND(["pandoc"])
 fi
 
 AC_CONFIG_FILES([Makefile
diff --git a/docs/.gitignore b/docs/.gitignore
index 86f8cfd..c9ffb90 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -3,3 +3,11 @@
 
 doxygen-output
 sphinx-output
+
+# Automatically generated .rst
+gpiodetect.rst
+gpioinfo.rst
+gpioget.rst
+gpioset.rst
+gpiomon.rst
+gpionotify.rst
diff --git a/docs/Makefile.am b/docs/Makefile.am
index ef9ebf2..269dd7e 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -33,6 +33,7 @@ DOCS_DEPS = \
 	Doxyfile \
 	index.rst \
 	glib_api.rst \
+	gpio_tools.rst \
 	python_api.rst \
 	python_chip_info.rst \
 	python_chip.rst \
diff --git a/docs/conf.py b/docs/conf.py
index 33fc89f..5e20c17 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -100,8 +100,30 @@ subprocess.run(
         "--enable-tools",
         "--enable-bindings-glib",
         "--enable-introspection",
+        "--enable-tools",
     ],
     check=True,
 )
 subprocess.run(["make", "-j"], check=True)
 os.chdir(cwd)
+
+for page in [
+    "gpiodetect",
+    "gpioinfo",
+    "gpioget",
+    "gpioset",
+    "gpiomon",
+    "gpionotify",
+]:
+    subprocess.run(
+        [
+            "pandoc",
+            "--from=man",
+            "--to=rst",
+            "--standalone",
+            "--wrap=none",
+            f"--output={page}.rst",
+            f"../man/{page}.man",
+        ],
+        check=True,
+    )
diff --git a/docs/gpio_tools.rst b/docs/gpio_tools.rst
new file mode 100644
index 0000000..7372de4
--- /dev/null
+++ b/docs/gpio_tools.rst
@@ -0,0 +1,25 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   GPIO tools documentation
+
+Command-line tools
+==================
+
+The **libgpiod** project includes a suite of **command-line tools** to
+facilitate GPIO manipulation from console and shell scripts.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Manual entries
+
+   gpiodetect<gpiodetect>
+   gpioinfo<gpioinfo>
+   gpioget<gpioget>
+   gpioset<gpioset>
+   gpiomon<gpiomon>
+   gpionotify<gpionotify>
diff --git a/docs/index.rst b/docs/index.rst
index 8dcea20..a52cc3a 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -26,3 +26,4 @@ this interface.
 
    core_api
    bindings
+   gpio_tools

-- 
2.45.2


