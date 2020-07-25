Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A590822D4B8
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgGYEWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:22 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11098C0619D3;
        Fri, 24 Jul 2020 21:22:21 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b9so5600596plx.6;
        Fri, 24 Jul 2020 21:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3+hJ7zNRaoWlLSVnXOWNWFpr3kcfCni2wrrkU2nF2eI=;
        b=YQf0b2pTetZeBKC67fknHNTDBxx6pQFTMI64zb2N/Iw3iVm8XxmXtXQwK6DaOl7cR3
         /TqKa7wYXUoM5QMDyS1jtUe1f38XjvWih5yH96vfCpYjiXnSqIYW3pGipSHQ9sdLmra1
         9//ky8PpxzaY96qOg4wWicnYiSxW85xcWahbNjGSTAddzuFDgzAnt/EEJLjiZZwhsJjn
         Ng/ejojLxFdSghCui3k4HTVpK/QxNOPo1ZnP6/M0NzYhvJtGvALcxGIiAu/J81rofWs/
         Ryk2XSgtrl8wOp6CWycExuf+M4x8NcSoUO97jNMijpn1V2bcSALnR9r9DjSunc3ViYfc
         7NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3+hJ7zNRaoWlLSVnXOWNWFpr3kcfCni2wrrkU2nF2eI=;
        b=EwxlJfPQvLmmKxRFNsE4NHuT63gYt0NDnDNNDKLKnEb++r5ayMdiDwCo9S2NMMTb/L
         swL+fUd2685sNVXL57lE11yCfIo9SxkJJfdxkP2eZi6DWWtNQhEt9uNjLBFe5NBCONnE
         2EMW1HkexYorVbinzsZef2L6cMyG3Bl1W8uPUHsfG6CRX2ap/ipDYQnVoWPV3XlgPKAA
         Df9byW1GVbFBWczb6arcC8PECQXDer1tHqW/0QeyNvbynovB4CkpiGP4MN77uXUMSA1Z
         HU4rNHOhN2iquZjxG203veBBeAJqnQfEdd4qkhrROO0i784ICLS9yr6L2HwxZnHmUzOq
         7+uQ==
X-Gm-Message-State: AOAM532SjcFciq1NYHCPzDc/7J9IHiPDcruTn2G9rKKrBMg3G4NA2B93
        b3hL6QyE5TjDFD5lYVaHm6U/EELQ
X-Google-Smtp-Source: ABdhPJzggfcbrksskJE7EQg13Kkt/wdSbyWa1cmmJCqof8ePmS2gyQ8YCCJ9o16rESxPGK+HMgoblg==
X-Received: by 2002:a17:90a:ce93:: with SMTP id g19mr355143pju.1.1595650940197;
        Fri, 24 Jul 2020 21:22:20 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 12/18] tools: gpio: port lsgpio to v2 uAPI
Date:   Sat, 25 Jul 2020 12:19:49 +0800
Message-Id: <20200725041955.9985-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the lsgpio tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/lsgpio.c | 102 ++++++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 55 deletions(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index b08d7a5e779b..0a993d535707 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -23,58 +23,50 @@
 
 #include "gpio-utils.h"
 
-struct gpio_flag {
-	char *name;
-	unsigned long mask;
-};
-
-struct gpio_flag flagnames[] = {
-	{
-		.name = "kernel",
-		.mask = GPIOLINE_FLAG_KERNEL,
-	},
-	{
-		.name = "output",
-		.mask = GPIOLINE_FLAG_IS_OUT,
-	},
-	{
-		.name = "active-low",
-		.mask = GPIOLINE_FLAG_ACTIVE_LOW,
-	},
-	{
-		.name = "open-drain",
-		.mask = GPIOLINE_FLAG_OPEN_DRAIN,
-	},
-	{
-		.name = "open-source",
-		.mask = GPIOLINE_FLAG_OPEN_SOURCE,
-	},
-	{
-		.name = "pull-up",
-		.mask = GPIOLINE_FLAG_BIAS_PULL_UP,
-	},
-	{
-		.name = "pull-down",
-		.mask = GPIOLINE_FLAG_BIAS_PULL_DOWN,
-	},
-	{
-		.name = "bias-disabled",
-		.mask = GPIOLINE_FLAG_BIAS_DISABLE,
-	},
-};
-
-void print_flags(unsigned long flags)
+static void print_attributes(struct gpioline_info_v2 *info)
 {
 	int i;
-	int printed = 0;
-
-	for (i = 0; i < ARRAY_SIZE(flagnames); i++) {
-		if (flags & flagnames[i].mask) {
-			if (printed)
-				fprintf(stdout, " ");
-			fprintf(stdout, "%s", flagnames[i].name);
-			printed++;
-		}
+	const char *field_format = "%s";
+
+	if (info->flags & GPIOLINE_FLAG_V2_USED) {
+		fprintf(stdout, field_format, "used");
+		field_format = ", %s";
+	}
+
+	if (info->flags & GPIOLINE_FLAG_V2_OUTPUT)
+		fprintf(stdout, field_format, "output");
+	else
+		fprintf(stdout, field_format, "input");
+
+	field_format = ", %s";
+
+	if (info->flags & GPIOLINE_FLAG_V2_ACTIVE_LOW)
+		fprintf(stdout, field_format, "active-low");
+
+	if (info->flags & GPIOLINE_FLAG_V2_OPEN_DRAIN)
+		fprintf(stdout, field_format, "open-drain");
+	if (info->flags & GPIOLINE_FLAG_V2_OPEN_SOURCE)
+		fprintf(stdout, field_format, "open-source");
+
+	if (info->flags & GPIOLINE_FLAG_V2_BIAS_DISABLED)
+		fprintf(stdout, field_format, "bias-disabled");
+	if (info->flags == GPIOLINE_FLAG_V2_BIAS_PULL_UP)
+		fprintf(stdout, field_format, "pull-up");
+	if (info->flags == GPIOLINE_FLAG_V2_BIAS_PULL_DOWN)
+		fprintf(stdout, field_format, "pull-down");
+
+	if ((info->flags & GPIOLINE_FLAG_V2_EDGE_RISING) &&
+	    (info->flags & GPIOLINE_FLAG_V2_EDGE_FALLING))
+		fprintf(stdout, field_format, "both-edges");
+	else if (info->flags & GPIOLINE_FLAG_V2_EDGE_RISING)
+		fprintf(stdout, field_format, "rising-edge");
+	else if (info->flags & GPIOLINE_FLAG_V2_EDGE_FALLING)
+		fprintf(stdout, field_format, "falling-edge");
+
+	for (i = 0; i < info->num_attrs; i++) {
+		if (info->attrs[i].id == GPIOLINE_ATTR_ID_DEBOUNCE)
+			fprintf(stdout, ", debounce_period=%dusec",
+				info->attrs[0].debounce_period);
 	}
 }
 
@@ -109,18 +101,18 @@ int list_device(const char *device_name)
 
 	/* Loop over the lines and print info */
 	for (i = 0; i < cinfo.lines; i++) {
-		struct gpioline_info linfo;
+		struct gpioline_info_v2 linfo;
 
 		memset(&linfo, 0, sizeof(linfo));
-		linfo.line_offset = i;
+		linfo.offset = i;
 
-		ret = ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
+		ret = ioctl(fd, GPIO_GET_LINEINFO_V2_IOCTL, &linfo);
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
@@ -131,7 +123,7 @@ int list_device(const char *device_name)
 			fprintf(stdout, " unused");
 		if (linfo.flags) {
 			fprintf(stdout, " [");
-			print_flags(linfo.flags);
+			print_attributes(&linfo);
 			fprintf(stdout, "]");
 		}
 		fprintf(stdout, "\n");
-- 
2.27.0

