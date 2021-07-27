Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5C13D7892
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhG0OeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhG0OeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:34:05 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E29C061757
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 07:34:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b7so15475888wri.8
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GQHT9sYOHLp0/eUog0CpJJpFZ9Bs9jPNWEkLf94mgh8=;
        b=K1+uxKEtuB9mviNJe/RPcWUBPyAMiU7GGKpoZbXOVNQ/JKyDWIig2ngsinM/NewZfW
         pLPpIkoBg+SFV/l52guAYdTySkr9TUbwoYhWdfZnGPQnPkMbgSNm0DMBipHY4eZBhV/R
         Y2o9XBGmJB9Sd5BaMmvJo5+/J+8hZB8mD2N9DbDvZD86TZn3amAS1aF1MvojVJbZF76G
         +U2FpBvuHrLFnF2KiGllBO6qZvJZVEvLSMW46iitls9v/0c+9uRomFiJhWV4Z0hju5LD
         BQsY+kchB0Kg0XdkezY+R2eLrC9Twiol5jXsyB9KTp2ZqbM5BgjIeMw2yEyb5Jd1p0ie
         iTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GQHT9sYOHLp0/eUog0CpJJpFZ9Bs9jPNWEkLf94mgh8=;
        b=X4U5uZUDCK1CS9rY/OY6qTn7B4YdDnIbI39j+cjlxvmTOXWK2X8rJfPmhNyX3NjsKz
         oID1adYYNuFYhmvzWrpIQkonh5THP5pa9X9+ln4kHrcR7IAHhbNm3ysNf1ZsmrZvYPf9
         fp+XX6nzVdpEDmzKi6Ijte0Y0hmdJ+BlDAptzWDcC58MK7FWXJ+zP385UXujhNpkqbjj
         5zlmV5FtXv8b6eMbilTBB2iL5B/0UrQjTkSZwEpMsbOcGZ9IbcsF2MnZaVG8Wualx9fA
         h/ZY6qq7EWdxcb1wS9gSQVq9mSPCKA8Ce39rE6yCX+FI1fdcqGegyAyWM5ak4FA0qtrY
         ZaWg==
X-Gm-Message-State: AOAM531M2TWg6IEALKZGJn/nb7Z7g2aupnrWIVSr2D/bM4noKBj0MdAP
        SvTqMLxPZM6L2LuwcK0mNuTlvg==
X-Google-Smtp-Source: ABdhPJxQBeAWzHFtRV+uvPyGbpmUFHZrIjJ/jGtdl68W+aUZLPbv6ql6R/VjgbmM4HKVaSExV+SjHg==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr4784964wrk.353.1627396443131;
        Tue, 27 Jul 2021 07:34:03 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm3782729wrm.86.2021.07.27.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 07:34:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v3 2/3] API: extend the line request functionality
Date:   Tue, 27 Jul 2021 16:33:59 +0200
Message-Id: <20210727143400.32543-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210727143400.32543-1-brgl@bgdev.pl>
References: <20210727143400.32543-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds new public functions for interacting with line request objects.
First we implement getters for the number of lines in a request and for
the array of offsets of requested lines. Next we rename the existing
gpiod_line_request_get/set_values() functions to
gpiod_line_request_get/set_values_subset() and add new functions that are
named gpiod_line_request_get/set_values() but allow to get/set the values
of all requested lines.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h    | 54 ++++++++++++++++++++++++++++++++++++++++------
 lib/line-request.c | 50 +++++++++++++++++++++++++++++++++---------
 tools/gpioget.c    |  3 +--
 3 files changed, 89 insertions(+), 18 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 8fc20ed..51e93be 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -814,6 +814,22 @@ gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
  */
 void gpiod_line_request_release(struct gpiod_line_request *request);
 
+/**
+ * @brief Get the number of lines in this request.
+ * @param request Line request object.
+ * @return Number of requested lines.
+ */
+unsigned int gpiod_line_request_get_num_lines(struct gpiod_line_request *request);
+
+/**
+ * @brief Get the hardware offsets of lines in this request.
+ * @param request Line request object.
+ * @param offsets Array to store offsets in. Must hold at least the number of
+ *                lines returned by ::gpiod_line_request_get_num_lines.
+ */
+void gpiod_line_request_get_offsets(struct gpiod_line_request *request,
+				    unsigned int *offsets);
+
 /**
  * @brief Read the value of a single line associated with this request.
  * @param request Line request object.
@@ -824,7 +840,7 @@ int gpiod_line_request_get_value(struct gpiod_line_request *request,
 				 unsigned int offset);
 
 /**
- * @brief Read values of lines associated with this request.
+ * @brief Read values of a subset of lines associated with this request.
  * @param request GPIO line request.
  * @param num_lines Number of lines for which to read values.
  * @param offsets Array of offsets corresponding with the lines associated with
@@ -832,9 +848,23 @@ int gpiod_line_request_get_value(struct gpiod_line_request *request,
  * @param values Array in which the values will be stored.
  * @return 0 on success, -1 on failure.
  */
+int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
+					 unsigned num_lines,
+					 const unsigned int *offsets,
+					 int *values);
+
+/**
+ * @brief Read values of all lines associated with this request.
+ * @param request GPIO line request.
+ * @param values Array in which the values will be stored. Must hold at least
+ *               the number of lines returned by
+ *               ::gpiod_line_request_get_num_lines. The index of each value
+ *               will be associated with the offset at the same index in the
+ *               offset array returned by ::gpiod_line_request_get_offsets.
+ * @return 0 on success, -1 on failure.
+ */
 int gpiod_line_request_get_values(struct gpiod_line_request *request,
-				  unsigned num_lines,
-				  const unsigned int *offsets, int *values);
+				  int *values);
 
 /**
  * @brief Set the value of a single line associated with this request.
@@ -846,7 +876,7 @@ int gpiod_line_request_set_value(struct gpiod_line_request *request,
 				 unsigned int offset, int value);
 
 /**
- * @brief Set values of lines associated with this line request.
+ * @brief Set values of a subset of lines associated with this line request.
  * @param request GPIO line request.
  * @param num_lines Number of lines for which to set values.
  * @param offsets Array of offsets corresponding with the lines associated with
@@ -855,9 +885,21 @@ int gpiod_line_request_set_value(struct gpiod_line_request *request,
  *               correspond with the offsets in the previous argument.
  * @return 0 on success, -1 on failure.
  */
+int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
+					 unsigned int num_lines,
+					 const unsigned int *offsets,
+					 const int *values);
+
+/**
+ * @brief Set values of all lines associated with this request.
+ * @param request GPIO line request.
+ * @param values Array containing the values to set. Must hold at least the
+ *               number of lines returned by ::gpiod_line_request_get_num_lines.
+ *               The index of each value be associated with the offset at the
+ *               same index in the offset array returned by
+ *               ::gpiod_line_request_get_offsets.
+ */
 int gpiod_line_request_set_values(struct gpiod_line_request *request,
-				  unsigned int num_lines,
-				  const unsigned int *offsets,
 				  const int *values);
 
 /**
diff --git a/lib/line-request.c b/lib/line-request.c
index 6cbb08a..8008b89 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -45,13 +45,27 @@ GPIOD_API void gpiod_line_request_release(struct gpiod_line_request *request)
 	free(request);
 }
 
+GPIOD_API unsigned int
+gpiod_line_request_get_num_lines(struct gpiod_line_request *request)
+{
+	return request->num_lines;
+}
+
+GPIOD_API void
+gpiod_line_request_get_offsets(struct gpiod_line_request *request,
+			       unsigned int *offsets)
+{
+	memcpy(offsets, request->offsets,
+	       sizeof(*offsets) * request->num_lines);
+}
+
 GPIOD_API int gpiod_line_request_get_value(struct gpiod_line_request *request,
 					   unsigned int offset)
 {
 	unsigned int ret;
 	int val;
 
-	ret = gpiod_line_request_get_values(request, 1, &offset, &val);
+	ret = gpiod_line_request_get_values_subset(request, 1, &offset, &val);
 	if (ret)
 		return -1;
 
@@ -71,10 +85,10 @@ static int offset_to_bit(struct gpiod_line_request *request,
 	return -1;
 }
 
-GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
-					    unsigned num_lines,
-					    const unsigned int *offsets,
-					    int *values)
+GPIOD_API int
+gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
+				     unsigned num_lines,
+				     const unsigned int *offsets, int *values)
 {
 	struct gpio_v2_line_values buf;
 	uint64_t mask = 0, bits = 0;
@@ -119,16 +133,25 @@ GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
 	return 0;
 }
 
+GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
+					    int *values)
+{
+	return gpiod_line_request_get_values_subset(request, request->num_lines,
+						    request->offsets, values);
+}
+
 GPIOD_API int gpiod_line_request_set_value(struct gpiod_line_request *request,
 					   unsigned int offset, int value)
 {
-	return gpiod_line_request_set_values(request, 1, &offset, &value);
+	return gpiod_line_request_set_values_subset(request, 1,
+						    &offset, &value);
 }
 
-GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
-					    unsigned int num_lines,
-					    const unsigned int *offsets,
-					    const int *values)
+GPIOD_API int
+gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
+				     unsigned int num_lines,
+				     const unsigned int *offsets,
+				     const int *values)
 {
 	struct gpio_v2_line_values buf;
 	uint64_t mask = 0, bits = 0;
@@ -153,6 +176,13 @@ GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
 	return ioctl(request->fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &buf);
 }
 
+GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
+					    const int *values)
+{
+	return gpiod_line_request_set_values_subset(request, request->num_lines,
+						    request->offsets, values);
+}
+
 GPIOD_API int
 gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 				     struct gpiod_line_config *config)
diff --git a/tools/gpioget.c b/tools/gpioget.c
index e0c630d..afa2ccb 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -129,8 +129,7 @@ int main(int argc, char **argv)
 	if (!request)
 		die_perror("unable to request lines");
 
-	ret = gpiod_line_request_get_values(request, num_lines,
-					    offsets, values);
+	ret = gpiod_line_request_get_values(request, values);
 	if (ret)
 		die_perror("unable to read GPIO line values");
 
-- 
2.30.1

