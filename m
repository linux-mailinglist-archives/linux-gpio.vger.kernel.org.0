Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58AF6A3419
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Feb 2023 21:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjBZUx0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Feb 2023 15:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBZUx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Feb 2023 15:53:26 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6A210A88
        for <linux-gpio@vger.kernel.org>; Sun, 26 Feb 2023 12:53:24 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id da10so18099925edb.3
        for <linux-gpio@vger.kernel.org>; Sun, 26 Feb 2023 12:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JR/xaxtSDlKmw7YS+qfiLoBpoTU0MOOpIKaw5YJTCOk=;
        b=FW/nKNh3fHOfReuXwxYmOniq6e6RvXBbrPhgd4uZCkUfFf6UUaNPX5kgCeRlyu3rdT
         1b5NYLxxYHp78G7KfPlZXf1MNOgPjirYu8R4Hv3Ze/vU4EGZ+KKagSZ5f0L6uFvatVNv
         lEny/6gqgd1mPvaeUxKxGJoZj87PoO5h4JhxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JR/xaxtSDlKmw7YS+qfiLoBpoTU0MOOpIKaw5YJTCOk=;
        b=sUAbHjl9zn7oXnpAaan6cElRtHuhyhtGMHkLhF5EP/WFnsldBw8Jm0iO0XxiYcfmQ8
         xV6Olx9c/qW017mJRSegFFlAzO+EohnVl9nOP1VWzVOGuSHSHeM/JeAhdEWqW07/fYYv
         5/hOvDA3wvNJpRHqYEhd/Eaz7DmdiDpobCVlYZf0fMqc4bn/XDQeul8BRJ+GnfcpD3V4
         pnhxlN21PrX0XzsKfYPdvWqMtG1TXUPqLBPOCU8VIQBP42GZhsg2WbxzINMWMUZ8+R7D
         egAWjEBvmq+gpEstnK6r+92LW0lfNnisF7Bn9Jrl4llinZUcMuvvcFPQt6XkNa+KAmoY
         /ZHg==
X-Gm-Message-State: AO0yUKX1Cp6xpDfWBBB9YqXsQysvcO4bcy6Lg03yT0UU083qfAaAQMII
        xjB0MLN9If55PjhXTbqZPEW9oQ==
X-Google-Smtp-Source: AK7set+TUuGaEXqJsTdShmOkZN4jEDn0nCAQIfagWEH7zKj8yi1UJnEWFXw8n3S3O3UFlvsMKJF09A==
X-Received: by 2002:a17:906:4fd5:b0:878:54e3:e3e1 with SMTP id i21-20020a1709064fd500b0087854e3e3e1mr38571076ejw.73.1677444802852;
        Sun, 26 Feb 2023 12:53:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-22-12.retail.telecomitalia.it. [82.56.22.12])
        by smtp.gmail.com with ESMTPSA id l17-20020a170906a41100b008d5d721f8a4sm2322954ejz.197.2023.02.26.12.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 12:53:22 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: mxc: use dynamic allocation of base
Date:   Sun, 26 Feb 2023 21:53:19 +0100
Message-Id: <20230226205319.1013332-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using static
gpiobase allocation"), one or more warnings are printed during boot on
systems where static allocation of GPIO base is used:

[    1.611480] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.622893] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.633272] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.643388] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.653474] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.

So let's follow the suggestion and use dynamic allocation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpio/gpio-mxc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d0cec4b82a3..abc129a88a62 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -462,8 +462,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = gpiochip_generic_request;
 	port->gc.free = gpiochip_generic_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
-					     pdev->id * 32;
+	port->gc.base = -1;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)
-- 
2.32.0

