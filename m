Return-Path: <linux-gpio+bounces-24197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BACB20CE1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B656F7B184D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071212E06EF;
	Mon, 11 Aug 2025 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jz9N6B0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9822E040C
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924538; cv=none; b=ZgBg/lZmVKKj2VwbGXHhKzbmneN8MJi+yjri4K+n59eR4TDfs02QH5A0tWN4+Kdaei/UPhZq+8gCzqSYzKRHzTNZbXW1/VB3WCS0VMJZGFz01Vw05/KoouNko0oG3FVXXW+UfTHrpYPfg6xrjCv8WJXOXesRFRgmYLbfOoUgsCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924538; c=relaxed/simple;
	bh=JrVzoF6/5W9MPbmnMZbsg9fhIAekqpgyP6QDd3zCrks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXp5hmAheFVijEO+Y5zx4AzQ4Ghm97InU5z+hatrwDz/TDxnsrRPF1XkJRTFXoUJM9RslUomMDsUk1Y7NxacTq7iW8rW5rp5JJg2WyyG2TUGVFS4PWI4FSOswRdf6qd8NLd8fRNRX9jpXwyMzcYUL6j8t//ybCq6qrAGT5kef5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jz9N6B0R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso28488155e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924535; x=1755529335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
        b=Jz9N6B0RqGJb7k1Nmq1I0dfUH/uHOSffzZmBhQ+cMtRhRoCD2R0yjPtjC3Ny4gXiH0
         a7SFo4EhOE9ob3QmZbvxUWDaG2WSK1Z11IF2jaqMyULpuMYisI9d/DLLnQDQwC3uCzQH
         WozGtngN+7vySJqeyBIDKpaAwS4Zzx1+/MHHZvumFP0GvfJ1YFax+o23N6kh7zn1P4Ns
         fd9z8Vx46Cv8ef7hTyJdWnlT+CDtka5ynG9RIhHaGXBqt7rhLgTGVCDVLuHn0qt4KvfU
         zj1FmNO2TFO7jvSKfJeX6J1JxxkGahIQGgGP0n0APdAqB2J4wFtkbnu0LO1ygJBnpLWz
         mS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924535; x=1755529335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysJS8u8Fhvri8S6AtBehkn2Zfsj3AWbxJ9fTcztcrag=;
        b=oTpqlthsFx5RgdaTy4ch0IXZc06Q2m04LxVrHMyillIOwV/IHrJ3iNagKBsZsMVonH
         gmJtIZhmKpaFt8k/l/KJteWX33an36CGRNsZtmFcCQXGYTo1OGC143RwHaIjLss0uADu
         aV5YcWRmBdQmrBvCEvFdubw/Zr1LvDTW2BpBoU7Ntb8vJ0fA08MORcA432pdJbWrhBOi
         2TOPX+jV1e4nZfhKVMJhMBeD4Xzb4PiJGaCePdkbJEwMY1nGb5fZgffPHK8qP/HD4VOA
         izUkzYVqB//1nLddN9P/vf3h8s9sJhP0qEmeUlyeE6PaMMPYxKgwFbTkqJdBP/1RZdnq
         DVMg==
X-Gm-Message-State: AOJu0YwZZzlLD83q1AZGBF+6j1QD4rZE14ku6Rqk6xYHwUSIaJaydF4+
	rDJI1FAgrsdBjiVIpHQY9q0L6v9Mbx0ZZMlJ7J/cTY1ksEcNN/XBKF2QbnjZ7l/0ht4=
X-Gm-Gg: ASbGncsU0boY0Sse5bu9AGWzsq1eIWRTGN+EaluFdY3wp/N2hINdEQOeo8N1zvhGiOe
	LC5bxwtenvD3NsyjhIO2o8OzsPvV0jAdBFn5MHUFA8KGxHHhlbvfqru6WxGrYWlAEDKDgo1eKWL
	5PBeOhCdtgAF9F1hC98CwGtQWHTIko0Ws2bds6/QmyHfidcYzkTOWXEaZaxW/Pp7Ox8KP2zDBj8
	HnBDPFUt89He1oVikFDtsWIy8zWkJEWFRTYkFME6ilBF0WLyCwFOx53+/VQbs+cpBmhqUZzHm4V
	g7ercD3ScNRlgx3/d44svojzgR4epjNhWBKdJWC20MpdgGWrDgqoIV2cMdhj7kLbh1kO8M7uVF9
	wxpWADREdlYUo+cta
X-Google-Smtp-Source: AGHT+IFiSDH4dTGzeIV+hH7h6pQJ8LcJq0Po1XDJ2GeMsEQEPO5rZY2CszDqq2FuZ2ThQvFn+PGHwg==
X-Received: by 2002:a05:600c:35c3:b0:456:1a69:94fd with SMTP id 5b1f17b1804b1-45a10b3a3edmr905615e9.0.1754924535221;
        Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:04 +0200
Subject: [PATCH 5/5] pinctrl: wpcm450: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-5-a84c5da2be20@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuIHwRskLSRbzwrVaTM8WNQE9cJKBQppwXKNoQVeoEY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXtHEGmnbFBea5WN4RyVzy/ytLzLC9kh6vxq
 DDy5vP9Yv6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7QAKCRARpy6gFHHX
 ch1FEACHNtA8UzYfZDTsRXPIaEfNVsIe/A7suWXcUxzJAJ4wCZsAylvzKkr4JN0hxegkQstolf7
 cqpnmT7yqQ1Qk6wcPN9hZ1SSYHmIrwvaf3mTmEloQV38NDiIm7IGi5WF2anqrWdsXNN3Fqw/Z03
 JdjyJUJ5kL/NyHTWt2wSuJS5hnvdvWygpCfSyzgVrSoOrLyFbcGlnT8I7BNO6P5D84sFm2wi7Jm
 mxORKa6aTz2hN16G9QVmbIatahVLcdG/fcDo/fqSdRfrFH54Sxws3Z1yVZiKcrsVWTD8E0xcIfi
 ah2zKGomVba+cXUDEYljd/xpKApsmMZRcMI7JjiZFjYoOXOGWQk/y66BEo7xGO5cm2Ek7E1c3vb
 cKltTFPFOiJa2IZQm5w2yvy6lA08elwimHnGHoWhZVIzJN/i3zKfcAYeYcM3+Wzv09D9vZIDGa4
 c2jq8H6LaAp67sWaKXv+xE4ZtQpaIDrhcTNQE3EvPDga8ATKWdhmZRx3sX9eaKFUiSdAskTrsxq
 Dr99n5NoKjTUCBXAsZpDkai4eXAliRMhl1omn+dBC7Yu2SOBy23wHHP91AJIGRlZt2CTyMq+9/z
 rvhkL4YUd2ZQIdIRTAOUqWRH/1+EHDZOjJGT66N8dJzDfMyUk55wkaiNTKtvBxo3NxRUbinLL7M
 rPWbiSQMV59HkEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 44 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279..4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -11,6 +11,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
@@ -47,7 +48,7 @@ struct wpcm450_pinctrl;
 struct wpcm450_bank;
 
 struct wpcm450_gpio {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	struct wpcm450_pinctrl	*pctrl;
 	const struct wpcm450_bank *bank;
 };
@@ -184,11 +185,12 @@ static void wpcm450_gpio_irq_unmask(struct irq_data *d)
 }
 
 /*
- * This is an implementation of the gpio_chip->get() function, for use in
- * wpcm450_gpio_fix_evpol. Unfortunately, we can't use the bgpio-provided
- * implementation there, because it would require taking gpio_chip->bgpio_lock,
- * which is a spin lock, but wpcm450_gpio_fix_evpol must work in contexts where
- * a raw spin lock is held.
+ * FIXME: This is an implementation of the gpio_chip->get() function, for use
+ * in wpcm450_gpio_fix_evpol(). It was implemented back when gpio-mmio used a
+ * regular spinlock internally, while wpcm450_gpio_fix_evpol() needed to work
+ * in contexts with a raw spinlock held. Since then, the gpio generic chip has
+ * been switched to using a raw spinlock so this should be converted to using
+ * the locking interfaces provided in linux/gpio/gneneric.h.
  */
 static int wpcm450_gpio_get(struct wpcm450_gpio *gpio, int offset)
 {
@@ -329,7 +331,7 @@ static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
 	for_each_set_bit(bit, &pending, 32) {
 		int offset = wpcm450_irq_bitnum_to_gpio(gpio, bit);
 
-		generic_handle_domain_irq(gpio->gc.irq.domain, offset);
+		generic_handle_domain_irq(gpio->chip.gc.irq.domain, offset);
 	}
 	chained_irq_exit(chip, desc);
 }
@@ -1012,7 +1014,7 @@ static int wpcm450_gpio_add_pin_ranges(struct gpio_chip *chip)
 	struct wpcm450_gpio *gpio = gpiochip_get_data(chip);
 	const struct wpcm450_bank *bank = gpio->bank;
 
-	return gpiochip_add_pin_range(&gpio->gc, dev_name(gpio->pctrl->dev),
+	return gpiochip_add_pin_range(&gpio->chip.gc, dev_name(gpio->pctrl->dev),
 				      0, bank->base, bank->length);
 }
 
@@ -1029,6 +1031,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 				     "Resource fail for GPIO controller\n");
 
 	for_each_gpiochip_node(dev, child) {
+		struct gpio_generic_chip_config config;
 		void __iomem *dat = NULL;
 		void __iomem *set = NULL;
 		void __iomem *dirout = NULL;
@@ -1060,17 +1063,26 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		} else {
 			flags = BGPIOF_NO_OUTPUT;
 		}
-		ret = bgpio_init(&gpio->gc, dev, 4,
-				 dat, set, NULL, dirout, NULL, flags);
+
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = dat,
+			.set = set,
+			.dirout = dirout,
+			.flags = flags,
+		};
+
+		ret = gpio_generic_chip_init(&gpio->chip, &config);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "GPIO initialization failed\n");
 
-		gpio->gc.ngpio = bank->length;
-		gpio->gc.set_config = wpcm450_gpio_set_config;
-		gpio->gc.fwnode = child;
-		gpio->gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
+		gpio->chip.gc.ngpio = bank->length;
+		gpio->chip.gc.set_config = wpcm450_gpio_set_config;
+		gpio->chip.gc.fwnode = child;
+		gpio->chip.gc.add_pin_ranges = wpcm450_gpio_add_pin_ranges;
 
-		girq = &gpio->gc.irq;
+		girq = &gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
 		girq->parent_handler = wpcm450_gpio_irqhandler;
 		girq->parents = devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
@@ -1094,7 +1106,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			girq->num_parents++;
 		}
 
-		ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+		ret = devm_gpiochip_add_data(dev, &gpio->chip.gc, gpio);
 		if (ret)
 			return dev_err_probe(dev, ret, "Failed to add GPIO chip\n");
 	}

-- 
2.48.1


