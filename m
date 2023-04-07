Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4346DAC59
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Apr 2023 13:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240293AbjDGLuW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 07:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240120AbjDGLuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 07:50:17 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B057AB9
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 04:50:14 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5491fa028adso295276457b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2023 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680868212; x=1683460212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn9VGQBxO0VW8CThpup8iOfOpiJuYyrE48H21arWabA=;
        b=PS+WYQIP26GBXUU1txWOSQkhyjA9mC1r0ZTdmHThdqM/kQIewGs/FAORfQfDR+/TJv
         UMiYAT0pgGZygzlN8Rv35b5zCeqrviHL6roT+jLupnMglDSzianQEiYAR305Ow5T7WeM
         IdpncrB6X2tJZ9ToBalbemJX45r8MikYkg7yPYR8oxoMdJpQne+hagG0xlrQoZKy5Wkf
         osk52yvoEfRDUSF0urzVAVEnWd9R6zq5x0/88fwz0I4NVmxeFkKYrvTXCwQ/sjA2DtRT
         gk/rbdKupKBo5msA9IIFMDqpp7/KeYFo343Pf3MLNVXqaZoK+F1POxOlvyn22fybOryi
         Ei7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868212; x=1683460212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn9VGQBxO0VW8CThpup8iOfOpiJuYyrE48H21arWabA=;
        b=ZFrtC8qyIM7QIzGy4oflDGXhVB6x8P0A1ZT9fINT/ira3SJmQLb1n6UR6EFmVK6Tyi
         AzloNCVjPREfpNa+d2DoA7+Oap8t+a73PXgKFnwZmKQjq15E9NtoTcrWiNdi/5PXr5XH
         f3yhCWRnb5DBZqQKykq9J5Uze8aGa1yThOzGr4yY4Hq3l5DwM8iocrlCe1xy6Lx4y1OK
         Ma9ujv6/2Od5wnixxfZzKGHU/+KvyD47FCPN8hsW7jFIrE/FzAJmx+42I0z13mMgT8U6
         tzey3ULHj0vz9cdc5iKpfVPQoOXP02xrAkeFDOtSh2FrpZXVadNKCsLupAMcs1auzfec
         Rt2g==
X-Gm-Message-State: AAQBX9eG46PKu37zUQcbnRKeG5xxDPiQ8SycnyQLxOW3zEbZ5X1Lykva
        48xQ2mQfQnKgKLDSu3xixq8UdA==
X-Google-Smtp-Source: AKy350b6xNq5sP6ICoP8hRVz+gsVa9gv2d6v37wE9aqmG2X+HKX2QngMg9E+B+fShVBqT67umlkgjw==
X-Received: by 2002:a81:d02:0:b0:54c:289b:6983 with SMTP id 2-20020a810d02000000b0054c289b6983mr1706558ywn.14.1680868212364;
        Fri, 07 Apr 2023 04:50:12 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id bw28-20020a05690c079c00b00545a08184bfsm955644ywb.79.2023.04.07.04.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 04:50:12 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [RESEND PATCH v3 1/2] gpio: 104-dio-48e: Implement struct dio48e_gpio
Date:   Fri,  7 Apr 2023 07:47:32 -0400
Message-Id: <ca710d14a710fee44f7911f2a84b6a55570561ee.1679323449.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679323449.git.william.gray@linaro.org>
References: <cover.1679323449.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A private data structure struct dio48e_gpio is introduced to facilitate
passage of the regmap and IRQ mask state for the device to the callback
dio48e_handle_mask_sync(). This is in preparation for the removal of the
handle_mask_sync() map parameter in a subsequent patch.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
Changes in v3:
 - Inline dio48gpio->map usage in dio48e_handle_mask_sync() to avoid
   redefining map parameter

 drivers/gpio/gpio-104-dio-48e.c | 35 ++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 74e2721f2613..3516321c92b0 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -99,13 +99,23 @@ static const struct regmap_irq dio48e_regmap_irqs[] = {
 	DIO48E_REGMAP_IRQ(0), DIO48E_REGMAP_IRQ(1),
 };
 
+/**
+ * struct dio48e_gpio - GPIO device private data structure
+ * @map:	Regmap for the device
+ * @irq_mask:	Current IRQ mask state on the device
+ */
+struct dio48e_gpio {
+	struct regmap *map;
+	unsigned int irq_mask;
+};
+
 static int dio48e_handle_mask_sync(struct regmap *const map, const int index,
 				   const unsigned int mask_buf_def,
 				   const unsigned int mask_buf,
 				   void *const irq_drv_data)
 {
-	unsigned int *const irq_mask = irq_drv_data;
-	const unsigned int prev_mask = *irq_mask;
+	struct dio48e_gpio *const dio48egpio = irq_drv_data;
+	const unsigned int prev_mask = dio48egpio->irq_mask;
 	int err;
 	unsigned int val;
 
@@ -114,19 +124,19 @@ static int dio48e_handle_mask_sync(struct regmap *const map, const int index,
 		return 0;
 
 	/* remember the current mask for the next mask sync */
-	*irq_mask = mask_buf;
+	dio48egpio->irq_mask = mask_buf;
 
 	/* if all previously masked, enable interrupts when unmasking */
 	if (prev_mask == mask_buf_def) {
-		err = regmap_write(map, DIO48E_CLEAR_INTERRUPT, 0x00);
+		err = regmap_write(dio48egpio->map, DIO48E_CLEAR_INTERRUPT, 0x00);
 		if (err)
 			return err;
-		return regmap_write(map, DIO48E_ENABLE_INTERRUPT, 0x00);
+		return regmap_write(dio48egpio->map, DIO48E_ENABLE_INTERRUPT, 0x00);
 	}
 
 	/* if all are currently masked, disable interrupts */
 	if (mask_buf == mask_buf_def)
-		return regmap_read(map, DIO48E_DISABLE_INTERRUPT, &val);
+		return regmap_read(dio48egpio->map, DIO48E_DISABLE_INTERRUPT, &val);
 
 	return 0;
 }
@@ -167,7 +177,7 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	struct regmap *map;
 	int err;
 	struct regmap_irq_chip *chip;
-	unsigned int irq_mask;
+	struct dio48e_gpio *dio48egpio;
 	struct regmap_irq_chip_data *chip_data;
 
 	if (!devm_request_region(dev, base[id], DIO48E_EXTENT, name)) {
@@ -185,12 +195,14 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 		return dev_err_probe(dev, PTR_ERR(map),
 				     "Unable to initialize register map\n");
 
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
+	dio48egpio = devm_kzalloc(dev, sizeof(*dio48egpio), GFP_KERNEL);
+	if (!dio48egpio)
 		return -ENOMEM;
 
-	chip->irq_drv_data = devm_kzalloc(dev, sizeof(irq_mask), GFP_KERNEL);
-	if (!chip->irq_drv_data)
+	dio48egpio->map = map;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
 
 	chip->name = name;
@@ -205,6 +217,7 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	chip->irqs = dio48e_regmap_irqs;
 	chip->num_irqs = ARRAY_SIZE(dio48e_regmap_irqs);
 	chip->handle_mask_sync = dio48e_handle_mask_sync;
+	chip->irq_drv_data = dio48egpio;
 
 	/* Initialize to prevent spurious interrupts before we're ready */
 	err = dio48e_irq_init_hw(map);
-- 
2.39.2

