Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5ED66A563
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjAMVwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbjAMVw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:27 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDB289BCF
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:25 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id q8so4305742wmo.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVWShqrtG6nhs2mzsOMgfRA5OJ9/LyNVBuy1z6RwGsU=;
        b=AiSzFfJtCmbBbWd224QTTW/Rna5dg66LsbdpNjGoaihHGGr57d+X/vL65OSnpib8cf
         ONObSiQweuS0+tyRKLObafgcSzkvzm5PsF4BaTTjjjVNZ0LaNJg4BkheLYiXeEgf+gNg
         vpVtvZHhbHhJtKNeeslyupTZfGAl+W4HIcPOG28+AXvqbDlgNQdJO1eOQe39TMj3VgY0
         tdl/IpvM9hEJCo2lgVsKbIO67ATrzI3buLm5JputMpVqC6JSrMESuLjc7sf5YvKuUYB3
         RMdX+fHxrMyrWEdaRIEbrQCAxywelfMkFHpZ4vO7rC4zbaAeZzCy+sURH/BqcVb8j7eg
         yq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVWShqrtG6nhs2mzsOMgfRA5OJ9/LyNVBuy1z6RwGsU=;
        b=tGuUYNAZWeS2D0pMWQBcE38V5RfmRN95al6zIWtGzi+UobIFjtVGrBFL0OWmhqNlKL
         UlVyM5HJ2g2adxEARLT6lFVSEEguBwB2aOk0zY81MtMQiJA1yz/aeP+a+l8FeJEhWHRu
         jpzEHHK/xYRqIQvu6LQNORJvSqLXfo96Gb0B6VvEFJ2f3LxKsEXrG+5rNHKSO4pJe/pg
         l4QzTlw5AGNKYLB+Y1sMnS+8rsD70bZco6r+uCIMJAg7f6hW437cf6xm+4o9SBfFrptB
         eQgI7HCgT2Hjnt72I7zELonSNcXSeeOlOaqDckgFwr+TsWP3icAriGE391jaPgFDeLun
         tV2g==
X-Gm-Message-State: AFqh2kpHFxEO8nSYPBenph9F411ICA9GXnqGGBs9uEZwPRqXiLqwmgUj
        Xsk5hKnIw9r3Fpx4UDHymbYWl1nKKai0s9GS
X-Google-Smtp-Source: AMrXdXu5c0q0IAmzmEJ4LgM29sSe9+E5D/y5GcK5z4+8fQ5cFAvrX65awN/a/7t/qm0H9F2DShr14g==
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id k13-20020a05600c0b4d00b003d35d697aa5mr57972051wmr.25.1673646744326;
        Fri, 13 Jan 2023 13:52:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 08/16] tests: fix the line config reset test case
Date:   Fri, 13 Jan 2023 22:52:02 +0100
Message-Id: <20230113215210.616812-9-brgl@bgdev.pl>
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

We're using testing wrong variables in the reset_config test case. We
should be checking the retrieved0 settings which are read back from
the line config object.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/tests-line-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 5afdf7b..ef85c3a 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -175,9 +175,9 @@ GPIOD_TEST_CASE(reset_config)
 	g_assert_nonnull(retrieved0);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+	g_assert_cmpint(gpiod_line_settings_get_direction(retrieved0), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
-	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+	g_assert_cmpint(gpiod_line_settings_get_bias(retrieved0), ==,
 			GPIOD_LINE_BIAS_PULL_DOWN);
 
 	gpiod_line_config_reset(config);
-- 
2.37.2

