Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5F519B6B7
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 22:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732807AbgDAUFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 16:05:35 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44119 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732695AbgDAUFf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 16:05:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id m17so1533805wrw.11;
        Wed, 01 Apr 2020 13:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vI49ES0RxEAa6EnUEnaXuceKKewptCwJ7U7B/qtu8WE=;
        b=agLnhc0KJXIezIOiP2dTCNztO+P5XDUm50ivn7pbrmc7okAXwFT3hLwvcdpz9EJQF3
         mN0WWMfKl7rOdjvMrfN4vgoMKqAdzWuf+JSe9KKiqixVfB45nuVTfp90fZm4adhBFnl6
         SRQSntwswLdx8ozCP8r6LJNMkOjQSJYpamFT/ktf31H0E87zDz3I8pjXNqWHEmWxgr2h
         r27+O1ysI8hggLHYXS1E6JEqzDGs1BRbX6Exeimk8mksUJSPSpx8KOz+dyNsCUjPQc6M
         xpR6OwBAgrOcxaWCSMmH2ZA5icWsDNCSXqVobcUEyYBlxk7LP5noz3Sgnl+Pq5R8pSPv
         4C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vI49ES0RxEAa6EnUEnaXuceKKewptCwJ7U7B/qtu8WE=;
        b=iz25KvG0BQhwX+7f0AX84yJyEQ9B9/hYYaui/1RedNv1pKEAtnw+WDGgP327UnGrjP
         JcHXP6NboHW0kDI2pKApQxGtuVk1JHxQQ+Lkjok5mDWkxBY4n4fGJS5pYlJDuR6P/13T
         FlTbRrkbginv2zCn6iktW0FPO4pj56bHKI6pn3nTMwxsa3YFzHbjfe0cuwAGyGl9IVtG
         O7kB6ESed21LRLFuVF/eRdCDTyQs0Yy4fmrb7ykUwhRLtC7oci3gacOV12vd5Ns7mXrV
         z5jEoj8/JPXEOhjuj7DBsHFTj1np85EsFaYpHuCtyCh/3DP8MmJSeW6HdeMFF8DlNaKM
         eYaA==
X-Gm-Message-State: ANhLgQ1fxClmjqZYuQzPXR4qB7HA88+zNr79jCMmhBGdsyPKZw+hFX5V
        MJKdKKUVbdKttLHwipTgVDo=
X-Google-Smtp-Source: ADFU+vszFXDSJDjW1n494XC6zkKdM+PHFUe65IUUCn+OChGVMoU0nJv56VZijGq4G4kBji5hwPv32w==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr27204536wrl.298.1585771532365;
        Wed, 01 Apr 2020 13:05:32 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id a7sm3757579wmm.34.2020.04.01.13.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:05:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: Unconditionally assign .request()/.free()
Date:   Wed,  1 Apr 2020 22:05:26 +0200
Message-Id: <20200401200527.2982450-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The gpiochip_generic_request() and gpiochip_generic_free() functions can
now deal properly with chips that don't have any pin-ranges defined, so
they can be assigned unconditionally.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-davinci.c |  7 ++-----
 drivers/gpio/gpio-mxc.c     |  7 ++-----
 drivers/gpio/gpio-pl061.c   |  7 ++-----
 drivers/gpio/gpio-pxa.c     |  7 ++-----
 drivers/gpio/gpio-zx.c      | 10 ++++------
 5 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index e0b025689625..085b874db2a9 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -259,11 +259,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips->chip.of_gpio_n_cells = 2;
 	chips->chip.parent = dev;
 	chips->chip.of_node = dev->of_node;
-
-	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
-		chips->chip.request = gpiochip_generic_request;
-		chips->chip.free = gpiochip_generic_free;
-	}
+	chips->chip.request = gpiochip_generic_request;
+	chips->chip.free = gpiochip_generic_free;
 #endif
 	spin_lock_init(&chips->lock);
 
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c77d474185f3..64278a4756f0 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -485,11 +485,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
-	if (of_property_read_bool(np, "gpio-ranges")) {
-		port->gc.request = gpiochip_generic_request;
-		port->gc.free = gpiochip_generic_free;
-	}
-
+	port->gc.request = gpiochip_generic_request;
+	port->gc.free = gpiochip_generic_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 3439120f166a..e241fb884c12 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -298,11 +298,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(pl061->base);
 
 	raw_spin_lock_init(&pl061->lock);
-	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
-		pl061->gc.request = gpiochip_generic_request;
-		pl061->gc.free = gpiochip_generic_free;
-	}
-
+	pl061->gc.request = gpiochip_generic_request;
+	pl061->gc.free = gpiochip_generic_free;
 	pl061->gc.base = -1;
 	pl061->gc.get_direction = pl061_get_direction;
 	pl061->gc.direction_input = pl061_direction_input;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 567742d962ae..1361270ecf8c 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -361,11 +361,8 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 	pchip->chip.set = pxa_gpio_set;
 	pchip->chip.to_irq = pxa_gpio_to_irq;
 	pchip->chip.ngpio = ngpio;
-
-	if (pxa_gpio_has_pinctrl()) {
-		pchip->chip.request = gpiochip_generic_request;
-		pchip->chip.free = gpiochip_generic_free;
-	}
+	pchip->chip.request = gpiochip_generic_request;
+	pchip->chip.free = gpiochip_generic_free;
 
 #ifdef CONFIG_OF_GPIO
 	pchip->chip.of_node = np;
diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 98cbaf0e415e..64bfb722756a 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -226,13 +226,11 @@ static int zx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	raw_spin_lock_init(&chip->lock);
-	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
-		chip->gc.request = gpiochip_generic_request;
-		chip->gc.free = gpiochip_generic_free;
-	}
-
 	id = of_alias_get_id(dev->of_node, "gpio");
+
+	raw_spin_lock_init(&chip->lock);
+	chip->gc.request = gpiochip_generic_request;
+	chip->gc.free = gpiochip_generic_free;
 	chip->gc.direction_input = zx_direction_input;
 	chip->gc.direction_output = zx_direction_output;
 	chip->gc.get = zx_get_value;
-- 
2.24.1

