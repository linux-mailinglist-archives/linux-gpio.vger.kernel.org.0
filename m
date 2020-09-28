Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786AB27A4D7
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgI1Ab2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgI1Ab2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:31:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565CEC0613CE;
        Sun, 27 Sep 2020 17:31:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k13so7782709pfg.1;
        Sun, 27 Sep 2020 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ys6wqSQYuQoXYJfJn/Rp0bUM9O0PtZUuVhMhadizOSw=;
        b=Yy9gkOH+K0pXLd6dtmxD+1HGK/QC5Z5JL18LOqnq2QHgB+dFfMv34JS8laS3rP52jn
         s9Xh9fpMz+xfGrw2SEXpO8+w8wZHeiHCqEIhzuXnwEqa5RqawLhB6XR33OIhdnn/Ctdl
         TWUpNCV6+glqmQtoEv+HbaNrgsNd3/+RyTRRwv1FV6iznvvpTDuM90wp8H6DjnUlwXOi
         sZsXkyvWx2abLRHw7G4ELki8mLtC8JfPdDvDTGS14roqaliNS0ADqPA6TMRSDBN3EUbJ
         KOs1Dws7TUMz5xC6pNv8hUiGGObLI+hQdKzqpe3WDItTEkiRh7+0f6oD8d0WfqeBPwPm
         zViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ys6wqSQYuQoXYJfJn/Rp0bUM9O0PtZUuVhMhadizOSw=;
        b=pcp9cZL72br2Iiir3onRvtIPT4FcqgOfZsrBD6GoaYUDZsR9yEtl1hKGFOm5/qgmPD
         MpALQOjIHm+3qHwaw/wEgMj/bjE7yWoTSeKH3peJ2TIXrS//LBz8kXfGQXw4GKALS7AV
         G5hp0HDJsshOSKGRH1unVoN9TNDdtjZoIyxKnze43sUbjZsN8XwT//r9fh+YuOFAfmzn
         bSHccb3gZCpG6GgCsZk8kHw5SKQxvD2YKmpIC/1ASShu5rJPpNTW4tyojzl5scItte2l
         dykXHbJkE9enNiK7jX2xuCQMMfuscwsbpgiv67i0kiHM1BOpMfWlyXs9VauhCaKnw20u
         aGvw==
X-Gm-Message-State: AOAM531f/0W4IQfruKS6EpqbvC9VvvfM3fZ8v4Udj/kYydR16Ufw38B5
        MW961lN7/bQ5WYTil1hkei/f4dtBnAiqxQ==
X-Google-Smtp-Source: ABdhPJxpR9TQBQUblUMBSkleBJu0ly/sskdkEh75Zoyuf3JENUT0NyhgjXTbrD6rWWSDpzCh2+71sA==
X-Received: by 2002:a62:8c88:0:b029:13e:d13d:a08b with SMTP id m130-20020a628c880000b029013ed13da08bmr8824851pfd.34.1601253087516;
        Sun, 27 Sep 2020 17:31:27 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:31:26 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 14/20] tools: gpio: port lsgpio to v2 uAPI
Date:   Mon, 28 Sep 2020 08:28:01 +0800
Message-Id: <20200928002807.12146-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the lsgpio tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

