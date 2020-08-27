Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EFF2546FE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgH0Ofa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgH0OEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:04:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D05C0619C6;
        Thu, 27 Aug 2020 07:03:30 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u20so3591930pfn.0;
        Thu, 27 Aug 2020 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADP2aGUDRbAJ2fzGJ4u2MgmoEkak0G6DX7jqH1kdmdo=;
        b=pskKla1kOyTKpAXy0EvUaMGChf4lXWttIW4Ki8kiHdDF3GuvOKv5yHvwTVQ/kTwiOG
         wEHq2OtPfKz1Q5p9IbYEIcJxrS1oH5LpAQ1PPjz+9jHDvXIJbKlPrPEjF+DNtlA6smww
         hN7j4Vz+ZTK1xG4GhRibUGUXmdFKRrcdh1Idv3YHyzDU3/PBgdo7wCw7dp0gsi0cDVRC
         ISeiI9BULQfftcuJizPk/96hIBV6YBwSsAAQmDRm37Q7o4kiLnV99/FI2QL1T8FhkVwp
         K7bufUUGHUiK/18jl3B9UhemG5wQOkzHl95rdCOAjxdfXh7pb/zFL+/6dsVfrM55EqfW
         jy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADP2aGUDRbAJ2fzGJ4u2MgmoEkak0G6DX7jqH1kdmdo=;
        b=OXq8Ncme4GdzvixYHAkjV5OEZTUm1dPtnGrd3YpMfpon0YbuDqEHyU8yR9Jm3qU084
         Gl23G0HC07OpkxKOMhTiB+NVS7bF14hb5WL5duRUAqReCOzQQ4/wMzRCJTWUC/OzMpW1
         Mm2TS80TjWVxsDY3Sh6OJeyeYcPaItRs2Ky953Lhg8lBftzTkHJvGLGi0HnDMove/6c8
         729zQJklJ08wmMpOTDrgDMbWKCtNNtcqmaKaz36IcN7f8eq4Enw6U0Fx4zcWYyVbqHWw
         /keyJtdVT26XR/1RCNR0qOGuuOzbsf3/MJ8SqUZu5e/kGrggSNNS1tlNPmFm+CbulEFh
         f5Rg==
X-Gm-Message-State: AOAM530aIPfnXtg1HOuSSEPQsC1qlApxOo3Ng4t2iHBPJVgU5yp+se1S
        53xnS+hD3cz654lTjcl5ihF2LNZiRJg=
X-Google-Smtp-Source: ABdhPJyd95QYOnXT2VOz7fgHmCWIqzI9VrAx9XEgx8YJFP8cGJeCWM2UsLlEUUZzCv5IK2/QEWy5KQ==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr15864709plr.251.1598537009145;
        Thu, 27 Aug 2020 07:03:29 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:03:28 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 14/20] tools: gpio: port lsgpio to v2 uAPI
Date:   Thu, 27 Aug 2020 22:00:14 +0800
Message-Id: <20200827140020.159627-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the lsgpio tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/lsgpio.c | 60 ++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index b08d7a5e779b..deda38244026 100644
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
+				info->attrs[0].debounce_period);
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

