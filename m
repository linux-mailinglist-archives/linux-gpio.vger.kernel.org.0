Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A9E2738C8
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbgIVChA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIVCg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:36:59 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84DCC061755;
        Mon, 21 Sep 2020 19:36:59 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so744655pjb.0;
        Mon, 21 Sep 2020 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUdV44j+aZOh9NjfP0p2CTGZmk4MYDgkv51zw4YvHxk=;
        b=OY6ZzWbW227SAZlaNjPyBjkAMad1mjpXzP/EL6uc17edPYdM6RJ4QInGYMVT0V1Gx/
         t137iACzUWlgiPqtJ1NAAwhrydWIUOt6yOLbiXqosvaB0azikOIB46iA8GV64lM+BGmM
         Skj6zvLdGyWA6a3Awr44OLoXXt9bdJ3oRTtz1bvuXpF1aLH9hIkFFJZ+et80c94geIb9
         DOXTJQ9xU7UwRDtsdGCEmpLBVo6t67RHsU+eKhlZo3a7Y+KMSK1yU+zjAfdxByX96zQ0
         AkV/EPREoLxJ9sb1pudHZX2g1MCennwbrZN7aMqlRmcoGnCFJh7VH6tOFCS9bOimPBQR
         eOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUdV44j+aZOh9NjfP0p2CTGZmk4MYDgkv51zw4YvHxk=;
        b=QGqAzn6+WMvEVDqsPWrP/tcxkvxqmiKJqYRRLz5pukw6q5TnzMYDH37xMmcbG1NtUD
         /42aApaXD/DFOjJWyzT/5KtLBPbHe//1JeX+bO9R2+kjIfNo3T8M1z30LrkfYWNaB/oq
         HIizRqDfcO9auErQ5CwDzr1e+aPSXhAUTsuobHPncVGPnwJmVAAIOyTuWc6zzG7fjyyi
         UHgujkugNeS4fnzkw40Guwr9Il+fsp4GEFjasy0ziH0uax1+ohqkxr+GdGfWQjBqjJ8r
         wqhFpSmCkoXWMAXtyS+Cyq6/mjiB6qvOG6jsHNmtsJNyPg/Y7fSD6P9tq0M5yOWPtf8H
         vc/A==
X-Gm-Message-State: AOAM530T1Xh5XM6WTbWhKUYrEaMxKtgfNZLowViwoyn/f7OgPTF1LlD0
        DbUadU/6OpUPnZKggrd/E1iuBem/toaXxg==
X-Google-Smtp-Source: ABdhPJwj7zkaGYwjMvFPv6ka2AnmX2yiAudhU4RrfVtt5ITCdDmtQw/Xq6TagP47YLb0tHFMN33QiA==
X-Received: by 2002:a17:90b:889:: with SMTP id bj9mr1950441pjb.101.1600742218688;
        Mon, 21 Sep 2020 19:36:58 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:36:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 17/20] tools: gpio: port gpio-hammer to v2 uAPI
Date:   Tue, 22 Sep 2020 10:31:48 +0800
Message-Id: <20200922023151.387447-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-hammer tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-hammer.c |  32 +++++---
 tools/gpio/gpio-utils.c  | 164 ++++++++++++++++++++++++++++++++-------
 tools/gpio/gpio-utils.h  |  46 ++++++++++-
 3 files changed, 197 insertions(+), 45 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index a2c7577fad5c..54fdf59dd320 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -25,23 +25,30 @@
 int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 		  unsigned int loops)
 {
-	struct gpiohandle_data data;
+	struct gpio_v2_line_values values;
+	struct gpio_v2_line_config config;
 	char swirr[] = "-\\|/";
 	int fd;
 	int ret;
 	int i, j;
 	unsigned int iteration = 0;
 
-	memset(&data.values, 0, sizeof(data.values));
-	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
-					   GPIOHANDLE_REQUEST_OUTPUT, &data,
-					   "gpio-hammer");
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIO_V2_LINE_FLAG_OUTPUT;
+
+	ret = gpiotools_request_line(device_name, lines, num_lines,
+				     &config, "gpio-hammer");
 	if (ret < 0)
 		goto exit_error;
 	else
 		fd = ret;
 
-	ret = gpiotools_get_values(fd, &data);
+	values.mask = 0;
+	values.bits = 0;
+	for (i = 0; i < num_lines; i++)
+		gpiotools_set_bit(&values.mask, i);
+
+	ret = gpiotools_get_values(fd, &values);
 	if (ret < 0)
 		goto exit_close_error;
 
@@ -53,7 +60,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 	}
 	fprintf(stdout, "] on %s, initial states: [", device_name);
 	for (i = 0; i < num_lines; i++) {
-		fprintf(stdout, "%d", data.values[i]);
+		fprintf(stdout, "%d", gpiotools_test_bit(values.bits, i));
 		if (i != (num_lines - 1))
 			fprintf(stdout, ", ");
 	}
@@ -64,14 +71,14 @@ int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 	while (1) {
 		/* Invert all lines so we blink */
 		for (i = 0; i < num_lines; i++)
-			data.values[i] = !data.values[i];
+			gpiotools_change_bit(&values.bits, i);
 
-		ret = gpiotools_set_values(fd, &data);
+		ret = gpiotools_set_values(fd, &values);
 		if (ret < 0)
 			goto exit_close_error;
 
 		/* Re-read values to get status */
-		ret = gpiotools_get_values(fd, &data);
+		ret = gpiotools_get_values(fd, &values);
 		if (ret < 0)
 			goto exit_close_error;
 
@@ -82,7 +89,8 @@ int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 
 		fprintf(stdout, "[");
 		for (i = 0; i < num_lines; i++) {
-			fprintf(stdout, "%d: %d", lines[i], data.values[i]);
+			fprintf(stdout, "%d: %d", lines[i],
+				gpiotools_test_bit(values.bits, i));
 			if (i != (num_lines - 1))
 				fprintf(stdout, ", ");
 		}
@@ -97,7 +105,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 	ret = 0;
 
 exit_close_error:
-	gpiotools_release_linehandle(fd);
+	gpiotools_release_line(fd);
 exit_error:
 	return ret;
 }
diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index d527980bcb94..37187e056c8b 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -100,20 +100,87 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 	free(chrdev_name);
 	return ret < 0 ? ret : req.fd;
 }
+
+/**
+ * gpiotools_request_line() - request gpio lines in a gpiochip
+ * @device_name:	The name of gpiochip without prefix "/dev/",
+ *			such as "gpiochip0"
+ * @lines:		An array desired lines, specified by offset
+ *			index for the associated GPIO device.
+ * @num_lines:		The number of lines to request.
+ * @config:		The new config for requested gpio. Reference
+ *			"linux/gpio.h" for config details.
+ * @consumer:		The name of consumer, such as "sysfs",
+ *			"powerkey". This is useful for other users to
+ *			know who is using.
+ *
+ * Request gpio lines through the ioctl provided by chardev. User
+ * could call gpiotools_set_values() and gpiotools_get_values() to
+ * read and write respectively through the returned fd. Call
+ * gpiotools_release_line() to release these lines after that.
+ *
+ * Return:		On success return the fd;
+ *			On failure return the errno.
+ */
+int gpiotools_request_line(const char *device_name, unsigned int *lines,
+			   unsigned int num_lines,
+			   struct gpio_v2_line_config *config,
+			   const char *consumer)
+{
+	struct gpio_v2_line_request req;
+	char *chrdev_name;
+	int fd;
+	int i;
+	int ret;
+
+	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
+	if (ret < 0)
+		return -ENOMEM;
+
+	fd = open(chrdev_name, 0);
+	if (fd == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to open %s, %s\n",
+			chrdev_name, strerror(errno));
+		goto exit_free_name;
+	}
+
+	memset(&req, 0, sizeof(req));
+	for (i = 0; i < num_lines; i++)
+		req.offsets[i] = lines[i];
+
+	req.config = *config;
+	strcpy(req.consumer, consumer);
+	req.num_lines = num_lines;
+
+	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue %s (%d), %s\n",
+			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
+	}
+
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+exit_free_name:
+	free(chrdev_name);
+	return ret < 0 ? ret : req.fd;
+}
+
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
+int gpiotools_set_values(const int fd, struct gpio_v2_line_values *values)
 {
 	int ret;
 
-	ret = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, data);
+	ret = ioctl(fd, GPIO_V2_LINE_SET_VALUES_IOCTL, values);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
@@ -127,17 +194,17 @@ int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
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
+int gpiotools_get_values(const int fd, struct gpio_v2_line_values *values)
 {
 	int ret;
 
-	ret = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, data);
+	ret = ioctl(fd, GPIO_V2_LINE_GET_VALUES_IOCTL, values);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
@@ -169,6 +236,27 @@ int gpiotools_release_linehandle(const int fd)
 	return ret;
 }
 
+/**
+ * gpiotools_release_line(): Release the line(s) of gpiochip
+ * @fd:			The fd returned by
+ *			gpiotools_request_line().
+ *
+ * Return:		On success return 0;
+ *			On failure return the errno.
+ */
+int gpiotools_release_line(const int fd)
+{
+	int ret;
+
+	ret = close(fd);
+	if (ret == -1) {
+		perror("Failed to close GPIO LINE device file");
+		ret = -errno;
+	}
+
+	return ret;
+}
+
 /**
  * gpiotools_get(): Get value from specific line
  * @device_name:	The name of gpiochip without prefix "/dev/",
@@ -180,11 +268,14 @@ int gpiotools_release_linehandle(const int fd)
  */
 int gpiotools_get(const char *device_name, unsigned int line)
 {
-	struct gpiohandle_data data;
+	int ret;
+	unsigned int value;
 	unsigned int lines[] = {line};
 
-	gpiotools_gets(device_name, lines, 1, &data);
-	return data.values[0];
+	ret = gpiotools_gets(device_name, lines, 1, &value);
+	if (ret)
+		return ret;
+	return value;
 }
 
 
@@ -195,27 +286,35 @@ int gpiotools_get(const char *device_name, unsigned int line)
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @num_lines:		The number of lines to request.
- * @data:		The array of values get from gpiochip.
+ * @values:		The array of values get from gpiochip.
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
 int gpiotools_gets(const char *device_name, unsigned int *lines,
-		   unsigned int num_lines, struct gpiohandle_data *data)
+		   unsigned int num_lines, unsigned int *values)
 {
-	int fd;
+	int fd, i;
 	int ret;
 	int ret_close;
+	struct gpio_v2_line_config config;
+	struct gpio_v2_line_values lv;
 
-	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
-					   GPIOHANDLE_REQUEST_INPUT, data,
-					   CONSUMER);
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIO_V2_LINE_FLAG_INPUT;
+	ret = gpiotools_request_line(device_name, lines, num_lines,
+				     &config, CONSUMER);
 	if (ret < 0)
 		return ret;
 
 	fd = ret;
-	ret = gpiotools_get_values(fd, data);
-	ret_close = gpiotools_release_linehandle(fd);
+	for (i = 0; i < num_lines; i++)
+		gpiotools_set_bit(&lv.mask, i);
+	ret = gpiotools_get_values(fd, &lv);
+	if (!ret)
+		for (i = 0; i < num_lines; i++)
+			values[i] = gpiotools_test_bit(lv.bits, i);
+	ret_close = gpiotools_release_line(fd);
 	return ret < 0 ? ret : ret_close;
 }
 
@@ -232,11 +331,9 @@ int gpiotools_gets(const char *device_name, unsigned int *lines,
 int gpiotools_set(const char *device_name, unsigned int line,
 		  unsigned int value)
 {
-	struct gpiohandle_data data;
 	unsigned int lines[] = {line};
 
-	data.values[0] = value;
-	return gpiotools_sets(device_name, lines, 1, &data);
+	return gpiotools_sets(device_name, lines, 1, &value);
 }
 
 /**
@@ -246,22 +343,31 @@ int gpiotools_set(const char *device_name, unsigned int line,
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @num_lines:		The number of lines to request.
- * @data:		The array of values set to gpiochip, must be
+ * @value:		The array of values set to gpiochip, must be
  *			0(low) or 1(high).
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
 int gpiotools_sets(const char *device_name, unsigned int *lines,
-		   unsigned int num_lines, struct gpiohandle_data *data)
+		   unsigned int num_lines, unsigned int *values)
 {
-	int ret;
+	int ret, i;
+	struct gpio_v2_line_config config;
 
-	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
-					   GPIOHANDLE_REQUEST_OUTPUT, data,
-					   CONSUMER);
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIO_V2_LINE_FLAG_OUTPUT;
+	config.num_attrs = 1;
+	config.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+	for (i = 0; i < num_lines; i++) {
+		gpiotools_set_bit(&config.attrs[0].mask, i);
+		gpiotools_assign_bit(&config.attrs[0].attr.values,
+				     i, values[i]);
+	}
+	ret = gpiotools_request_line(device_name, lines, num_lines,
+				     &config, CONSUMER);
 	if (ret < 0)
 		return ret;
 
-	return gpiotools_release_linehandle(ret);
+	return gpiotools_release_line(ret);
 }
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
index 324729577865..f8ea4fac14d5 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -12,7 +12,9 @@
 #ifndef _GPIO_UTILS_H_
 #define _GPIO_UTILS_H_
 
+#include <stdbool.h>
 #include <string.h>
+#include <linux/types.h>
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
@@ -26,16 +28,52 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 				 unsigned int num_lines, unsigned int flag,
 				 struct gpiohandle_data *data,
 				 const char *consumer_label);
-int gpiotools_set_values(const int fd, struct gpiohandle_data *data);
-int gpiotools_get_values(const int fd, struct gpiohandle_data *data);
 int gpiotools_release_linehandle(const int fd);
 
+int gpiotools_request_line(const char *device_name,
+			   unsigned int *lines,
+			   unsigned int num_lines,
+			   struct gpio_v2_line_config *config,
+			   const char *consumer);
+int gpiotools_set_values(const int fd, struct gpio_v2_line_values *values);
+int gpiotools_get_values(const int fd, struct gpio_v2_line_values *values);
+int gpiotools_release_line(const int fd);
+
 int gpiotools_get(const char *device_name, unsigned int line);
 int gpiotools_gets(const char *device_name, unsigned int *lines,
-		   unsigned int num_lines, struct gpiohandle_data *data);
+		   unsigned int num_lines, unsigned int *values);
 int gpiotools_set(const char *device_name, unsigned int line,
 		  unsigned int value);
 int gpiotools_sets(const char *device_name, unsigned int *lines,
-		   unsigned int num_lines, struct gpiohandle_data *data);
+		   unsigned int num_lines, unsigned int *values);
+
+/* helper functions for gpio_v2_line_values bits */
+static inline void gpiotools_set_bit(__u64 *b, int n)
+{
+	*b |= 1ULL << n;
+}
+
+static inline void gpiotools_change_bit(__u64 *b, int n)
+{
+	*b ^= 1ULL << n;
+}
+
+static inline void gpiotools_clear_bit(__u64 *b, int n)
+{
+	*b &= ~(1ULL << n);
+}
+
+static inline int gpiotools_test_bit(__u64 b, int n)
+{
+	return !!(b & 1ULL << n);
+}
+
+static inline void gpiotools_assign_bit(__u64 *b, int n, bool value)
+{
+	if (value)
+		gpiotools_set_bit(b, n);
+	else
+		gpiotools_clear_bit(b, n);
+}
 
 #endif /* _GPIO_UTILS_H_ */
-- 
2.28.0

