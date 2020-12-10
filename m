Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F522D5B9D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389219AbgLJNYe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389209AbgLJNY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:26 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4BFC0611CB
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:39 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id i9so5469839wrc.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=op6go9cA91PDGEg+5OPc9LgcgqX87Gp5iVITUw7CtWM=;
        b=YS90i0zivAxEEThilPHY58uUAH++x2RX09e3hlIvTCswoG0/uKS4sJUpEOdzO1Rz8l
         PfxANagkotqXjUxUTXzehhdRaV+5/6QDq3NvaF7EvHztbutYNM//8gPGGt865iiV1MKj
         OD5zgyOEtL/bQClxFXP8m1ccUw0BS5JoWHs3ozgAAXQGEky8QWiItRCIjIEqoHrCe0Aa
         eZCypS0+8R2IniEBNwW5aDO96Rm5FtrAU7DISvFzesulYKFHAi9HN6PQjpfU+fKPlx+j
         SVOwHqfOieutCjbmx7c0NzLUfLxWCyovVRbL7Bwn26ih6VcJ4Cu7GLbASWKPzkBOpXsC
         G1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=op6go9cA91PDGEg+5OPc9LgcgqX87Gp5iVITUw7CtWM=;
        b=Dd8YjpNrkfl+nsugBpmEEy0KLeUZNRqWEmeIYcUdveIJH7cmHM+tTh47pl+5w/mekX
         5u29mUORzH5GAr25ujNX1g1DtlUkp3cfvSkSrMp6V8ELzFvvj4Kx1mjnkFCYs+ANnFsS
         tuUqchfnOXsqxUoR1CTvUFbY82PzwfDjzaPt/yyoiVIkIy5lPOAChuHi3SvW5eJGCilr
         mzxP10Rz47VHsJMyVyeKvklVAlyY6zrpnmKtKhfA8UQTfIf7KjNk2BDTgXVLcaEfTpIB
         SAwjYPog0v09XC0NlsO2pswwthw2PfJoSeUYMhI7cwwCO86vEwUzzqSQ4C0KA7Ztxt+g
         Sm6A==
X-Gm-Message-State: AOAM533t492SXCAfCZUMJ52/Tz30Lh30iaN3nIHwB5qLOlrVV5wlzTwn
        5ryt8ghXGl1m228OHw9kljVvlw==
X-Google-Smtp-Source: ABdhPJz4OYhIX+gjyAgF87McvTEqFv3Mwzf6HS5Dg8YrJ5HF3rd/uAlECOo0N+6iOYPxrAFlDF8oAQ==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr8292444wrv.306.1607606618114;
        Thu, 10 Dec 2020 05:23:38 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:37 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 13/14] build: add a configure switch for building examples
Date:   Thu, 10 Dec 2020 14:23:14 +0100
Message-Id: <20201210132315.5785-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Example code for bindings is currently always built if bindings are
enabled. Make it conditional with a new configure switch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/Makefile.am    |  8 +++++++-
 bindings/python/Makefile.am | 10 ++++++++--
 configure.ac                |  6 ++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index 5c40ceb..87463b0 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -18,10 +18,16 @@ include_HEADERS = gpiod.hpp
 pkgconfigdir = $(libdir)/pkgconfig
 pkgconfig_DATA = libgpiodcxx.pc
 
-SUBDIRS = . examples
+SUBDIRS = .
 
 if WITH_TESTS
 
 SUBDIRS += tests
 
 endif
+
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 124f152..5403bcb 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -6,8 +6,6 @@
 # Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
 #
 
-SUBDIRS = . examples
-
 pyexec_LTLIBRARIES = gpiod.la
 
 gpiod_la_SOURCES = gpiodmodule.c
@@ -17,8 +15,16 @@ gpiod_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
 gpiod_la_LDFLAGS = -module -avoid-version
 gpiod_la_LIBADD = $(top_builddir)/lib/libgpiod.la $(PYTHON_LIBS)
 
+SUBDIRS = .
+
 if WITH_TESTS
 
 SUBDIRS += tests
 
 endif
+
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
diff --git a/configure.ac b/configure.ac
index 57c99a8..90a6324 100644
--- a/configure.ac
+++ b/configure.ac
@@ -155,6 +155,12 @@ then
 	fi
 fi
 
+AC_ARG_ENABLE([examples],
+	[AS_HELP_STRING([--enable-examples], [enable building code examples[default=no]])],
+	[if test "x$enableval" = xyes; then with_examples=true; fi],
+	[with_examples=false])
+AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
+
 AC_ARG_ENABLE([bindings-cxx],
 	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
 	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
-- 
2.29.1

