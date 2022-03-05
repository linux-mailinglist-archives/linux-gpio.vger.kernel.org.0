Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E678D4CE599
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Mar 2022 16:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiCEPnv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Mar 2022 10:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiCEPnv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Mar 2022 10:43:51 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4525DE0E
        for <linux-gpio@vger.kernel.org>; Sat,  5 Mar 2022 07:43:00 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id q7-20020a7bce87000000b00382255f4ca9so8294139wmj.2
        for <linux-gpio@vger.kernel.org>; Sat, 05 Mar 2022 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5knFVechqLRRoXBkQeiWnLlTmYCcvi5f90+imAg2cOY=;
        b=6GIQsk7E60HvmrJlWOB81ghr8WfFAcCK+WRKuC0zMYbLUAyMbvPV3UGg/4t9Ex/Izw
         j0J1Q1P1AgBIk1cRAD0yuuE4KPHIsoZZOPhdJLF7p+MH+eb3XMzhgYWdiaocbjGb+MPi
         mTql/YSVVPTp8YJse7dT4MJH/H3lkmCbTFp5mGSLlemQlXdewTib1NRWfljatEvLBjBD
         56ygfhUrASNeL59k33XDDaT0fozZKeizkB1kEK4YwnkI5eLQzmWWol2w29OwcUH0wM1j
         Sb8aCjZ6N3XDpjvFP1qu6LASl0WNJ35/lkCCUvi/JhfpgbDdxGYdgutd/uuvDUX5jShU
         m+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5knFVechqLRRoXBkQeiWnLlTmYCcvi5f90+imAg2cOY=;
        b=UdorLGaUvnpL0qEGzNAPUyWe0N65HS3nLaCpmzh6ffoHC2Km//3Bo5FIjLuNqKjjun
         r/pDAoSVjbmA2C1FvQfQ+CdHezjBb3N9kc+/BmrlpyjlhbbuUDjHolxrApLlUDziOhHP
         s0OVxXIvQwQk1u8B3RNqOOl95iNg2bzR2pOJGZAEW79PMuuBphffy7HqBv0q9655pISb
         bEOmd+rNqzPtac00ZzuBuvgkiaeikdh1X7nuiWI75r8hI7cLF58S7m92kxdTE7EatFGL
         BB062eM6d+p5EnrJ3QIlSaU476C3VUmX3SdSGQCwpaWqcjW7/1rGHwfL07cu5JBJmSXE
         tL1A==
X-Gm-Message-State: AOAM531XbC40yzWsQE+rfunxmHgc4WG4AVSR/RPVFfMzzCZVaXciMN0A
        dtuLcMfxpzCs8b3GW8HRqi5tDQ==
X-Google-Smtp-Source: ABdhPJy+SNKXJeLTJy8POUvyAoiHW/OMNnPo+MkaECuSUorkrJ9qGUSpWqPl+BU0JFsdnVH8sPrg1w==
X-Received: by 2002:a05:600c:651:b0:381:3d7b:40e0 with SMTP id p17-20020a05600c065100b003813d7b40e0mr12016162wmm.17.1646494978708;
        Sat, 05 Mar 2022 07:42:58 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id bk19-20020a0560001d9300b001a65e479d20sm6758970wrb.83.2022.03.05.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 07:42:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: fix the size of the ngpios variable
Date:   Sat,  5 Mar 2022 16:42:56 +0100
Message-Id: <20220305154256.278394-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
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

The ngpio fields both in struct gpio_device as well as gpio_chip are
16 bit unsigned integers. Let's not risk an overflow and use the correct
size when reading the device property.

Fixes: 9dbd1ab20509 ("gpiolib: check the 'ngpios' property in core gpiolib code")
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a3d14277f17c..147b86db16aa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -607,7 +607,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = gc->base;
 	unsigned int i;
 	int ret = 0;
-	u32 ngpios;
+	u16 ngpios;
 
 	if (gc->fwnode)
 		fwnode = gc->fwnode;
@@ -665,7 +665,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * of GPIO lines.
 	 */
 	if (gc->ngpio == 0) {
-		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
+		ret = device_property_read_u16(&gdev->dev, "ngpios", &ngpios);
 		if (ret == -ENODATA)
 			/*
 			 * -ENODATA means that there is no property found and
-- 
2.30.1

