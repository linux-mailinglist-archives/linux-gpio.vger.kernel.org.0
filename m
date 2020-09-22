Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5FF2738CD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgIVChQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbgIVChP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:37:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC878C061755;
        Mon, 21 Sep 2020 19:37:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f18so11069477pfa.10;
        Mon, 21 Sep 2020 19:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhsdDka5VAuNSf2HuQvOP3xLEekqQct63e8ZhTs/yiQ=;
        b=OvKUE6rQcDD4UJw6F7gC2obwxlPN9Bh8oyf7zsOH/xBLknyS4GZH9kK1+82udglPnk
         LaduPhiBHLXoVhN8tyQDJCFA7li6hPBV29H/ohxqWrfG7VuyqWc2+KvKZPN3GxTx1vmK
         oDLAA+GXS82z6n2JX+MDMJIlY/Voeg2cF8mxXfCCmB1U2vGPLf8v2deN/DCxzFXpd5BP
         hv2hYdtaPKDIm5Oh+gECoK8sDhz/fy8TJq33ZPm5IqETI65n0YYeV/WLPcWchSMWlauK
         wrt3wUrFQdiYnfdkNA/fMdz5j2YlFjK32kUQFugBArtpwjPaeaHN3D27jzsF+3FLyb3+
         bthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhsdDka5VAuNSf2HuQvOP3xLEekqQct63e8ZhTs/yiQ=;
        b=EFPn0oO8ItUP1CuznzPWRceFRYnSo06X+/u1Ew6ByGA8dARqivqPhBc0VrzxmIQD9A
         YN9otTmuvbIYcvpqZ0RNnPeZdB9/HBw9jn0oGG/r377NX/VGNqQhByiif7qAmC29/3so
         FZtuW02RlC+3x+bgooyMxhj+P49pgh/VDvFXckylIaG5qs4WNJXF5TLjIRiHAROEScu/
         VV0AfEH7AFMeKT2nn+vD8Lzgaqyy9fqbHxpoPePHSAArLk63LCzmqWnr+pWrTWo5BWeK
         RFGYIJLd66esTXm9DSPiBTUJ3ZvU1fbgybW+t+rPG41hd+qLU63z9DIY6TWZu++PYpQX
         fndA==
X-Gm-Message-State: AOAM531CN5xC9Lrukg9P7zQ4VtbahWKAVzbvtZrGnZ5f92esr05CqNJk
        gV78nrvSkbbYYMRFMMHM6qUbjh2r6asbKQ==
X-Google-Smtp-Source: ABdhPJwCLZrOXLxIe7Z2ULuFt9buC/SX6o3uSyTskvBVdK006Dh1FBzkgMqil5qHV0Fq7qHVmc/Egg==
X-Received: by 2002:a63:521c:: with SMTP id g28mr1918298pgb.43.1600742234818;
        Mon, 21 Sep 2020 19:37:14 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:37:14 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 19/20] tools: gpio: add multi-line monitoring to gpio-event-mon
Date:   Tue, 22 Sep 2020 10:31:50 +0800
Message-Id: <20200922023151.387447-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend gpio-event-mon to support monitoring multiple lines.
This would require multiple lineevent requests to implement using uAPI v1,
but can be performed with a single line request using uAPI v2.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 45 ++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index b230af889f26..0c34f18f511c 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -26,7 +26,8 @@
 #include "gpio-utils.h"
 
 int monitor_device(const char *device_name,
-		   unsigned int line,
+		   unsigned int *lines,
+		   unsigned int num_lines,
 		   struct gpio_v2_line_config *config,
 		   unsigned int loops)
 {
@@ -47,7 +48,7 @@ int monitor_device(const char *device_name,
 		goto exit_free_name;
 	}
 
-	ret = gpiotools_request_line(device_name, &line, 1, config,
+	ret = gpiotools_request_line(device_name, lines, num_lines, config,
 				     "gpio-event-mon");
 	if (ret < 0)
 		goto exit_device_close;
@@ -55,8 +56,10 @@ int monitor_device(const char *device_name,
 		lfd = ret;
 
 	/* Read initial states */
-	values.mask = 1;
+	values.mask = 0;
 	values.bits = 0;
+	for (i = 0; i < num_lines; i++)
+		gpiotools_set_bit(&values.mask, i);
 	ret = gpiotools_get_values(lfd, &values);
 	if (ret < 0) {
 		fprintf(stderr,
@@ -65,9 +68,23 @@ int monitor_device(const char *device_name,
 		goto exit_line_close;
 	}
 
-	fprintf(stdout, "Monitoring line %d on %s\n", line, device_name);
-	fprintf(stdout, "Initial line value: %d\n",
-		gpiotools_test_bit(values.bits, 0));
+	if (num_lines == 1) {
+		fprintf(stdout, "Monitoring line %d on %s\n", lines[0], device_name);
+		fprintf(stdout, "Initial line value: %d\n",
+			gpiotools_test_bit(values.bits, 0));
+	} else {
+		fprintf(stdout, "Monitoring lines %d", lines[0]);
+		for (i = 1; i < num_lines - 1; i++)
+			fprintf(stdout, ", %d", lines[i]);
+		fprintf(stdout, " and %d on %s\n", lines[i], device_name);
+		fprintf(stdout, "Initial line values: %d",
+			gpiotools_test_bit(values.bits, 0));
+		for (i = 1; i < num_lines - 1; i++)
+			fprintf(stdout, ", %d",
+				gpiotools_test_bit(values.bits, i));
+		fprintf(stdout, " and %d\n",
+			gpiotools_test_bit(values.bits, i));
+	}
 
 	while (1) {
 		struct gpio_v2_line_event event;
@@ -126,7 +143,7 @@ void print_usage(void)
 	fprintf(stderr, "Usage: gpio-event-mon [options]...\n"
 		"Listen to events on GPIO lines, 0->1 1->0\n"
 		"  -n <name>  Listen on GPIOs on a named device (must be stated)\n"
-		"  -o <n>     Offset to monitor\n"
+		"  -o <n>     Offset of line to monitor (may be repeated)\n"
 		"  -d         Set line as open drain\n"
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
@@ -146,7 +163,8 @@ void print_usage(void)
 int main(int argc, char **argv)
 {
 	const char *device_name = NULL;
-	unsigned int line = -1;
+	unsigned int lines[GPIO_V2_LINES_MAX];
+	unsigned int num_lines = 0;
 	unsigned int loops = 0;
 	struct gpio_v2_line_config config;
 	int c;
@@ -162,7 +180,12 @@ int main(int argc, char **argv)
 			device_name = optarg;
 			break;
 		case 'o':
-			line = strtoul(optarg, NULL, 10);
+			if (num_lines >= GPIO_V2_LINES_MAX) {
+				print_usage();
+				return -1;
+			}
+			lines[num_lines] = strtoul(optarg, NULL, 10);
+			num_lines++;
 			break;
 		case 'd':
 			config.flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
@@ -182,7 +205,7 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (!device_name || line == -1) {
+	if (!device_name || num_lines == 0) {
 		print_usage();
 		return -1;
 	}
@@ -191,5 +214,5 @@ int main(int argc, char **argv)
 		       "falling edges\n");
 		config.flags |= EDGE_FLAGS;
 	}
-	return monitor_device(device_name, line, &config, loops);
+	return monitor_device(device_name, lines, num_lines, &config, loops);
 }
-- 
2.28.0

