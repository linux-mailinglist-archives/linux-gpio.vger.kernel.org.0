Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB794D5C8C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235948AbiCKHl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbiCKHl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:41:27 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2611B7540
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:25 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id mm23-20020a17090b359700b001bfceefd8c6so4152037pjb.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DWowfv9uW0to4N1HNNkbqZtlP7cpR9WD8lCLK86WeWM=;
        b=Goe5W+QbqbKdjY2h5pwtRCKpMYXFJTp5xbmbTdEKuALqaekU8QI1qqU9CNFQPkRWZc
         bY87iorqLytNbd3MJ0K+tLELJfei42z5YK/uvvFu8Nkh4Wud2pybG5wulhdDNXbdHxZP
         se/LEO6H0e1phOyzM3hDB9Ufnhb6+A43bxGVOY3T55VuA0LKeTa4gh/YmqC6o5conieb
         /G4NrSAKY3u8x9j4GptbgXOhSD3foQ8N8ZzUK50veqydmt7CfzCxwSL+1zaatp/y5AVw
         1Gs85tzOlA9HV2KmVe6wDID94a8qiRujnR0bUveSArlQgdlkZhgRGNRZweHyeP0gy+n6
         uMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DWowfv9uW0to4N1HNNkbqZtlP7cpR9WD8lCLK86WeWM=;
        b=O0kVbNMN2S7f0fLynAqUO0Y/D7YxLhP0Hn6QITGN2o3W8hIXg83pBR66P3IAphCUHv
         sN2aNXro06JdO87AhdYJQpqZ1wrDFbNK5IMWxrQbGb4beuXJ4cS+4ek8vQY6P2VXye9M
         VDuW8tw3rZlQut7grj6HPHKGNAhqEUy7N68dfqjKy1aRSIuxxRCRBj1xDSBLEAMAUsge
         c+C5rXDxfBzX3aIC81d3xl/w3uCTaiZYCLS4y5C/won4Whm+zNydPtF8EqOTyL3uRP4g
         JFz4GucjRcfQ6bQXhAxxykd/GawH4kd391PCWVU4uMWkAZ7yLkahXdWi/W8W4I+dURfb
         EfgA==
X-Gm-Message-State: AOAM532MWF8QwCbWDD61RolWYOssxZL7/5+f1Hb4eBV8TEHGwRicejfR
        C73CeH9/1XJ1dYwR728MmErq91qxUrNnXw==
X-Google-Smtp-Source: ABdhPJx08cnDSK1H7DtSKXpa995SMsuK/jD31kxDVZxag4+oo5+Ml2VjTMfX1LoWa5vwuIUrCKu/Sg==
X-Received: by 2002:a17:902:d506:b0:151:ced2:3cf with SMTP id b6-20020a170902d50600b00151ced203cfmr9200328plg.147.1646984424564;
        Thu, 10 Mar 2022 23:40:24 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:40:24 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 2/6] API: rename gpiod_request_config_get_num_offsets to gpiod_request_config_get_num_lines to match line_request pattern
Date:   Fri, 11 Mar 2022 15:39:22 +0800
Message-Id: <20220311073926.78636-3-warthog618@gmail.com>
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

Both gpiod_request_config and gpiod_line_request contain a number of
lines, but the former has a get_num_offsets accessor, while the latter
has get_num_lines.  Make them consistent by switching request_config to
get_num_lines.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h              |  6 +++---
 lib/request-config.c         | 22 +++++++++++-----------
 tests/tests-line-request.c   |  2 +-
 tests/tests-request-config.c |  8 ++++----
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index e6a4645..8fb70ee 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1094,12 +1094,12 @@ void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
 				      const unsigned int *offsets);
 
 /**
- * @brief Get the number of offsets configured in this request config.
+ * @brief Get the number of lines configured in this request config.
  * @param config Request config object.
- * @return Number of line offsets in this request config.
+ * @return Number of lines to be requested by this config.
  */
 size_t
-gpiod_request_config_get_num_offsets(struct gpiod_request_config *config);
+gpiod_request_config_get_num_lines(struct gpiod_request_config *config);
 
 /**
  * @brief Get the hardware offsets of lines in this request config.
diff --git a/lib/request-config.c b/lib/request-config.c
index abcca58..d9ecc8e 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -13,7 +13,7 @@
 struct gpiod_request_config {
 	char consumer[GPIO_MAX_NAME_SIZE];
 	unsigned int offsets[GPIO_V2_LINES_MAX];
-	size_t num_offsets;
+	size_t num_lines;
 	size_t event_buffer_size;
 };
 
@@ -54,22 +54,22 @@ gpiod_request_config_get_consumer(struct gpiod_request_config *config)
 
 GPIOD_API void
 gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				 size_t num_offsets,
+				 size_t num_lines,
 				 const unsigned int *offsets)
 {
 	size_t i;
 
-	config->num_offsets = num_offsets > GPIO_V2_LINES_MAX ?
-					GPIO_V2_LINES_MAX : num_offsets;
+	config->num_lines = num_lines > GPIO_V2_LINES_MAX ?
+					GPIO_V2_LINES_MAX : num_lines;
 
-	for (i = 0; i < config->num_offsets; i++)
+	for (i = 0; i < config->num_lines; i++)
 		config->offsets[i] = offsets[i];
 }
 
 GPIOD_API size_t
-gpiod_request_config_get_num_offsets(struct gpiod_request_config *config)
+gpiod_request_config_get_num_lines(struct gpiod_request_config *config)
 {
-	return config->num_offsets;
+	return config->num_lines;
 }
 
 GPIOD_API void
@@ -77,7 +77,7 @@ gpiod_request_config_get_offsets(struct gpiod_request_config *config,
 				 unsigned int *offsets)
 {
 	memcpy(offsets, config->offsets,
-	       sizeof(*offsets) * config->num_offsets);
+	       sizeof(*offsets) * config->num_lines);
 }
 
 GPIOD_API void
@@ -98,15 +98,15 @@ int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
 {
 	size_t i;
 
-	if (config->num_offsets == 0) {
+	if (config->num_lines == 0) {
 		errno = EINVAL;
 		return -1;
 	}
 
-	for (i = 0; i < config->num_offsets; i++)
+	for (i = 0; i < config->num_lines; i++)
 		reqbuf->offsets[i] = config->offsets[i];
 
-	reqbuf->num_lines = config->num_offsets;
+	reqbuf->num_lines = config->num_lines;
 	strcpy(reqbuf->consumer, config->consumer);
 	reqbuf->event_buffer_size = config->event_buffer_size;
 
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 8ef391d..eb3adee 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -21,7 +21,7 @@ GPIOD_TEST_CASE(request_fails_with_no_offsets)
 	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(req_cfg), ==, 0);
+	g_assert_cmpuint(gpiod_request_config_get_num_lines(req_cfg), ==, 0);
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
 	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
diff --git a/tests/tests-request-config.c b/tests/tests-request-config.c
index becb414..136fe07 100644
--- a/tests/tests-request-config.c
+++ b/tests/tests-request-config.c
@@ -16,7 +16,7 @@ GPIOD_TEST_CASE(default_config)
 	config = gpiod_test_create_request_config_or_fail();
 
 	g_assert_null(gpiod_request_config_get_consumer(config));
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 0);
+	g_assert_cmpuint(gpiod_request_config_get_num_lines(config), ==, 0);
 	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config),
 			 ==, 0);
 }
@@ -42,7 +42,7 @@ GPIOD_TEST_CASE(offsets)
 	config = gpiod_test_create_request_config_or_fail();
 
 	gpiod_request_config_set_offsets(config, 4, offsets);
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 4);
+	g_assert_cmpuint(gpiod_request_config_get_num_lines(config), ==, 4);
 	memset(read_back, 0, sizeof(read_back));
 	gpiod_request_config_get_offsets(config, read_back);
 	for (i = 0; i < 4; i++)
@@ -71,11 +71,11 @@ GPIOD_TEST_CASE(max_offsets)
 	config = gpiod_test_create_request_config_or_fail();
 
 	gpiod_request_config_set_offsets(config, 64, offsets_good);
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 64);
+	g_assert_cmpuint(gpiod_request_config_get_num_lines(config), ==, 64);
 
 	gpiod_request_config_set_offsets(config, 65, offsets_bad);
 	/* Should get truncated. */
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 64);
+	g_assert_cmpuint(gpiod_request_config_get_num_lines(config), ==, 64);
 }
 
 GPIOD_TEST_CASE(event_buffer_size)
-- 
2.35.1

