Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B8D665D2C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jan 2023 14:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbjAKN6H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 08:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjAKN6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 08:58:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363BF6317
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 05:58:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g13so23638924lfv.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 05:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44/nBqqhAUPyxGB5I8M9n1J0/0YHj04WiXik7CmLbeA=;
        b=zWl83H4HSSjWuq9PnZYN8PIZ6AXnITpL1VbNF4N5RqNMLf29sa4ZdXNjdk6seF+B12
         wDd8Y8bNws5zb8ORt2YgnaXcnqFXf44EGn/XsgRvxccg9GY3dtlUJ1NGuHQDXu4GrRfH
         aaZIlYHpaFqi/tVEw93pDCG7eiWwNBVSy7BHgqJNHa+J4pZiE4gwFGg0b4tztDVYmwTU
         4W0ZOPYb/fBcMZcRIW6sKt1V9uJDtBOMeFAxn1Dd/yI6nZnre33vaGT3mVUTjxjWswQk
         2nQpoFzYDLTasLMriCeyRVe3FmWH9ZvbJOhXIMKT83T4kT3kfr2IrXzA/Yxx8NE+Nszk
         e4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44/nBqqhAUPyxGB5I8M9n1J0/0YHj04WiXik7CmLbeA=;
        b=K/sPROFqQVSZIFRyuK52cWz+46R2z6Mjm2AS9JTUOK+pxA2XHNhZz8R6mnLTGIV6PJ
         FyHzDSvPjax/wifnpeCoYHwlQMn/aOYyr4M5FYnOXZ91udoJjIQR4FT5O+qaIZpi1sIQ
         knHtwMUGGEphsSFNL5RKYdvikrNucsvknjUBmNbwi4Dir7LyeTg7Av4ZVqyAcipapecV
         U3Ou8pX8Piktgf4x3VEHKKVzsYSCQX59jOsFQz5Y34mF1Qg+AFb0mL6YGJX9D4vh55dg
         +DdkWN++qchqErdI5o2SG2YhPa89IYyBKjqKheLjBqswfAuL7Em6vaTDA8XJ1zZvaQyo
         k9KA==
X-Gm-Message-State: AFqh2krZKaH9uRn1XQqrAnhhQAfAc0T2D7rjqyGNAtP5llbgCi7T3O3Y
        G3ppcHWyn2V5cXkaJcTJ/g9fkw==
X-Google-Smtp-Source: AMrXdXsncOkM7KAlsnz6GSQron9wTKD27W5Bjt4gHL/41yBaqFqSlgPeVz3IuHHTiUKHDRXr6lkt0g==
X-Received: by 2002:a05:6512:3f0e:b0:4cb:430d:2b99 with SMTP id y14-20020a0565123f0e00b004cb430d2b99mr10988858lfa.41.1673445483570;
        Wed, 11 Jan 2023 05:58:03 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id t20-20020ac243b4000000b004cb44c1d060sm2721367lfl.134.2023.01.11.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 05:58:03 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] media: em28xx: Drop abuse of gpiolib
Date:   Wed, 11 Jan 2023 14:58:01 +0100
Message-Id: <20230111135801.135824-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver is issueing calls to the legacy gpio API from
<linux/gpio.h> to pull a LNA gpio line low or high.

The code as it stands can not work and does not make sense
since the GPIO number assigned to dvb->lna_gpio is only
in scope in this file and never assigned any valid GPIO
number, the driver has no way of asking for a proper GPIO
and will likely ask for GPIO 0, which will likely be wrong.

In one execution path dvb->lna_gpio is assigned some constants
to the local GPIO block which is not using gpiolib, adding
to the confusion.

Delete all use of gpiolib as it can't work. Leave the custom
(local) gpio handling around, as this is likely the only thing
that can actually work.

My guess is that this driver only worked on platforms that
for some reason does not enable CONFIG_GPIOLIB. It was likely
causing a bug on any platform enabling CONFIG_GPIOLIB.

If anyone knows how to fix this driver properly then tell
me.

Cc: linux-gpio@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 32 ---------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 9fce59979e3b..57598e825135 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -29,7 +29,6 @@
 #include <media/dmxdev.h>
 #include <media/tuner.h>
 #include "tuner-simple.h"
-#include <linux/gpio.h>
 
 #include "lgdt330x.h"
 #include "lgdt3305.h"
@@ -727,28 +726,10 @@ static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
 	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
 	struct em28xx *dev = i2c_bus->dev;
-#ifdef CONFIG_GPIOLIB
-	struct em28xx_dvb *dvb = dev->dvb;
-	int ret;
-	unsigned long flags;
-
-	if (c->lna == 1)
-		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
-	else
-		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
 
-	ret = gpio_request_one(dvb->lna_gpio, flags, NULL);
-	if (ret)
-		dev_err(&dev->intf->dev, "gpio request failed %d\n", ret);
-	else
-		gpio_free(dvb->lna_gpio);
-
-	return ret;
-#else
 	dev_warn(&dev->intf->dev, "%s: LNA control is disabled (lna=%u)\n",
 		 KBUILD_MODNAME, c->lna);
 	return 0;
-#endif
 }
 
 static int em28xx_pctv_292e_set_lna(struct dvb_frontend *fe)
@@ -1705,19 +1686,6 @@ static int em28xx_dvb_init(struct em28xx *dev)
 				goto out_free;
 			}
 
-#ifdef CONFIG_GPIOLIB
-			/* enable LNA for DVB-T, DVB-T2 and DVB-C */
-			result = gpio_request_one(dvb->lna_gpio,
-						  GPIOF_OUT_INIT_LOW, NULL);
-			if (result)
-				dev_err(&dev->intf->dev,
-					"gpio request failed %d\n",
-					result);
-			else
-				gpio_free(dvb->lna_gpio);
-
-			result = 0; /* continue even set LNA fails */
-#endif
 			dvb->fe[0]->ops.set_lna = em28xx_pctv_290e_set_lna;
 		}
 
-- 
2.34.1

