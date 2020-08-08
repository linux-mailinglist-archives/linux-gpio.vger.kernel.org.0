Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AFA23F727
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Aug 2020 12:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgHHKAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Aug 2020 06:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgHHKAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Aug 2020 06:00:12 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9BAC061A27
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 03:00:11 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4BNyQK4VNlzQky8
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 12:00:09 +0200 (CEST)
Authentication-Results: hefe.heinlein-support.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1596880806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vld3sRAoYgi6sLOlaHm+XUV3hV/NXu3wU0JZvzH6euY=;
        b=Q5bwh7asu8UhpGjuRnJelYOGjv1pwSRVsdTxOuZvr2eUkRr703UreAH3PZ0TizqYDgblJF
        o4W4sbCf7c1SyVrQL4p0fsck5ZUXVn15uVH9pTBb4N5FBISmT/tZH3FALQx8P7uNgERdEN
        gFbsTTKdobqpv22ImsPWUjZOzsQFEcozzH4nQA402eomAcUxj8TqDtpbrwKTIcMkGuYavB
        vbCHkZJRV4KcLD1ZliyLHibOyPmJbN2F0nF42zTg0mEs7+O6yFjKMH7X7Nn7b2QEoiPSM1
        9ayf3dzFAB+nmTwtS1WbKrBRITs87im1X4oaLw7zmkvqLguusxoD8D2zBaOl0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1596880805; bh=mBasGfyea+gR6Q/Z4T3A32lzi7WO9s8Fu
        Vc96tiW9S8=; b=TW+GYkQIXr9Oa64Tv9yA+XRfHnVmM6KD/pv7xOHBZsjjT596M
        UtqX9uGEsA9aL2DBFr+zWL+aFtJlO1TmZyc79qm0oJ+cDFFmeKoTBWdM609nAGjv
        Veh6XFD5NoeBcbFQgylB0P/z1QAQGXMm83LweMl8ij0tYSlqv5SrfZxsZvNziu6A
        YkAPodr+pChpJQHf+nc9KwxAz1XFI/BpSIkFwtNHHnCzyk/97T5ZXJar1EpsqwfE
        dPsrcNTNfjVt4RG5vC5KdWinAb/zLDDtpjlLKCvKfUix8XPW06NbBDrCxO04s8VF
        Ot3NsKva73Ubx2z6qiTPBJdDZVZAJzYggyVfQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 02YMX0uxevPe; Sat,  8 Aug 2020 12:00:05 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 2/5] doc: Use autotoolized Doxyfile
Date:   Sat,  8 Aug 2020 11:59:41 +0200
Message-Id: <20200808095944.188479-3-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-1-alexander.stein@mailbox.org>
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -8.55 / 15.00 / 15.00
X-Rspamd-Queue-Id: 5AE5617AD
X-Rspamd-UID: f14da5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This has several advantages:
* More simplified Makefile.am
* Actually used doxygen config is available as a file
* Building doc out-of-tree is possible

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .gitignore              | 1 +
 Doxyfile => Doxyfile.in | 3 ++-
 Makefile.am             | 4 +---
 configure.ac            | 1 +
 4 files changed, 5 insertions(+), 4 deletions(-)
 rename Doxyfile => Doxyfile.in (95%)

diff --git a/.gitignore b/.gitignore
index 488d9d6..a77efde 100644
--- a/.gitignore
+++ b/.gitignore
@@ -10,6 +10,7 @@ doc
 # autotools stuff
 .deps/
 .libs/
+Doxyfile
 Makefile
 Makefile.in
 aclocal.m4
diff --git a/Doxyfile b/Doxyfile.in
similarity index 95%
rename from Doxyfile
rename to Doxyfile.in
index b194095..8c6d591 100644
--- a/Doxyfile
+++ b/Doxyfile.in
@@ -10,6 +10,7 @@
 
 # General configuration
 PROJECT_NAME           = libgpiod
+PROJECT_NUMBER         = @VERSION_STR@
 OUTPUT_DIRECTORY       = doc
 OUTPUT_LANGUAGE        = English
 EXTRACT_ALL            = NO
@@ -48,7 +49,7 @@ WARNINGS               = YES
 WARN_IF_UNDOCUMENTED   = YES
 WARN_FORMAT            =
 WARN_LOGFILE           =
-INPUT                  = include/gpiod.h
+INPUT                  = @top_srcdir@/include/gpiod.h @top_srcdir@/bindings/cxx/gpiod.hpp
 SOURCE_BROWSER         = YES
 INLINE_SOURCES         = NO
 REFERENCED_BY_RELATION = YES
diff --git a/Makefile.am b/Makefile.am
index d3f57b2..72e6a25 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -29,9 +29,7 @@ SUBDIRS += bindings
 if HAS_DOXYGEN
 
 doc:
-	@(cat Doxyfile; \
-		echo PROJECT_NUMBER = $(VERSION_STR); \
-		echo INPUT += bindings/cxx/gpiod.hpp) | doxygen -
+	@doxygen Doxyfile
 .PHONY: doc
 
 clean-local:
diff --git a/configure.ac b/configure.ac
index 008499d..c2d9f99 100644
--- a/configure.ac
+++ b/configure.ac
@@ -207,6 +207,7 @@ if test "x$has_doxygen" = xfalse
 then
 	AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
 fi
+AM_COND_IF([HAS_DOXYGEN], [AC_CONFIG_FILES([Doxyfile])])
 
 if test "x$cross_compiling" = xno
 then
-- 
2.28.0

