Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0807783B27
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 09:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbjHVHve (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 03:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbjHVHvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 03:51:31 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D551196
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 00:51:29 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fef56f7223so10307165e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692690688; x=1693295488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECb5skCeOv1O2YqHXGwlW3DQYk2SMZQiwOoMUc4VWxA=;
        b=K+LX1vNBTwJ0P3IgHZjtIvNFtu+X1zVGwiowxEV/0CK18L1/T20K4h1HbA+bk2bk7T
         xh8z+Vl3WvMgRWi5NYmeqUlfkDo+LcKpyZcnffLZTCOQ+P7kp4SwoXHGQ4xkAgkQrWea
         UuUdZvvJY0gbP7UzoL5vShkQhcDJ4kfvqO/3gGq0GD64V+/RfDloHQE0dDNr6LYitlQZ
         W777HJgUnFrWTpm3TCctWDDE7V9QG61EzoraBjeeTCm6LfiWiAOPoFqlq0aj3quVJC6x
         mmCMrXTE1rGxwJX+/hD4eJOZezZ2cg2xXTzXjzaI6FZkmMr0W8JIUCjVaa7FGzyiG70K
         4Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692690688; x=1693295488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECb5skCeOv1O2YqHXGwlW3DQYk2SMZQiwOoMUc4VWxA=;
        b=PqHBO2BxhQYr9gIc0g3osyk+sZj3qv5LjtK9GRnCA/gEEHLuAF5GHi8Ypyqnc40yUJ
         D5nMuIwUeK4iAmfpeQYg+AO9OA08RmTQBPRXHfOp3J4gjpFVP+sbKc59IEhXMkMXjlTl
         GAsRo4VhjPttxZHI+QCue5qysBms/z+zWQLU03o2FHm8pgDOwrJxKxOIv/01fqkyxHl/
         kE+l8Wj2DGE8sGosZf6lhsVxS4jiW+8WxMGTA4N39V2gAxXENerhkO6yoUm+0nvyQYJw
         HsJs0sU4peoo80HBd6AzvkeGw99ks+ssSHwjbfzD3a/Ufxi1Jf92xG3NWgpploU72CqP
         Skag==
X-Gm-Message-State: AOJu0YwtpYOAMr8ePloBP0Iic5GIEAY1xX3H4Bq5pzYboSoegRKiPn2C
        +iYLwOwYt+fr/PerIf+ZOLhywJKqJ2to9sdwyA3JfQ==
X-Google-Smtp-Source: AGHT+IF7HFvo30T/ab0u5shkV6X+SmAKJfrPBhJ3P+3vUfb94eS6lKYDAn7vRAQyb5aGM6P0hRDAdg==
X-Received: by 2002:a7b:c459:0:b0:3fe:16d3:7d60 with SMTP id l25-20020a7bc459000000b003fe16d37d60mr6902040wmi.9.1692690687793;
        Tue, 22 Aug 2023 00:51:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6042:edc2:a9e7:ea8b])
        by smtp.gmail.com with ESMTPSA id v25-20020a7bcb59000000b003fe4548188bsm11057739wmj.48.2023.08.22.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 00:51:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: sim: pass the GPIO device's software node to irq domain
Date:   Tue, 22 Aug 2023 09:51:22 +0200
Message-Id: <20230822075122.6900-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822075122.6900-1-brgl@bgdev.pl>
References: <20230822075122.6900-1-brgl@bgdev.pl>
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

Associate the swnode of the GPIO device's (which is the interrupt
controller here) with the irq domain. Otherwise the interrupt-controller
device attribute is will be a no-op.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 27515384aa10..835999343f16 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -414,7 +414,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (!chip->pull_map)
 		return -ENOMEM;
 
-	chip->irq_sim = devm_irq_domain_create_sim(dev, NULL, num_lines);
+	chip->irq_sim = devm_irq_domain_create_sim(dev, swnode, num_lines);
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
-- 
2.39.2

