Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5252A6A26E1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjBYDIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDIn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:08:43 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D10BEC57
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:41 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id 4so918404ilz.6
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN4wuB3HSSzUGVYTydobbDkZeaqteFMQek0z11qPGjc=;
        b=RGhOv5+5hKeivRk1ujHClIY5rj/pH1laAbVtEIUZam6XNMeSuqFerURjnVIMp3BqTz
         23ChR92XdgvAxqWuEdhJGTIYKrh54vuGUKnwcXMRLLdMtn9ArqdyST27acr13AN6fTze
         g5RKnOAWwid5ZDAq5Sowb8MNgSKgIbM6AjvEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LN4wuB3HSSzUGVYTydobbDkZeaqteFMQek0z11qPGjc=;
        b=rqtGePXRKlb9Aa/8OrwVP78xciAhySJiKSWBK07I4hckTaGftCKmt1UsF5IpR751UC
         gzmL2tWv+xNiQ30p07sBAlRu/SDVt1Oo15+7cRreIH0n1/y3N8YK8ge+EQXt0y6WDNBC
         HY/aiGN7xj9MwWtmb+evQ6ALHEOZ902d4RsJaykFxp5bDmQqjFY1POdaI8jsdRhoM7ha
         ZIgtsgIap5v45XJYfpPq1O5d3qZNp/MLSr8YQ6QUje1eiypIGvsfN75eE041A8HchIXg
         sQI9NBpuRu3Tc+tTWm+uR0zhhvQ8/YGlzZaxUGr2yDTCToR+ipxr0uzwVP0xd5jaHIf1
         GXbg==
X-Gm-Message-State: AO0yUKULm6zANZuZ+uKX+K5mgkobPsxJWMwl8F/wKwH3HQH5ZS5wysPB
        yh3iS2AgGAQ94iVrBy5ObxxFYMWSQrt0vqdT
X-Google-Smtp-Source: AK7set8WMdmXspYd8pRx4P+V7bGHVD4yST1Wy90FloEkuNOwnDcpE0Tj/k7aAkl4Am684ZDZ2/wYxg==
X-Received: by 2002:a05:6e02:1a27:b0:316:e033:86ba with SMTP id g7-20020a056e021a2700b00316e03386bamr11959918ile.31.1677294519831;
        Fri, 24 Feb 2023 19:08:39 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id r16-20020a056e02109000b00316ecc80a61sm257352ilj.11.2023.02.24.19.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:08:39 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v1.6.x,1/3] tools: use getprogname() when available to remove dependency on glibc
Date:   Fri, 24 Feb 2023 19:08:11 -0800
Message-Id: <20230225030813.3885661-2-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225030813.3885661-1-benl@squareup.com>
References: <20230225030813.3885661-1-benl@squareup.com>
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
 configure.ac         |  5 +++++
 tools/gpiodetect.c   |  4 ++--
 tools/gpiofind.c     |  4 ++--
 tools/gpioget.c      |  4 ++--
 tools/gpioinfo.c     |  4 ++--
 tools/gpiomon.c      |  4 ++--
 tools/gpioset.c      |  4 ++--
 tools/tools-common.c | 12 +++++++-----
 tools/tools-common.h |  4 +++-
 9 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/configure.ac b/configure.ac
index 31681c2..53c26a0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -132,6 +132,11 @@ then
 	AC_CHECK_FUNC([signalfd], [], [FUNC_NOT_FOUND_TOOLS([signalfd])])
 	AC_CHECK_FUNC([setlinebuf], [], [FUNC_NOT_FOUND_TOOLS([setlinebuf])])
 	AC_CHECK_HEADERS([sys/signalfd.h], [], [HEADER_NOT_FOUND_TOOLS([sys/signalfd.h])])
+	AC_CHECK_FUNC([getprogname],
+		[AC_DEFINE([HAVE_GETPROGNAME], 1, [Define to 1 if getprogname() is available.])],
+		[AC_CHECK_DECL([program_invocation_short_name], [],
+			[FUNC_NOT_FOUND_TOOLS([getprogname or program_invocation_short_name])],
+			[#include <errno.h>])])
 fi
 
 AC_ARG_ENABLE([tests],
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 1c992a4..9e06b51 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -22,7 +22,7 @@ static const char *const shortopts = "+hv";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS]\n", get_progname());
+	printf("Usage: %s [OPTIONS]\n", getprogname());
 	printf("\n");
 	printf("List all GPIO chips, print their labels and number of GPIO lines.\n");
 	printf("\n");
@@ -50,7 +50,7 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 931ac40..6a81b63 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -22,7 +22,7 @@ static const char *const shortopts = "+hv";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <name>\n", get_progname());
+	printf("Usage: %s [OPTIONS] <name>\n", getprogname());
 	printf("\n");
 	printf("Find a GPIO line by name. The output of this command can be used as input for gpioget/set.\n");
 	printf("\n");
@@ -50,7 +50,7 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 815507d..066a8a8 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -26,7 +26,7 @@ static const char *const shortopts = "+hvlB:";
 static void print_help(void)
 {
 	printf("Usage: %s [OPTIONS] <chip name/number> <offset 1> <offset 2> ...\n",
-	       get_progname());
+	       getprogname());
 	printf("\n");
 	printf("Read line value(s) from a GPIO chip\n");
 	printf("\n");
@@ -67,7 +67,7 @@ int main(int argc, char **argv)
 			flags = bias_flags(optarg);
 			break;
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 67be379..779475b 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -73,7 +73,7 @@ static const char *const shortopts = "+hv";
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <gpiochip1> ...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <gpiochip1> ...\n", getprogname());
 	printf("\n");
 	printf("Print information about all lines of the specified GPIO chip(s) (or all gpiochips if none are specified).\n");
 	printf("\n");
@@ -201,7 +201,7 @@ int main(int argc, char **argv)
 			print_version();
 			return EXIT_SUCCESS;
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 213efaa..a2ef4ea 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -35,7 +35,7 @@ static const char *const shortopts = "+hvlB:n:srfbF:";
 static void print_help(void)
 {
 	printf("Usage: %s [OPTIONS] <chip name/number> <offset 1> <offset 2> ...\n",
-	       get_progname());
+	       getprogname());
 	printf("\n");
 	printf("Wait for events on GPIO lines and print them to standard output\n");
 	printf("\n");
@@ -275,7 +275,7 @@ int main(int argc, char **argv)
 			ctx.fmt = optarg;
 			break;
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/gpioset.c b/tools/gpioset.c
index fb6d51e..0152179 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -35,7 +35,7 @@ static const char *const shortopts = "+hvlB:D:m:s:u:b";
 static void print_help(void)
 {
 	printf("Usage: %s [OPTIONS] <chip name/number> <offset1>=<value1> <offset2>=<value2> ...\n",
-	       get_progname());
+	       getprogname());
 	printf("\n");
 	printf("Set GPIO line values of a GPIO chip and maintain the state until the process exits\n");
 	printf("\n");
@@ -242,7 +242,7 @@ int main(int argc, char **argv)
 			cbdata.daemonize = true;
 			break;
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", getprogname());
 		default:
 			abort();
 		}
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 12bde20..cf829c3 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -19,17 +19,19 @@
 
 #include "tools-common.h"
 
-const char *get_progname(void)
+#ifndef HAVE_GETPROGNAME
+const char *getprogname(void)
 {
-	return program_invocation_name;
+	return program_invocation_short_name;
 }
+#endif
 
 void die(const char *fmt, ...)
 {
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", getprogname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 	va_end(va);
@@ -42,7 +44,7 @@ void die_perror(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", getprogname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, ": %s\n", strerror(errno));
 	va_end(va);
@@ -53,7 +55,7 @@ void die_perror(const char *fmt, ...)
 void print_version(void)
 {
 	printf("%s (libgpiod) v%s\n",
-	       program_invocation_short_name, gpiod_version_string());
+	       getprogname(), gpiod_version_string());
 	printf("Copyright (C) 2017-2018 Bartosz Golaszewski\n");
 	printf("License: LGPLv2.1\n");
 	printf("This is free software: you are free to change and redistribute it.\n");
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 9f1b801..7582c8b 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -21,7 +21,9 @@
 
 #define GETOPT_NULL_LONGOPT	NULL, 0, NULL, 0
 
-const char *get_progname(void);
+#ifndef HAVE_GETPROGNAME
+const char *getprogname(void);
+#endif
 void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
-- 
2.25.1

