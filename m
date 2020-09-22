Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0AF22738CC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbgIVChI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIVChH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:37:07 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F39C061755;
        Mon, 21 Sep 2020 19:37:07 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk9so739358pjb.2;
        Mon, 21 Sep 2020 19:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HKc6w3F44MKGXiOOHvhIp1w/DOfC/JosCic+YWr/JAE=;
        b=usjI/DeBeg5URu1vmlmhxUPahN5u8auqccCgouNuvagjQ7ZV2HvOJ8GTlwPmUmQPvO
         WQzaEVNoPA/HgeNesVuSSWpGZ0Qlh+PKD611a+vLjKk+zEiDaFeol0HzosVDTy270wEz
         wCy4k4X4OJborVTn1wjJFH4blhhCEvvQiUKkxNDmmaTy24oH46pSJ+qu7HxDGl0T77bO
         pckq2CK4JhsdR2VmU6rSgYeVfQ2D2VjclW2F23jkMJVN3+/gwhsIQNGlYfi89Tuy96Ks
         Le7yJjtQCJRUS7p2ph3ljGYCd56wpDvyytjTjVEf5tkuCiKCAe1gSuyUQwMfzq1SDqDd
         l5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HKc6w3F44MKGXiOOHvhIp1w/DOfC/JosCic+YWr/JAE=;
        b=sDqWcjxivW6hDKT0t0E1gckpPo8yn5iAXfuwT/sbdta+1y+27c0daUkwFKAaWydKHw
         rTNzY0sgVbl5ubfKXounXNjLQFlE+rlVpzuBt7pHRA+C+xtm/uwPQY05oKWQmRSfgsGp
         bhXSv7qMY0RA44OW/SkevxEyAX+sCtozIQllAi8tzd3oI3qd6n7B/2RyxExNH05sUZg6
         Oj80myDQz0UzA9y/trVH+r5RZWkPSix2a7RBaanJKq2mitisbxanz8G8pFVldKHpiAiT
         tUatAUQlsGdbDgLWdu5h73O7f59Z7XEiH8YM5rB4fzeHTS1wVuSqutXZtxFVsyXQXoLu
         GDaA==
X-Gm-Message-State: AOAM530TBraVl9mvAkfZp2YEQWF/XYFzsgZCN4XX55Wc89zn/S/NihCr
        s1uCtRp0Z2zzT4qYEheTB2PKDX3Ea0CkMQ==
X-Google-Smtp-Source: ABdhPJxa4GpKXRHr1mYY6b7B7xLI/z3nSaINhrX0EGDzF6Lg8yIlhK2DcywV/l8mrWeFaTsPdK7L6A==
X-Received: by 2002:a17:90b:1245:: with SMTP id gx5mr1848434pjb.193.1600742226737;
        Mon, 21 Sep 2020 19:37:06 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:37:06 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 18/20] tools: gpio: port gpio-event-mon to v2 uAPI
Date:   Tue, 22 Sep 2020 10:31:49 +0800
Message-Id: <20200922023151.387447-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-event-mon tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 91 +++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 1a303a81aeef..b230af889f26 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -23,17 +23,16 @@
 #include <sys/ioctl.h>
 #include <sys/types.h>
 #include <linux/gpio.h>
+#include "gpio-utils.h"
 
 int monitor_device(const char *device_name,
 		   unsigned int line,
-		   uint32_t handleflags,
-		   uint32_t eventflags,
+		   struct gpio_v2_line_config *config,
 		   unsigned int loops)
 {
-	struct gpioevent_request req;
-	struct gpiohandle_data data;
+	struct gpio_v2_line_values values;
 	char *chrdev_name;
-	int fd;
+	int cfd, lfd;
 	int ret;
 	int i = 0;
 
@@ -41,44 +40,39 @@ int monitor_device(const char *device_name,
 	if (ret < 0)
 		return -ENOMEM;
 
-	fd = open(chrdev_name, 0);
-	if (fd == -1) {
+	cfd = open(chrdev_name, 0);
+	if (cfd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
 		goto exit_free_name;
 	}
 
-	req.lineoffset = line;
-	req.handleflags = handleflags;
-	req.eventflags = eventflags;
-	strcpy(req.consumer_label, "gpio-event-mon");
-
-	ret = ioctl(fd, GPIO_GET_LINEEVENT_IOCTL, &req);
-	if (ret == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to issue GET EVENT "
-			"IOCTL (%d)\n",
-			ret);
-		goto exit_close_error;
-	}
+	ret = gpiotools_request_line(device_name, &line, 1, config,
+				     "gpio-event-mon");
+	if (ret < 0)
+		goto exit_device_close;
+	else
+		lfd = ret;
 
 	/* Read initial states */
-	ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-	if (ret == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
-			"VALUES IOCTL (%d)\n",
+	values.mask = 1;
+	values.bits = 0;
+	ret = gpiotools_get_values(lfd, &values);
+	if (ret < 0) {
+		fprintf(stderr,
+			"Failed to issue GPIO LINE GET VALUES IOCTL (%d)\n",
 			ret);
-		goto exit_close_error;
+		goto exit_line_close;
 	}
 
 	fprintf(stdout, "Monitoring line %d on %s\n", line, device_name);
-	fprintf(stdout, "Initial line value: %d\n", data.values[0]);
+	fprintf(stdout, "Initial line value: %d\n",
+		gpiotools_test_bit(values.bits, 0));
 
 	while (1) {
-		struct gpioevent_data event;
+		struct gpio_v2_line_event event;
 
-		ret = read(req.fd, &event, sizeof(event));
+		ret = read(lfd, &event, sizeof(event));
 		if (ret == -1) {
 			if (errno == -EAGAIN) {
 				fprintf(stderr, "nothing available\n");
@@ -96,12 +90,14 @@ int monitor_device(const char *device_name,
 			ret = -EIO;
 			break;
 		}
-		fprintf(stdout, "GPIO EVENT %llu: ", event.timestamp);
+		fprintf(stdout, "GPIO EVENT at %llu on line %d (%d|%d) ",
+			event.timestamp_ns, event.offset, event.line_seqno,
+			event.seqno);
 		switch (event.id) {
-		case GPIOEVENT_EVENT_RISING_EDGE:
+		case GPIO_V2_LINE_EVENT_RISING_EDGE:
 			fprintf(stdout, "rising edge");
 			break;
-		case GPIOEVENT_EVENT_FALLING_EDGE:
+		case GPIO_V2_LINE_EVENT_FALLING_EDGE:
 			fprintf(stdout, "falling edge");
 			break;
 		default:
@@ -114,8 +110,11 @@ int monitor_device(const char *device_name,
 			break;
 	}
 
-exit_close_error:
-	if (close(fd) == -1)
+exit_line_close:
+	if (close(lfd) == -1)
+		perror("Failed to close line file");
+exit_device_close:
+	if (close(cfd) == -1)
 		perror("Failed to close GPIO character device file");
 exit_free_name:
 	free(chrdev_name);
@@ -140,15 +139,20 @@ void print_usage(void)
 	);
 }
 
+#define EDGE_FLAGS \
+	(GPIO_V2_LINE_FLAG_EDGE_RISING | \
+	 GPIO_V2_LINE_FLAG_EDGE_FALLING)
+
 int main(int argc, char **argv)
 {
 	const char *device_name = NULL;
 	unsigned int line = -1;
 	unsigned int loops = 0;
-	uint32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
-	uint32_t eventflags = 0;
+	struct gpio_v2_line_config config;
 	int c;
 
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIO_V2_LINE_FLAG_INPUT;
 	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
@@ -161,16 +165,16 @@ int main(int argc, char **argv)
 			line = strtoul(optarg, NULL, 10);
 			break;
 		case 'd':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
+			config.flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 			break;
 		case 's':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
+			config.flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 			break;
 		case 'r':
-			eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
+			config.flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
 			break;
 		case 'f':
-			eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
+			config.flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 			break;
 		case '?':
 			print_usage();
@@ -182,11 +186,10 @@ int main(int argc, char **argv)
 		print_usage();
 		return -1;
 	}
-	if (!eventflags) {
+	if (!(config.flags & EDGE_FLAGS)) {
 		printf("No flags specified, listening on both rising and "
 		       "falling edges\n");
-		eventflags = GPIOEVENT_REQUEST_BOTH_EDGES;
+		config.flags |= EDGE_FLAGS;
 	}
-	return monitor_device(device_name, line, handleflags,
-			      eventflags, loops);
+	return monitor_device(device_name, line, &config, loops);
 }
-- 
2.28.0

