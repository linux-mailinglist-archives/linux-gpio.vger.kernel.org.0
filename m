Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C691C6A341C
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Feb 2023 21:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjBZUyE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Feb 2023 15:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjBZUyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Feb 2023 15:54:03 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93047A90
        for <linux-gpio@vger.kernel.org>; Sun, 26 Feb 2023 12:54:02 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id o12so17969283edb.9
        for <linux-gpio@vger.kernel.org>; Sun, 26 Feb 2023 12:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xCc6hdBBOY36yrfSA2b2U559vub69VWaEmSIo4wJJw=;
        b=SMeeXl1uXWvpcsnn6+YTJTplSH7r1sn5v0jQLPV0uuM6eZ8NSBeUCPJct+UDIbDfhE
         hUz9whtZe9H0GWdqkRZmx2lLO80M2ZWam06soXPbvfqNEAKu3NZ7Lf8a/HzlWeqUXFoc
         PTUqnprv3G8kpA+6PG+qBflVBseS6XsKp6Yg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xCc6hdBBOY36yrfSA2b2U559vub69VWaEmSIo4wJJw=;
        b=xJfJgR79qniqKZBgP68J6Z+MiDU6VTTfzjPmiQUZeLfHpNbcfoyK7ZhFNx1F2/YaFX
         mVSlugQhar0putvVWSvJrLaS30Nc8N49GOfDmN9Cp5eszUWnjPneqrud9Iu2DvkQl73X
         DF8IsC3Ryecl5m8tyr/vfjuZeClA/EXiipupO5el4GH355WajI0ax3Kejr9o+xtl837p
         lFf1DZvwWSK1XLf+eKKQR7e6B9xYx4HoNmK0cflR1EqGULEHQvJfVH2LuPTag0nFyUIj
         JVc4mKnMdqDT5b8G9uDaIaLlInhEtPODTB/UsUUWXMGJEfvBUsJJOL70YYK/R/ov0qSL
         hv1w==
X-Gm-Message-State: AO0yUKWlsmPIv1gIDSGog4j37EufUjbW1SfnwZ6N5DuI2kaZvv4Nyk/s
        MMlm0Cxo/2oiqo/nNDS3ykrWRA==
X-Google-Smtp-Source: AK7set8V6hoMz0ECwaPMOpg+24nD8v3A2PKT8QB9l9btM0fXTE2gC6XCHB9TJ6kADcZOags+3mOjmg==
X-Received: by 2002:a17:906:9991:b0:8b1:7eb1:590e with SMTP id af17-20020a170906999100b008b17eb1590emr32173637ejc.20.1677444841214;
        Sun, 26 Feb 2023 12:54:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-22-12.retail.telecomitalia.it. [82.56.22.12])
        by smtp.gmail.com with ESMTPSA id lz15-20020a170906fb0f00b008dffda52d71sm2320013ejb.124.2023.02.26.12.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 12:54:00 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: mxs: use dynamic allocation of base
Date:   Sun, 26 Feb 2023 21:53:57 +0100
Message-Id: <20230226205357.1013504-1-dario.binacchi@amarulasolutions.com>
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

[    0.136834] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.142753] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.148452] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.154341] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.160097] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.

So let's follow the suggestion and use dynamic allocation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpio/gpio-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 7f59e5d936c2..b48a7c1fb7c1 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -330,7 +330,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 
 	port->gc.to_irq = mxs_gpio_to_irq;
 	port->gc.get_direction = mxs_gpio_get_direction;
-	port->gc.base = port->id * 32;
+	port->gc.base = -1;
 
 	err = gpiochip_add_data(&port->gc, port);
 	if (err)
-- 
2.32.0

