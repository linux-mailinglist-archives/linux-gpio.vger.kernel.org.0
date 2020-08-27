Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6E72546A3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgH0ORC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbgH0OFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:05:38 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A7EC061239;
        Thu, 27 Aug 2020 07:04:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ls14so2646347pjb.3;
        Thu, 27 Aug 2020 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zeAqt+L6g1vrQKWXIoolqUPOf3l3HNvz8g6zB2yyrdI=;
        b=OnhNILNH79CwzJfLX9pU2ERgM5FfOBMz09TdRKvhkLzIZW5EGAehJtlDgnynAWsvfT
         T//Y5PEBkgfX45MrBipWKt/AcvQk9Ar3m8LXBI9K6yQw1qkWmNA1tIt91zC5mkT+xxt6
         WU2XNWOSMVBqCiAXlPqt4at6gbYqLpOKkN1hYBtqtQFsuCJB8SucZj7K5fP7Tfgmdaby
         Awua82yghSmwwvMUhcROtP3iLPJ/mmJpWNo7HdY4sD4pgv6eGBaTbwgqTY7/VJ3hHjIE
         27w/jJQF+hp0XatwPf3Ksx1LmjDYVWbDNHoJst9Pq6ShdfV47btGtxqzdke+imB3ZM/C
         qfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zeAqt+L6g1vrQKWXIoolqUPOf3l3HNvz8g6zB2yyrdI=;
        b=e18zROpaKkbr1wpyR5h2TztxU7JCYjxpRwtZdNUfPWqRefre1bW3ZtKv25jXue3d+Z
         XCGA/mZJcmUOUZXMl62Z6gEueQCvWaoYJLj5sCOJQjUo1RblDMu93VAx0uqxSkLDcpjp
         CbHMaDVtSZFp8LNOi6BNqqZ27rCoD81dpbmH1x9Z5o2Oz4Sne9UDS1Uku5Wpac6mNoL/
         TT5c9YZhTZLnByz4PZEyh6JcnLXmRvwCmVqEHF3TXDN49p2fGtAc+S0n3oYghv+ta4cR
         56y1Th2m34msR3Bryb6ORJS33hbuhljnV4qVRTUWmb1NHk0j/T6M6O8ueHMURu/nHI27
         1OIQ==
X-Gm-Message-State: AOAM531ShvZVLz2u/50uDg2vO3pQHwqmesSzzAb7+MewxkNyBVYdptCf
        hXGZraXCBSlSJM2uwBs9V5Tbv7eQrmI=
X-Google-Smtp-Source: ABdhPJyJ+9QkifpDjycw3SplohaUIxF5lHNpUuo8KMqk+GwoNlCd8161IAJcKF1+hBnL7ApGZ1YxUQ==
X-Received: by 2002:a17:90a:e815:: with SMTP id i21mr2825462pjy.216.1598537061348;
        Thu, 27 Aug 2020 07:04:21 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:04:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 19/20] tools: gpio: add multi-line monitoring to gpio-event-mon
Date:   Thu, 27 Aug 2020 22:00:19 +0800
Message-Id: <20200827140020.159627-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
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

