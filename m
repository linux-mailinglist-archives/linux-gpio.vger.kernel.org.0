Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6AF262D1B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgIIK26 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729911AbgIIK2w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:52 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C0FC061573;
        Wed,  9 Sep 2020 03:28:51 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so1735185pfg.13;
        Wed, 09 Sep 2020 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NHFesHMh8urOzDGLF3BG3WK3USIsA8bYlNdGJPsk5Ng=;
        b=uFlp9Cxs5+TY72v4m/1WoOdT14cVf9T0+48/jnZ2/R1Y58+MErmFs5/Sk77ALZsHuc
         dduYgJJCbM7gNsP3DtRunXOBpjh+DxUWjYAJL/SfKcCso4Iu8r/ZZmfbBPVu5YCb5U46
         VXPTNBC4lGAKQw8RYpdOqk95WOL1F1a4a8GkNlE7tyts6gd8nQX4gYIr2tswFQpkRdWK
         RMSN2/LgA6ek2AOtTMBRYzTG61Zblb27uchg5GBHir2EaR12PjbBO6U+Fo3XLX1nNczT
         31Uuwr74GU++yRaGpsB0mlQWUFIdqgj3L/Wkl8vMmQbIQcOttdjdg5bL+IsPv+O7HalI
         oSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NHFesHMh8urOzDGLF3BG3WK3USIsA8bYlNdGJPsk5Ng=;
        b=n6/DCzGni7Os0PWiQ+1nMcysFWaXAlZQDeSdNkIL/LpmvoFuxAzazgV9kBZMMw+laN
         6nsetneEr6rEXOQ2neW09SbPUGeEiDULB8kN6fTiPUsZIbs2Z5AenqwB5hcmfoKrHr7E
         kjW+jLlgES2AuUJcV4vH4oui8cE1gGNfdP7BHxwXAATUQHarbw7vL+BqllUHKQnIb9P8
         KSwYqe+ZSdY9+XHw/9/xhyQVTVYN2yIXa+prHZq7/9rVrWC83ugRatul406103JBgIbX
         HuFSYakfecYlwc0Tv6dcv6oFvNb8TnLFN7u9haOdPwYRP8TRwK0VEYrKYed+XWIHmDob
         YBUw==
X-Gm-Message-State: AOAM533dOlgySk91k44OBMXO2hWMlZ9a6YWfKdGGGKwMTOS5DSSjHd5n
        FQSbhpX120fGMrTU08ltRhG+slR0Hmg=
X-Google-Smtp-Source: ABdhPJwTyXjSLfa4fBGNWgMAKSYmWKU0Js3ZbR3QAdY1ilR15/4TB2HWOguXLMf0EehvPqoYs+PCPQ==
X-Received: by 2002:a17:902:6ac6:b029:cf:85a7:8373 with SMTP id i6-20020a1709026ac6b02900cf85a78373mr365861plt.2.1599647330871;
        Wed, 09 Sep 2020 03:28:50 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:50 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 18/20] tools: gpio: port gpio-event-mon to v2 uAPI
Date:   Wed,  9 Sep 2020 18:26:38 +0800
Message-Id: <20200909102640.1657622-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

