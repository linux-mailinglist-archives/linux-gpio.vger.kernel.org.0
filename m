Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE5025723F
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgHaDXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgHaDXs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:23:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367CDC061573;
        Sun, 30 Aug 2020 20:23:48 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t11so2375462plr.5;
        Sun, 30 Aug 2020 20:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADP2aGUDRbAJ2fzGJ4u2MgmoEkak0G6DX7jqH1kdmdo=;
        b=ZqEX81E6rE/tSfxfxwQx3AEYIR4lXbD/nfCwPtVosvhgXN0gB1JYCpZ0SY3xMw2eph
         5YneMAVVCM53lALl66vQAvq6pS3XjOC1qj5OvLZ5iHl228E2tecjUt3IJXSd+a9P0tyF
         mKZrzg+lheog5Cjt3wCtnCOaYEVNK//8TxhLmsXkg6ds1U9b85SWCof6pUkrb8DsMr49
         YvmPMvLWd+ktxwFQy/vq9TadS8ezP+ab2EppjpelROvUJnLuDnTpcgyT51yiF6cQnBI+
         qPAdHCGHcv0VzRt4X3pwhNQ6YAwq96Lul8VFCbPcbatSRzAwQChARCGIootdiEy9xBQq
         qb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADP2aGUDRbAJ2fzGJ4u2MgmoEkak0G6DX7jqH1kdmdo=;
        b=TJl4g7i5+gUyPdDY98ZMMg05TzW+Hf4bxKamu+TK49TSaSo7alunGjYILc/FIjoQUv
         sX0oRuxfbQQn+YPISMiLBDdi2uZ1a9E/BbKpjZW+nLGaiG9tVY/0qeA7qk1d3t9tZBg/
         De3XNxUfCkNXNMJVxkRlR0qIW0d2W9yP5xjj9WVzgF3sbnIG2UtWWGOKXvBWZjoOGEoQ
         EtflfkHgsJiYDA18lpDdRje16yTd0H5kleBxkzZdmY7PUOGHNTNvE62B1OW0SGu+RvQd
         MH190PNkH8glutHEtozqlgPer8SGQ/BVQp0/jUdhWHt3gH1dC0sEk43cl8SQbFzL7Ver
         9ZVg==
X-Gm-Message-State: AOAM532XBL3cnwqieXN4yfXjlcPzJGqBa2jYedZdvMQ262zggA+zpQl1
        WaDNj/Rf4PDhox+KPiB5sFOeHHL6iuI=
X-Google-Smtp-Source: ABdhPJwdDafRYjfZrjgWpF2va0cniVPFR34WCzlFv27w+nArn39wGWpdfm046u9BJecbGze29hCjzA==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id iq14mr8354878pjb.133.1598844226526;
        Sun, 30 Aug 2020 20:23:46 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:23:45 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 14/20] tools: gpio: port lsgpio to v2 uAPI
Date:   Mon, 31 Aug 2020 11:20:00 +0800
Message-Id: <20200831032006.1019978-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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

