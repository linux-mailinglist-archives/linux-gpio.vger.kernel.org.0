Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5730E32ACD6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381925AbhCBVNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbhCBBTY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 20:19:24 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78740C061756;
        Mon,  1 Mar 2021 17:18:44 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l12so18108999wry.2;
        Mon, 01 Mar 2021 17:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b5JpSopPY2Ba++MnmvP2oy7vlccUYn7Bdxr1A7Oe/pI=;
        b=vEOiFiRkTJygK/lt0xOwiye1jZBqFA7aQQ0jfkwsAdWpgMIwunDIln6TsffSNMwdNn
         mOK364Py8BBpvzeD/V2maBlVLsuQm3ytH+gp2mvfDeoXHXc3wb9DI2dQiPhXAsq4CqcZ
         kz9dBWj97SXQtAGzUvcxx9GYO1sP3jCD6DViLCUPczUGbj3i9ZN+poW0E2UZl22+H8qQ
         qPGFrDibQQP7PmCr30TE0SLLXCtkaWpc2ritz3AWUmKRcpSSaS2+A/qke4tqy7FG1lk9
         PHGmohKfkJNvrvMn8q7t3s2RxjTo93w7mfMIhKSbSsN0PXfuGCEeQcPdhKiCllXZN1Oh
         x/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b5JpSopPY2Ba++MnmvP2oy7vlccUYn7Bdxr1A7Oe/pI=;
        b=IqjVTA5I3XzWvtzwHCX5yjo2Rrt3FZPSsUVseNi6AQlcN8sYeGSrCAHE+rcZk4c//L
         RGEdGAzebteLYcGxxY8duXlxucrqwRHjHe3VDydyBqWVaSFL+Dpk0w4SV/VemaNJOMZz
         +v3GATyKm4LDzI1hwZorS2Tldjqle5kqHc7HLdv/mb8i8xN4FncFrOUb8ilgqhMSZXXC
         vHSjNz7najg4vgEhfJ/SN1P66B5uL2hTJ+zeDCa05rleRb2EVoBpql98v9fZ7YDJD0lX
         t6X2Jq49LVsCqA3xmnIgzg7dBmbSFTAYU3rqxFrwNGzv2cf0rPGFr0n1G5n62FooBSdB
         pXsQ==
X-Gm-Message-State: AOAM532GAk7jedqBjIFKsN1UOy5hOAHG4R8rJyMwLOjkB4b9CuDvLRO8
        KGaq/58X009YJO3Vv310RvJcw3ZFmmZW0WDT
X-Google-Smtp-Source: ABdhPJy8n7OKNFczVy0IootLTBtWXICCrYTBHKaL9I0I9WnHHEFXUqN7b3MBIL0eMHO782sZTMkE+Q==
X-Received: by 2002:a5d:6290:: with SMTP id k16mr19516503wru.264.1614647923283;
        Mon, 01 Mar 2021 17:18:43 -0800 (PST)
Received: from localhost.localdomain ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id 36sm29018553wrh.94.2021.03.01.17.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 17:18:42 -0800 (PST)
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: omap: Honor "aliases" node
Date:   Tue,  2 Mar 2021 02:18:13 +0100
Message-Id: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the naming of the GPIO chips depends on their order in the DT,
but also on the kernel version (I've noticed the change from v5.10.x to
v5.11). Honor the persistent enumeration in the "aliases" node like other
GPIO drivers do.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Yes, I noticed checkpatch "WARNING: DT binding docs and includes should be
a separate patch."
However, the parts below are tiny and barely make sense separately.

 Documentation/devicetree/bindings/gpio/gpio-omap.txt | 6 ++++++
 drivers/gpio/gpio-omap.c                             | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-omap.txt b/Documentation/devicetree/bindings/gpio/gpio-omap.txt
index e57b2cb28f6c..6050db3fd84e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-omap.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-omap.txt
@@ -30,9 +30,15 @@ OMAP specific properties:
 - ti,gpio-always-on: 	Indicates if a GPIO bank is always powered and
 			so will never lose its logic state.
 
+Note: GPIO ports can have an alias correctly numbered in "aliases" node for
+persistent enumeration.
 
 Example:
 
+aliases {
+	gpio0 = &gpio0;
+};
+
 gpio0: gpio@44e07000 {
     compatible = "ti,omap4-gpio";
     reg = <0x44e07000 0x1000>;
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 41952bb818ad..dd2a8f6d920f 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1014,6 +1014,11 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 			bank->chip.parent = &omap_mpuio_device.dev;
 		bank->chip.base = OMAP_MPUIO(0);
 	} else {
+#ifdef CONFIG_OF_GPIO
+		ret = of_alias_get_id(bank->chip.of_node, "gpio");
+		if (ret >= 0)
+			gpio = ret * bank->width;
+#endif
 		label = devm_kasprintf(bank->chip.parent, GFP_KERNEL, "gpio-%d-%d",
 				       gpio, gpio + bank->width - 1);
 		if (!label)
-- 
2.30.1

