Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAD5262D2F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbgIIKb0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgIIK2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B472C061755;
        Wed,  9 Sep 2020 03:28:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n14so1767568pff.6;
        Wed, 09 Sep 2020 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADP2aGUDRbAJ2fzGJ4u2MgmoEkak0G6DX7jqH1kdmdo=;
        b=cCb96bd/ZKzxjj8K1XHiEsSYKl0+uzDOsAIFm4kWQ/A63lA1YimHbZb8E5/pAIAdkK
         miBFsadcPYjnX5fDL7u6IqO+nH+A3VvmFtMyNEUvmtD77YlrDqLxdDp06sbhgMfvnBhw
         9TeoolQwqjNFCsDtsskFXvj7Hh+zOYG2/0bs/tW5bbMO0Eg5BWs5GYr5PKSKvA+80ZHJ
         MO53Hjvib/TXOQDs2TlnjoVEkGLbGm/9T/Z6JE8AnTk8JhCpBKZLSDs5pMOcUaIKAWk2
         /b+xqoVAraQBFXUwyahA1OTCQhRGc91BBMn/0oW7uXdW2Ch7GKREmFV1NGhph6H0lhHc
         Y87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADP2aGUDRbAJ2fzGJ4u2MgmoEkak0G6DX7jqH1kdmdo=;
        b=I/FlbDYaNogGd/awbG5PmdlAnsemFuxZpz3IIwMCL3GvlmR4kq0C/Wo+8h9FAJrp1y
         +HMsW8HxtV91ICZrkycj2YPauE3PdfAQmPzEsaqhXb4ETxDPHunor2XOPFKe/1FLTGco
         WL8rxlBx70fqZiUIQ5h2od9egFm+WpWfMq3BjLUxdKls+ieeKH6BkN0RIg/v8uwpUzPV
         3TH7vnZRHWmtD2Ia2tkWEha3hgzEacWrH22iACym5klONfMwSwRQYgcCf4Igd9oGpxyJ
         u2odsL0VBWRjt+5M2YEo40Rmn0oaxfiXYNJLh8nV+D/9357ru7H5jL1TFB/hC17l2RtR
         KX/A==
X-Gm-Message-State: AOAM531/VzdgX94ZOyxQ+/qLXrwWultZ0kN7IqKANkZ1BbfRD2kgDtVG
        3lTHnQXo+o9S2oeKNHMNmNr0h5cQa/8=
X-Google-Smtp-Source: ABdhPJyYuIUXKtRFKGyzp0mxaALhib1jIhD00A67xYUX+vzjAWF+gvkxCWgc+Hz944LY83NUI0mWDQ==
X-Received: by 2002:a63:2782:: with SMTP id n124mr108572pgn.319.1599647312706;
        Wed, 09 Sep 2020 03:28:32 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:32 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 14/20] tools: gpio: port lsgpio to v2 uAPI
Date:   Wed,  9 Sep 2020 18:26:34 +0800
Message-Id: <20200909102640.1657622-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

