Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59FBB784A72
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 21:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjHVT3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 15:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjHVT3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 15:29:50 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B060DB
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 12:29:49 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fef34c33d6so19726955e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 12:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692732588; x=1693337388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=466Sg4iv0QPYwqla3IN/qZazdkQTuc/CHLvGEclLflM=;
        b=fg1ZktYtogcavbabgsn5hjJepJazA2t34SDkIvKwH6CJ4g75yfMM+ylYY3T2j644gv
         2cjq2+JzE630hSEz49V50klQEOMIz48dfXP9OhjqHNC4yEwITahXO8RL1lW0WBdbMQAF
         G+onVaEDXEy8rHRIcVZcCs1lAmTnYbE4SSmIpfEQovTVO1sIP/0qZpFrXb4vcGltl4Pk
         6DyCVcr9OyUZ/KSVsF7ABijyAWbiENblMxMPRCpj5a6gC/PW3YY9aoFRx39qXW6JWNKi
         fxoagOJdC8gxm6cB6ydGgn29dqbQRQsSNd/AjdSQ2AHGjXf3OzG3GQGT0q5F03xHaCC9
         kFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732588; x=1693337388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=466Sg4iv0QPYwqla3IN/qZazdkQTuc/CHLvGEclLflM=;
        b=B0+sjLTmeRo5byPh5ldryRlxvIWJCWOBYijfApmXrQA27V2emYcQOgxybj6GH2Sr5n
         vVY/EnnoiQXAJeQiWJRs6vFRaQO5/ACekoeh3Peh5hfUm6dxbh1q3OqVPSHsV0M+dVyt
         xm3lzi/gaDm9NEn0ZXJBux/JEBAeKerd5wtujhYbugP99Hf+12lyAcnzK6YTK2oSjfvG
         aX6gakMtHv0eXOG9go0y/7YBItfSwYstLi7e48BO86O2vjYHpN18yeQX5BGkPI8ZjtbE
         7rbh3tMxEzMGsG6NPUNRfeRyEZUh4RFenEeGw30enc5FmIFfSTgSoIGbugOXE2zKXELF
         LEvA==
X-Gm-Message-State: AOJu0YzXIBq6kN629AvVbhjwlG0PgHzcVE9NR+BqXzt3sYS5cYQsGNOk
        eLXbpVAv+QHnv9UdSCmZW8GlAQ==
X-Google-Smtp-Source: AGHT+IFIlrjbTyqnZfVROgE6smTniEOIXGrSGniQw4H0h0WObRmAX9yY6dVlSqyG3yG16BYhgckUaQ==
X-Received: by 2002:a5d:62ce:0:b0:31a:ed75:75df with SMTP id o14-20020a5d62ce000000b0031aed7575dfmr6660534wrv.15.1692732587551;
        Tue, 22 Aug 2023 12:29:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ca21:e0f4:e967:fd3d])
        by smtp.gmail.com with ESMTPSA id s3-20020a1cf203000000b003fe17901fcdsm20062516wmc.32.2023.08.22.12.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:29:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] gpio: sim: dispose of irq mappings before destroying the irq_sim domain
Date:   Tue, 22 Aug 2023 21:29:42 +0200
Message-Id: <20230822192943.493182-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If a GPIO simulator device is unbound with interrupts still requested,
we will hit a use-after-free issue in __irq_domain_deactivate_irq(). The
owner of the irq domain must dispose of all mappings before destroying
the domain object.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- drop the return value check of irq_find_mapping()

 drivers/gpio/gpio-sim.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index f1f6f1c32987..8fb11a5395eb 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -291,6 +291,15 @@ static void gpio_sim_mutex_destroy(void *data)
 	mutex_destroy(lock);
 }
 
+static void gpio_sim_dispose_mappings(void *data)
+{
+	struct gpio_sim_chip *chip = data;
+	unsigned int i;
+
+	for (i = 0; i < chip->gc.ngpio; i++)
+		irq_dispose_mapping(irq_find_mapping(chip->irq_sim, i));
+}
+
 static void gpio_sim_sysfs_remove(void *data)
 {
 	struct gpio_sim_chip *chip = data;
@@ -406,6 +415,10 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
+	ret = devm_add_action_or_reset(dev, gpio_sim_dispose_mappings, chip);
+	if (ret)
+		return ret;
+
 	mutex_init(&chip->lock);
 	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
 				       &chip->lock);
-- 
2.39.2

