Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3931920485B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732395AbgFWEDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732351AbgFWEDb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:31 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98069C061573;
        Mon, 22 Jun 2020 21:03:29 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j12so7240808pfn.10;
        Mon, 22 Jun 2020 21:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f46bZBD4e6qYGDuSCrF9VL17S8R8lt8hHRfX7ovPUUw=;
        b=mensVun8cUjbjXZHjt4ia9oNpkKAJr42pbvVudjdlVHjV6HVV4CHJIb3lTJYEIiBC8
         xhaoud3O4cWsn9Rk8b1Zef8zkMIjSdYPC7IDyx8jiP2a7BBzPRraV+4E87kwJ2Ydv7FP
         iFPfUulfrDL7AxvDC8/RDhlXS4xwuHZPo86oCmacuO6ZO4TYxX3waPOHcUXU+BK2PF88
         A0QRhmT6pWv1jGSZww8RNr239m69755ISdMrxfatOH27S71oG52KWvD7uDakjOf7Y15f
         Qz8Q3ozZbjKvHcv9hsgXZ2hFdEkiOR385cXU8UqWmRaGqeBsQr++MCajyY/WrClY7KyA
         bWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f46bZBD4e6qYGDuSCrF9VL17S8R8lt8hHRfX7ovPUUw=;
        b=BxeLEPAKgst4Gi43uJaq48uPXjnjITbArFzSsHwdj+q7CE9Hik1sQI/9Ws5vVcrW2P
         OjeZ+XGcOt97cj2Ap/t6rq5fmR6iAtFEpLcrLwHqpweQl45AB938+2RyZgIUWrVZ+3/t
         A1rziPiQPiNvMk6uEVvwgk2eGykMzXViBxsZiIFdoLhO6zriMStIpn8CPxpARdT0JOnV
         Of0rN4O3Zkp2HlB7cMCeCfap8gxXTT4XO5oxWM27e3eo6BxwBLcgGjrES/vuEkdwF4p2
         ahxVrS7b+jOolKFkM+zjxsOifO0pBum0da8j/JYHZRRO4dFdxf3yPV+L/oR/qiyG5+Ko
         nZfA==
X-Gm-Message-State: AOAM531/9ww+XgT4EUV+2T38WO2RvjrFckAI3YOHGAhde/k5VTSvttES
        fp1ttWbcAFj6atT2MxdHmNexuSBNg6s=
X-Google-Smtp-Source: ABdhPJwyNKV7MWXGg1GYvBtXINsUdxnHsMbogUnhLaz6ndxjlMcgXPsd8AwdHBD1ToFOvrn144+tgA==
X-Received: by 2002:a63:380d:: with SMTP id f13mr8610341pga.16.1592885008032;
        Mon, 22 Jun 2020 21:03:28 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:27 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 20/22] tools: gpio: switch tools to V2 uAPI
Date:   Tue, 23 Jun 2020 12:01:05 +0800
Message-Id: <20200623040107.22270-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update all the GPIO tools to use uAPI V2 instead of uAPI V1.
The tools command lines and behaviour remain unchanged, although lsgpio
now reports additional information not available through V1, specifically
the edge detection and debounce configuration.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 tools/gpio/gpio-event-mon.c |  91 ++++++++++++++---------------
 tools/gpio/gpio-hammer.c    |  28 +++++----
 tools/gpio/gpio-utils.c     | 107 ++++++++++++++++++----------------
 tools/gpio/gpio-utils.h     |  48 +++++++++++++---
 tools/gpio/gpio-watch.c     |  10 ++--
 tools/gpio/lsgpio.c         | 112 +++++++++++++++++-------------------
 6 files changed, 217 insertions(+), 179 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 30ed0e06f52a..d8d692f67b9e 100644
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
+		   struct gpioline_config *config,
 		   unsigned int loops)
 {
-	struct gpioevent_request req;
-	struct gpiohandle_data data;
+	struct gpioline_values values;
 	char *chrdev_name;
-	int fd;
+	int cfd, lfd;
 	int ret;
 	int i = 0;
 
@@ -41,44 +40,37 @@ int monitor_device(const char *device_name,
 	if (ret < 0)
 		return -ENOMEM;
 
-	fd = open(chrdev_name, 0);
-	if (fd == -1) {
+	cfd = open(chrdev_name, 0);
+	if (cfd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-		goto exit_close_error;
+		goto exit_free_name;
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
+		gpiotools_test_bit(values.bitmap, 0));
 
 	while (1) {
-		struct gpioevent_data event;
+		struct gpioline_event event;
 
-		ret = read(req.fd, &event, sizeof(event));
+		ret = read(lfd, &event, sizeof(event));
 		if (ret == -1) {
 			if (errno == -EAGAIN) {
 				fprintf(stderr, "nothing available\n");
@@ -96,12 +88,14 @@ int monitor_device(const char *device_name,
 			ret = -EIO;
 			break;
 		}
-		fprintf(stdout, "GPIO EVENT %llu: ", event.timestamp);
+		fprintf(stdout, "GPIO EVENT at %llu on line %d (%d|%d) ",
+			event.timestamp, event.offset, event.line_seqno,
+			event.seqno);
 		switch (event.id) {
-		case GPIOEVENT_EVENT_RISING_EDGE:
+		case GPIOLINE_EVENT_RISING_EDGE:
 			fprintf(stdout, "rising edge");
 			break;
-		case GPIOEVENT_EVENT_FALLING_EDGE:
+		case GPIOLINE_EVENT_FALLING_EDGE:
 			fprintf(stdout, "falling edge");
 			break;
 		default:
@@ -114,9 +108,13 @@ int monitor_device(const char *device_name,
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
+exit_free_name:
 	free(chrdev_name);
 	return ret;
 }
@@ -144,10 +142,12 @@ int main(int argc, char **argv)
 	const char *device_name = NULL;
 	unsigned int line = -1;
 	unsigned int loops = 0;
-	uint32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
-	uint32_t eventflags = 0;
+	struct gpioline_config config;
 	int c;
 
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_DIRECTION | GPIOLINE_FLAG_V2_EDGE_DETECTION;
+	config.direction = GPIOLINE_DIRECTION_INPUT;
 	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
@@ -160,16 +160,18 @@ int main(int argc, char **argv)
 			line = strtoul(optarg, NULL, 10);
 			break;
 		case 'd':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
+			config.flags |= GPIOLINE_FLAG_V2_DRIVE;
+			config.drive = GPIOLINE_DRIVE_OPEN_DRAIN;
 			break;
 		case 's':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
+			config.flags |= GPIOLINE_FLAG_V2_DRIVE;
+			config.drive = GPIOLINE_DRIVE_OPEN_SOURCE;
 			break;
 		case 'r':
-			eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
+			config.edge_detection |= GPIOLINE_EDGE_RISING;
 			break;
 		case 'f':
-			eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
+			config.edge_detection |= GPIOLINE_EDGE_FALLING;
 			break;
 		case '?':
 			print_usage();
@@ -181,11 +183,10 @@ int main(int argc, char **argv)
 		print_usage();
 		return -1;
 	}
-	if (!eventflags) {
+	if (!config.edge_detection) {
 		printf("No flags specified, listening on both rising and "
 		       "falling edges\n");
-		eventflags = GPIOEVENT_REQUEST_BOTH_EDGES;
+		config.edge_detection = GPIOLINE_EDGE_BOTH;
 	}
-	return monitor_device(device_name, line, handleflags,
-			      eventflags, loops);
+	return monitor_device(device_name, line, &config, loops);
 }
diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 9fd926e8cb52..d517ff7d5646 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -25,23 +25,26 @@
 int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 		  unsigned int loops)
 {
-	struct gpiohandle_data data;
+	struct gpioline_values values;
+	struct gpioline_config config;
 	char swirr[] = "-\\|/";
 	int fd;
 	int ret;
 	int i, j;
 	unsigned int iteration = 0;
 
-	memset(&data.values, 0, sizeof(data.values));
-	ret = gpiotools_request_linehandle(device_name, lines, nlines,
-					   GPIOHANDLE_REQUEST_OUTPUT, &data,
-					   "gpio-hammer");
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_DIRECTION;
+	config.direction = GPIOLINE_DIRECTION_OUTPUT;
+
+	ret = gpiotools_request_line(device_name, lines, nlines,
+				     &config, "gpio-hammer");
 	if (ret < 0)
 		goto exit_error;
 	else
 		fd = ret;
 
-	ret = gpiotools_get_values(fd, &data);
+	ret = gpiotools_get_values(fd, &values);
 	if (ret < 0)
 		goto exit_close_error;
 
@@ -53,7 +56,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	}
 	fprintf(stdout, "] on %s, initial states: [", device_name);
 	for (i = 0; i < nlines; i++) {
-		fprintf(stdout, "%d", data.values[i]);
+		fprintf(stdout, "%d", gpiotools_test_bit(values.bitmap, i));
 		if (i != (nlines - 1))
 			fprintf(stdout, ", ");
 	}
@@ -64,14 +67,14 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	while (1) {
 		/* Invert all lines so we blink */
 		for (i = 0; i < nlines; i++)
-			data.values[i] = !data.values[i];
+			gpiotools_change_bit(values.bitmap, i);
 
-		ret = gpiotools_set_values(fd, &data);
+		ret = gpiotools_set_values(fd, &values);
 		if (ret < 0)
 			goto exit_close_error;
 
 		/* Re-read values to get status */
-		ret = gpiotools_get_values(fd, &data);
+		ret = gpiotools_get_values(fd, &values);
 		if (ret < 0)
 			goto exit_close_error;
 
@@ -82,7 +85,8 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 
 		fprintf(stdout, "[");
 		for (i = 0; i < nlines; i++) {
-			fprintf(stdout, "%d: %d", lines[i], data.values[i]);
+			fprintf(stdout, "%d: %d", lines[i],
+				gpiotools_test_bit(values.bitmap, i));
 			if (i != (nlines - 1))
 				fprintf(stdout, ", ");
 		}
@@ -97,7 +101,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	ret = 0;
 
 exit_close_error:
-	gpiotools_release_linehandle(fd);
+	gpiotools_release_line(fd);
 exit_error:
 	return ret;
 }
diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 06003789e7c7..5f2ff0f1e4e6 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -33,34 +33,33 @@
  * release these lines.
  */
 /**
- * gpiotools_request_linehandle() - request gpio lines in a gpiochip
+ * gpiotools_request_line() - request gpio lines in a gpiochip
  * @device_name:	The name of gpiochip without prefix "/dev/",
  *			such as "gpiochip0"
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @nline:		The number of lines to request.
- * @flag:		The new flag for requsted gpio. Reference
- *			"linux/gpio.h" for the meaning of flag.
+ * @config:		The new config for requested gpio. Reference
+ *			"linux/gpio.h" for config details.
  * @data:		Default value will be set to gpio when flag is
  *			GPIOHANDLE_REQUEST_OUTPUT.
- * @consumer_label:	The name of consumer, such as "sysfs",
+ * @consumer:		The name of consumer, such as "sysfs",
  *			"powerkey". This is useful for other users to
  *			know who is using.
  *
  * Request gpio lines through the ioctl provided by chardev. User
  * could call gpiotools_set_values() and gpiotools_get_values() to
  * read and write respectively through the returned fd. Call
- * gpiotools_release_linehandle() to release these lines after that.
+ * gpiotools_release_line() to release these lines after that.
  *
  * Return:		On success return the fd;
  *			On failure return the errno.
  */
-int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
-				 unsigned int nlines, unsigned int flag,
-				 struct gpiohandle_data *data,
-				 const char *consumer_label)
+int gpiotools_request_line(const char *device_name, unsigned int *lines,
+			   unsigned int nlines, struct gpioline_config *config,
+			   const char *consumer)
 {
-	struct gpiohandle_request req;
+	struct gpioline_request req;
 	char *chrdev_name;
 	int fd;
 	int i;
@@ -75,45 +74,44 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s, %s\n",
 			chrdev_name, strerror(errno));
-		goto exit_close_error;
+		goto exit_free_name;
 	}
 
+	memset(&req, 0, sizeof(req));
 	for (i = 0; i < nlines; i++)
-		req.lineoffsets[i] = lines[i];
+		req.offsets[i] = lines[i];
 
-	req.flags = flag;
-	strcpy(req.consumer_label, consumer_label);
-	req.lines = nlines;
-	if (flag & GPIOHANDLE_REQUEST_OUTPUT)
-		memcpy(req.default_values, data, sizeof(req.default_values));
+	req.config = *config;
+	strcpy(req.consumer, consumer);
+	req.num_lines = nlines;
 
-	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
+	ret = ioctl(fd, GPIO_GET_LINE_IOCTL, &req);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
-			"GPIO_GET_LINEHANDLE_IOCTL", ret, strerror(errno));
+			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
 	}
 
-exit_close_error:
 	if (close(fd) == -1)
 		perror("Failed to close GPIO character device file");
+exit_free_name:
 	free(chrdev_name);
 	return ret < 0 ? ret : req.fd;
 }
 /**
  * gpiotools_set_values(): Set the value of gpio(s)
  * @fd:			The fd returned by
- *			gpiotools_request_linehandle().
- * @data:		The array of values want to set.
+ *			gpiotools_request_line().
+ * @values:		The array of values want to set.
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
-int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
+int gpiotools_set_values(const int fd, struct gpioline_values *values)
 {
 	int ret;
 
-	ret = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, data);
+	ret = ioctl(fd, GPIOLINE_SET_VALUES_IOCTL, values);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
@@ -127,17 +125,17 @@ int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
 /**
  * gpiotools_get_values(): Get the value of gpio(s)
  * @fd:			The fd returned by
- *			gpiotools_request_linehandle().
- * @data:		The array of values get from hardware.
+ *			gpiotools_request_line().
+ * @values:		The array of values get from hardware.
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
-int gpiotools_get_values(const int fd, struct gpiohandle_data *data)
+int gpiotools_get_values(const int fd, struct gpioline_values *values)
 {
 	int ret;
 
-	ret = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, data);
+	ret = ioctl(fd, GPIOLINE_GET_VALUES_IOCTL, values);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
@@ -149,14 +147,14 @@ int gpiotools_get_values(const int fd, struct gpiohandle_data *data)
 }
 
 /**
- * gpiotools_release_linehandle(): Release the line(s) of gpiochip
+ * gpiotools_release_line(): Release the line(s) of gpiochip
  * @fd:			The fd returned by
- *			gpiotools_request_linehandle().
+ *			gpiotools_request_line().
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
-int gpiotools_release_linehandle(const int fd)
+int gpiotools_release_line(const int fd)
 {
 	int ret;
 
@@ -180,11 +178,11 @@ int gpiotools_release_linehandle(const int fd)
  */
 int gpiotools_get(const char *device_name, unsigned int line)
 {
-	struct gpiohandle_data data;
+	struct gpioline_values values;
 	unsigned int lines[] = {line};
 
-	gpiotools_gets(device_name, lines, 1, &data);
-	return data.values[0];
+	gpiotools_gets(device_name, lines, 1, &values);
+	return values.bitmap[0] & 1;
 }
 
 
@@ -195,27 +193,30 @@ int gpiotools_get(const char *device_name, unsigned int line)
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @nline:		The number of lines to request.
- * @data:		The array of values get from gpiochip.
+ * @values:		The array of values get from gpiochip.
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
 int gpiotools_gets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data)
+		   unsigned int nlines, struct gpioline_values *values)
 {
 	int fd;
 	int ret;
 	int ret_close;
+	struct gpioline_config config;
 
-	ret = gpiotools_request_linehandle(device_name, lines, nlines,
-					   GPIOHANDLE_REQUEST_INPUT, data,
-					   CONSUMER);
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_DIRECTION;
+	config.direction = GPIOLINE_DIRECTION_INPUT;
+	ret = gpiotools_request_line(device_name, lines, nlines,
+				     &config, CONSUMER);
 	if (ret < 0)
 		return ret;
 
 	fd = ret;
-	ret = gpiotools_get_values(fd, data);
-	ret_close = gpiotools_release_linehandle(fd);
+	ret = gpiotools_get_values(fd, values);
+	ret_close = gpiotools_release_line(fd);
 	return ret < 0 ? ret : ret_close;
 }
 
@@ -232,11 +233,13 @@ int gpiotools_gets(const char *device_name, unsigned int *lines,
 int gpiotools_set(const char *device_name, unsigned int line,
 		  unsigned int value)
 {
-	struct gpiohandle_data data;
+	struct gpioline_values values;
 	unsigned int lines[] = {line};
 
-	data.values[0] = value;
-	return gpiotools_sets(device_name, lines, 1, &data);
+	memset(&values, 0, sizeof(values));
+	if (value)
+		values.bitmap[0] |= 1;
+	return gpiotools_sets(device_name, lines, 1, &values);
 }
 
 /**
@@ -246,22 +249,26 @@ int gpiotools_set(const char *device_name, unsigned int line,
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @nline:		The number of lines to request.
- * @data:		The array of values set to gpiochip, must be
+ * @value:		The array of values set to gpiochip, must be
  *			0(low) or 1(high).
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
 int gpiotools_sets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data)
+		   unsigned int nlines, struct gpioline_values *values)
 {
 	int ret;
+	struct gpioline_config config;
 
-	ret = gpiotools_request_linehandle(device_name, lines, nlines,
-					   GPIOHANDLE_REQUEST_OUTPUT, data,
-					   CONSUMER);
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_DIRECTION;
+	config.direction = GPIOLINE_DIRECTION_OUTPUT;
+	config.values = *values;
+	ret = gpiotools_request_line(device_name, lines, nlines,
+				     &config, CONSUMER);
 	if (ret < 0)
 		return ret;
 
-	return gpiotools_release_linehandle(ret);
+	return gpiotools_release_line(ret);
 }
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
index cf37f13f3dcb..9357765b6b79 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -12,7 +12,9 @@
 #ifndef _GPIO_UTILS_H_
 #define _GPIO_UTILS_H_
 
+#include <stdbool.h>
 #include <string.h>
+#include <linux/types.h>
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
@@ -22,20 +24,48 @@ static inline int check_prefix(const char *str, const char *prefix)
 		strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
-int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
-				 unsigned int nlines, unsigned int flag,
-				 struct gpiohandle_data *data,
-				 const char *consumer_label);
-int gpiotools_set_values(const int fd, struct gpiohandle_data *data);
-int gpiotools_get_values(const int fd, struct gpiohandle_data *data);
-int gpiotools_release_linehandle(const int fd);
+int gpiotools_request_line(const char *device_name, unsigned int *lines,
+			   unsigned int nlines, struct gpioline_config *config,
+			   const char *consumer_label);
+int gpiotools_set_values(const int fd, struct gpioline_values *values);
+int gpiotools_get_values(const int fd, struct gpioline_values *values);
+int gpiotools_release_line(const int fd);
 
 int gpiotools_get(const char *device_name, unsigned int line);
 int gpiotools_gets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data);
+		   unsigned int nlines, struct gpioline_values *values);
 int gpiotools_set(const char *device_name, unsigned int line,
 		  unsigned int value);
 int gpiotools_sets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data);
+		   unsigned int nlines, struct gpioline_values *values);
+
+/* helper functions for gpioline_values bitmap bits */
+static inline void gpiotools_set_bit(__u64 b[], int n)
+{
+	b[n>>6] |= 1UL << (n%64);
+}
+
+static inline void gpiotools_change_bit(__u64 b[], int n)
+{
+	b[n>>6] ^= 1UL << (n%64);
+}
+
+static inline void gpiotools_clear_bit(__u64 b[], int n)
+{
+	b[n>>6] &= ~(1UL << (n%64));
+}
+
+static inline int gpiotools_test_bit(__u64 b[], int n)
+{
+	return !!(b[n>>6] & 1 <<  (n%64));
+}
+
+static inline void gpiotools_assign_bit(__u64 b[], int n, bool value)
+{
+	if (value)
+		gpiotools_set_bit(b, n);
+	else
+		gpiotools_clear_bit(b, n);
+}
 
 #endif /* _GPIO_UTILS_H_ */
diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index 5cea24fddfa7..0dd5a04ab250 100644
--- a/tools/gpio/gpio-watch.c
+++ b/tools/gpio/gpio-watch.c
@@ -21,8 +21,8 @@
 
 int main(int argc, char **argv)
 {
-	struct gpioline_info_changed chg;
-	struct gpioline_info req;
+	struct gpioline_info_changed_v2 chg;
+	struct gpioline_info_v2 req;
 	struct pollfd pfd;
 	int fd, i, j, ret;
 	char *event, *end;
@@ -40,11 +40,11 @@ int main(int argc, char **argv)
 	for (i = 0, j = 2; i < argc - 2; i++, j++) {
 		memset(&req, 0, sizeof(req));
 
-		req.line_offset = strtoul(argv[j], &end, 0);
+		req.offset = strtoul(argv[j], &end, 0);
 		if (*end != '\0')
 			goto err_usage;
 
-		ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_IOCTL, &req);
+		ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_V2_IOCTL, &req);
 		if (ret) {
 			perror("unable to set up line watch");
 			return EXIT_FAILURE;
@@ -87,7 +87,7 @@ int main(int argc, char **argv)
 			}
 
 			printf("line %u: %s at %llu\n",
-			       chg.info.line_offset, event, chg.timestamp);
+			       chg.info.offset, event, chg.timestamp);
 		}
 	}
 
diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 8a71ad36f83b..0fd6adbb7de3 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -23,58 +23,53 @@
 
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
+static void print_config(struct gpioline_config *config)
 {
-	int i;
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
+	if (config->flags & GPIOLINE_FLAG_V2_USED) {
+		fprintf(stdout, field_format, "used");
+		field_format = ", %s";
+	}
+
+	if (config->direction == GPIOLINE_DIRECTION_OUTPUT)
+		fprintf(stdout, field_format, "output");
+	else
+		fprintf(stdout, field_format, "input");
+
+	field_format = ", %s";
+
+	if (config->flags & GPIOLINE_FLAG_V2_ACTIVE_LOW)
+		fprintf(stdout, field_format, "active-low");
+
+	if (config->flags & GPIOLINE_FLAG_V2_DRIVE) {
+		if (config->drive == GPIOLINE_DRIVE_OPEN_DRAIN)
+			fprintf(stdout, field_format, "open-drain");
+		else if (config->drive == GPIOLINE_DRIVE_OPEN_SOURCE)
+			fprintf(stdout, field_format, "open-source");
+	}
+
+	if (config->flags & GPIOLINE_FLAG_V2_BIAS) {
+		if (config->bias == GPIOLINE_BIAS_DISABLED)
+			fprintf(stdout, field_format, "bias-disabled");
+		else if (config->bias == GPIOLINE_BIAS_PULL_UP)
+			fprintf(stdout, field_format, "pull-up");
+		else if (config->bias == GPIOLINE_BIAS_PULL_DOWN)
+			fprintf(stdout, field_format, "pull-down");
+	}
+
+	if (config->flags & GPIOLINE_FLAG_V2_EDGE_DETECTION) {
+		if (config->edge_detection == GPIOLINE_EDGE_BOTH)
+			fprintf(stdout, field_format, "both-edges");
+		else if (config->edge_detection == GPIOLINE_EDGE_RISING)
+			fprintf(stdout, field_format, "rising-edge");
+		else if (config->edge_detection == GPIOLINE_EDGE_FALLING)
+			fprintf(stdout, field_format, "falling-edge");
+	}
+
+	if (config->debounce_period) {
+		fprintf(stdout, ", debounce_period=%dusec",
+			config->debounce_period);
 	}
 }
 
@@ -94,7 +89,7 @@ int list_device(const char *device_name)
 	if (fd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-		goto exit_close_error;
+		goto exit_free_name;
 	}
 
 	/* Inspect this GPIO chip */
@@ -109,18 +104,18 @@ int list_device(const char *device_name)
 
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
@@ -129,9 +124,9 @@ int list_device(const char *device_name)
 			fprintf(stdout, " \"%s\"", linfo.consumer);
 		else
 			fprintf(stdout, " unused");
-		if (linfo.flags) {
+		if (linfo.config.flags) {
 			fprintf(stdout, " [");
-			print_flags(linfo.flags);
+			print_config(&linfo.config);
 			fprintf(stdout, "]");
 		}
 		fprintf(stdout, "\n");
@@ -141,6 +136,7 @@ int list_device(const char *device_name)
 exit_close_error:
 	if (close(fd) == -1)
 		perror("Failed to close GPIO character device file");
+exit_free_name:
 	free(chrdev_name);
 	return ret;
 }
-- 
2.27.0

