Return-Path: <linux-gpio+bounces-24194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76543B20CED
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132511905E34
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F6C2DFF28;
	Mon, 11 Aug 2025 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VBmiAFiQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D12DECA5
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924534; cv=none; b=P4dGZ/6ZlE80HzH3J9IoOzZWQQh7RHfSAcp2Wuh2dr1P6Yd++ROeaVkOY64c7vZ+pkT4AfZf3Jm4Ar/CLiqtbIcGvFwW5grYFM8T/LV5wz/BDB1umbsV9d4PUqUwmqAD2ubr2epUBKqt9wDWTYaJbm3nHvv56yw3i0x1vVmlpS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924534; c=relaxed/simple;
	bh=pxsnB67X1RtWO8JqaO2M8hiAAK4eLO71j2ZfjvrlhOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmHv7ok02FEeHkibOrhBOLt9gZ62gZU3sECJQE0ImDMt9c9nQJKboTMRhWxBvSmFMWFV6GBmrPIVyLusE2KxYZBXnprrmavxhszWw9fqrDq2sfbYKVRhiFJQEgSA3OMmbTRSKc/8D4J6TL9oZyt1dCa11HHTaj3WXt4ahkhFcXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VBmiAFiQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459ddb41539so14558505e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924530; x=1755529330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
        b=VBmiAFiQlOs5sThs5EwyA2DcV0rKlQSVfk+3IoX6+H9Gbr1ksQgRDIbOWAns0tOqL8
         bOckSy+rwhhWzES3Dv+868RRZkuBJyfF4ccXY+hhSB78V4bm3w80vtS0cvUW5iS8UTdM
         xu55fe7Bp6oTydwdvKDmeFnd9L0nUB2ra31DXoBayQDIQR3D6aPpbqIvUUjZwIxpA7Di
         7MeVT/ZJSu5T4x9FRoznOlRbxUAwhAXr9qCoXBw24f7atrqJPPy/tiia+D33Qu4ddeic
         HxTm6h8stW5t+zaylbxVytxc2HDASIcBH+mDCDUgf3Y6an/HzmzugUvhROt51lpFsHEo
         89ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924530; x=1755529330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQU4/cpC7C/NCX7LSPoWn8KwFr+mblMjEw9u9UNyQPs=;
        b=F4MlWgBKJqgPmVckd2C6syJHsY+aersvy/IUqk3+SptboLvAnEnUhJdnu6uVtWNCrq
         fFJqpgDR90BYygJ4msOi8SD7st6BX1Gcwgqx72j8FeOdngipR+4SxF0JTvj98PvpljYn
         nfd2pRmPtJ5/2M75KDtb/4SUZ4UZWLVSAYy7qXxuXJyO+BcLsW6IbPXpnLJwPT4OKXLO
         2+UqhtUxqW7fNtglQo8xWQ89R2grjPSGRqY7YGJtlaFoiXkHAfTOKLGSQP/gOfD3tPhS
         WNt+Xg5p6XRmil6vilKOELlc0/UV27v3Mtf6FGr7hKtNAbQsOq2SAKEI8+XOPtJe84Xa
         jo3g==
X-Gm-Message-State: AOJu0Yyq0VOAVjYScfF9zEwiQyhXGBQRUUDWiX/vSsGNFxeuQ56DnsoX
	SSEk7N5HupG1md4o077PWbmwnXMPRzDdUIXMToad/KckG/UdSdsYb2jK3Tg6mym2GWw=
X-Gm-Gg: ASbGnctzm4F15PLmQeSiQxzQvWA/EW2EsC7i0HUHZD1beYxLdC69XiIoVziUkbHjw0k
	/KwpZlpKuuKm5vl5IAPtzfHfjQuWRfvJm0EiN/Se0Ox14WEZpIyu8tGGaUwUtiyVjarRK6OlNCd
	42go0HTTOJKMclZVCj8BOMCX3pBYk9g83o1RX3QzPf6T9E47/Vbj4BkDEk/hh5uSnncHVe9QV75
	iiHtvomwWyo7bLIpUL9hKtq+ALgqMiJdgHqmGIXSG2EtYVvhEOF5B9SoReXotuj09xbkGrIu2OR
	EyON19eXEF7LwIsBB88Rdq+7OjHYC11b+RaDq+Z8PlWk01tsDyDRgAMOfvGdjwKx3I81i8Fmgsm
	k+EUuvUzcP1eto7VT
X-Google-Smtp-Source: AGHT+IGuRkJqXSehCHbSdsJW5I33/Fn2ULOWbTPFQOZm6vceKVH1dj+vd6G7mjfXDQfCQnwSEMY/9Q==
X-Received: by 2002:a05:600c:6286:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-459f5687c58mr137162945e9.30.1754924529892;
        Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:01 +0200
Subject: [PATCH 2/5] pinctrl: equilibrium: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-2-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8Yc3Q+1qQoLBEOdwvJ5ov1cATZZZnKh5I0syYOGIftg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXt7zodHeDBKguKwa7IUu7mcb1ZhND7UMYHE
 Y3heyY/C7KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ctoEEACcZAO8D6d3VypQQR63kLzYUCVUIk8a+J2FDJHx39O6IWus2qEipgONFpBz4wzudLzRqo5
 uTDCIgtDBb4+xJv641uKV8GWW3kJDVL/zaEWQ1Cf2Nf+yZvVNDEpUvV/VHI1d5FW0zgB7aatJkD
 kIfjKQcNA9wAf3mrbhjOWyi8dGvn5t3h1GxP+h1zpkki5kt4wDiJiXKnh++Ff4Ms9vMsQHUAVi6
 Fag9N8dquoInaui2BKJA/kw8qg7mJUwafO9F+/3tIV7qtJ95GeT2HIF/UXJkfF4TmmkN89PxnHc
 97wGuk/NY91jcfhI3KJj/hX34dOLANgeSYSH7c+Tpl03qrvmhQMA3LYu9Saa3UeO38Zj6Dx/3zg
 RazSoMS1zXdV+ejLnGNXLXtUtNXfk4H3DYEaDL7AlIHaaFLk1Lz1TZK0Wld7XemwDSyeif5/wY0
 6jl7HI/GWCSq/YKqrUqtnKVbK6TX8vHIEWYhS11f9U6maRkQTH2dYj8xa24n85cmVEtwKYsFv1R
 WO7dmB3Fh6fEzDpmTeE4q5VclBBN7g0ryWyWTw3Tqz/jegXUkYHK+3E9ygCq2v9KPTWGDjbsETw
 sFh/2j2L3ozuxpUBA9WEzEKEfGXqVs89vl0sjRB3eXyg2Do+3VVbsLLwztT5sfHuJ7xhq5Rh8kP
 4qhIiw2vIrQy7EQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 26 ++++++++++++++++----------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..210044185679384d03278e200d8f7723324487cd 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Intel Corporation */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -179,7 +180,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *gc;
 
-	gc = &gctrl->chip;
+	gc = &gctrl->chip.gc;
 	gc->label = gctrl->name;
 	gc->fwnode = gctrl->fwnode;
 	gc->request = gpiochip_generic_request;
@@ -191,7 +192,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	girq = &gctrl->chip.irq;
+	girq = &gctrl->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
@@ -208,6 +209,7 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 
 static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = drvdata->dev;
 	struct eqbr_gpio_ctrl *gctrl;
 	struct device_node *np;
@@ -239,12 +241,16 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		raw_spin_lock_init(&gctrl->lock);
 
-		ret = bgpio_init(&gctrl->chip, dev, gctrl->bank->nr_pins / 8,
-				 gctrl->membase + GPIO_IN,
-				 gctrl->membase + GPIO_OUTSET,
-				 gctrl->membase + GPIO_OUTCLR,
-				 gctrl->membase + GPIO_DIR,
-				 NULL, 0);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = gctrl->bank->nr_pins / 8,
+			.dat = gctrl->membase + GPIO_IN,
+			.set = gctrl->membase + GPIO_OUTSET,
+			.clr = gctrl->membase + GPIO_OUTCLR,
+			.dirout = gctrl->membase + GPIO_DIR,
+		};
+
+		ret = gpio_generic_chip_init(&gctrl->chip, &config);
 		if (ret) {
 			dev_err(dev, "unable to init generic GPIO\n");
 			return ret;
@@ -254,7 +260,7 @@ static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
 		if (ret)
 			return ret;
 
-		ret = devm_gpiochip_add_data(dev, &gctrl->chip, gctrl);
+		ret = devm_gpiochip_add_data(dev, &gctrl->chip.gc, gctrl);
 		if (ret)
 			return ret;
 	}
@@ -499,7 +505,7 @@ static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 					bank->pin_base, pin);
 				return -ENODEV;
 			}
-			gc = &gctrl->chip;
+			gc = &gctrl->chip.gc;
 			gc->direction_output(gc, offset, 0);
 			continue;
 		default:
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index b4d149bde39d8dd08a962bb05ccf026364dd9f68..b56124d7fe9132c875d2768b0af8b939f1a4fbf8 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -96,7 +96,7 @@ struct fwnode_handle;
  * @lock: spin lock to protect gpio register write.
  */
 struct eqbr_gpio_ctrl {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;

-- 
2.48.1


