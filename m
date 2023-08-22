Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26A8784A75
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 21:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjHVT3w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 15:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjHVT3w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 15:29:52 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1925DDB
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 12:29:51 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3feff2362fbso3555625e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 12:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692732589; x=1693337389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHyXqFfULvIVcKIx2K5/rAyt42Nw4BzX3vSzBNKU1Lk=;
        b=IaBTLslOVwcXL9iVY6OPIiQqPph5vK5PCMt6TiDktyQ9pzv2OT1arJJS1zdfGKHBI9
         ABloCYGehGnYnaHvyxRMozZ+aqEmG84IWZieQgrz1qLn8ZahOJXysv8j9k/WUBFk24iq
         LbI2eBlXIDQDzqfIusFT+3uReB+J1ptJB0zWcIXL9G1n2zek3aDYwbjy/FMgu7NiQBze
         QYaamWCuJFZegTRZ1OpR7JW2EJWNmbr63TG6kxzl3usP2aSchWuVnlqdgDEfRXMVTX4g
         ItImyKt0FpvDHNtDhWa4hlOMvlAgRrjbrBgyR0oE2iFJz12YNaw4B2R3EbcZyKa5dnoK
         +KKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732589; x=1693337389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHyXqFfULvIVcKIx2K5/rAyt42Nw4BzX3vSzBNKU1Lk=;
        b=CAARY/Yicw0fOC9Csl1masAacj9Q72YJz17phmvawZw36t+RakOrvbEzEimWmL9seQ
         8lSy/eX57j+ygfURdV3GX3j8p0m14wDMGqPGwnF6EKCCYmfv/gG8VJNjNeZ2cWsxIHp1
         ZR0yWQfjF5KCnPYk2G2mUQe5KzyrA03kMWUZouJfJCOpTZ+QbV2275aeV3auRAFfujTf
         ckPkohfkwviZ3dhM0IE61Oa3vbJ17COSbsyMA9IrXD4uJ1LDxn7iL+njNtUHTRuHrEc6
         k7dPUJwWMZRL3ESMGVcdtg13ymJHlCFBD+gj7n5LPRwMOO0Un6oawZZ5J9K2JyFlHEs8
         6MWg==
X-Gm-Message-State: AOJu0Yw4pcyIXRYGRFa7bh4w/kZGJSHewJhUrS8vB+ldQpBF5jjboFvl
        YO5koXWTjoB9VuyAuggqjAPV6s0/ghXe3oHx7QnFJQ==
X-Google-Smtp-Source: AGHT+IH3hdkmkNaGNj+MDVmsoeIDa16uecdRLrCYXkNmfhohS0laxDL13T9tJiApgiXLRdEhZXHDPQ==
X-Received: by 2002:a05:600c:2284:b0:3fe:e842:60a0 with SMTP id 4-20020a05600c228400b003fee84260a0mr6956840wmf.31.1692732588710;
        Tue, 22 Aug 2023 12:29:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ca21:e0f4:e967:fd3d])
        by smtp.gmail.com with ESMTPSA id s3-20020a1cf203000000b003fe17901fcdsm20062516wmc.32.2023.08.22.12.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:29:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/2] gpio: sim: pass the GPIO device's software node to irq domain
Date:   Tue, 22 Aug 2023 21:29:43 +0200
Message-Id: <20230822192943.493182-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822192943.493182-1-brgl@bgdev.pl>
References: <20230822192943.493182-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Associate the swnode of the GPIO device's (which is the interrupt
controller here) with the irq domain. Otherwise the interrupt-controller
device attribute is a no-op.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v1 -> v2:
- tweak the commit message

 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 8fb11a5395eb..533d81572579 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -411,7 +411,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (!chip->pull_map)
 		return -ENOMEM;
 
-	chip->irq_sim = devm_irq_domain_create_sim(dev, NULL, num_lines);
+	chip->irq_sim = devm_irq_domain_create_sim(dev, swnode, num_lines);
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
-- 
2.39.2

