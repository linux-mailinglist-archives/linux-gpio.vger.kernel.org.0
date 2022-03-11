Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49834D5C8B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237429AbiCKHlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbiCKHlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:41:12 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1184FC6233
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:09 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id lj8-20020a17090b344800b001bfaa46bca3so7279692pjb.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sv1lXVgfybLMpJSR42/h4ucaWbFN/fP77J6ZhSjqgwE=;
        b=K1Rc32MFMl6FoYapa82f8X/QIEFkkYit0oWaIMecGWoh9XjDFISSklELIIryXiTjKv
         34fSiDq1O7ONGvEyX+WNLYX7oji9P6iPOFuqBxoYHB5n3GYfC/DIQdmHPGRkX0N2FELs
         UEjvmvBOilieN8UpRziwRYuBgmxWUdMzalVknfL/DgmYuLRK+xsVdOCi/1tVUCbee+Z8
         /n0gERcYGikybrBtL1G+0ys/MyEUvbBUaUOlL4cTXe6I+rD/sAGYWy2AbakxRdivk6oe
         iPy9AmUVjpIgV4tWwiSYvc3JoNKo0YsrDnn82pAmi3tvl8ihehFVcVdY8jZBfPYfmaAb
         f6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sv1lXVgfybLMpJSR42/h4ucaWbFN/fP77J6ZhSjqgwE=;
        b=NDMpGtHxQtcRAwhuwVZcaeiGrZIVH58pDh8UaI2wQEioyxgp+umVwPaliMIPD3RUkx
         MqsG9ClwMMLfJW3dqCR0/m57lce+4FVqdfOfUfXNKIEDGRMUnBMhkqOhdEGxTFO3VyFZ
         lZkYSMXETffV9qUQ+fY3U+nUP7LJ9fPvhL7ThF6QR0yBxeQu3a5DA+f1UGCSy7aYdHEw
         bHoFex/eUR63Fkkx7rmkInq3czvjYoUGhbaGvHDiIX3L4gQ1E6o3Tc8YXcr0RA/WmC/M
         1mADrpdreBAzW+cq7gM9rdx+gQhE6CHAwcyCZwHs549kCymiKPMg95JXKu1e0nILug18
         pHbQ==
X-Gm-Message-State: AOAM533NTmRPJa8WE/UwHfntUD+zWWnyi2Bogm00RCPAXIneV4lzrCbj
        PDv7qxJrbna8tAlCwPEozslaCenCWlvGgw==
X-Google-Smtp-Source: ABdhPJztlwawA79YBLAu2bJWwZbSC8JDIPYx3WE4qUJyQGhdMVevwafekSxzAAKP8qMQFqOgL7kxAA==
X-Received: by 2002:a17:902:c94a:b0:151:8e65:c715 with SMTP id i10-20020a170902c94a00b001518e65c715mr9084038pla.169.1646984406774;
        Thu, 10 Mar 2022 23:40:06 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:40:06 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 1/6] treewide: use size_t for loop variable where limit is size_t
Date:   Fri, 11 Mar 2022 15:39:21 +0800
Message-Id: <20220311073926.78636-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
References: <20220311073926.78636-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch loop variables to size_t for loops where the limit is a size_t to
remove implicit type conversions.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/edge-event.c     |  2 +-
 lib/line-config.c    | 22 +++++++++++-----------
 lib/line-info.c      |  2 +-
 lib/line-request.c   |  6 +++---
 lib/request-config.c |  4 ++--
 tools/gpioget.c      |  4 ++--
 tools/gpioinfo.c     |  4 ++--
 tools/gpioset.c      |  6 +++---
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/lib/edge-event.c b/lib/edge-event.c
index 8f993e8..661754e 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -152,7 +152,7 @@ int gpiod_edge_event_buffer_read_fd(int fd,
 {
 	struct gpio_v2_line_event *curr;
 	struct gpiod_edge_event *event;
-	unsigned int i;
+	size_t i;
 	ssize_t rd;
 
 	memset(buffer->event_data, 0,
diff --git a/lib/line-config.c b/lib/line-config.c
index a4b4d7b..f21e1c4 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -102,7 +102,7 @@ GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
 
 GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
 {
-	int i;
+	size_t i;
 
 	memset(config, 0, sizeof(*config));
 	init_base_config(&config->defaults);
@@ -114,7 +114,7 @@ static struct override_config *
 get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
 {
 	struct override_config *override;
-	unsigned int i;
+	size_t i;
 
 	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
 		override = &config->overrides[i];
@@ -130,7 +130,7 @@ static struct override_config *
 get_free_override(struct gpiod_line_config *config, unsigned int offset)
 {
 	struct override_config *override;
-	unsigned int i;
+	size_t i;
 
 	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
 		override = &config->overrides[i];
@@ -675,7 +675,7 @@ gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 				    const unsigned int *offsets,
 				    const int *values)
 {
-	unsigned int i;
+	size_t i;
 
 	for (i = 0; i < num_values; i++)
 		gpiod_line_config_set_output_value_override(config,
@@ -750,7 +750,7 @@ GPIOD_API size_t
 gpiod_line_config_get_num_overrides(struct gpiod_line_config *config)
 {
 	struct override_config *override;
-	unsigned int i, j, count = 0;
+	size_t i, j, count = 0;
 
 	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
 		override = &config->overrides[i];
@@ -797,7 +797,7 @@ gpiod_line_config_get_overrides(struct gpiod_line_config *config,
 				unsigned int *offsets, int *props)
 {
 	struct override_config *override;
-	unsigned int i, j, count = 0;
+	size_t i, j, count = 0;
 
 	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
 		override = &config->overrides[i];
@@ -884,7 +884,7 @@ static uint64_t make_kernel_flags(const struct base_config *config)
 static int find_bitmap_index(unsigned int needle, unsigned int num_lines,
 			     const unsigned int *haystack)
 {
-	unsigned int i;
+	size_t i;
 
 	for (i = 0; i < num_lines; i++) {
 		if (needle == haystack[i])
@@ -900,7 +900,7 @@ static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 				     const unsigned int *offsets)
 {
 	struct override_config *override;
-	unsigned int i;
+	size_t i;
 	int idx;
 
 	gpiod_line_mask_zero(mask);
@@ -1033,7 +1033,7 @@ static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
 				 struct gpiod_line_config *config)
 {
 	struct override_config *override;
-	unsigned int i, j;
+	size_t i, j;
 	int off;
 
 	gpiod_line_mask_zero(out);
@@ -1080,7 +1080,7 @@ static int process_overrides(struct gpiod_line_config *config,
 	struct gpio_v2_line_config_attribute *attr;
 	uint64_t processed = 0, marked = 0, mask;
 	struct override_config *current, *next;
-	unsigned int i, j;
+	size_t i, j;
 
 	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
 		current = &config->overrides[i];
@@ -1129,7 +1129,7 @@ static int process_overrides(struct gpiod_line_config *config,
 static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
 {
 	struct override_config *override;
-	unsigned int i;
+	size_t i;
 
 	if (config->defaults.direction == GPIOD_LINE_DIRECTION_OUTPUT)
 		return true;
diff --git a/lib/line-info.c b/lib/line-info.c
index 5db6269..fc656f9 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -110,7 +110,7 @@ gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
 {
 	struct gpio_v2_line_attribute *attr;
 	struct gpiod_line_info *info;
-	unsigned int i;
+	size_t i;
 
 	info = malloc(sizeof(*info));
 	if (!info)
diff --git a/lib/line-request.c b/lib/line-request.c
index 69e4e11..2c73dba 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -75,7 +75,7 @@ GPIOD_API int gpiod_line_request_get_value(struct gpiod_line_request *request,
 static int offset_to_bit(struct gpiod_line_request *request,
 			 unsigned int offset)
 {
-	unsigned int i;
+	size_t i;
 
 	for (i = 0; i < request->num_lines; i++) {
 		if (offset == request->offsets[i])
@@ -92,7 +92,7 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 {
 	struct gpio_v2_line_values buf;
 	uint64_t mask = 0, bits = 0;
-	unsigned int i;
+	size_t i;
 	int bit, ret;
 
 	buf.bits = 0;
@@ -146,7 +146,7 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 {
 	struct gpio_v2_line_values buf;
 	uint64_t mask = 0, bits = 0;
-	unsigned int i;
+	size_t i;
 	int bit;
 
 	for (i = 0; i < num_lines; i++) {
diff --git a/lib/request-config.c b/lib/request-config.c
index dd92062..abcca58 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -57,7 +57,7 @@ gpiod_request_config_set_offsets(struct gpiod_request_config *config,
 				 size_t num_offsets,
 				 const unsigned int *offsets)
 {
-	unsigned int i;
+	size_t i;
 
 	config->num_offsets = num_offsets > GPIO_V2_LINES_MAX ?
 					GPIO_V2_LINES_MAX : num_offsets;
@@ -96,7 +96,7 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
 				   struct gpio_v2_line_request *reqbuf)
 {
-	unsigned int i;
+	size_t i;
 
 	if (config->num_offsets == 0) {
 		errno = EINVAL;
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 28030fa..641de7b 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -46,11 +46,11 @@ int main(int argc, char **argv)
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
-	unsigned int *offsets, i;
+	unsigned int *offsets;
 	struct gpiod_chip *chip;
 	bool active_low = false;
 	char *device, *end;
-	size_t num_lines;
+	size_t i, num_lines;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 7788468..c852b36 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -127,7 +127,7 @@ static void list_lines(struct gpiod_chip *chip)
 	bool flag_printed, of, active_low;
 	struct gpiod_line_info *info;
 	const char *name, *consumer;
-	unsigned int i, offset;
+	size_t i, offset;
 	int direction;
 
 	printf("%s - %zu lines:\n",
@@ -146,7 +146,7 @@ static void list_lines(struct gpiod_chip *chip)
 		of = false;
 
 		printf("\tline ");
-		prinfo(&of, 3, "%u", offset);
+		prinfo(&of, 3, "%zu", offset);
 		printf(": ");
 
 		name ? prinfo(&of, 12, "\"%s\"", name)
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 3b8e34b..39279a2 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -167,7 +167,7 @@ static const struct mode_mapping modes[] = {
 
 static const struct mode_mapping *parse_mode(const char *mode)
 {
-	unsigned int i;
+	size_t i;
 
 	for (i = 0; i < ARRAY_SIZE(modes); i++)
 		if (strcmp(mode, modes[i].name) == 0)
@@ -195,11 +195,11 @@ int main(int argc, char **argv)
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
 	struct callback_data cbdata;
-	unsigned int *offsets, i;
+	unsigned int *offsets;
 	struct gpiod_chip *chip;
 	bool active_low = false;
 	char *device, *end;
-	size_t num_lines;
+	size_t i, num_lines;
 
 	memset(&cbdata, 0, sizeof(cbdata));
 
-- 
2.35.1

