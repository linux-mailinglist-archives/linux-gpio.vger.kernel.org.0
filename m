Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89352443D7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgHNDGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgHNDGE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:06:04 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80A4C061757;
        Thu, 13 Aug 2020 20:06:04 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e4so3750225pjd.0;
        Thu, 13 Aug 2020 20:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zeAqt+L6g1vrQKWXIoolqUPOf3l3HNvz8g6zB2yyrdI=;
        b=UpSmTiCPEAlVnNK9iJjxZM9Auc7wdz7ZXX2kyGIZEyDwPcb/k+sbNuDND3N2LoltQk
         BJfZDxtA2bk9mwL5E6mmArRXx9V/ffZdlzf44vcQIg3PV5u4wMtLLNy/I08YU8gOLOUc
         W0qSTcG7mVpta6BQ4z2h/EU+dB2vSaCaUo4owcdgkJAci/gF7ff5s4AOkKZMzVGku0SD
         QJy7Vlrx6auHTy8GsXovlhRzD2CoideNwxONJ4N0/rXIDT84XDGJN6lgXTzNA25Zjqi4
         7uaKo/KrO5EcqkJ3CbKxQOTRRPsrw5VUkBxeO64O1ntouYq9YZXHvXdAtq1hdkgsMJAU
         ESSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zeAqt+L6g1vrQKWXIoolqUPOf3l3HNvz8g6zB2yyrdI=;
        b=QvoWcXFby2OgFhpKwTZXd6NQiootzC4mE7c9xHaE7vlPnDkctO9XY2TUleaAkFNivE
         k9ZffrVNQWklpCWeL0jfrQxEmO/k74UGzRv1K7cFErwlRKZ/Vn8CXfVNjXMJ8PDnA9FQ
         cjv7uHFpJeWFpwMbNJGXpw26cbEB3kVBeP/KIyGWulJKvGr9hyaH7+ZVjUyb2G+dMy95
         86a7rNl3pY7sQoHdvdppGAk/WiMmkZ2N22mNGWoO1tIxtozQQ+nuNH+q9HtHVbp/Fawh
         09R7cx6oy7AlI+KLTsnRhEPown1gct7Mn8VtHM3zCcgyQMj5eHYXzS7oj+ZBQuYwln+G
         hRuQ==
X-Gm-Message-State: AOAM532ZoRd5RcG8AGZqNsM0q7tK1YW2z0xZARbdP/YD2MCHFzP4yVH8
        xijunX6x6+X0yCH2IPqq/jNmppyY
X-Google-Smtp-Source: ABdhPJyeGu93RWE9q+cI55W8Y16e/lpPF7M2SogF2Kp5V5NBsGhKCYJnLJq+KXeHqOLq6RKgCOv/EQ==
X-Received: by 2002:a17:90b:1b43:: with SMTP id nv3mr613106pjb.22.1597374363843;
        Thu, 13 Aug 2020 20:06:03 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:06:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 19/20] tools: gpio: add multi-line monitoring to gpio-event-mon
Date:   Fri, 14 Aug 2020 11:02:56 +0800
Message-Id: <20200814030257.135463-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
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

