Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF797CC292
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbjJQMIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234972AbjJQMHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:07:48 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE3C272E
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:54 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4060b623e64so35187165e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544352; x=1698149152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qenkA6xUaauonLvrFTXXD5sPq5v8M/Ht2ghe2Ntrw0=;
        b=yl015W87x66JjdrmgBYlXhSC1ilptn8QMzY+J4MiiJ99/Arogz0msko+061uEx506q
         M7gQ18qfTXz4dsrb3q7DIr7kgEznANR7lWSVML0pHJbOn33G4KNbpt/YU3z0wZFmXeWZ
         Wt+JBXegCnRu8z0iLPAE5VkmYvyZ9z/Zv4KHmz19jadfoMsqGQG44iRBuQz+WASMnEeP
         3NuAzb/LJKVHTsueIBALTMpfXYBqGafMKI2vqJPff5dNf2E9PNk4fgp8vIMVGL3K6ojy
         7Y/0GWR1ETy5o33/x9FwqxFowDyeyhQetbvIlFGVHce3wcu+DH5Xny1uV5k5NGVw0u54
         FTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544352; x=1698149152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qenkA6xUaauonLvrFTXXD5sPq5v8M/Ht2ghe2Ntrw0=;
        b=j6tWQ4ckW2nXXOizVedVmIEVFFori57WsypK8tbBfbbJbrF5/8SK1CXC1MRe6/sJcb
         4UXIPoGVfeRT0+tdg760P5H/v9qh6AQoqFCu94rS54eQGagIFQPFF5Iu25rLCNL9KvRD
         gGC3Jq+i3z7STzRwsj3gowZc5+1tdpB3BmL0GaMv11Q/oZp3sPpxGosROHPHcbqpvtZq
         QoqeuVMyfcGAvIEN9/GuFm+REH0KZZBndUpkfPuMcuRmwECWzf/Sh6uOWWs6x2RbQXD1
         7i44ljdpFEYGWO0ZkeFHxCbGAfef6mJERu+/oHG6Lx9bjsHVJVXb43awlbNde8dRtKUT
         SeYA==
X-Gm-Message-State: AOJu0YzHWN18Jx8Q+nrQwngKsktgO+tPL1T6ZgQ1U/+mc/FCUYuqYW/d
        tQFpLvu96/7OK9kqgcbw6Zi8Kg==
X-Google-Smtp-Source: AGHT+IG006eiZyEKvcOuI2B3LRPUl2eJRkiEOnDMJ8eFEPmWL+95NbnHDFnkRuQ7844hEA8IaFsYmg==
X-Received: by 2002:a05:600c:4fd3:b0:402:e68f:8a4f with SMTP id o19-20020a05600c4fd300b00402e68f8a4fmr1608219wmq.0.1697544352447;
        Tue, 17 Oct 2023 05:05:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 67/73] pinctrl: starfive: jh7100: drop wrappers around pinctrl_gpio_request/free()
Date:   Tue, 17 Oct 2023 14:04:25 +0200
Message-Id: <20231017120431.68847-68-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_*() helpers now have signatures corresponding with those of
the GPIOLIB callbacks. We can drop the wrappers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 7beed57d665a..ea70b8c61679 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -916,16 +916,6 @@ static struct pinctrl_desc starfive_desc = {
 	.custom_conf_items = starfive_pinconf_custom_conf_items,
 };
 
-static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
-{
-	return pinctrl_gpio_request(gc, gpio);
-}
-
-static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
-{
-	pinctrl_gpio_free(gc, gpio);
-}
-
 static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
@@ -1309,8 +1299,8 @@ static int starfive_probe(struct platform_device *pdev)
 
 	sfp->gc.label = dev_name(dev);
 	sfp->gc.owner = THIS_MODULE;
-	sfp->gc.request = starfive_gpio_request;
-	sfp->gc.free = starfive_gpio_free;
+	sfp->gc.request = pinctrl_gpio_request;
+	sfp->gc.free = pinctrl_gpio_free;
 	sfp->gc.get_direction = starfive_gpio_get_direction;
 	sfp->gc.direction_input = starfive_gpio_direction_input;
 	sfp->gc.direction_output = starfive_gpio_direction_output;
-- 
2.39.2

