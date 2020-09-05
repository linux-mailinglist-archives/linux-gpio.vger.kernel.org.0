Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89E625E7FB
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgIENmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgIENjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:39:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAACC061246;
        Sat,  5 Sep 2020 06:39:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk9so1936202pjb.2;
        Sat, 05 Sep 2020 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zeAqt+L6g1vrQKWXIoolqUPOf3l3HNvz8g6zB2yyrdI=;
        b=gBzN4GfKP4e9KGrA1rJIlb+hRY7To/3CR74YhVa94ot8jSHVg1gWaNqzLHivLQkn1m
         03Nfz4CAzhfFgalDY8YeifzA6WGGa510ECRN4sB+MSJQmESLYGgHDHGPTgjmphur+iu9
         z2+JMMi+C0v7I00qO/OZzI8YEfuaA8yYAm95YjnA9ABjF1cmsZtda6mBIjMul3vVG+YD
         ALssmLS+KXiKcMG2HjgWodac0/Vi57crtp6rzXWcqyS+EVPVcwW7PqreEFPZpn4flE8j
         SshLiDGp7HVIoC9fvXPkFypgPBWDtvM1sQ8/ec+jYL8fTWZfIswWP4ZDXOG5z1TMkOMl
         lYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zeAqt+L6g1vrQKWXIoolqUPOf3l3HNvz8g6zB2yyrdI=;
        b=jcLYDcGpDlpKZIkxYRkdeXeKh6Kd9caVDwD6OkOBddUspxiqcmxaIlcKJOCb18g7Zv
         +o5bTx9mUThJLsTFm2U0cIEnb1qtZcS2B6EFTC68Nf1kjXA/wQ3/+GDgzhJfz5nwfzmh
         anKF++WTv35CBlmIlCn+pqeO5o1AekIxG4QsAcMf50bW3GhIAykhKmYUkyaYNnVdknlw
         bHX+SnaevzM8dDL3TbSnCI4nFnMJaZyhBKlTT+zpPJv0jDOt8l7C/fFR4SqFTsqgl2Fy
         D992Jf4qFRloWpo1p1PePIbBZLZ+7kOLywsJn/k4FJikoirDBaeWtS9ouVjCVor1Bx99
         OJkw==
X-Gm-Message-State: AOAM532LZWalUmzsxMmyk86MF4LHVBOT66zBXeFUJwJ7VzJ4+aD2itFy
        7SbKN0RVtxzsQSBkpj5lhcdFXJulWKE=
X-Google-Smtp-Source: ABdhPJzqrbin2rkrBsOhnuOsP+GhW1muSTil0mTs38nRCMFjQNRRwLY8XPJx6XwH0UjbkY9vefiEdQ==
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr12928742pjb.87.1599313159641;
        Sat, 05 Sep 2020 06:39:19 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:39:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 19/20] tools: gpio: add multi-line monitoring to gpio-event-mon
Date:   Sat,  5 Sep 2020 21:35:48 +0800
Message-Id: <20200905133549.24606-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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
index d6a831200c18..e50bb107ea3a 100644
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

