Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B049F3CAD9E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 22:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343790AbhGOUNi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 16:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343805AbhGOUNA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 16:13:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0D1C061767
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k4so9320713wrc.8
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GQHT9sYOHLp0/eUog0CpJJpFZ9Bs9jPNWEkLf94mgh8=;
        b=CZ6Z2biHdUa/V+oAuIqpPjKk+GOkGp/u385DXN4H1IB3b42uM4LZL3e7ilQFtiGPiA
         YisI+z2I84Fg15fteDAwFqafS3YC5NxYvKJQRr4Mr0bR6hHCC3Lm+gepyJ+rtCe6fQTP
         TfgK12kkKcN3WRTekOMfb18HD6lqvD6SHw3E3Z3g1+OSSvz2YVEdjj/MCwE8EvdbuiwG
         LZHPXmm1RPyVHoXyAkc8hj+vXLwooFs2R0uPRIY2AeBA8W9wn7UY2PQBg8mYdgiPX5jn
         6y1ViR1Xi0QQ8CKazIB9xQkgYMYihNCEFddhVCqLsL38CDsQ37tebJSnZnaxl9QqFhPs
         11hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GQHT9sYOHLp0/eUog0CpJJpFZ9Bs9jPNWEkLf94mgh8=;
        b=AWkOOKxudTQHxFGJ/+7prxGVIEl2HEmOm/sbTiTlmnfwniWeFRSdGpma12/lglc19i
         vLouBT/qTX3C4ZN1dUEhCjMT3v7EyikmoFWnyTALnKiQaZVFzIBxBOT3zVEBTDGi2vSO
         yWJ56jQideNRsMoPfbwbezJnZTTZtvobwQKQiLGfvF1t5F1wd3lGzRmQ6atMVhsZCU6D
         xHeMGq983b5kHfx9Pdgr59clK3oieLAwZBsUhlKhPaxf+ayXpOiPaeLJ4cuCeiezC/E6
         YueEiIvTkGCIfHj2Vgz57RYMG6ALSRIy5vo4Wx4kAIdRsbR5VLuAF2dRlumu5iaFkFgf
         T5VA==
X-Gm-Message-State: AOAM530pFj3WLFJlch6b6QzQjXuCFcYdn6I2LYU19TuOxHGtoZtROxBp
        NGO+y0ek13G0k8Lx8ZVjXSd91Q==
X-Google-Smtp-Source: ABdhPJwCh2u9oOum4WxU6mzsRdJJugBbUrFWCMq56V8HefU4O57tFboNHcsihALXIyrrKD01GeCyiw==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr7846576wrs.236.1626379804620;
        Thu, 15 Jul 2021 13:10:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id m32sm8860986wms.23.2021.07.15.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 13:10:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v2 2/3] API: extend the line request functionality
Date:   Thu, 15 Jul 2021 22:10:00 +0200
Message-Id: <20210715201001.23726-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210715201001.23726-1-brgl@bgdev.pl>
References: <20210715201001.23726-1-brgl@bgdev.pl>
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

