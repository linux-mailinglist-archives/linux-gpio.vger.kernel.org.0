Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B98B4D1B93
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 16:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbiCHPXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 10:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiCHPXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 10:23:35 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD52A1A0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 07:22:36 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id x15so29068658wru.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MFpHAgFXJR4UYkwxkQ1B/SJkrtRscew00y6ZsXzHRus=;
        b=kZTPTXwDqxCVOnTDPqRHA9J2iVETH8NfPHBs3P5jEhCo5lkVgFJij1/c3Q3ZLXyDxQ
         OFB6BNHFfjjMaFRie+FJjiVaNf3Y5jCKPM/m+rORAnB7Py9U/d6sLhJOqCczGFcjUm8J
         Nm6JIE2Fwm8yP8Pt7yrt/I7aGFjdFfj5VNDUNGu+uyvijgP1S+gD8y21XKVebc+4S2n7
         7ymz7qUy4bFqNmTG0ZmyPiMi/kqAFfLKAqxUGHx9le9v/gMQCQQ1K9phj655WySJxAqf
         mfsWuL0cDqw7NtZLN4YX2lNUPxtV5+tcuKazbEZYYc1l/qu0rYz6XVt23ALhkLWL0XRi
         vqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MFpHAgFXJR4UYkwxkQ1B/SJkrtRscew00y6ZsXzHRus=;
        b=QMR7shFFHougw2sxvom0NDYK4eEcrasf+1SJxcAk9oOd2PkhBVkYhModOg0hgiMZvv
         K/z7HFLn0+ZCzS5Ik4MpiOa43zLESeqmliRc1D44uWlrd6P6yiORMtJn3qo0Ylt+SDck
         XHlviH/OUXqoTfEQHMmzGOWZK5zKE730EhNtPw7XcLbt4w133Xk6vR0VTXomoJkC3D9B
         ZWO2INGjGpW1IGMu2hKu/oy+oQb0lQrJSbiKv1MtmXK+iiSkKvgQn45UmSGJxmlccI6o
         xt8lJZwSnLhbvvZHTZQSfh05XnWMsNRuJ2E8Tq8uaB2LcuEUiwlx5bOCZSC7NRx91fci
         Xkhw==
X-Gm-Message-State: AOAM5307Cy5AGsrOFknKiletFOIWWHb+oXzznUdE1Ca49xnpt26g3OWO
        X8qwtG+/Uq5owsfa2/Qy/Yh6ACIzzJOGdw==
X-Google-Smtp-Source: ABdhPJy067LetEbP0zJmCGQsCt8ZzWDDH7DhEZJN7ePa3v/twPGzygxYEocNzF5JSEZC9CbPR95S3g==
X-Received: by 2002:a5d:6987:0:b0:1f0:16cb:db6b with SMTP id g7-20020a5d6987000000b001f016cbdb6bmr12976005wru.702.1646752955239;
        Tue, 08 Mar 2022 07:22:35 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d5006000000b0020374784350sm54959wrt.64.2022.03.08.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:22:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] treewide: use size_t where applicable
Date:   Tue,  8 Mar 2022 16:22:33 +0100
Message-Id: <20220308152233.493098-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

size_t is the unsigned integer type generally used whenever variables
define sizes, ranges and numbers of elements. Use it throughout the
C library wherever it makes sense.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h      | 30 +++++++++++++++---------------
 lib/chip.c           |  4 ++--
 lib/edge-event.c     | 12 ++++++------
 lib/internal.h       |  2 +-
 lib/line-config.c    |  4 ++--
 lib/line-request.c   | 10 +++++-----
 lib/request-config.c | 12 ++++++------
 tools/gpiodetect.c   |  2 +-
 tools/gpioget.c      |  3 ++-
 tools/gpioinfo.c     |  2 +-
 tools/gpiomon.c      |  4 ++--
 tools/gpioset.c      |  3 ++-
 12 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 0512a8f..e6a4645 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -9,6 +9,7 @@
 #define __LIBGPIOD_GPIOD_H__
 
 #include <stdbool.h>
+#include <stddef.h>
 #include <stdint.h>
 
 #ifdef __cplusplus
@@ -99,7 +100,7 @@ const char *gpiod_chip_get_path(struct gpiod_chip *chip);
  * @param chip GPIO chip object.
  * @return Number of GPIO lines.
  */
-unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
+size_t gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 
 /**
  * @brief Get the current snapshot of information about the line at given
@@ -940,7 +941,7 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
  *               the previous argument.
  */
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-					 unsigned int num_values,
+					 size_t num_values,
 					 const unsigned int *offsets,
 					 const int *values);
 
@@ -1016,8 +1017,7 @@ enum {
  * @param config Line config object.
  * @return Number of individual overridden settings.
  */
-unsigned int
-gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
+size_t gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
 
 /**
  * @brief Get the list of overridden offsets and the corresponding types of
@@ -1090,7 +1090,7 @@ gpiod_request_config_get_consumer(struct gpiod_request_config *config);
  *       accepted by the kernel (64 lines) are silently dropped.
  */
 void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				      unsigned int num_offsets,
+				      size_t num_offsets,
 				      const unsigned int *offsets);
 
 /**
@@ -1098,7 +1098,7 @@ void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
  * @param config Request config object.
  * @return Number of line offsets in this request config.
  */
-unsigned int
+size_t
 gpiod_request_config_get_num_offsets(struct gpiod_request_config *config);
 
 /**
@@ -1119,14 +1119,14 @@ void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
  */
 void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
-					   unsigned int event_buffer_size);
+					   size_t event_buffer_size);
 
 /**
  * @brief Get the edge event buffer size from this request config.
  * @param config Request config object.
  * @return Current edge event buffer size setting.
  */
-unsigned int
+size_t
 gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
 
 /**
@@ -1149,7 +1149,7 @@ void gpiod_line_request_release(struct gpiod_line_request *request);
  * @param request Line request object.
  * @return Number of requested lines.
  */
-unsigned int gpiod_line_request_get_num_lines(struct gpiod_line_request *request);
+size_t gpiod_line_request_get_num_lines(struct gpiod_line_request *request);
 
 /**
  * @brief Get the hardware offsets of lines in this request.
@@ -1179,7 +1179,7 @@ int gpiod_line_request_get_value(struct gpiod_line_request *request,
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
-					 unsigned num_lines,
+					 size_t num_lines,
 					 const unsigned int *offsets,
 					 int *values);
 
@@ -1216,7 +1216,7 @@ int gpiod_line_request_set_value(struct gpiod_line_request *request,
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
-					 unsigned int num_lines,
+					 size_t num_lines,
 					 const unsigned int *offsets,
 					 const int *values);
 
@@ -1272,7 +1272,7 @@ int gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
  */
 int gpiod_line_request_edge_event_read(struct gpiod_line_request *request,
 				       struct gpiod_edge_event_buffer *buffer,
-				       unsigned int max_events);
+				       size_t max_events);
 
 /**
  * @}
@@ -1361,7 +1361,7 @@ unsigned long gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event);
  *       capacity is larger than 1024, it will be limited to 1024.
  */
 struct gpiod_edge_event_buffer *
-gpiod_edge_event_buffer_new(unsigned int capacity);
+gpiod_edge_event_buffer_new(size_t capacity);
 
 /**
  * @brief Get the capacity (the max number of events that can be stored) of
@@ -1369,7 +1369,7 @@ gpiod_edge_event_buffer_new(unsigned int capacity);
  * @param buffer Edge event buffer.
  * @return The capacity of the buffer.
  */
-unsigned int
+size_t
 gpiod_edge_event_buffer_get_capacity(struct gpiod_edge_event_buffer *buffer);
 
 /**
@@ -1395,7 +1395,7 @@ gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
  * @param buffer Edge event buffer.
  * @return Number of events stored in this buffer.
  */
-unsigned int
+size_t
 gpiod_edge_event_buffer_get_num_events(struct gpiod_edge_event_buffer *buffer);
 
 /**
diff --git a/lib/chip.c b/lib/chip.c
index 74544f5..b881be1 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -15,7 +15,7 @@
 
 struct gpiod_chip {
 	int fd;
-	unsigned int num_lines;
+	size_t num_lines;
 	char name[32];
 	char label[32];
 	char *path;
@@ -105,7 +105,7 @@ GPIOD_API const char *gpiod_chip_get_path(struct gpiod_chip *chip)
 	return chip->path;
 }
 
-GPIOD_API unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip)
+GPIOD_API size_t gpiod_chip_get_num_lines(struct gpiod_chip *chip)
 {
 	return chip->num_lines;
 }
diff --git a/lib/edge-event.c b/lib/edge-event.c
index 69c0d96..8f993e8 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -21,8 +21,8 @@ struct gpiod_edge_event {
 };
 
 struct gpiod_edge_event_buffer {
-	unsigned int capacity;
-	unsigned int num_events;
+	size_t capacity;
+	size_t num_events;
 	struct gpiod_edge_event *events;
 	struct gpio_v2_line_event *event_data;
 };
@@ -79,7 +79,7 @@ gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event)
 }
 
 GPIOD_API struct gpiod_edge_event_buffer *
-gpiod_edge_event_buffer_new(unsigned int capacity)
+gpiod_edge_event_buffer_new(size_t capacity)
 {
 	struct gpiod_edge_event_buffer *buf;
 
@@ -111,7 +111,7 @@ gpiod_edge_event_buffer_new(unsigned int capacity)
 	return buf;
 }
 
-GPIOD_API unsigned int
+GPIOD_API size_t
 gpiod_edge_event_buffer_get_capacity(struct gpiod_edge_event_buffer *buffer)
 {
 	return buffer->capacity;
@@ -140,7 +140,7 @@ gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
 	return &buffer->events[index];
 }
 
-GPIOD_API unsigned int
+GPIOD_API size_t
 gpiod_edge_event_buffer_get_num_events(struct gpiod_edge_event_buffer *buffer)
 {
 	return buffer->num_events;
@@ -148,7 +148,7 @@ gpiod_edge_event_buffer_get_num_events(struct gpiod_edge_event_buffer *buffer)
 
 int gpiod_edge_event_buffer_read_fd(int fd,
 				    struct gpiod_edge_event_buffer *buffer,
-				    unsigned int max_events)
+				    size_t max_events)
 {
 	struct gpio_v2_line_event *curr;
 	struct gpiod_edge_event *event;
diff --git a/lib/internal.h b/lib/internal.h
index 32f36b5..9af2cda 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -29,7 +29,7 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 struct gpiod_line_request *
 gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf);
 int gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
-				    unsigned int max_events);
+				    size_t max_events);
 struct gpiod_info_event *
 gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf);
 struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
diff --git a/lib/line-config.c b/lib/line-config.c
index b58603f..a4b4d7b 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -671,7 +671,7 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
 
 GPIOD_API void
 gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-				    unsigned int num_values,
+				    size_t num_values,
 				    const unsigned int *offsets,
 				    const int *values)
 {
@@ -746,7 +746,7 @@ static bool base_debounce_period_is_equal(struct base_config *base,
 	return true;
 }
 
-GPIOD_API unsigned int
+GPIOD_API size_t
 gpiod_line_config_get_num_overrides(struct gpiod_line_config *config)
 {
 	struct override_config *override;
diff --git a/lib/line-request.c b/lib/line-request.c
index 45e11e3..69e4e11 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -14,7 +14,7 @@
 
 struct gpiod_line_request {
 	unsigned int offsets[GPIO_V2_LINES_MAX];
-	unsigned int num_lines;
+	size_t num_lines;
 	int fd;
 };
 
@@ -45,7 +45,7 @@ GPIOD_API void gpiod_line_request_release(struct gpiod_line_request *request)
 	free(request);
 }
 
-GPIOD_API unsigned int
+GPIOD_API size_t
 gpiod_line_request_get_num_lines(struct gpiod_line_request *request)
 {
 	return request->num_lines;
@@ -87,7 +87,7 @@ static int offset_to_bit(struct gpiod_line_request *request,
 
 GPIOD_API int
 gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
-				     unsigned num_lines,
+				     size_t num_lines,
 				     const unsigned int *offsets, int *values)
 {
 	struct gpio_v2_line_values buf;
@@ -140,7 +140,7 @@ GPIOD_API int gpiod_line_request_set_value(struct gpiod_line_request *request,
 
 GPIOD_API int
 gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
-				     unsigned int num_lines,
+				     size_t num_lines,
 				     const unsigned int *offsets,
 				     const int *values)
 {
@@ -210,7 +210,7 @@ gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
 GPIOD_API int
 gpiod_line_request_edge_event_read(struct gpiod_line_request *request,
 				   struct gpiod_edge_event_buffer *buffer,
-				   unsigned int max_events)
+				   size_t max_events)
 {
 	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
 }
diff --git a/lib/request-config.c b/lib/request-config.c
index 3de1820..dd92062 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -13,8 +13,8 @@
 struct gpiod_request_config {
 	char consumer[GPIO_MAX_NAME_SIZE];
 	unsigned int offsets[GPIO_V2_LINES_MAX];
-	unsigned int num_offsets;
-	unsigned int event_buffer_size;
+	size_t num_offsets;
+	size_t event_buffer_size;
 };
 
 GPIOD_API struct gpiod_request_config *gpiod_request_config_new(void)
@@ -54,7 +54,7 @@ gpiod_request_config_get_consumer(struct gpiod_request_config *config)
 
 GPIOD_API void
 gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				 unsigned int num_offsets,
+				 size_t num_offsets,
 				 const unsigned int *offsets)
 {
 	unsigned int i;
@@ -66,7 +66,7 @@ gpiod_request_config_set_offsets(struct gpiod_request_config *config,
 		config->offsets[i] = offsets[i];
 }
 
-GPIOD_API unsigned int
+GPIOD_API size_t
 gpiod_request_config_get_num_offsets(struct gpiod_request_config *config)
 {
 	return config->num_offsets;
@@ -82,12 +82,12 @@ gpiod_request_config_get_offsets(struct gpiod_request_config *config,
 
 GPIOD_API void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
-					   unsigned int event_buffer_size)
+					   size_t event_buffer_size)
 {
 	config->event_buffer_size = event_buffer_size;
 }
 
-GPIOD_API unsigned int
+GPIOD_API size_t
 gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 {
 	return config->event_buffer_size;
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 9047091..6ce3cb8 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -70,7 +70,7 @@ int main(int argc, char **argv)
 		if (!chip)
 			die_perror("unable to open %s", entries[i]->d_name);
 
-		printf("%s [%s] (%u lines)\n",
+		printf("%s [%s] (%zu lines)\n",
 		       gpiod_chip_get_name(chip),
 		       gpiod_chip_get_label(chip),
 		       gpiod_chip_get_num_lines(chip));
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 112257c..28030fa 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -44,12 +44,13 @@ int main(int argc, char **argv)
 	int direction = GPIOD_LINE_DIRECTION_INPUT;
 	int optc, opti, bias = 0, ret, *values;
 	struct gpiod_request_config *req_cfg;
-	unsigned int *offsets, i, num_lines;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
+	unsigned int *offsets, i;
 	struct gpiod_chip *chip;
 	bool active_low = false;
 	char *device, *end;
+	size_t num_lines;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 2c21474..7788468 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -130,7 +130,7 @@ static void list_lines(struct gpiod_chip *chip)
 	unsigned int i, offset;
 	int direction;
 
-	printf("%s - %u lines:\n",
+	printf("%s - %zu lines:\n",
 	       gpiod_chip_get_name(chip), gpiod_chip_get_num_lines(chip));
 
 	for (offset = 0; offset < gpiod_chip_get_num_lines(chip); offset++) {
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 31ea294..2ead5c6 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -154,15 +154,15 @@ static void handle_signal(int signum UNUSED)
 
 int main(int argc, char **argv)
 {
-	unsigned int offsets[64], num_lines = 0, offset, events_wanted = 0,
-		     events_done = 0;
 	bool watch_rising = false, watch_falling = false, active_low = false;
+	size_t num_lines = 0, events_wanted = 0, events_done = 0;
 	struct gpiod_edge_event_buffer *event_buffer;
 	int optc, opti, ret, i, edge, bias = 0;
 	uint64_t timeout = 10 * 1000000000LLU;
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
+	unsigned int offsets[64], offset;
 	struct gpiod_edge_event *event;
 	struct gpiod_chip *chip;
 	struct mon_ctx ctx;
diff --git a/tools/gpioset.c b/tools/gpioset.c
index c27525a..3b8e34b 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -192,13 +192,14 @@ int main(int argc, char **argv)
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
 	int ret, optc, opti, bias = 0, drive = 0, *values;
 	struct gpiod_request_config *req_cfg;
-	unsigned int *offsets, num_lines, i;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
 	struct callback_data cbdata;
+	unsigned int *offsets, i;
 	struct gpiod_chip *chip;
 	bool active_low = false;
 	char *device, *end;
+	size_t num_lines;
 
 	memset(&cbdata, 0, sizeof(cbdata));
 
-- 
2.30.1

