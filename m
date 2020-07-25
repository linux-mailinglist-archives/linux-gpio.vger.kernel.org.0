Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785B022D4C4
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgGYEW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AB3C0619D3;
        Fri, 24 Jul 2020 21:22:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id o22so6571059pjw.2;
        Fri, 24 Jul 2020 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=crje8LMEWe+nPqJPbXwwSKHdTWnnedlQivtsgNuFZH4=;
        b=Uanmk9VszHznxuEAObcgraGn8/jp9vuHuVYtqZJacfUqod2gSlD/nOwYq57wWSH1ss
         HNGDD16WRMvtkg8Z7iOLFxPtA5t/9y4B/+g1d2q85KzIbQszgZUi1N9LE23B1zGpHzpO
         OGXXCyfNZ+WWK9+p69A2wHr6PHLFMKyC7i3pSjzXDnrKAx72LXpYK+x/pf6axcSOu9Qn
         xL5qzNckku9LLREmdFPeE1OQJwn42LgY51lIBSWLB07g7W7+JV33MpS7dM9JHldqwIb5
         EaLy4Oq+T4cf2gezp31xs3sznF6GWxO+RF/FvqU8JawF0O+u8/FhjqivMk9pHoALyQqz
         gkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=crje8LMEWe+nPqJPbXwwSKHdTWnnedlQivtsgNuFZH4=;
        b=JKTfMvCe8m5PDm01e7RKJ5GOcfYy3ZwrJc/2UotqfohfIJeqtJnOq/MbK6Q5PBRLo7
         SC+GsUkyb4LORU1Ea9iEnXW11xzmV+PKFUF3B5GNfvkNcBq9Fk+Ez4nTnW4/MmX/wzGS
         bPKouNOjMhPqPu9BLQvI9nWXEoYzcKmYUbllCixaimX2Hx4VHS4dMlohsKFrh6/3DFum
         CI+8YMEYfDGmPHwmS6eLiySOGmUhTaNHiNtITIc7LliCtaqBbwX+BdGdv9JQtIwGx/hq
         oXTsDhDJ9ZGcEETxxGs4qJ7ak2TIqpM0GjUrKWxZwfvNbRZS4ZlOdrHaB6Kxbm8eZwYd
         0UNw==
X-Gm-Message-State: AOAM5319cwB4D4yd1JlOOFm1+geLY996glOsZJraqz1IbkQLJH/t3JBa
        pyZmKjR1Hiuawj3wbdRRCHA+/fbH
X-Google-Smtp-Source: ABdhPJwhot18b7leVQGxHESQMPoPRY7tGw2gtNAK/3ffKbNpUBGqNRD4PAUhdd+5b8Ls1HU5Mupt1A==
X-Received: by 2002:a17:90a:2dcb:: with SMTP id q11mr8561605pjm.135.1595650974930;
        Fri, 24 Jul 2020 21:22:54 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:54 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 18/18] tools: gpio: add multi-line monitoring to gpio-event-mon
Date:   Sat, 25 Jul 2020 12:19:55 +0800
Message-Id: <20200725041955.9985-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
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
 tools/gpio/gpio-event-mon.c | 41 ++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index b64427d78942..e22cbf631e49 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -26,7 +26,8 @@
 #include "gpio-utils.h"
 
 int monitor_device(const char *device_name,
-		   unsigned int line,
+		   unsigned int *lines,
+		   unsigned int num_lines,
 		   struct gpioline_config *config,
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
@@ -63,9 +64,23 @@ int monitor_device(const char *device_name,
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
 		struct gpioline_event event;
@@ -124,7 +139,7 @@ void print_usage(void)
 	fprintf(stderr, "Usage: gpio-event-mon [options]...\n"
 		"Listen to events on GPIO lines, 0->1 1->0\n"
 		"  -n <name>  Listen on GPIOs on a named device (must be stated)\n"
-		"  -o <n>     Offset to monitor\n"
+		"  -o <n>     Offset of line to monitor (may be repeated)\n"
 		"  -d         Set line as open drain\n"
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
@@ -145,7 +160,8 @@ void print_usage(void)
 int main(int argc, char **argv)
 {
 	const char *device_name = NULL;
-	unsigned int line = -1;
+	unsigned int lines[GPIOLINES_MAX];
+	unsigned int num_lines = 0;
 	unsigned int loops = 0;
 	struct gpioline_config config;
 	int c, attr;
@@ -161,7 +177,12 @@ int main(int argc, char **argv)
 			device_name = optarg;
 			break;
 		case 'o':
-			line = strtoul(optarg, NULL, 10);
+			if (num_lines >= GPIOLINES_MAX) {
+				print_usage();
+				return -1;
+			}
+			lines[num_lines] = strtoul(optarg, NULL, 10);
+			num_lines++;
 			break;
 		case 'b':
 			attr = config.num_attrs;
@@ -189,7 +210,7 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (!device_name || line == -1) {
+	if (!device_name || num_lines == 0) {
 		print_usage();
 		return -1;
 	}
@@ -198,5 +219,5 @@ int main(int argc, char **argv)
 		       "falling edges\n");
 		config.flags |= EDGE_FLAGS;
 	}
-	return monitor_device(device_name, line, &config, loops);
+	return monitor_device(device_name, lines, num_lines, &config, loops);
 }
-- 
2.27.0

