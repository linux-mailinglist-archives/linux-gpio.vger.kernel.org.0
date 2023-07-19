Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A3E759E6B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjGSTVM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjGSTVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:09 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987FC1BF7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:08 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so67808725e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689794467; x=1690399267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM7MC2D3VSlqahUBU+HsG655VTszMrDx6ek6kDLjkZI=;
        b=viBsolprfjSb0ZUWXyQUqoT7iiQKKJTTdwqXEFogDidmbutbO3oXZqv9YZscAeUuTm
         9iQj5JKA+pQ51X4wZE3IKNkgoE4MjGpIjWTFK0AaGi6Oj9sF7PFRwaEa5YYYodLlNmUI
         skpoZbxDd7y77e3WhGaVzm/9KaL5kC/Yu0GupMMq7BMNaefRfG6Ov1ZtEyLAmHj4FDcB
         5nTCmSeSxDIaRuem0Tw4LULr0ht7QUogKQ8zsMCIMUW2n07+B4iFvIqcsO9KNUR3q/0O
         Edm8tp4+rQKNLP7qHoSc3I9LWU2HE4F+fJH96F6kYKPfochYvCPjdF4t6co6gd0pm9oF
         UJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794467; x=1690399267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PM7MC2D3VSlqahUBU+HsG655VTszMrDx6ek6kDLjkZI=;
        b=Q0A9T/oydRSAk13I8Pzn+bZv758K8FqAHIhQN7AXiYCP4OlPn99Qj+WIpPfidbmjd4
         rocU4jrLYTrqRRE1yNVnY8a2NSEEsx++TPBZSSyaY1yn8W+jAABw8hfo8puoBW8VqgUq
         rki3AThIceW9ECvfBulUFbOt+z+4l2TiYJAEYieLqSOXdX3KewHMrhQg3qXv6wVc44NJ
         N798bs0TsYjG1gI3MmZaNCy3s63V9WKEJU1rhYSAcihDkMICMxWTiBE/RVf2nPizcBgZ
         QCSKXiZ3IjLj9Wva+dqWa+QClmrsdIMM4u+KE4HQoBzyY806YYH15mOi5AhR7BR2QNJ2
         OBAg==
X-Gm-Message-State: ABy/qLY40haKfsWoE37EXtBudZrlLjgRLlGpgSgzvRLJuuXh2u9Ff55d
        biOJKFnhC9ucFnF/oNtCfQRt+BQz0xDiruJlSQA=
X-Google-Smtp-Source: APBJJlGWXHAMS3cj6MBZA3A0CODyIYmGeqhjPT/fDvCkUyAyODUkB4h+30NOAx5EedFaX5/lo95lMg==
X-Received: by 2002:a05:600c:acf:b0:3fa:770c:5918 with SMTP id c15-20020a05600c0acf00b003fa770c5918mr2810407wmr.9.1689794466813;
        Wed, 19 Jul 2023 12:21:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f884:f48d:2867:5c1d])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2373454wmi.6.2023.07.19.12.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/5] tests: add a test-case for gpiod_line_request_get_chip_path()
Date:   Wed, 19 Jul 2023 21:20:54 +0200
Message-Id: <20230719192057.172560-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719192057.172560-1-brgl@bgdev.pl>
References: <20230719192057.172560-1-brgl@bgdev.pl>
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a test case for the chip path getter on line-request objects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/tests-line-request.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 0b985e2..2c8c497 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -675,3 +675,24 @@ GPIOD_TEST_CASE(get_requested_offsets_less_and_more)
 	g_assert_cmpuint(retrieved[2], ==, 2);
 	g_assert_cmpuint(retrieved[3], ==, 3);
 }
+
+GPIOD_TEST_CASE(get_chip_path)
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
+	g_assert_cmpstr(gpiod_chip_get_path(chip), ==,
+			gpiod_line_request_get_chip_path(request));
+}
-- 
2.39.2

