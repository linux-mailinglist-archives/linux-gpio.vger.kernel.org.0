Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344EB25E801
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgIENnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728661AbgIENjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:39:13 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3356AC061249;
        Sat,  5 Sep 2020 06:39:12 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id c3so2159127plz.5;
        Sat, 05 Sep 2020 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NHFesHMh8urOzDGLF3BG3WK3USIsA8bYlNdGJPsk5Ng=;
        b=fCDR8sfYkUYfiVSmRThHacmpT+uDNQNyCr/aDu+ZnnfmMCz/OcGP9bFJ6+NqijzOEB
         Lp5wLAWG52YY5Am2Etgs6Xfs2d13zAyO1cqrGC/vDD8ooRNJ/pRpRVNWoJ0S+3sFTKFA
         okEXNlJARPAA3caENjp9nu2eyAHe4q67w2oXLpOgMKfTrbvZLZoGrHhk8equ3jeOhTXt
         9NohRqZcXO8eJrzTr0R6Jiv0uTMGVSZWZAR+ICqGGSm2ExD7waSHKNgkPjGTpNJBAgnO
         u8M4RFHPiAX9w+Rt7WxRxPw5ilB9rwbi5bu/cu4cXZpdpq/rJ39rjKCcvlMha6uMZlPB
         a2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NHFesHMh8urOzDGLF3BG3WK3USIsA8bYlNdGJPsk5Ng=;
        b=UuVyZVBWvFaeR6oYf3cPXZX+1/B8IQLaiqsKM7cTjKt9F5rGTijgc9TPro8CyJZ1zc
         xONYVqZKujC49rMZNrJ/di5IU2wG93310hDg9VMf4mexBdcK8IjcBs1sbOZgQuOGHuEo
         8gF3CX9M+tY1P7KdCa8WRQ1uhaknwhFau2mvmWB6PXs0QzL60ktaw4U05sVes3b42wc+
         stPKRz5xhA3fehG0j19G2GjcNCTe5RrL/zrNOLgkmsI2CvE+j2q1U2L5lKRnfhuMvp+7
         2muHXSqlrBUikZP/0yVRVauwEmWzLcdCBecQbgvg0rj+vSIYYXvTk0OI5CFRaVqVIAb+
         YnTg==
X-Gm-Message-State: AOAM530+/9pzlfep1uUX4VZx7Knssb3+BH7kDSUqE06Z5xtZOHxXYd++
        BHFxUbGeeiGiKvymCh7eSSj1tS6nxmI=
X-Google-Smtp-Source: ABdhPJxjk/UXtepjV/oaBkeBA2lV09XP/ksUpWLeO2Z5gyjXPS/HeSqWDb+fKS3Pj1NHPFjbuvN7+A==
X-Received: by 2002:a17:902:ee0b:: with SMTP id z11mr12855106plb.268.1599313151278;
        Sat, 05 Sep 2020 06:39:11 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:39:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 18/20] tools: gpio: port gpio-event-mon to v2 uAPI
Date:   Sat,  5 Sep 2020 21:35:47 +0800
Message-Id: <20200905133549.24606-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-event-mon tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 91 +++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 1a303a81aeef..d6a831200c18 100644
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
+			event.timestamp, event.offset, event.line_seqno,
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

