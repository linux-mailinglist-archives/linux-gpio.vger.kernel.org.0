Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECDCA75B18C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjGTOsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjGTOsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:48:07 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70D71722
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:01 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso7196555e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864480; x=1690469280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTZVEED0n66JzC14z8Y1dyJsVAMPVbfXgo6SBVqhOmM=;
        b=5JzdMHLXkyEhZYg7CUm1aleIZQcSL2nkKdFNAwDHqvxdZFgoVzkRTLOj9phUk2L4DK
         kI17XlXM6MFievJpnpXc+w9csF0WfgzcyyHKcOMvqaUBAGGMcymcavx39cND1I15+BoE
         ZIsqHxv+Y9XNC0JvYsxRfK1OB/U7lKQtbb37G20ia+JHD6aVNZHqhKMAhEqvHrcrBwbZ
         hkb1tbLr8zof3wexOhiEYKN6QoPG+sFSMkzqrII9De15nSlzYBkJ2l/ipI5hIzXM4DVp
         pHr1Ymqaot84VjIQ5cYitpZd5WPUwG67VLG1fZiu3XGqDcVxUE/DkoMQTiBbdSkaAHCK
         7wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864480; x=1690469280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTZVEED0n66JzC14z8Y1dyJsVAMPVbfXgo6SBVqhOmM=;
        b=bF5Tvpkwi7Jooa3NBlQJaWczf7fFkhY0EvT5QkN7UylpHZ8bFIZSrc+arrZlXkwL8D
         u6ubuW2YtUQhGyPSn39j4VIEXrt2TwoVdGHR4L8oEM5vVt2C/BYnp1HM/sZXGTSk/GPg
         Y/zHVTpcDWDn3pdCTVkgQzNZi/VYefzMsCuMIhvC+0B2cv/l9BYtPm4wsZB8vGFw4a6j
         J51z7sRhwdKCsUFNusRbWbU5yj1R/f5LocqSLbQ3tFJnhd8/T7Cr68b08cJdjIcniBRb
         3kb0W2kq8UCelxIg2wd+iakP7sjXo7qa5H4/oV3v4B1iKP4St65C0XZGRm8ENDXva14G
         IDmw==
X-Gm-Message-State: ABy/qLZy2/TVg3Iqg30KOc8pbCduIPvLhyahZ70jeff5Gq5EdlE4V3bj
        ODCXtE+mWBicLvfLdfiigWHwjw==
X-Google-Smtp-Source: APBJJlG96IaRTak/hUyKcVaF/fMszw4gQMjAsfQGailp5kkdylkrTs6by3wl71Q7gX9erq6P7MhrNw==
X-Received: by 2002:a1c:ed16:0:b0:3fb:dd5d:76b with SMTP id l22-20020a1ced16000000b003fbdd5d076bmr1915049wmh.7.1689864480159;
        Thu, 20 Jul 2023 07:48:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bd83:c166:7e2d:3d74])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1550906wrn.83.2023.07.20.07.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:47:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 2/5] tests: add a test-case for gpiod_line_request_get_chip_name()
Date:   Thu, 20 Jul 2023 16:47:44 +0200
Message-Id: <20230720144747.73276-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720144747.73276-1-brgl@bgdev.pl>
References: <20230720144747.73276-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a test case for the chip name getter on line-request objects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/tests-line-request.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 0b985e2..1a58275 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -675,3 +675,24 @@ GPIOD_TEST_CASE(get_requested_offsets_less_and_more)
 	g_assert_cmpuint(retrieved[2], ==, 2);
 	g_assert_cmpuint(retrieved[3], ==, 3);
 }
+
+GPIOD_TEST_CASE(get_chip_name)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 NULL);
+
+	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
+
+	g_assert_cmpstr(g_gpiosim_chip_get_name(sim), ==,
+			gpiod_line_request_get_chip_name(request));
+}
-- 
2.39.2

