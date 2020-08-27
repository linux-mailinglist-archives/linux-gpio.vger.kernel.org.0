Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6A5254667
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgH0OFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgH0OEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:04:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDACC061235;
        Thu, 27 Aug 2020 07:03:54 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w186so3434475pgb.8;
        Thu, 27 Aug 2020 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b4qnERya2lAXwivmnc6QYVo0ihib6LVkWcetGyot3Rg=;
        b=P7GDRiRWVTmnSNbfwIKt0W/sJZFwCI4kQKF3mFhoM/7UXvvszItARCfCIuVkG19Uvn
         y9q+nyrYk6/o4U78SNTqytOD1yCJtjmGvSeiRxkEtQ+KHH8fAW7+tDnEoMLMk19uKdl4
         W6YcqVgETVn/YhUUHIoWOy6+ErhoCK8rIGkhYJvVd/9J7iNJEn7DQ6sv5IHJYClvFFXL
         Rcc5YllJU8KQXqPb4DR7bNnKFxt2dtfYhSi6KD4gewbTKDsvkt8DCUWf+en2uAmpu54T
         y19Pn1mSWqIPeI/KA+0thYpuf5F+++tYiLhSpMGJe0rozyh6DBvFiJsNcTv+ZJg5Jd6L
         JCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b4qnERya2lAXwivmnc6QYVo0ihib6LVkWcetGyot3Rg=;
        b=iJMIlAuZHfH9rN/prBBS8zxVLrnLbzp9Ii6LaxYwBEbYE80YG0bIDkGkC7SaG4v3UQ
         355pxMvaQ3AKYhJWKjhmx/FbukfBzfYOhbm3rBmd5Usrn+D8ppUWBYpYnjfm4acr58JO
         +URfIt5/ZxQWrufUzvm9zuY3Oc++nCC6H4Cc6aJCPwszQ7CiSEXBzfBWY6oF+vWDkm9i
         ZLFkN8uUjukTUx6Re0reyF02/11Y4WvsIzNzIsK90r1FAta8Z+hROFZZPw3IrYmH/nWu
         eVAlFdoDQ5kb1xkHLIoBb+hNn+5UanYDejhA/yYCmExYWeMN8Sqy7IjctRE1maeoQKGD
         9WCQ==
X-Gm-Message-State: AOAM533g57a48+qL40lSV8GGUUEepSeoB3FKd6PSC/t4mmUo2J2EV6Hh
        YjK6z7st+9rDs/OIwqVE5WHmK74o/Fs=
X-Google-Smtp-Source: ABdhPJyiZf9WFcjl2wpM6uqmcdHuVX1FilJ+BdCpopf9df0EHQzBcYsj7SQQqvbROgQ7Bn4/pxwqww==
X-Received: by 2002:a63:584a:: with SMTP id i10mr15233166pgm.315.1598537033405;
        Thu, 27 Aug 2020 07:03:53 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:03:52 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 16/20] tools: gpio: rename nlines to num_lines
Date:   Thu, 27 Aug 2020 22:00:16 +0800
Message-Id: <20200827140020.159627-17-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename nlines to num_lines to be consistent with other usage for fields
describing the number of entries in an array.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-hammer.c | 26 +++++++++++++-------------
 tools/gpio/gpio-utils.c  | 20 ++++++++++----------
 tools/gpio/gpio-utils.h  |  6 +++---
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 9fd926e8cb52..a2c7577fad5c 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -22,7 +22,7 @@
 #include <linux/gpio.h>
 #include "gpio-utils.h"
 
-int hammer_device(const char *device_name, unsigned int *lines, int nlines,
+int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 		  unsigned int loops)
 {
 	struct gpiohandle_data data;
@@ -33,7 +33,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	unsigned int iteration = 0;
 
 	memset(&data.values, 0, sizeof(data.values));
-	ret = gpiotools_request_linehandle(device_name, lines, nlines,
+	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
 					   GPIOHANDLE_REQUEST_OUTPUT, &data,
 					   "gpio-hammer");
 	if (ret < 0)
@@ -46,15 +46,15 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 		goto exit_close_error;
 
 	fprintf(stdout, "Hammer lines [");
-	for (i = 0; i < nlines; i++) {
+	for (i = 0; i < num_lines; i++) {
 		fprintf(stdout, "%d", lines[i]);
-		if (i != (nlines - 1))
+		if (i != (num_lines - 1))
 			fprintf(stdout, ", ");
 	}
 	fprintf(stdout, "] on %s, initial states: [", device_name);
-	for (i = 0; i < nlines; i++) {
+	for (i = 0; i < num_lines; i++) {
 		fprintf(stdout, "%d", data.values[i]);
-		if (i != (nlines - 1))
+		if (i != (num_lines - 1))
 			fprintf(stdout, ", ");
 	}
 	fprintf(stdout, "]\n");
@@ -63,7 +63,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 	j = 0;
 	while (1) {
 		/* Invert all lines so we blink */
-		for (i = 0; i < nlines; i++)
+		for (i = 0; i < num_lines; i++)
 			data.values[i] = !data.values[i];
 
 		ret = gpiotools_set_values(fd, &data);
@@ -81,9 +81,9 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 			j = 0;
 
 		fprintf(stdout, "[");
-		for (i = 0; i < nlines; i++) {
+		for (i = 0; i < num_lines; i++) {
 			fprintf(stdout, "%d: %d", lines[i], data.values[i]);
-			if (i != (nlines - 1))
+			if (i != (num_lines - 1))
 				fprintf(stdout, ", ");
 		}
 		fprintf(stdout, "]\r");
@@ -121,7 +121,7 @@ int main(int argc, char **argv)
 	const char *device_name = NULL;
 	unsigned int lines[GPIOHANDLES_MAX];
 	unsigned int loops = 0;
-	int nlines;
+	int num_lines;
 	int c;
 	int i;
 
@@ -158,11 +158,11 @@ int main(int argc, char **argv)
 		return -1;
 	}
 
-	nlines = i;
+	num_lines = i;
 
-	if (!device_name || !nlines) {
+	if (!device_name || !num_lines) {
 		print_usage();
 		return -1;
 	}
-	return hammer_device(device_name, lines, nlines, loops);
+	return hammer_device(device_name, lines, num_lines, loops);
 }
diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 16a5d9cb9da2..d527980bcb94 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -38,7 +38,7 @@
  *			such as "gpiochip0"
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
- * @nline:		The number of lines to request.
+ * @num_lines:		The number of lines to request.
  * @flag:		The new flag for requsted gpio. Reference
  *			"linux/gpio.h" for the meaning of flag.
  * @data:		Default value will be set to gpio when flag is
@@ -56,7 +56,7 @@
  *			On failure return the errno.
  */
 int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
-				 unsigned int nlines, unsigned int flag,
+				 unsigned int num_lines, unsigned int flag,
 				 struct gpiohandle_data *data,
 				 const char *consumer_label)
 {
@@ -78,12 +78,12 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 		goto exit_free_name;
 	}
 
-	for (i = 0; i < nlines; i++)
+	for (i = 0; i < num_lines; i++)
 		req.lineoffsets[i] = lines[i];
 
 	req.flags = flag;
 	strcpy(req.consumer_label, consumer_label);
-	req.lines = nlines;
+	req.lines = num_lines;
 	if (flag & GPIOHANDLE_REQUEST_OUTPUT)
 		memcpy(req.default_values, data, sizeof(req.default_values));
 
@@ -194,20 +194,20 @@ int gpiotools_get(const char *device_name, unsigned int line)
  *			such as "gpiochip0".
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
- * @nline:		The number of lines to request.
+ * @num_lines:		The number of lines to request.
  * @data:		The array of values get from gpiochip.
  *
  * Return:		On success return 0;
  *			On failure return the errno.
  */
 int gpiotools_gets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data)
+		   unsigned int num_lines, struct gpiohandle_data *data)
 {
 	int fd;
 	int ret;
 	int ret_close;
 
-	ret = gpiotools_request_linehandle(device_name, lines, nlines,
+	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
 					   GPIOHANDLE_REQUEST_INPUT, data,
 					   CONSUMER);
 	if (ret < 0)
@@ -245,7 +245,7 @@ int gpiotools_set(const char *device_name, unsigned int line,
  *			such as "gpiochip0".
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
- * @nline:		The number of lines to request.
+ * @num_lines:		The number of lines to request.
  * @data:		The array of values set to gpiochip, must be
  *			0(low) or 1(high).
  *
@@ -253,11 +253,11 @@ int gpiotools_set(const char *device_name, unsigned int line,
  *			On failure return the errno.
  */
 int gpiotools_sets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data)
+		   unsigned int num_lines, struct gpiohandle_data *data)
 {
 	int ret;
 
-	ret = gpiotools_request_linehandle(device_name, lines, nlines,
+	ret = gpiotools_request_linehandle(device_name, lines, num_lines,
 					   GPIOHANDLE_REQUEST_OUTPUT, data,
 					   CONSUMER);
 	if (ret < 0)
diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
index cf37f13f3dcb..324729577865 100644
--- a/tools/gpio/gpio-utils.h
+++ b/tools/gpio/gpio-utils.h
@@ -23,7 +23,7 @@ static inline int check_prefix(const char *str, const char *prefix)
 }
 
 int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
-				 unsigned int nlines, unsigned int flag,
+				 unsigned int num_lines, unsigned int flag,
 				 struct gpiohandle_data *data,
 				 const char *consumer_label);
 int gpiotools_set_values(const int fd, struct gpiohandle_data *data);
@@ -32,10 +32,10 @@ int gpiotools_release_linehandle(const int fd);
 
 int gpiotools_get(const char *device_name, unsigned int line);
 int gpiotools_gets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data);
+		   unsigned int num_lines, struct gpiohandle_data *data);
 int gpiotools_set(const char *device_name, unsigned int line,
 		  unsigned int value);
 int gpiotools_sets(const char *device_name, unsigned int *lines,
-		   unsigned int nlines, struct gpiohandle_data *data);
+		   unsigned int num_lines, struct gpiohandle_data *data);
 
 #endif /* _GPIO_UTILS_H_ */
-- 
2.28.0

