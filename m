Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2C874709E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 14:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjGDMMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jul 2023 08:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjGDMMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2023 08:12:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F172710D0
        for <linux-gpio@vger.kernel.org>; Tue,  4 Jul 2023 05:12:26 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so54769785e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jul 2023 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688472745; x=1691064745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePBcaTYEs44NeEhwgzfSH62vnYOyN2NM+qTIlzpNLQc=;
        b=vTXQwTaYeGu+Fnsk2AL1qeLczcq4N/ZQ+KxG09wBa1FiAf8g7Cg/e6WVOGDbM76vYs
         gsZ0kcnhFDgapk4ozf09zuc/AWWkWYoj7oWzKZ6BDABzRkwdh436kizyMRNTMz8+fsBw
         sYrpp02ckss5Anqq49js6KcXQipwvsbgX/SCAstWwFb5Rny4G+h60GTUaGC9J51+fdXg
         YbUcM/Kp1KfrsmX+846W/auiUQ9C1n8qubcYS9JSdfbThx05n6SQIG460lL8Dw8h4Izd
         zRpTUvWspryzwAbx6YOsaFo/Y/n6Wu+3x9SeYkBbPbxqxGkV+QFB1EltdvB78wNS2z59
         RX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688472745; x=1691064745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePBcaTYEs44NeEhwgzfSH62vnYOyN2NM+qTIlzpNLQc=;
        b=bXyLwoVvBXXhLJ04oeM1qu48Gv0IOfoJQeOcVSvQwFpl1JPX+nuxCdclw9XJwhsaEH
         EQIueRGCl87lLSPf6BQNEvAdPRuEP7B/hYTxzib/n0Mp5Kg0ox3rnpC7SICi+G4igVCD
         WhBZuREmLRgI3r9XING3u0fl/6zBU5p5V2GggZMRYxUHKZS48ADwiGtS4fegaeCzd878
         Lja5DkBYJRXRwGyuxRThjSo7qyQc1b9zpCnEdf19Y1oQVS7sBnYVXjaxqPhij6FEr5KS
         DnKd7AG0KRbhXzzwIKPJYvmlNBrBmNPHmlR1RGql8WKedNos2Ak05PFupix3nYO2h2pM
         MZ7w==
X-Gm-Message-State: ABy/qLZ6NeR60abg7yikb+7IH1VaMMk+/OPoNjAgiLTJRpmxUaKF4LJ9
        6E5JMxO88MUrLOkiIBwdKwHZCA==
X-Google-Smtp-Source: APBJJlE9f6+ymnF7qyYfPLfO/zMVxpuorI/RQfS3d8bgdDnuI64536wA9SkrWRz+BJU8WbtdlhbGqg==
X-Received: by 2002:adf:f003:0:b0:314:15b7:20a5 with SMTP id j3-20020adff003000000b0031415b720a5mr11243603wro.54.1688472745225;
        Tue, 04 Jul 2023 05:12:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3241:8e44:bb14:fdd3])
        by smtp.gmail.com with ESMTPSA id f3-20020adff443000000b00314367cf43asm5878514wrp.106.2023.07.04.05.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 05:12:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: clarify the non-option arguments in help text
Date:   Tue,  4 Jul 2023 14:12:22 +0200
Message-Id: <20230704121222.314617-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We already use [] for optional and <> for required arguments in help text
but let's make it clear that we can pass multiple chips/lines and in most
tools only the first one is required.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpiodetect.c | 2 +-
 tools/gpioget.c    | 2 +-
 tools/gpioinfo.c   | 2 +-
 tools/gpiomon.c    | 2 +-
 tools/gpionotify.c | 2 +-
 tools/gpioset.c    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 0a3461b..569cdfe 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -12,7 +12,7 @@
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] [chip]...\n", get_prog_name());
+	printf("Usage: %s [OPTIONS] [chip1] [chip2] ...\n", get_prog_name());
 	printf("\n");
 	printf("List GPIO chips, print their labels and number of GPIO lines.\n");
 	printf("\n");
diff --git a/tools/gpioget.c b/tools/gpioget.c
index f611737..5d3092b 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -26,7 +26,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_prog_name());
+	printf("Usage: %s [OPTIONS] <line1> [line2] ...\n", get_prog_name());
 	printf("\n");
 	printf("Read values of GPIO lines.\n");
 	printf("\n");
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 44d1c8c..002d631 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -20,7 +20,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] [line]...\n", get_prog_name());
+	printf("Usage: %s [OPTIONS] [line1] [line2] ...\n", get_prog_name());
 	printf("\n");
 	printf("Print information about GPIO lines.\n");
 	printf("\n");
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index e3abb2d..cb76913 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -35,7 +35,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_prog_name());
+	printf("Usage: %s [OPTIONS] <line1> [line2] ...\n", get_prog_name());
 	printf("\n");
 	printf("Wait for events on GPIO lines and print them to standard output.\n");
 	printf("\n");
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index 2c56590..71eacbb 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -28,7 +28,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line>...\n", get_prog_name());
+	printf("Usage: %s [OPTIONS] <line1> [line2] ...\n", get_prog_name());
 	printf("\n");
 	printf("Wait for changes to info on GPIO lines and print them to standard output.\n");
 	printf("\n");
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 9dc5aeb..e0d971c 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -36,7 +36,7 @@ struct config {
 
 static void print_help(void)
 {
-	printf("Usage: %s [OPTIONS] <line=value>...\n", get_prog_name());
+	printf("Usage: %s [OPTIONS] <line1=value1> [line2=value2] ...\n", get_prog_name());
 	printf("\n");
 	printf("Set values of GPIO lines.\n");
 	printf("\n");
-- 
2.39.2

