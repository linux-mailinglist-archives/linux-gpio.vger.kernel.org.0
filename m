Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F076ACCEC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 19:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjCFSqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 13:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCFSqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 13:46:10 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3173B67C
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 10:46:06 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id v10so4422000iox.8
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 10:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google; t=1678128365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKfjPjValZ9T/qyZ+gUxo6eNUPe3k04f17QGGvFtjp4=;
        b=LqCDfKhCmuY6hc8VqCqs6KwLREAH247HJFSsalcoCXZWR6yIGileYG32Qb54IE2aHk
         neVDsyUSTIFaRqnw4ai1ofdZ5qNnNdHCvyx6cqIPjDTUmWejwXkG5VXVpnQDEcFWvM08
         P5Kdl5YOuh2OyFeeWHUp65l91b0Ljuvf/5axk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKfjPjValZ9T/qyZ+gUxo6eNUPe3k04f17QGGvFtjp4=;
        b=h9uzUl9sosD5cZzPSZpWHYyewXHbQyRz6Zn+5NgMRQz36wrLA7LiKhu14QAPojBqTX
         7iyYvkG625OuQ3CrPpcLAQoKJ3qUyLh6m3Av2t0Pp5K1SpGlNcgUuNE1uzQAKlWWJH3A
         hngI5hKrXiylx+EyC1YYRlS7LWPFJpo8pZr3VH3B9GRmlokFbjTJKc2UoiyvJJiQeGVF
         YiMu706Wwk8TVAuO2xWF46/hbtIJogezmy4rcWkFsuh9Nhjdvc5gzewt4rwhSUKkrzlc
         jfiOjnGTXZr7q+dgBFr4kLvRtnJ7BYOCuSrkKEl7mzFw3qmB98D70hVXc52HGHae1U8N
         Q/Gw==
X-Gm-Message-State: AO0yUKV4YMlMORd/63HnWmK/41blRd0dg/xHRjPDc6YkFog/eGZ8oEEl
        k6sSCm3nQq7MccO/K0P/u/YQHLvif6GGrjDv6Ck=
X-Google-Smtp-Source: AK7set/bVLJ664zcPbEdZylcLSGcVeBgVeDENxpTpxcExmaB8CwW/V6BbHUjsYsuOrtoJ6z6S7JoWg==
X-Received: by 2002:a6b:7d09:0:b0:704:c2fe:d923 with SMTP id c9-20020a6b7d09000000b00704c2fed923mr8671468ioq.2.1678128365378;
        Mon, 06 Mar 2023 10:46:05 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id e12-20020a5ede0c000000b0074c9a4bb374sm3367677iok.11.2023.03.06.10.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 10:46:05 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v4 1/2] tools: remove dependency on glibc program_invocation_[short_]name
Date:   Mon,  6 Mar 2023 10:45:44 -0800
Message-Id: <20230306184545.1316993-2-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306184545.1316993-1-benl@squareup.com>
References: <20230306184545.1316993-1-benl@squareup.com>
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
which is a GNU extension. It does have getprogname(), a BSD extension,
but rather than supporting multiple extensions let's just introduce
our own local helpers.

We derive the short name ourselves rather than calling basename(),
as the POSIX version takes char *, not const char *, and is thus
not guaranteed to avoid modifying its input. (The GNU version does
take const char * but we are avoiding extensions here.)

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 tools/gpiodetect.c   |  5 +++--
 tools/gpioget.c      |  5 +++--
 tools/gpioinfo.c     |  5 +++--
 tools/gpiomon.c      |  5 +++--
 tools/gpionotify.c   |  5 +++--
 tools/gpioset.c      |  5 +++--
 tools/tools-common.c | 34 ++++++++++++++++++++++++++--------
 tools/tools-common.h |  4 +++-
 8 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index f0211da..0a3461b 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -12,7 +12,7 @@
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
+	printf("Usage: %s [OPTIONS] [chip]...\n", get_prog_name());
 	printf("\n");
 	printf("List GPIO chips, print their labels and number of GPIO lines.\n");
 	printf("\n");
@@ -51,7 +51,7 @@ static int parse_config(int argc, char **argv)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", get_prog_name());
 		default:
 			abort();
 		}
@@ -89,6 +89,7 @@ int main(int argc, char **argv)
 	int num_chips, i, ret = EXIT_SUCCESS;
 	char **paths, *path;
 
+	set_prog_name(argv[0]);
 	i = parse_config(argc, argv);
 	argc -= i;
 	argv += i;
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 08c17e6..f611737 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -26,7 +26,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line>...\n", get_prog_name());
 	printf("\n");
 	printf("Read values of GPIO lines.\n");
 	printf("\n");
@@ -120,7 +120,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", get_prog_name());
 		case 0:
 			break;
 		default:
@@ -146,6 +146,7 @@ int main(int argc, char **argv)
 	struct config cfg;
 	const char *fmt;
 
+	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
 	argc -= i;
 	argv += i;
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 1ec7f63..44d1c8c 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -20,7 +20,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] [line]...\n", get_progname());
+	printf("Usage: %s [OPTIONS] [line]...\n", get_prog_name());
 	printf("\n");
 	printf("Print information about GPIO lines.\n");
 	printf("\n");
@@ -83,7 +83,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", get_prog_name());
 		case 0:
 			break;
 		default:
@@ -228,6 +228,7 @@ int main(int argc, char **argv)
 	struct config cfg;
 	char **paths;
 
+	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
 	argc -= i;
 	argv += i;
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 93ff463..ec177df 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -34,7 +34,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line>...\n", get_prog_name());
 	printf("\n");
 	printf("Wait for events on GPIO lines and print them to standard output.\n");
 	printf("\n");
@@ -195,7 +195,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", get_prog_name());
 		case 0:
 			break;
 		default:
@@ -360,6 +360,7 @@ int main(int argc, char **argv)
 	struct config cfg;
 	int ret, i, j;
 
+	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
 	argc -= i;
 	argv += i;
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index a0976f7..990ca04 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -27,7 +27,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line>...\n", get_prog_name());
 	printf("\n");
 	printf("Wait for changes to info on GPIO lines and print them to standard output.\n");
 	printf("\n");
@@ -144,7 +144,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", get_prog_name());
 		case 0:
 			break;
 		default:
@@ -370,6 +370,7 @@ int main(int argc, char **argv)
 	struct pollfd *pollfds;
 	struct config cfg;
 
+	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
 	argc -= optind;
 	argv += optind;
diff --git a/tools/gpioset.c b/tools/gpioset.c
index a7084a3..9dc5aeb 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -36,7 +36,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line=value>...\n", get_progname());
+	printf("Usage: %s [OPTIONS] <line=value>...\n", get_prog_name());
 	printf("\n");
 	printf("Set values of GPIO lines.\n");
 	printf("\n");
@@ -212,7 +212,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 			print_version();
 			exit(EXIT_SUCCESS);
 		case '?':
-			die("try %s --help", get_progname());
+			die("try %s --help", get_prog_name());
 		case 0:
 			break;
 		default:
@@ -876,6 +876,7 @@ int main(int argc, char **argv)
 	struct config cfg;
 	char **lines;
 
+	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
 	argc -= i;
 	argv += i;
diff --git a/tools/tools-common.c b/tools/tools-common.c
index a0080fc..e5f6fc1 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -19,9 +19,28 @@
 
 #include "tools-common.h"
 
-const char *get_progname(void)
+static const char *prog_name = NULL;
+static const char *prog_short_name = NULL;
+
+void set_prog_name(const char *name)
+{
+	prog_name = name;
+	prog_short_name = name;
+	while (*name) {
+		if (*name++ == '/') {
+			prog_short_name = name;
+		}
+	}
+}
+
+const char *get_prog_name(void)
+{
+	return prog_name;
+}
+
+const char *get_prog_short_name(void)
 {
-	return program_invocation_name;
+	return prog_short_name;
 }
 
 void print_error(const char *fmt, ...)
@@ -29,7 +48,7 @@ void print_error(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", get_prog_name());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 	va_end(va);
@@ -40,7 +59,7 @@ void print_perror(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", get_prog_name());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, ": %s\n", strerror(errno));
 	va_end(va);
@@ -51,7 +70,7 @@ void die(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", get_prog_name());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 	va_end(va);
@@ -64,7 +83,7 @@ void die_perror(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", get_prog_name());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, ": %s\n", strerror(errno));
 	va_end(va);
@@ -74,8 +93,7 @@ void die_perror(const char *fmt, ...)
 
 void print_version(void)
 {
-	printf("%s (libgpiod) v%s\n",
-	       program_invocation_short_name, gpiod_api_version());
+	printf("%s (libgpiod) v%s\n", get_prog_short_name(), gpiod_api_version());
 	printf("Copyright (C) 2017-2023 Bartosz Golaszewski\n");
 	printf("License: GPL-2.0-or-later\n");
 	printf("This is free software: you are free to change and redistribute it.\n");
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 434e5ba..c82317a 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -78,7 +78,9 @@ struct line_resolver {
 	struct resolved_line lines[];
 };
 
-const char *get_progname(void);
+void set_prog_name(const char *name);
+const char *get_prog_name(void);
+const char *get_prog_short_name(void);
 void print_error(const char *fmt, ...) PRINTF(1, 2);
 void print_perror(const char *fmt, ...) PRINTF(1, 2);
 void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
-- 
2.25.1

