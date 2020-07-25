Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DB722D4BE
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgGYEWj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DFEC0619D3;
        Fri, 24 Jul 2020 21:22:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w17so5594444ply.11;
        Fri, 24 Jul 2020 21:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcFL0C1HUXSdrqkFSylIGdqdnE1WMhzy+WpoNuLSl/Q=;
        b=YvPN1ZbudIp6A4WcgKD9LU8s5E+4l4k38slR0fAsywNvX2xhWEAJClnDHljFzvhnyZ
         4Y6G+c4tz6rJURIOYi8jNKLvY8Jt/eQKe6ssC8zlisII1LEK8Rfrd/iyS1cXevZBTcmu
         o3MpuAhbFY84IWem0Z07xOjC+HUYvdArfybtmJiYi48gveXFFgEyqD11PZrAeqU5qYRW
         3IT7JUzYtxua3uAxzHFTWQNosz8Y87dF2Ozttas3wj6YrQNDn15DbmWaiVBucLg8rcLs
         TcUU23Kmh5AOH9alZjCPAcspeMOc1+tio8VESokeemPeCGtdpuR+Tlcg3WICIlC6IHq2
         mA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcFL0C1HUXSdrqkFSylIGdqdnE1WMhzy+WpoNuLSl/Q=;
        b=HlwYPHJieOkZs2E60J8uqByDo1YXtnZ39VmO+w8R+EuA0ymLyOlPt5TUTDe2KDqfNU
         CyGlMaQFmcFA+ymEEsUHyjbLKJSgfWHwc+Jw6X2dwG2YIX/A1YLYenypMPyr6Mayi1n2
         GUhNeZVkm2PgR9OfWJhgSbPVQ4aXx1W/EWh6NG7isyu/tAtwiVaCMKd38ecB8JLt0I8B
         fbfuJI4LB4sHExVDNqeKaMWedHMJP/jBl+j8b4diwS1D+RRR2A1GkOretw5seiQVC1uA
         vu36mqKCft+3McHJeLU8PEm4Dl4MOqeJbfChsLhD6BMJApSx4pNhumz4Slsn+sTQZvM3
         b7ZQ==
X-Gm-Message-State: AOAM532ms8SsXrMUbQjcpf7MlkuEwiSPC/xPo2Z9JptkP+JOhYXsPnqR
        Oho8Fn7unsiMLO/tQi+bSTjDIETY
X-Google-Smtp-Source: ABdhPJwwqTL9em30fYoZrwjgrWvCnZSWtpesjX6RgqhUsYIxO7Fc0Bk8584OaBcmO/tuIOwL18IVAA==
X-Received: by 2002:a17:902:9001:: with SMTP id a1mr10952274plp.124.1595650958051;
        Fri, 24 Jul 2020 21:22:38 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 15/18] tools: gpio: port gpio-hammer to v2 uAPI
Date:   Sat, 25 Jul 2020 12:19:52 +0800
Message-Id: <20200725041955.9985-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-hammer tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-hammer.c |  27 +++++-----
 tools/gpio/gpio-utils.c  | 109 +++++++++++++++++++++------------------
 tools/gpio/gpio-utils.h  |  48 +++++++++++++----
 3 files changed, 112 insertions(+), 72 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 9fd926e8cb52..1ab58f8fc03e 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -25,23 +25,25 @@
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
+	config.flags = GPIOLINE_FLAG_V2_OUTPUT;
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
 
@@ -53,7 +55,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	}
 	fprintf(stdout, "] on %s, initial states: [", device_name);
 	for (i = 0; i < nlines; i++) {
-		fprintf(stdout, "%d", data.values[i]);
+		fprintf(stdout, "%d", gpiotools_test_bit(values.bits, i));
 		if (i != (nlines - 1))
 			fprintf(stdout, ", ");
 	}
@@ -64,14 +66,14 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	while (1) {
 		/* Invert all lines so we blink */
 		for (i = 0; i < nlines; i++)
-			data.values[i] = !data.values[i];
+			gpiotools_change_bit(values.bits, i);
 
-		ret = gpiotools_set_values(fd, &data);
+		ret = gpiotools_set_values(fd, &values);
 		if (ret < 0)
 			goto exit_close_error;
 
 		/* Re-read values to get status */
-		ret = gpiotools_get_values(fd, &data);
+		ret = gpiotools_get_values(fd, &values);
 		if (ret < 0)
 			goto exit_close_error;
 
@@ -82,7 +84,8 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 
 		fprintf(stdout, "[");
 		for (i = 0; i < nlines; i++) {
-			fprintf(stdout, "%d: %d", lines[i], data.values[i]);
+			fprintf(stdout, "%d: %d", lines[i],
+				gpiotools_test_bit(values.bits, i));
 			if (i != (nlines - 1))
 				fprintf(stdout, ", ");
 		}
@@ -97,7 +100,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	ret = 0;
 
 exit_close_error:
-	gpiotools_release_linehandle(fd);
+	gpiotools_release_line(fd);
 exit_error:
 	return ret;
 }
diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index d527980bcb94..435d4fc64644 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -33,34 +33,31 @@
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
+			   unsigned int num_lines, struct gpioline_config *config,
+			   const char *consumer)
 {
-	struct gpiohandle_request req;
+	struct gpioline_request req;
 	char *chrdev_name;
 	int fd;
 	int i;
@@ -78,20 +75,19 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
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
+	ret = ioctl(fd, GPIO_GET_LINE_IOCTL, &req);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
-			"GPIO_GET_LINEHANDLE_IOCTL", ret, strerror(errno));
+			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
 	}
 
 	if (close(fd) == -1)
@@ -103,17 +99,17 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
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
@@ -127,17 +123,17 @@ int gpiotools_set_values(const int fd, struct gpiohandle_data *data)
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
@@ -149,14 +145,14 @@ int gpiotools_get_values(const int fd, struct gpiohandle_data *data)
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
 
@@ -180,11 +176,11 @@ int gpiotools_release_linehandle(const int fd)
  */
 int gpiotools_get(const char *device_name, unsigned int line)
 {
-	struct gpiohandle_data data;
+	struct gpioline_values values;
 	unsigned int lines[] = {line};
 
-	gpiotools_gets(device_name, lines, 1, &data);
-	return data.values[0];
+	gpiotools_gets(device_name, lines, 1, &values);
+	return values.bits[0] & 1;
 }
 
 
@@ -195,27 +191,29 @@ int gpiotools_get(const char *device_name, unsigned int line)
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
+		   unsigned int num_lines, struct gpioline_values *values)
 {
 	int fd;
 	int ret;
 	int ret_close;
+	struct gpioline_config config;
 
-	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
-					   GPIOHANDLE_REQUEST_INPUT, data,
-					   CONSUMER);
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_INPUT;
+	ret = gpiotools_request_line(device_name, lines, num_lines,
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
 
@@ -232,11 +230,13 @@ int gpiotools_gets(const char *device_name, unsigned int *lines,
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
+		values.bits[0] |= 1;
+	return gpiotools_sets(device_name, lines, 1, &values);
 }
 
 /**
@@ -246,22 +246,29 @@ int gpiotools_set(const char *device_name, unsigned int line,
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
+		   unsigned int num_lines, struct gpioline_values *values)
 {
-	int ret;
+	int ret, i;
+	struct gpioline_config config;
 
-	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
-					   GPIOHANDLE_REQUEST_OUTPUT, data,
-					   CONSUMER);
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_OUTPUT;
+	config.num_attrs = 1;
+	for (i = 0; i < num_lines; i++)
+		gpiotools_set_bit(config.attrs[0].mask, i);
+	config.attrs[0].attr.id = GPIOLINE_ATTR_ID_OUTPUT_VALUES;
+	config.attrs[0].attr.values = *values;
+	ret = gpiotools_request_line(device_name, lines, num_lines,
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
-- 
2.27.0

