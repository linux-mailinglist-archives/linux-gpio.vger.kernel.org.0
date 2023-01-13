Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B88466A564
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjAMVwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjAMVw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:28 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDEB58F94
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:26 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so22237150wrb.11
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oY8/6WY3HsxwuOetEGEoZ4t9eIVGCq5j+RCrFrdVSxg=;
        b=PIGG269TuzftPJwEIxNCKmo9NDKwMvMTUCBRDUdoPtiKxsbWpukXJGZZtNcTvtMdYj
         aodR9DXFNYYR/FQlWgb7xzlSGQKxqvqgDGfeC3VZvIPl8tdxqn9ZPXjHCx3Q0/Ihh4Jl
         RLjk+T4TQx4gEsu5qosptF8I0ifbtrxv65tVlkBiYL6XcU9XVu79LN/BvgJllJUiJ9+P
         3oMlj0VH+kfS8hNWVl4dbUX21ikhRzO3E8TVt0LgAXguDk/+SxR1/VFWXKK0ECXEa9Gl
         MmUqMB9xX4gn4Hu2MiUR1T8AYFLyREAAbvpyxbBLFjEfbsLzFCbvNtQANm1QBKz/9Xf/
         qKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oY8/6WY3HsxwuOetEGEoZ4t9eIVGCq5j+RCrFrdVSxg=;
        b=Ms9AcjjYvhd/w8M4VhkEtLMDqKAh1IokE+Pco0RpoGfQXNNVyTaWm+AONsOvxysp6X
         7EZt97dA+SQDwJrTDyAflohuY2iCBvxTSoWVqN/Ee71A2vmhuIf2k/KtPcsoCpE97+MI
         +d972+EAjimniy7+XlC8N2mXBv+MJPb9PBajHmrRtaJKWKVdtoyr91jGlGutcx+9C8LW
         GIy8QpIMGawrnGxESd9BOOrY9Ox0NJ9HKSAjC5XUSB/bCG8rLRlbRRYL61ak1aDOZdJo
         33zQUPf7jsTRUxNEW9Py8nCLuEoPhznlqiVnaVWkbBKZOixFhlQK2JXyyUT1JWxmnVWa
         zeXQ==
X-Gm-Message-State: AFqh2krfz9hqeJ14Rnwu31CWDcNHU1X1jfGSC0I3ZhvbIetVrxeocHQ3
        shwHgx9IIBV9S3pUYVa7r+P9hA==
X-Google-Smtp-Source: AMrXdXv7L83FyrWoZSq1/0vJMeUWgHrvHBhaIMKwCBmZ/cnk1cFSbwgxXbASiaE/JVr4MBAvqP1xXA==
X-Received: by 2002:a5d:4d85:0:b0:2bd:d8f1:2efe with SMTP id b5-20020a5d4d85000000b002bdd8f12efemr864901wru.34.1673646745333;
        Fri, 13 Jan 2023 13:52:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 09/16] tests: add a helper for reading back line settings from line config
Date:   Fri, 13 Jan 2023 22:52:03 +0100
Message-Id: <20230113215210.616812-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper for getting line settings from line config that allows to
shrink the test code a bit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiod-test-helpers.h | 10 ++++++++++
 tests/tests-line-config.c  | 13 ++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
index b40b820..fb3fd7d 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/gpiod-test-helpers.h
@@ -126,6 +126,16 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 		gpiod_test_return_if_failed(); \
 	} while (0)
 
+#define gpiod_test_line_config_get_line_settings_or_fail(_line_cfg, _offset) \
+	({ \
+		struct gpiod_line_settings *_settings = \
+			gpiod_line_config_get_line_settings(_line_cfg, \
+							    _offset); \
+		g_assert_nonnull(_settings); \
+		gpiod_test_return_if_failed(); \
+		_settings; \
+	})
+
 #define gpiod_test_create_request_config_or_fail() \
 	({ \
 		struct gpiod_request_config *_config = \
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index ef85c3a..7f5e4b1 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -46,9 +46,7 @@ GPIOD_TEST_CASE(get_line_settings)
 	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
 							 settings);
 
-	retrieved = gpiod_line_config_get_line_settings(config, 2);
-	g_assert_nonnull(retrieved);
-	gpiod_test_return_if_failed();
+	retrieved = gpiod_test_line_config_get_line_settings_or_fail(config, 2);
 
 	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
@@ -146,9 +144,7 @@ GPIOD_TEST_CASE(null_settings)
 	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
 							 NULL);
 
-	settings = gpiod_line_config_get_line_settings(config, 2);
-	g_assert_nonnull(settings);
-	gpiod_test_return_if_failed();
+	settings = gpiod_test_line_config_get_line_settings_or_fail(config, 2);
 
 	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
 			GPIOD_LINE_DIRECTION_AS_IS);
@@ -171,9 +167,8 @@ GPIOD_TEST_CASE(reset_config)
 	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
 							 settings);
 
-	retrieved0 = gpiod_line_config_get_line_settings(config, 2);
-	g_assert_nonnull(retrieved0);
-	gpiod_test_return_if_failed();
+	retrieved0 = gpiod_test_line_config_get_line_settings_or_fail(config,
+								      2);
 
 	g_assert_cmpint(gpiod_line_settings_get_direction(retrieved0), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
-- 
2.37.2

