Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10ED257245
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgHaDYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgHaDYQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:24:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23646C061573;
        Sun, 30 Aug 2020 20:24:16 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so3803525pfb.6;
        Sun, 30 Aug 2020 20:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B32Dv5Raw6pqsytedEB7eSywyX272NyDde93Ip5JzyQ=;
        b=U77xNZZnGio3U2otCWj6//mk5HCxCAwXAupNYqfUHyaqf1Htxa9q+vnDbrnwnTSebm
         EPPy9bbdwT/pczZAXKi/IFMoYnzVdRUT33ZwdMHC8B3pCohsiKZE4e7cYRII7stIt2aA
         KtRHklCEg1ySsVCbggJZ+3em8orybJ9i8H3JHg5FWe3cr3FbwsPe4tA5uASTDi5Jf6er
         qBrI6DOW9cL2baokRJbhmsaRGNd3ubK2H/eFivDINdPmVVYQCHjVbwyjOBY3mpYjZTWf
         ogzNLlpq/f2yKSgVEkbHnt/xS5G3EWfxG3dsD94kqijpcN9QBfgzJxu9ljJxf9yUXM/O
         VuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B32Dv5Raw6pqsytedEB7eSywyX272NyDde93Ip5JzyQ=;
        b=QY6IHGR9RpSTZrlKetks5txYSF+B7sSnpBLHNoogV4idjXM3x5TuSRx07WgEj3BSaW
         zY3l6psAqJUTW1qAqQkvMZvGyK6t866Gl6ZccV1BuvU8hlEBcd5c1oUR30LGSoqK6uVJ
         DaTq/wL6b+Asl8mrqCYKhJNI1im/HxtqFmlXNvthvcmJuNbFkxs2IVi8L9yKy72+GFvA
         Nm6pY4sULqxxd5R5IndsJ2c9STdgOHDj8FHBE0gKVgows2h1ArHtydbp3N1L0bRDQ2Lx
         mmFtfzoWVjqf82MKCJ//5N7GwHA1OCjLhht20HsXBUda2+eDvAoEusN7K60nmBkQQKYM
         8zRQ==
X-Gm-Message-State: AOAM530DsxTYgRKNezr7E3TLJa1gGFqR3p7eiakIEMx5niveR7zygy0s
        p2Wvh1zwJuYDShXci4C1LfUQ3Z6Kcg8=
X-Google-Smtp-Source: ABdhPJwtPMbUYLnCZXzIUlZI6iA4QauAuZHdII+RZ5Yb6liYcIf8PE/7qlhyXM5t9f1xyNso4uVHqg==
X-Received: by 2002:a62:53c2:: with SMTP id h185mr7696130pfb.53.1598844255061;
        Sun, 30 Aug 2020 20:24:15 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:24:14 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 17/20] tools: gpio: port gpio-hammer to v2 uAPI
Date:   Mon, 31 Aug 2020 11:20:03 +0800
Message-Id: <20200831032006.1019978-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-hammer tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-hammer.c |  32 +++++++----
 tools/gpio/gpio-utils.c  | 119 ++++++++++++++++++++++-----------------
 tools/gpio/gpio-utils.h  |  50 +++++++++++++---
 3 files changed, 128 insertions(+), 73 deletions(-)

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
index d527980bcb94..68edc1a329e2 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -33,34 +33,32 @@
  * release these lines.
  */
 /**
- * gpiotools_request_linehandle() - request gpio lines in a gpiochip
+ * gpiotools_request_line() - request gpio lines in a gpiochip
  * @device_name:	The name of gpiochip without prefix "/dev/",
  *			such as "gpiochip0"
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @num_lines:		The number of lines to request.
- * @flag:		The new flag for requsted gpio. Reference
- *			"linux/gpio.h" for the meaning of flag.
- * @data:		Default value will be set to gpio when flag is
- *			GPIOHANDLE_REQUEST_OUTPUT.
- * @consumer_label:	The name of consumer, such as "sysfs",
+ * @config:		The new config for requested gpio. Reference
+ *			"linux/gpio.h" for config details.
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
-				 unsigned int num_lines, unsigned int flag,
-				 struct gpiohandle_data *data,
-				 const char *consumer_label)
+int gpiotools_request_line(const char *device_name, unsigned int *lines,
+			   unsigned int num_lines,
+			   struct gpio_v2_line_config *config,
+			   const char *consumer)
 {
-	struct gpiohandle_request req;
+	struct gpio_v2_line_request req;
 	char *chrdev_name;
 	int fd;
 	int i;
@@ -78,20 +76,19 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 		goto exit_free_name;
 	}
 
+	memset(&req, 0, sizeof(req));
 	for (i = 0; i < num_lines; i++)
-		req.lineoffsets[i] = lines[i];
+		req.offsets[i] = lines[i];
 
-	req.flags = flag;
-	strcpy(req.consumer_label, consumer_label);
-	req.lines = num_lines;
-	if (flag & GPIOHANDLE_REQUEST_OUTPUT)
-		memcpy(req.default_values, data, sizeof(req.default_values));
+	req.config = *config;
+	strcpy(req.consumer, consumer);
+	req.num_lines = num_lines;
 
-	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
+	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
-			"GPIO_GET_LINEHANDLE_IOCTL", ret, strerror(errno));
+			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
 	}
 
 	if (close(fd) == -1)
@@ -103,17 +100,17 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
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
@@ -127,17 +124,17 @@ int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
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
@@ -149,14 +146,14 @@ int gpiotools_get_values(const int fd, struct gpiohandle_data *data)
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
 
@@ -180,11 +177,14 @@ int gpiotools_release_linehandle(const int fd)
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
 
 
@@ -195,27 +195,35 @@ int gpiotools_get(const char *device_name, unsigned int line)
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
 
@@ -232,11 +240,9 @@ int gpiotools_gets(const char *device_name, unsigned int *lines,
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
@@ -246,22 +252,31 @@ int gpiotools_set(const char *device_name, unsigned int line,
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
index 324729577865..58c93a90add6 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -12,7 +12,9 @@
 #ifndef _GPIO_UTILS_H_
 #define _GPIO_UTILS_H_
 
+#include <stdbool.h>
 #include <string.h>
+#include <linux/types.h>
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
@@ -22,20 +24,50 @@ static inline int check_prefix(const char *str, const char *prefix)
 		strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
-int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
-				 unsigned int num_lines, unsigned int flag,
-				 struct gpiohandle_data *data,
-				 const char *consumer_label);
-int gpiotools_set_values(const int fd, struct gpiohandle_data *data);
-int gpiotools_get_values(const int fd, struct gpiohandle_data *data);
-int gpiotools_release_linehandle(const int fd);
+int gpiotools_request_line(const char *device_name,
+			   unsigned int *lines,
+			   unsigned int num_lines,
+			   struct gpio_v2_line_config *config,
+			   const char *consumer);
+int gpiotools_set_values(const int fd, struct gpio_v2_line_values *values);
+int gpiotools_get_values(const int fd, struct gpio_v2_line_values *values);
+int gpiotools_release_line(const int fd);
 
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

