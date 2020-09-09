Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB60262D19
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgIIK2u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbgIIK2r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3740AC061756;
        Wed,  9 Sep 2020 03:28:47 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l191so1755317pgd.5;
        Wed, 09 Sep 2020 03:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUdV44j+aZOh9NjfP0p2CTGZmk4MYDgkv51zw4YvHxk=;
        b=R71SFSuicwyBKJXqZmJ0ZrK/k+lcEyOzwQgkd9j+OYaIA2QdBlaXqEo3Srvh7VfPxE
         MViGUKtmHGLIRB+HOL7g8KPoRVQVmCZ9/B3xJ147X8MfAlVb9VBJSKh4hl4ZTUN5HZvL
         XaMwNR9w2ecP8fcq07DtSf2qbncS5K6rCbnTyblx8huy9nThz94U7nk8LVjnrzVFf+4l
         y01pHKeAf4q4BZPuoVDdENXHVPsQA7U+g7xpV3GaZwAotDnmPrhNQ1ivzBeG4+kVlA2v
         JXxfma318e4dBtXeY+qHGPM8+2S1Uhn7DEER99nUwlF61AD2s+7suDguqfmwr/KbhUnJ
         fBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUdV44j+aZOh9NjfP0p2CTGZmk4MYDgkv51zw4YvHxk=;
        b=is03A4f+2MNe5xHFoH3XtcPHj+6L6ZX++k8CD7yiAqq0YDVGyEsy4Djoa4kC0vf4+1
         6Fn2BijFP3pX/sce9O5yzb7EblCIt9pX8C5eYq2uTy8cHuAmzbTx0vfULU9Edz7IuQ1k
         8UTwjn5W1+iBbVlNownk4Iq+08Ae1eFMg79pAgvIa7cum0e770heAC74dxzj7T825qlL
         3fsJxu/y5OUE0cy28hIE95ps571gCUQicYzkh2gpzrWghiPr5d8RjW8GhmKcWRlvEpJO
         xVKa05ejWnYZCtvWmbH+BQ8+S7OFzkYPfF1UetD3dW+poFpX1qh1q7cS5AlQeem74cQy
         f8CQ==
X-Gm-Message-State: AOAM530hbVRcFTQkHigtU2d19wx/ap4E8hw9XHYqwILyo7xx7QPrt9kN
        gv3D2FzjBNtDheDuwkXW8gbmqYGJTPg=
X-Google-Smtp-Source: ABdhPJwliJttOow+lJGe7XvhT0m9RSr3eG4SftOb9oKlLxZzPhaNhJ4IxkXt6QxEjmJViWaohIRGyQ==
X-Received: by 2002:a63:24c2:: with SMTP id k185mr102255pgk.415.1599647326095;
        Wed, 09 Sep 2020 03:28:46 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:45 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 17/20] tools: gpio: port gpio-hammer to v2 uAPI
Date:   Wed,  9 Sep 2020 18:26:37 +0800
Message-Id: <20200909102640.1657622-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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

