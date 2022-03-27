Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B284E8811
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Mar 2022 16:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbiC0O1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Mar 2022 10:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbiC0O1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2022 10:27:43 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A756713DDD
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 07:26:04 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id o8so10278161pgf.9
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bm/6n1QSCINAlTMO/xix5WdbcFoXeamCwvcHy92gEQ=;
        b=Gl5zJoIkQcQ3CB2rXQF7NtPYhq+6ObybUtqB7erAdx0rP/dCvBoCkHwmj1TaCrD3GM
         4UXx8QQSyw6NDUfLlxv5yk85IaoL92xiTMWvZl/1neXOJSFyzliV8HCnhk/00xDgUMIT
         xSmdbtFG4IxAJGChWjBjM3eDcsKngGF53HYsz0gFHPMqjzE7lJJ4rMPkPn7eHJScGOBt
         TGuAXIfV/gCBT67/+NN1piUsAcRI7HI1+IUqxf3GabiURlnK2fa56oJbxh3GN7LlDspl
         LKc6n0ngBq2+rCCN+EsRsoexBZdVr2SCME25u7fEV8SxDnomc90Ls6M3GyTWJrQhygCo
         C/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5bm/6n1QSCINAlTMO/xix5WdbcFoXeamCwvcHy92gEQ=;
        b=cgZ+GipHUNgYHPNzKCv9x1XMMlSgn1jiGQynW7mGpDLEZfpObLbqTD7IpBgMLQkeMG
         cpjCn3ML+KvJ1/66bftYI/C+KP6W/lUmwEosLxpLagvzjdVkhAUb3CBpRgD504YbWxdd
         /O0AE9/pw6RsSbmRz1RW4jBgb8ESnUiVDJ2EPhfEFMxYeOBdC9LtJOD76ihR+NcTZuD6
         9Dvs6bHdFHvkuiMA6nrQbHhME7HmBHTUAlX9Pl132Lvx7nX6xSj3Q5LK7c9KJA8iTK/l
         M0Y0xFXsQbzknAbMpPL54Z7P6LMTAF3AY0tFu0UuRClus/yzekbGRuTjV8F+MowgHAfJ
         nTRg==
X-Gm-Message-State: AOAM533kznmYMhUmy2N/+dlGYkgIgr0QPc3NQbEvbvbAkNnBl3gAZceS
        ov4718cW4LEPHXiJxItnd6rsCT+PR74=
X-Google-Smtp-Source: ABdhPJypYaw+zZMP4CoWA2VAlamW5zLA2xS5yirEnhk8LN3ifvq4cRY2MbhJuXh3JMX+t4Trm8cxew==
X-Received: by 2002:a62:8647:0:b0:4fa:dff3:4614 with SMTP id x68-20020a628647000000b004fadff34614mr19196704pfd.5.1648391163711;
        Sun, 27 Mar 2022 07:26:03 -0700 (PDT)
Received: from sol.home.arpa ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a588600b001c699d77503sm11073269pji.2.2022.03.27.07.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 07:26:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH] core: make line values unsigned
Date:   Sun, 27 Mar 2022 22:25:53 +0800
Message-Id: <20220327142553.217535-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
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

Line values are either 0 or 1, so remove the possibility of a value
being negative by changing the type from int to unsigned int, similar
to offsets.

The exception is the value returned by gpiod_line_request_get_value()
which uses a negative value to indicate an error, as is common practice.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h            | 17 +++++++++--------
 lib/line-config.c          |  6 +++---
 lib/line-request.c         | 14 +++++++-------
 tests/tests-line-config.c  |  8 ++++----
 tests/tests-line-request.c | 21 ++++++++++-----------
 tools/gpioget.c            |  4 ++--
 tools/gpioset.c            |  4 ++--
 7 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index c605da8..456c2b8 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -973,7 +973,7 @@ int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
  */
 void
 gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
-					   int value);
+					   unsigned int value);
 
 /**
  * @brief Override the output value for a line.
@@ -983,7 +983,8 @@ gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
  */
 void
 gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
-					    unsigned int offset, int value);
+					    unsigned int offset,
+					    unsigned int value);
 
 /**
  * @brief Override the output values for multiple lines.
@@ -997,7 +998,7 @@ gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 					 size_t num_values,
 					 const unsigned int *offsets,
-					 const int *values);
+					 const unsigned int *values);
 
 /**
  * @brief Clear the output value override for a line.
@@ -1237,7 +1238,7 @@ int gpiod_line_request_get_value(struct gpiod_line_request *request,
 int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 					 size_t num_values,
 					 const unsigned int *offsets,
-					 int *values);
+					 unsigned int *values);
 
 /**
  * @brief Get the values of all requested lines.
@@ -1251,7 +1252,7 @@ int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values(struct gpiod_line_request *request,
-				  int *values);
+				  unsigned int *values);
 
 /**
  * @brief Set the value of a single requested line.
@@ -1260,7 +1261,7 @@ int gpiod_line_request_get_values(struct gpiod_line_request *request,
  * @param value Value to set.
  */
 int gpiod_line_request_set_value(struct gpiod_line_request *request,
-				 unsigned int offset, int value);
+				 unsigned int offset, unsigned int value);
 
 /**
  * @brief Set the values of a subset of requested lines.
@@ -1277,7 +1278,7 @@ int gpiod_line_request_set_value(struct gpiod_line_request *request,
 int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 					 size_t num_values,
 					 const unsigned int *offsets,
-					 const int *values);
+					 const unsigned int *values);
 
 /**
  * @brief Set the values of all lines associated with a request.
@@ -1290,7 +1291,7 @@ int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
  *		 ::gpiod_line_request_get_offsets.
  */
 int gpiod_line_request_set_values(struct gpiod_line_request *request,
-				  const int *values);
+				  const unsigned int *values);
 
 /**
  * @brief Update the configuration of lines associated with a line request.
diff --git a/lib/line-config.c b/lib/line-config.c
index f9cd6ac..cb9f316 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -648,14 +648,14 @@ gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
 
 GPIOD_API void
 gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
-					   int value)
+					   unsigned int value)
 {
 	config->defaults.value = value;
 }
 
 GPIOD_API void
 gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
-					  unsigned int offset, int value)
+					  unsigned int offset, unsigned int value)
 {
 	struct override_config *override;
 
@@ -671,7 +671,7 @@ GPIOD_API void
 gpiod_line_config_set_output_values(struct gpiod_line_config *config,
 				    size_t num_values,
 				    const unsigned int *offsets,
-				    const int *values)
+				    const unsigned int *values)
 {
 	size_t i;
 
diff --git a/lib/line-request.c b/lib/line-request.c
index 33f7f67..d578a9e 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -60,8 +60,7 @@ gpiod_line_request_get_offsets(struct gpiod_line_request *request,
 GPIOD_API int gpiod_line_request_get_value(struct gpiod_line_request *request,
 					   unsigned int offset)
 {
-	unsigned int ret;
-	int val;
+	unsigned int ret, val;
 
 	ret = gpiod_line_request_get_values_subset(request, 1, &offset, &val);
 	if (ret)
@@ -86,7 +85,8 @@ static int offset_to_bit(struct gpiod_line_request *request,
 GPIOD_API int
 gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 				     size_t num_values,
-				     const unsigned int *offsets, int *values)
+				     const unsigned int *offsets,
+				     unsigned int *values)
 {
 	struct gpio_v2_line_values uapi_values;
 	uint64_t mask = 0, bits = 0;
@@ -123,14 +123,14 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 }
 
 GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
-					    int *values)
+					    unsigned int *values)
 {
 	return gpiod_line_request_get_values_subset(request, request->num_lines,
 						    request->offsets, values);
 }
 
 GPIOD_API int gpiod_line_request_set_value(struct gpiod_line_request *request,
-					   unsigned int offset, int value)
+					   unsigned int offset, unsigned int value)
 {
 	return gpiod_line_request_set_values_subset(request, 1,
 						    &offset, &value);
@@ -140,7 +140,7 @@ GPIOD_API int
 gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 				     size_t num_values,
 				     const unsigned int *offsets,
-				     const int *values)
+				     const unsigned int *values)
 {
 	struct gpio_v2_line_values uapi_values;
 	uint64_t mask = 0, bits = 0;
@@ -166,7 +166,7 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 }
 
 GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
-					    const int *values)
+					    const unsigned int *values)
 {
 	return gpiod_line_request_set_values_subset(request, request->num_lines,
 						    request->offsets, values);
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 9ad8f17..9981a5f 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -300,10 +300,10 @@ GPIOD_TEST_CASE(set_and_clear_output_value_override)
 GPIOD_TEST_CASE(set_multiple_output_values)
 {
 	static const guint offsets[] = { 3, 4, 5, 6 };
-	static const gint values[] = { GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE };
+	static const guint values[] = { GPIOD_LINE_VALUE_ACTIVE,
+					GPIOD_LINE_VALUE_INACTIVE,
+					GPIOD_LINE_VALUE_ACTIVE,
+					GPIOD_LINE_VALUE_INACTIVE };
 
 	g_autoptr(struct_gpiod_line_config) config = NULL;
 	guint overridden_offsets[4], i;
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 8ef391d..531e466 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -200,8 +200,8 @@ GPIOD_TEST_CASE(read_all_values)
 	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
-	gint ret, values[5];
-	guint i;
+	gint ret;
+	guint i, values[5];
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 	req_cfg = gpiod_test_create_request_config_or_fail();
@@ -259,11 +259,11 @@ GPIOD_TEST_CASE(request_multiple_values_but_read_one)
 GPIOD_TEST_CASE(set_all_values)
 {
 	static const guint offsets[] = { 0, 2, 4, 5, 6 };
-	static const gint values[] = { GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE };
+	static const guint values[] = { GPIOD_LINE_VALUE_ACTIVE,
+					GPIOD_LINE_VALUE_INACTIVE,
+					GPIOD_LINE_VALUE_ACTIVE,
+					GPIOD_LINE_VALUE_ACTIVE,
+					GPIOD_LINE_VALUE_ACTIVE };
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
@@ -440,8 +440,8 @@ GPIOD_TEST_CASE(reconfigure_lines)
 	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
-	gint values[4], ret;
-	guint i;
+	gint ret;
+	guint values[4], i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 	req_cfg = gpiod_test_create_request_config_or_fail();
@@ -487,8 +487,7 @@ GPIOD_TEST_CASE(request_lines_with_unordered_offsets)
 	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
-	guint cfg_offsets[4];
-	gint values[4];
+	guint cfg_offsets[4], values[4];
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 	req_cfg = gpiod_test_create_request_config_or_fail();
diff --git a/tools/gpioget.c b/tools/gpioget.c
index ae80271..2cf5eae 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -42,13 +42,13 @@ static void print_help(void)
 int main(int argc, char **argv)
 {
 	int direction = GPIOD_LINE_DIRECTION_INPUT;
-	int optc, opti, bias = 0, ret, *values;
+	int optc, opti, bias = 0, ret;
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
 	struct gpiod_chip *chip;
 	bool active_low = false;
-	unsigned int *offsets;
+	unsigned int *offsets, *values;
 	size_t i, num_lines;
 	char *device, *end;
 
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 576b87d..1c11470 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -190,14 +190,14 @@ static int parse_drive(const char *option)
 int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
-	int ret, optc, opti, bias = 0, drive = 0, *values;
+	int ret, optc, opti, bias = 0, drive = 0;
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
 	struct callback_data cbdata;
 	struct gpiod_chip *chip;
 	bool active_low = false;
-	unsigned int *offsets;
+	unsigned int *offsets, *values;
 	size_t i, num_lines;
 	char *device, *end;
 
-- 
2.35.1

