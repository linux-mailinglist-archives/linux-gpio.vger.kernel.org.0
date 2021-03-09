Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AFC332868
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 15:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCIOUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 09:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhCIOUG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 09:20:06 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA14C06175F
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 06:20:05 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id v9so27352145lfa.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJyZdrYMJo+scwkiupHH0j/771HxMLWlOWm0nrPtSXk=;
        b=Qf5TOSf+bwAE3pDY6aNa1r0d+rcL6PPADVoY+Kq3ENDNoUJDBr2oLd4H336hpJsf5s
         m59+mNbmEFUU7AMq5+VXNC/YmjDz94QkcoEGjGfuoH13YXMS4QLFh3s+wOIjmu51RdsP
         Gne85erp2BuVB5VaF+yGm1jqBHfRVoA23Q5GTZe1lNWodHTKTHFLNIF6J+L2exsGEvZ3
         EPt19oMXU9lX7yxw1aumG2PRhmGInOvLB6K5oYdMskAj8RUBrRbFXD+jFOwKruqDzoZh
         ePfRjhcr0f7+JHc9KfzOFpgNYwW++JWV1gUUP1c4tjylLOzL1VnxpBC5yEMfSbYYywWJ
         pqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJyZdrYMJo+scwkiupHH0j/771HxMLWlOWm0nrPtSXk=;
        b=ZJCny86xaTisLXZTE7PQflAQ8aee5dUDPii0HFIYJoVN1fSeXgY6AGPNNKVfWC7BWf
         5kj3/+uuT1/lc3zrMdOC0ju9lbloQRWmjHEXHH1YhdGb/f8qI36wLsdtsB3yvmCFNlSz
         M/kpskluuBG53wp/DLgPCDc+5EvpputLuQ9lE4TWmqJ2lpPMBuZgRjAWgOcB78I/+RJk
         oT+EGRyv14zHhbv68AGMJ7mYrWjQlHHP30bOrAoFWNyVRT7655TH8T6fYY60yJPAlvHh
         UU7ixo8ThEdQCZZ1Xc3/eze92ulNpLJjfAvj1FGzbAGvjeQoR7WK12/JsFx6RNjm4gpm
         V1sQ==
X-Gm-Message-State: AOAM531ziO4chbTSmqC8bQ0CHUQXKjATs6fHn9h4Z5ZESvM9J9pY4zoT
        DSqND0jcNBIgS1g5TbE1xZ9UDw==
X-Google-Smtp-Source: ABdhPJz9A5PXmLiyuKuFuOw4BLhC2Ub3AtA/WR0hZ3WqO5LiLxNknClL+S7DqD8ECgZwsV4IEu4l5A==
X-Received: by 2002:a05:6512:348c:: with SMTP id v12mr17350197lfr.271.1615299604042;
        Tue, 09 Mar 2021 06:20:04 -0800 (PST)
Received: from localhost.localdomain (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
        by smtp.gmail.com with ESMTPSA id e11sm1272457ljj.59.2021.03.09.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 06:20:03 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Alexander Shiyan <shc_work@mail.ru>,
        linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM/gpio/dt-bindings: Clean out gpio alias from CLPS711X
Date:   Tue,  9 Mar 2021 15:20:00 +0100
Message-Id: <20210309142000.3034451-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This removes the use of GPIO alias from the CLPS711X GPIO
driver.

This driver only use it to add quirks to two GPIO blocks
for which we can reuse the standard property "ngpios" and
define a new Cirrus quirk to do it properly and get rid
of the alias.

The patch changes the driver, the one DTS file and the
bindings in one go: my apologies but this is a lockstep
solution to avoid any unclarities or inbetween states.

Old device trees with aliases are supported but will
produce a warning in dmesg and new properties will take
precedence.

Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Link: https://lore.kernel.org/linux-gpio/CACRpkda8+Lvz+c=ohXsEDkNSQ63hPo613P4p_90fvKyC_kQ_GA@mail.gmail.com/T/#t
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This is a result of a discussion with Rob about whether
we can get rid of GPIO aliases. I think we can at least
get rid of this one.
---
 .../bindings/gpio/gpio-clps711x.txt           | 10 +++---
 arch/arm/boot/dts/ep7209.dtsi                 |  8 ++---
 drivers/gpio/gpio-clps711x.c                  | 36 +++++++++----------
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt b/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
index 0a304ad29d81..c1ff20107607 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-clps711x.txt
@@ -11,15 +11,13 @@ Required properties:
     0 = active high
     1 = active low
 
-Note: Each GPIO port should have an alias correctly numbered in "aliases"
-node.
+Optional properties:
+- cirrus,inverted-polarity: The polarity of the GPIO lines is
+  inverted in hardware.
+- ngpios: Number of available GPIO lines 0..n-1, see gpio.txt
 
 Example:
 
-aliases {
-	gpio0 = &porta;
-};
-
 porta: gpio@80000000 {
 	compatible = "cirrus,ep7312-gpio","cirrus,ep7209-gpio";
 	reg = <0x80000000 0x1>, <0x80000040 0x1>;
diff --git a/arch/arm/boot/dts/ep7209.dtsi b/arch/arm/boot/dts/ep7209.dtsi
index 365931f8b48d..7d0f04959fdd 100644
--- a/arch/arm/boot/dts/ep7209.dtsi
+++ b/arch/arm/boot/dts/ep7209.dtsi
@@ -11,10 +11,6 @@ / {
 	compatible = "cirrus,ep7209";
 
 	aliases {
-		gpio0 = &porta;
-		gpio1 = &portb;
-		gpio3 = &portd;
-		gpio4 = &porte;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		spi0 = &spi;
@@ -72,6 +68,8 @@ portd: gpio@80000003 {
 			reg = <0x80000003 0x1 0x80000043 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			/* This bank have all lines polarity inverted */
+			cirrus,inverted-polarity;
 		};
 
 		porte: gpio@80000083 {
@@ -79,6 +77,8 @@ porte: gpio@80000083 {
 			reg = <0x80000083 0x1 0x800000c3 0x1>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			/* Only 3 GPIOs available on this bank */
+			ngpios = <3>;
 		};
 
 		syscon1: syscon@80000100 {
diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index 75f6f8d4323e..d2a20dc8f5d9 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -16,14 +16,11 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	void __iomem *dat, *dir;
 	struct gpio_chip *gc;
 	int err, id;
+	u32 ngpios;
 
 	if (!np)
 		return -ENODEV;
 
-	id = of_alias_get_id(np, "gpio");
-	if ((id < 0) || (id > 4))
-		return -ENODEV;
-
 	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
 	if (!gc)
 		return -ENOMEM;
@@ -36,29 +33,32 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
-	switch (id) {
-	case 3:
+	/* This ID will be negative if there is no alias node */
+	id = of_alias_get_id(np, "gpio");
+
+	if (id >= 0)
+		dev_info(&pdev->dev,
+			 "DT is using deprecated alias, please remove this and "
+			 "replace with proper node attributes\n");
+
+	if (of_property_read_bool(np, "cirrus,inverted-polarity") ||
+	    id == 3)
 		/* PORTD is inverted logic for direction register */
 		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
 				 NULL, dir, 0);
-		break;
-	default:
+	else
 		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
 				 dir, NULL, 0);
-		break;
-	}
-
 	if (err)
 		return err;
 
-	switch (id) {
-	case 4:
-		/* PORTE is 3 lines only */
+	if (id == 4)
+		/* This is just for compatibility with older device trees */
 		gc->ngpio = 3;
-		break;
-	default:
-		break;
-	}
+
+	if (!of_property_read_u32(np, "ngpios", &ngpios))
+		/* PORTE is 3 lines only */
+		gc->ngpio = ngpios;
 
 	gc->base = -1;
 	gc->owner = THIS_MODULE;
-- 
2.29.2

