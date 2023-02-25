Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178BF6A26E6
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjBYDMp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDMo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:12:44 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B786BF58
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:12:42 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id z5so961781ilq.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN9bk/58jihwaXsXyOTdUhSXGOBa6u3J5QpkcG3gy8U=;
        b=NaLDjSsRa4DRI5N5OdJteUfyCBIhgI1hPVQiE+4T/ycXLqFgI+nvRCKcdwTiIW0qCC
         vHZc5W+RSQI9XeF63rK2rf77tPDQnorTpxRG8ENQHtcytSV30Tkw1JM3G44Cf9pmBt84
         7do1iKDmiiyU/Wnis/hNCts/yD1HikRN/XemE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gN9bk/58jihwaXsXyOTdUhSXGOBa6u3J5QpkcG3gy8U=;
        b=LC25pEiVd4DhIoTwM6klWwgdah9tZ2ieNTL/m1rX0XzJqDlYaJ7YFdKhQiMI0rQoJI
         s1rW2BI+h5RRyS7D5EQduW8KFTwMfhCjrtiyJQxNiI9BWrQ4y+HAvB9D62GUnAwwV98F
         4hwnwyhRsZnfKKR2exxsnY+nmCXqgr9UC30EaMtbeGcMWznzhPHdeSXZcKsC3ftnyeBs
         Oi9CkNvHkwEum+JQWIUF+XuWoIR9KES2YR2fdLBcFp6MgiAPIVeiM5PgMt9BMBRRLqKL
         ihKPWqIBOF0m7Wh7ChOfzzQobrCZpa8Mlzq1n6u7sle4lWkEA3SS0ubnjBUM8RDeXBRk
         Bfuw==
X-Gm-Message-State: AO0yUKX9GrEhfeKIOJD8bbw15nTi5s0kQ9Cih7md6kDZg+T0Pf9IBT8B
        TnzNRNzQzc5xncLRarjwgsq8ymoqyWeCstDM
X-Google-Smtp-Source: AK7set+H1ZNh3913nRyjX1Mm88LxVeVYs5wAFGjmdnxkOF9Du2KRnje71/SqRH4cCWbAIPKKr/IhSg==
X-Received: by 2002:a05:6e02:1689:b0:316:d9fc:ea35 with SMTP id f9-20020a056e02168900b00316d9fcea35mr13468733ila.26.1677294761979;
        Fri, 24 Feb 2023 19:12:41 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id z9-20020a92d6c9000000b00313b08feec7sm242100ilp.42.2023.02.24.19.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:12:41 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v2 1/2] tools: use getprogname() when available to remove dependency on glibc
Date:   Fri, 24 Feb 2023 19:12:34 -0800
Message-Id: <20230225031235.3886280-2-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225031235.3886280-1-benl@squareup.com>
References: <20230225031235.3886280-1-benl@squareup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Platforms like Bionic libc don't have program_invocation_[short_]name,
which is a GNU extension. Use getprogname() from stdlib.h, another
widely agreed extension, when it's available.

It seemed a little heavyweight to add gnulib to this project's autotools
set-up just for making one function portable, so I've just added the
portabilty shim to tools-common.c for the moment.

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 configure.ac         | 11 ++++++++---
 tools/gpiodetect.c   |  4 ++--
 tools/gpioget.c      |  4 ++--
 tools/gpioinfo.c     |  4 ++--
 tools/gpiomon.c      |  4 ++--
 tools/gpionotify.c   |  4 ++--
 tools/gpioset.c      |  4 ++--
 tools/tools-common.c | 16 +++++++++-------
 tools/tools-common.h |  4 +++-
 9 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/configure.ac b/configure.ac
index 0a56074..7a77151 100644
--- a/configure.ac
+++ b/configure.ac
@@ -117,9 +117,14 @@ AM_CONDITIONAL([WITH_GPIOSET_INTERACTIVE],
 AS_IF([test "x$with_tools" = xtrue],
 	[# These are only needed to build tools
 	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
-	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
-	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
-	AC_CHECK_FUNC([alphasort], [], [FUNC_NOT_FOUND_LIB([alphasort])])
+	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
+	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
+	AC_CHECK_FUNC([alphasort], [], [FUNC_NOT_FOUND_TOOLS([alphasort])])
+	AC_CHECK_FUNC([getprogname],
+		[AC_DEFINE([HAVE_GETPROGNAME], 1, [Define to 1 if getprogname() is available.])],
+		[AC_CHECK_DECL([program_invocation_short_name], [],
+			[FUNC_NOT_FOUND_TOOLS([getprogname or program_invocation_short_name])],
+			[#include <errno.h>])])
 	AS_IF([test "x$with_gpioset_interactive" = xtrue],
 		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
 	])
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index f0211da..f5bdc01 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -12,7 +12,7 @@
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
+	printf("Usage: %s [OPTIONS] [chip]...\n", getprogname());
 	printf("\n");
 	printf("List GPIO chips, print their labels and number of GPIO lines.\n");
 	printf("\n");
@@ -51,7 +51,7 @@ static int parse_config(int argc, char **argv)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 08c17e6..43abdf0 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -26,7 +26,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line>...\n", getprogname());
 	printf("\n");
 	printf("Read values of GPIO lines.\n");
 	printf("\n");
@@ -120,7 +120,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		case 0:
 			break;
 		default:
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 1ec7f63..960f661 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -20,7 +20,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] [line]...\n", get_progname());
+	printf("Usage: %s [OPTIONS] [line]...\n", getprogname());
 	printf("\n");
 	printf("Print information about GPIO lines.\n");
 	printf("\n");
@@ -83,7 +83,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		case 0:
 			break;
 		default:
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 93ff463..69ec2c1 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -34,7 +34,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line>...\n", getprogname());
 	printf("\n");
 	printf("Wait for events on GPIO lines and print them to standard output.\n");
 	printf("\n");
@@ -195,7 +195,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		case 0:
 			break;
 		default:
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index a0976f7..9242ae8 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -27,7 +27,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line>...\n", getprogname());
 	printf("\n");
 	printf("Wait for changes to info on GPIO lines and print them to standard output.\n");
 	printf("\n");
@@ -144,7 +144,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		case 0:
 			break;
 		default:
diff --git a/tools/gpioset.c b/tools/gpioset.c
index a7084a3..291f727 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -36,7 +36,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line=value>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line=value>...\n", getprogname());
 	printf("\n");
 	printf("Set values of GPIO lines.\n");
 	printf("\n");
@@ -212,7 +212,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		case 0:
 			break;
 		default:
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 0a54571..67530a9 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -20,17 +20,19 @@
 
 #include "tools-common.h"
 
-const char *get_progname(void)
+#ifndef HAVE_GETPROGNAME
+const char *getprogname(void)
 {
-	return program_invocation_name;
+	return program_invocation_short_name;
 }
+#endif
 
 void print_error(const char *fmt, ...)
 {
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", getprogname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 	va_end(va);
@@ -41,7 +43,7 @@ void print_perror(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", getprogname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, ": %s\n", strerror(errno));
 	va_end(va);
@@ -52,7 +54,7 @@ void die(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", getprogname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 	va_end(va);
@@ -65,7 +67,7 @@ void die_perror(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", getprogname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, ": %s\n", strerror(errno));
 	va_end(va);
@@ -76,7 +78,7 @@ void die_perror(const char *fmt, ...)
 void print_version(void)
 {
 	printf("%s (libgpiod) v%s\n",
-	       program_invocation_short_name, gpiod_api_version());
+	       getprogname(), gpiod_api_version());
 	printf("Copyright (C) 2017-2023 Bartosz Golaszewski\n");
 	printf("License: GPL-2.0-or-later\n");
 	printf("This is free software: you are free to change and redistribute it.\n");
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 434e5ba..3aebef0 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -78,7 +78,9 @@ struct line_resolver {
 	struct resolved_line lines[];
 };
 
-const char *get_progname(void);
+#ifndef HAVE_GETPROGNAME
+const char *getprogname(void);
+#endif
 void print_error(const char *fmt, ...) PRINTF(1, 2);
 void print_perror(const char *fmt, ...) PRINTF(1, 2);
 void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
-- 
2.25.1

