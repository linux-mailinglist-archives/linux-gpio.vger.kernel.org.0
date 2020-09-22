Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CD92738C2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgIVCgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIVCgc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:36:32 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1026CC061755;
        Mon, 21 Sep 2020 19:36:32 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id md22so642627pjb.0;
        Mon, 21 Sep 2020 19:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zTij+5EN/4LffijACf/TI7nrzORX4RNuxzKERqFHnTI=;
        b=ogKwQplH76Bw5BP+Yb40rJ5bFxU3HvBHrV8xYHaJicTEFSS9GDELawHwc+Ie0Zch59
         hg4cY39QzKo2l0XJ77bjEYVadRF0Hrx2DnOu31EdmqQWxEg27BtzGCfT/qwd14g9OtEb
         TovK2xT+ug0kKwUMfV+w8fHlyF36i85PB2cr8lZ48W3iM8MHNfrkVhcKP1ZD9B/2ST1E
         wE/hEA7nTWio0APBE8A/e6ZBohvIsnRorVGC+5oneMIsMeBEygLdDCaOcByECs2lJNoo
         ir9o7hXMbD3DLy5Jb0Ltx1XFi4wX5qhvjrcwGnv32WTe+geYLPZLoTc00m4Nyj4rxpUq
         6C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTij+5EN/4LffijACf/TI7nrzORX4RNuxzKERqFHnTI=;
        b=UqaM9GPRz8vQsrG/m/YyhUrrHtrhM63zOx8BP38FdAMIBaHxYx0IOEGw28T/XxKflo
         JlAawQTJ0CMC55sk+YX3QQuRzv9kAMXgpWm8K+Dh498Wq1QtoEL/W//6Am5GcZYzB2jx
         HoBoE9feT4IwrlLC4sWkQUs6WjXYTbdTpu54ojNPjDCSrAO0gwHT1x5kfqqtNyephCtz
         PWoXBEaCohWQcX/B/fL7ZWHTCW/9ZhOhlHwFczUA7l89PeNxaA05w9N9cph6PiZSKfmN
         ESix/x6LeTKC33tWaC33l4NCFbYT1ZdF63/AlZpALSx1FSiojlTA7dLcSxC9T3SmwVqb
         ASbQ==
X-Gm-Message-State: AOAM532+D+XrEUQnN4FubRQXOLgP0ueBTtrYPBVaMtnyMqLhSfTSm+8t
        4dbhTIEXRHhZKyAFVyIdOhTy96LKem0ncg==
X-Google-Smtp-Source: ABdhPJxmFKtA3S5WEevgkKQgU3J0vnRBt22Ci5XW9pG5QvqXyX2e4KlU1gI92aOHWbhvpOFfu7/Ymw==
X-Received: by 2002:a17:90b:350b:: with SMTP id ls11mr1933459pjb.201.1600742191048;
        Mon, 21 Sep 2020 19:36:31 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:36:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 14/20] tools: gpio: port lsgpio to v2 uAPI
Date:   Tue, 22 Sep 2020 10:31:45 +0800
Message-Id: <20200922023151.387447-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the lsgpio tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/lsgpio.c | 60 ++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index b08d7a5e779b..5a05a454d0c9 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -25,57 +25,73 @@
 
 struct gpio_flag {
 	char *name;
-	unsigned long mask;
+	unsigned long long mask;
 };
 
 struct gpio_flag flagnames[] = {
 	{
-		.name = "kernel",
-		.mask = GPIOLINE_FLAG_KERNEL,
+		.name = "used",
+		.mask = GPIO_V2_LINE_FLAG_USED,
+	},
+	{
+		.name = "input",
+		.mask = GPIO_V2_LINE_FLAG_INPUT,
 	},
 	{
 		.name = "output",
-		.mask = GPIOLINE_FLAG_IS_OUT,
+		.mask = GPIO_V2_LINE_FLAG_OUTPUT,
 	},
 	{
 		.name = "active-low",
-		.mask = GPIOLINE_FLAG_ACTIVE_LOW,
+		.mask = GPIO_V2_LINE_FLAG_ACTIVE_LOW,
 	},
 	{
 		.name = "open-drain",
-		.mask = GPIOLINE_FLAG_OPEN_DRAIN,
+		.mask = GPIO_V2_LINE_FLAG_OPEN_DRAIN,
 	},
 	{
 		.name = "open-source",
-		.mask = GPIOLINE_FLAG_OPEN_SOURCE,
+		.mask = GPIO_V2_LINE_FLAG_OPEN_SOURCE,
 	},
 	{
 		.name = "pull-up",
-		.mask = GPIOLINE_FLAG_BIAS_PULL_UP,
+		.mask = GPIO_V2_LINE_FLAG_BIAS_PULL_UP,
 	},
 	{
 		.name = "pull-down",
-		.mask = GPIOLINE_FLAG_BIAS_PULL_DOWN,
+		.mask = GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN,
 	},
 	{
 		.name = "bias-disabled",
-		.mask = GPIOLINE_FLAG_BIAS_DISABLE,
+		.mask = GPIO_V2_LINE_FLAG_BIAS_DISABLED,
 	},
 };
 
-void print_flags(unsigned long flags)
+static void print_attributes(struct gpio_v2_line_info *info)
 {
 	int i;
-	int printed = 0;
+	const char *field_format = "%s";
 
 	for (i = 0; i < ARRAY_SIZE(flagnames); i++) {
-		if (flags & flagnames[i].mask) {
-			if (printed)
-				fprintf(stdout, " ");
-			fprintf(stdout, "%s", flagnames[i].name);
-			printed++;
+		if (info->flags & flagnames[i].mask) {
+			fprintf(stdout, field_format, flagnames[i].name);
+			field_format = ", %s";
 		}
 	}
+
+	if ((info->flags & GPIO_V2_LINE_FLAG_EDGE_RISING) &&
+	    (info->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING))
+		fprintf(stdout, field_format, "both-edges");
+	else if (info->flags & GPIO_V2_LINE_FLAG_EDGE_RISING)
+		fprintf(stdout, field_format, "rising-edge");
+	else if (info->flags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
+		fprintf(stdout, field_format, "falling-edge");
+
+	for (i = 0; i < info->num_attrs; i++) {
+		if (info->attrs[i].id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE)
+			fprintf(stdout, ", debounce_period=%dusec",
+				info->attrs[0].debounce_period_us);
+	}
 }
 
 int list_device(const char *device_name)
@@ -109,18 +125,18 @@ int list_device(const char *device_name)
 
 	/* Loop over the lines and print info */
 	for (i = 0; i < cinfo.lines; i++) {
-		struct gpioline_info linfo;
+		struct gpio_v2_line_info linfo;
 
 		memset(&linfo, 0, sizeof(linfo));
-		linfo.line_offset = i;
+		linfo.offset = i;
 
-		ret = ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
+		ret = ioctl(fd, GPIO_V2_GET_LINEINFO_IOCTL, &linfo);
 		if (ret == -1) {
 			ret = -errno;
 			perror("Failed to issue LINEINFO IOCTL\n");
 			goto exit_close_error;
 		}
-		fprintf(stdout, "\tline %2d:", linfo.line_offset);
+		fprintf(stdout, "\tline %2d:", linfo.offset);
 		if (linfo.name[0])
 			fprintf(stdout, " \"%s\"", linfo.name);
 		else
@@ -131,7 +147,7 @@ int list_device(const char *device_name)
 			fprintf(stdout, " unused");
 		if (linfo.flags) {
 			fprintf(stdout, " [");
-			print_flags(linfo.flags);
+			print_attributes(&linfo);
 			fprintf(stdout, "]");
 		}
 		fprintf(stdout, "\n");
-- 
2.28.0

