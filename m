Return-Path: <linux-gpio+bounces-25661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 809DFB45310
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 11:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11D66188B520
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 09:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77962CA5A;
	Fri,  5 Sep 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bP28w9O+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED62459E7
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064117; cv=none; b=aR/GrWicfwnC7Ho3AhghxbajZBMY6IHPg7z/MAk2N7SZaQ6bwIxEg6e7XdWq90lHf5qZUTa7un1sMiuyV1WqzLrao6+aindMlRU+V4iJtkAsyWj8TQEPzibioZxBHze1YFqE6sU3rrkhjW0YgqxXtx/qwXsBVQkVd7C+2icuuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064117; c=relaxed/simple;
	bh=bGG0YbGTV5a6JV47HS83Pj0NM0zbqUBpxOQRzfoBPYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DYLmQMyHFyUSsxZiqKqmbQpaQ6e6Zf56wYBmFQQjKLxMQQk0i+V4b/XPqCw6MD7M1kOfxzKwRS7D2SS5T0PJLmOKMM4/K8Dqj4FNrt+dMjN1Ndzbz+5dxmhNovUpoKckdBegBVInSmUEvHjMblOu65oO+dfb3bvC66SmWQJR1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bP28w9O+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so2099579e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757064112; x=1757668912; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1i3KBAyh6o9Xk/Md8T7Fo9k+AGdB0yieOB/w1VUG94o=;
        b=bP28w9O+awZ+rYkuRVRCboua2Gpl+OX/lcAEzDrkhNbbCAlYunyL9PZH4mfJnon2eA
         xquLzbFRP7BV3ER5yLGCh0+1IT4nrlc6r6LW61qmbgvnkuJH2pRylu8tw8H7st7BrNQu
         vB0b4nEWnhwDm5X5v2JfVzbKOcIsO9B8g1sXI9Av3VRvHIGsSKZO97hn3Je+rsfiEdeV
         S/BMfxU/dy6IhuZTr6kn1xq8L4h3inZ/Sye7G8CStvrrwD14Xu5z9dh6cyY+CyEDDKyb
         dnDdpUDiqOqFdGJvWxsl2hbofaqtYdZ109wlakuRu7UfuGDuPd9n00RgyrEj9enzq08I
         VqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064112; x=1757668912;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1i3KBAyh6o9Xk/Md8T7Fo9k+AGdB0yieOB/w1VUG94o=;
        b=DvS3t/ROXTqozL1mWoXkByPNRJMTBN4BFAJqiicOlf5X+yjYW7OYr98WR0CmHpqGTn
         xGZUtgIDid0/G0CDQk4neTweePnoEcSjAAcKn6CyLFrjQZiEZ3Ine7Z0KSzFDPPUyePs
         NcSle7rHZHJftU0H54JiAhesilIOZfOACxMxRLyOMh7A5imkGrYd1Y+9aG9Mw053zCdW
         am0Se674LbGQfmrYrvkhLOtc8aFxuMEdr63XER7qyqIMJhmPsnYu98Pvi9sgP0q0K8RX
         Swtv3RyG2XZas/aPsoLkJDnQIe2lblPumEmdAcLt10F/lXRJ4Ksf2bnXT6XUIfMPuHz7
         hmaA==
X-Gm-Message-State: AOJu0Yx7nn4JvBa+Ec7i2hoFxYjEiE4bYq+k47gt2CumNwkUa3W/3woN
	w4S+pBO2JzBMmyjna5yfB0m8EoTQH+kJqtrxh/TyT5lGsjoPI2jECpl3Ph5x9WYEHq3q6+OC0/b
	dTR0N
X-Gm-Gg: ASbGncvlDoGJA3L71lEeBaIDddTEkT6ovTFy2ft4rFcjOUFCHgdQ0AMUOwaeIzNofFN
	4iTPfGh9W3ijbywORrAn5E1kf3+R5ccNQOX7G+dTQ6SC65IYgkKEG/MFOIi2J1Lo/t1jQsnTK9n
	fw5EeWYGE/NMUtgq4jDQRY1ZZ/JVKj6ltGqxx6g098DgEsvDtbm9WUQ27zfxUwPHLPh9L794KT7
	/oC2ekuhMrp5ZEKhoBdKcqdN+4CSIO7V4VTNJ9zNqo9zrizTdbSNz0XAlzKeCM7z2b33Qu1beKG
	E25Kffixv36VdvxOw3974JzzG/rnnRO1T6/tZn6/sVuun9UP3LtXj+wFPk8QD7qOcGbprZVsqNK
	0F0b869ERIsUa9jUacEGVXvmBI0aS533A
X-Google-Smtp-Source: AGHT+IHjtrzIY/rkw16WnUSmUg0Wux8pn9CUH9kJyMJ29LEG12SxN33MWMiW3K3SuLYilPD+RHQ6sw==
X-Received: by 2002:a05:6512:61c6:10b0:560:8484:a91b with SMTP id 2adb3069b0e04-5608484ab52mr3615086e87.57.1757064111546;
        Fri, 05 Sep 2025 02:21:51 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc63c8sm1707968e87.61.2025.09.05.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:21:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 05 Sep 2025 11:21:50 +0200
Subject: [PATCH] pinctrl: generic: rename PIN_CONFIG_OUTPUT to LEVEL
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK2rumgC/zWMQQqAIBAAvxJ7TlAhs74SHSS32ogSNyOI/p4E3
 WYOMzcwRkKGtrgh4klM+5ZFlQUMs9smFOSzg5a6ko2sxJ6OkA5xujWhWBL/iN7bWitrjLGQ6xB
 xpOs7d/3zvDC0oXxpAAAA
X-Change-ID: 20250905-output-value-just-value-edd872186668
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This generic pin config property is confusingly named so let's
rename it to make things clearer.

There are already drivers in the tree that use PIN_CONFIG_OUTPUT
to *read* the value of an output driven pin, which is a big
semantic confusion for the head: are we then reading the
setting of the output or the actual value/level that is put
out on the pin?

We already have PIN_CONFIG_OUTPUT_ENABLE that turns on driver
buffers for output, so this can by logical conclusion only
drive the voltage level if it should be any different.

But if we read the pin, are we then reading the *setting* of
the output value or the *actual* value we can see on the
line?

If the pin has not first been set into output mode with
PIN_CONFIG_OUTPUT_ENABLE, but is instead in some input mode
or tristate, what will reading this property actually
return?

Reading the current users reading this property it is clear
that what we read is the logical level of the pin as 0 or 1
depending on if it is low or high.

Rename it to PIN_CONFIG_LEVEL so it is crystal clear that
we set or read the voltage level of the pin and nothing else.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
b4 wants to CC the entire world, I have to keep this down
to just the most relevant people and mailing lists.
---
 Documentation/driver-api/pin-control.rst          |  4 ++--
 drivers/gpio/gpio-rockchip.c                      |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c             |  6 +++---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c      |  4 ++--
 drivers/pinctrl/mediatek/pinctrl-airoha.c         |  4 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.c          |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c     |  2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c          |  4 ++--
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c        |  6 +++---
 drivers/pinctrl/meson/pinctrl-meson.c             |  6 +++---
 drivers/pinctrl/nomadik/pinctrl-abx500.c          |  6 +++---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c         |  6 +++---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c         |  6 +++---
 drivers/pinctrl/pinconf-generic.c                 |  6 +++---
 drivers/pinctrl/pinctrl-at91-pio4.c               |  2 +-
 drivers/pinctrl/pinctrl-aw9523.c                  |  6 +++---
 drivers/pinctrl/pinctrl-cy8c95x0.c                |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                 |  4 ++--
 drivers/pinctrl/pinctrl-k210.c                    |  2 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c         |  4 ++--
 drivers/pinctrl/pinctrl-ocelot.c                  |  4 ++--
 drivers/pinctrl/pinctrl-pic32.c                   |  4 ++--
 drivers/pinctrl/pinctrl-rk805.c                   |  4 ++--
 drivers/pinctrl/pinctrl-rockchip.c                |  6 +++---
 drivers/pinctrl/pinctrl-rp1.c                     |  2 +-
 drivers/pinctrl/pinctrl-scmi.c                    |  2 +-
 drivers/pinctrl/pinctrl-stmfx.c                   |  4 ++--
 drivers/pinctrl/pinctrl-sx150x.c                  |  8 ++++----
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          |  8 ++++----
 drivers/pinctrl/qcom/pinctrl-msm.c                |  6 +++---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c          |  8 ++++----
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c           |  8 ++++----
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c          |  4 ++--
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c           |  4 ++--
 drivers/pinctrl/renesas/pinctrl-rza1.c            |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c             |  2 +-
 drivers/pinctrl/sunplus/sppctl.c                  |  4 ++--
 include/linux/pinctrl/pinconf-generic.h           | 12 ++++++++----
 sound/hda/codecs/side-codecs/cirrus_scodec_test.c |  2 +-
 39 files changed, 91 insertions(+), 87 deletions(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 27ea1236307e84965598c69d5e687055153823d1..8208924e513e1f6420d04a42c0e49fa7cd5c7583 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -863,7 +863,7 @@ has to be handled by the ``<linux/gpio/consumer.h>`` interface. Instead view thi
 a certain pin config setting. Look in e.g. ``<linux/pinctrl/pinconf-generic.h>``
 and you find this in the documentation:
 
-  PIN_CONFIG_OUTPUT:
+  PIN_CONFIG_LEVEL:
      this will configure the pin in output, use argument
      1 to indicate high level, argument 0 to indicate low level.
 
@@ -897,7 +897,7 @@ And your machine configuration may look like this:
 	};
 
 	static unsigned long uart_sleep_mode[] = {
-		PIN_CONF_PACKED(PIN_CONFIG_OUTPUT, 0),
+		PIN_CONF_PACKED(PIN_CONFIG_LEVEL, 0),
 	};
 
 	static struct pinctrl_map pinmap[] __initdata = {
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index bcfc323a8315ef560d5891444cafe3f494a65e7d..47174eb3ba76fbe8d7573e186fcf07f13002fa71 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -769,7 +769,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 		list_del(&cfg->head);
 
 		switch (cfg->param) {
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
 			if (ret)
 				dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 7dbf079739bcc14a2ef8d5731af997b60b2b681c..c165674c5b4db0dc70afad4f111b46f3d4b4790b 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1023,7 +1023,7 @@ static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
 	/* No way to read back bias config in HW */
 
 	switch (param) {
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if (fsel != BCM2835_FSEL_GPIO_OUT)
 			return -EINVAL;
 
@@ -1091,7 +1091,7 @@ static int bcm2835_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		/* Set output-high or output-low */
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			bcm2835_gpio_set_bit(pc, arg ? GPSET0 : GPCLR0, pin);
 			break;
 
@@ -1202,7 +1202,7 @@ static int bcm2711_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		/* Set output-high or output-low */
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			bcm2835_gpio_set_bit(pc, arg ? GPSET0 : GPCLR0, pin);
 			break;
 
diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index d19ef13224cca753cf1a9b5140ec754e8b80283f..1d9481b1709178bfb4d61be940824493f41dec1b 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -804,7 +804,7 @@ static int madera_pin_conf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (conf[0] & MADERA_GP1_IP_CFG_MASK)
 			result = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if ((conf[1] & MADERA_GP1_DIR_MASK) &&
 		    (conf[0] & MADERA_GP1_LVL_MASK))
 			result = 1;
@@ -902,7 +902,7 @@ static int madera_pin_conf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			mask[1] |= MADERA_GP1_DIR_MASK;
 			conf[1] |= MADERA_GP1_DIR;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			val = pinconf_to_config_argument(*configs);
 			mask[0] |= MADERA_GP1_LVL_MASK;
 			if (val)
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..b4bf3cc967b2b3c56d7317ca0a458c43884cdd34 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2770,7 +2770,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 			break;
 		case PIN_CONFIG_OUTPUT_ENABLE:
 		case PIN_CONFIG_INPUT_ENABLE:
-		case PIN_CONFIG_OUTPUT: {
+		case PIN_CONFIG_LEVEL: {
 			bool input = param == PIN_CONFIG_INPUT_ENABLE;
 			int err;
 
@@ -2779,7 +2779,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 			if (err)
 				return err;
 
-			if (param == PIN_CONFIG_OUTPUT) {
+			if (param == PIN_CONFIG_LEVEL) {
 				err = airoha_pinconf_set_pin_value(pctrl_dev,
 								   pin, !!arg);
 				if (err)
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 6e4f6c07a509326a8a7e88b2dc32635b22e7b965..bfbd50d0a39c66ff6d9b33ff3e2e97df5d8310aa 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -332,7 +332,7 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				goto err;
 
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
 					       MTK_OUTPUT);
 			if (err)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index d10306024111c86816bf59abadc907b89ec459a8..d6a46fe0cda891436da54dddaf3949a6ccab42a2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -384,7 +384,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
 		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		mtk_gpio_set(pctl->chip, pin, arg);
 		ret = mtk_pmx_gpio_set_direction(pctldev, NULL, pin, false);
 		break;
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 3e714554789d0e7e31ecce92388f53b906bdf122..6bf37d8085fae5ac96b4ffefae9075bf3b04f241 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -169,7 +169,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		if (!ret)
 			err = -EINVAL;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
 			break;
@@ -292,7 +292,7 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		/* regard all non-zero value as enable */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, !!arg);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
 				       arg);
 		if (err)
diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e34e984c2b38a8309603eafd9366c14dc031a940..d2b15f1335646243b04f0a0f6519dbc54da39ab5 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -422,7 +422,7 @@ static int aml_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 			return -EINVAL;
 		arg = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		ret = aml_pinconf_get_output(info, pin);
 		if (ret <= 0)
 			return -EINVAL;
@@ -568,7 +568,7 @@ static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 		case PIN_CONFIG_OUTPUT_ENABLE:
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			arg = pinconf_to_config_argument(configs[i]);
 			break;
 
@@ -592,7 +592,7 @@ static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			ret = aml_pinconf_set_output(info, pin, arg);
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = aml_pinconf_set_output_drive(info, pin, arg);
 			break;
 		default:
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 277e9c40490d71e9b5939bf330897b8234256c47..18295b15ecd9ddd2d7ba6aea5b062f5d0d04b977 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -360,7 +360,7 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
 		case PIN_CONFIG_OUTPUT_ENABLE:
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			arg = pinconf_to_config_argument(configs[i]);
 			break;
 
@@ -384,7 +384,7 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			ret = meson_pinconf_set_output(pc, pin, arg);
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = meson_pinconf_set_output_drive(pc, pin, arg);
 			break;
 		default:
@@ -502,7 +502,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 			return -EINVAL;
 		arg = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		ret = meson_pinconf_get_output(pc, pin);
 		if (ret <= 0)
 			return -EINVAL;
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 7b5f94d8cb23cd85a6816019569192c411892ede..fc7ebeda8440eb95f07d5f6e255caa0fe1c3e78b 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -860,8 +860,8 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 
 		dev_dbg(chip->parent, "pin %d [%#lx]: %s %s\n",
 			pin, configs[i],
-			(param == PIN_CONFIG_OUTPUT) ? "output " : "input",
-			(param == PIN_CONFIG_OUTPUT) ?
+			(param == PIN_CONFIG_LEVEL) ? "output " : "input",
+			(param == PIN_CONFIG_LEVEL) ?
 			str_high_low(argument) :
 			(argument ? "pull up" : "pull down"));
 
@@ -907,7 +907,7 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 			ret = abx500_gpio_direction_input(chip, offset);
 			break;
 
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = abx500_gpio_direction_output(chip, offset,
 				argument);
 			break;
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index b8872d8f5930ad931dad208afec4e08a23c3d653..cf63b74ad960657feff589f5b02f9aa0496d62f5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1705,13 +1705,13 @@ static int npcm7xx_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
 			rc = (!pu && pd);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 	case PIN_CONFIG_INPUT_ENABLE:
 		ie = ioread32(bank->base + NPCM7XX_GP_N_IEM) & pinmask;
 		oe = ioread32(bank->base + NPCM7XX_GP_N_OE) & pinmask;
 		if (param == PIN_CONFIG_INPUT_ENABLE)
 			rc = (ie && !oe);
-		else if (param == PIN_CONFIG_OUTPUT)
+		else if (param == PIN_CONFIG_LEVEL)
 			rc = (!ie && oe);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
@@ -1770,7 +1770,7 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
 		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
 		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
 		break;
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 3c3b9d8d3681c64c21927615e1bb49f157f156b5..2214e87dead42655872c23f8a720e233cbda5c46 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2190,13 +2190,13 @@ static int npcm8xx_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
 			rc = !pu && pd;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 	case PIN_CONFIG_INPUT_ENABLE:
 		ie = ioread32(bank->base + NPCM8XX_GP_N_IEM) & pinmask;
 		oe = ioread32(bank->base + NPCM8XX_GP_N_OE) & pinmask;
 		if (param == PIN_CONFIG_INPUT_ENABLE)
 			rc = (ie && !oe);
-		else if (param == PIN_CONFIG_OUTPUT)
+		else if (param == PIN_CONFIG_LEVEL)
 			rc = (!ie && oe);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
@@ -2254,7 +2254,7 @@ static int npcm8xx_config_set_one(struct npcm8xx_pinctrl *npcm,
 		iowrite32(gpio, bank->base + NPCM8XX_GP_N_OEC);
 		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
 		iowrite32(gpio, bank->base + NPCM8XX_GP_N_OES);
 		break;
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index d67838afb08574c3fd95868bcec01e66a5082f2a..5de6ff62c69bdbb035a33c3c6848f617b94c68d9 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -48,7 +48,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
-	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
+	PCONFDUMP(PIN_CONFIG_LEVEL, "pin output", "level", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS, "output impedance", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
@@ -183,9 +183,9 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "low-power-enable", PIN_CONFIG_MODE_LOW_POWER, 1 },
 	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
 	{ "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
-	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
+	{ "output-high", PIN_CONFIG_LEVEL, 1, },
 	{ "output-impedance-ohms", PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS, 0 },
-	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
+	{ "output-low", PIN_CONFIG_LEVEL, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 35ea3414cb96d7ea1104907e13161cf19b8a0d3d..ec5351fc282e20646983cea68826b5ce9de00beb 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -862,7 +862,7 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 				conf |= ATMEL_PIO_IFSCEN_MASK;
 			}
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			conf |= ATMEL_PIO_DIR_MASK;
 			bank = ATMEL_PIO_BANK(pin_id);
 			pin = ATMEL_PIO_LINE(pin_id);
diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 890b83fddea3c5c860499c364e109ba33bf52387..479553a79216145acf036ea2f6ae70410215999f 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -215,7 +215,7 @@ static int aw9523_pcfg_param_to_reg(enum pin_config_param pcp, int pin, u8 *r)
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		reg = AW9523_REG_CONF_STATE(pin);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		reg = AW9523_REG_OUT_STATE(pin);
 		break;
 	default:
@@ -249,7 +249,7 @@ static int aw9523_pconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_UP:
 	case PIN_CONFIG_INPUT_ENABLE:
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		val &= BIT(regbit);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
@@ -301,7 +301,7 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			goto end;
 
 		switch (param) {
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			/* First, enable pin output */
 			rc = regmap_update_bits(awi->regmap,
 						AW9523_REG_CONF_STATE(pin),
diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index cf7f80497fdeaf72227416e976719ffea6981cca..a4b04bf6d081f6b26acfe887ea536a50e69b45b3 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -808,7 +808,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	case PIN_CONFIG_MODE_PWM:
 		reg = CY8C95X0_SELPWM;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		reg = CY8C95X0_OUTPUT;
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2900513467fa4e2e9374946fc9c7a30d48aef9eb..8e33276545ebc9d6faee1e621e2f97297a1a4e5b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4267,7 +4267,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_PULL_UP:
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 		case PIN_CONFIG_SLEW_RATE:
 			continue;
 		default:
@@ -4308,7 +4308,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			ingenic_set_schmitt_trigger(jzpc, pin, arg);
 			break;
 
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = pinctrl_gpio_direction_output(jzpc->gc,
 							pin - jzpc->gc->base);
 			if (ret)
diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 66c04120c29deccf53b21cbf8705f1d10c74ace5..ddd6d6bfd51399cd0467a451274bc38cbf9bbbee 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -551,7 +551,7 @@ static int k210_pinconf_set_param(struct pinctrl_dev *pctldev,
 		else
 			val &= ~K210_PC_ST;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		k210_pinmux_set_pin_function(pctldev, pin, K210_PCF_CONSTANT);
 		val = readl(&pdata->fpioa->pins[pin]);
 		val |= K210_PC_MODE_OUT;
diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 6191e5c13815310b8ecf65ae3d3c0a1caaf775ee..0c7ee3485db394b665607714de43c4e6dee03150 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -371,7 +371,7 @@ static int sgpio_pinconf_get(struct pinctrl_dev *pctldev,
 		val = !bank->is_input;
 		break;
 
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if (bank->is_input)
 			return -EINVAL;
 		val = sgpio_output_get(priv, &addr);
@@ -402,7 +402,7 @@ static int sgpio_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		arg = pinconf_to_config_argument(configs[cfg]);
 
 		switch (param) {
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			if (bank->is_input)
 				return -EINVAL;
 			err = sgpio_output_set(priv, &addr, arg);
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index b82bf83fed25b6aaaa90959198bbe6c129c621e7..70da3f37567a5c3ba9283bda351ccde07736f01f 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1656,7 +1656,7 @@ static int ocelot_pinconf_get(struct pinctrl_dev *pctldev,
 			return err;
 		break;
 
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		err = regmap_read(info->map, REG(OCELOT_GPIO_OUT, info, pin),
 				  &val);
 		if (err)
@@ -1735,7 +1735,7 @@ static int ocelot_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
 		case PIN_CONFIG_INPUT_ENABLE:
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			p = pin % 32;
 			if (arg)
 				regmap_write(info->map,
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 37c2bf752154d487b7ebde82b83f657a0123c698..e8b481e87c779291a69490de1892fbb7ec9c45f1 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1905,7 +1905,7 @@ static int pic32_pinconf_get(struct pinctrl_dev *pctldev, unsigned pin,
 	case PIN_CONFIG_INPUT_ENABLE:
 		arg = !!(readl(bank->reg_base + TRIS_REG) & mask);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		arg = !(readl(bank->reg_base + TRIS_REG) & mask);
 		break;
 	default:
@@ -1960,7 +1960,7 @@ static int pic32_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
 		case PIN_CONFIG_INPUT_ENABLE:
 			pic32_gpio_direction_input(&bank->gpio_chip, offset);
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			pic32_gpio_direction_output(&bank->gpio_chip,
 						    offset, arg);
 			break;
diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 3acf770316c1aa4f44ca6365d998ce6307ee0514..22f576337faa9c90a1c84a92cac678e8b58937be 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -541,7 +541,7 @@ static int rk805_pinconf_get(struct pinctrl_dev *pctldev,
 	u32 arg = 0;
 
 	switch (param) {
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 	case PIN_CONFIG_INPUT_ENABLE:
 		arg = rk805_gpio_get(&pci->gpio_chip, pin);
 		break;
@@ -568,7 +568,7 @@ static int rk805_pinconf_set(struct pinctrl_dev *pctldev,
 		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			rk805_gpio_set(&pci->gpio_chip, pin, arg);
 			rk805_pmx_gpio_set_direction(pctldev, NULL, pin, false);
 			break;
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 930c454e0cec7d88d66b2967fe8f14c915429e63..7a68a6237649c175dee815363b754b9f3b82f47d 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3272,7 +3272,7 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
 
-		if (param == PIN_CONFIG_OUTPUT || param == PIN_CONFIG_INPUT_ENABLE) {
+		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
 			/*
 			 * Check for gpio driver not being probed yet.
 			 * The lock makes sure that either gpio-probe has completed
@@ -3313,7 +3313,7 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			if (rc)
 				return rc;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			rc = rockchip_set_mux(bank, pin - bank->pin_base,
 					      RK_FUNC_GPIO);
 			if (rc != RK_FUNC_GPIO)
@@ -3392,7 +3392,7 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		arg = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		rc = rockchip_get_mux(bank, pin - bank->pin_base);
 		if (rc != RK_FUNC_GPIO)
 			return -EINVAL;
diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index dadafc935dbb28b7691e328ec80eb16450db224b..2375dfa0a22191bd8e9a17bd29ca43dda46eb52c 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1440,7 +1440,7 @@ static int rp1_pinconf_set(struct pinctrl_dev *pctldev, unsigned int offset,
 			rp1_output_enable(pin, arg);
 			break;
 
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			rp1_set_value(pin, arg);
 			rp1_set_dir(pin, RP1_DIR_OUTPUT);
 			rp1_set_fsel(pin, RP1_FSEL_GPIO);
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 383681041e4c05fe3c7d15dc58a7dbf783dae3c3..d14528b9aa31ef28812e106e5f8e28ddce430226 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -253,7 +253,7 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		*type = SCMI_PIN_OUTPUT_VALUE;
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index c89b99003b7111c98d30d84c5722d1a4bbbd368a..03ee13844b50736d85586d166069cbaa2c9556a1 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -267,7 +267,7 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
 		if ((!dir && !type) || (dir && type))
 			arg = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if (dir)
 			return -EINVAL;
 
@@ -334,7 +334,7 @@ static int stmfx_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			if (ret)
 				return ret;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = stmfx_gpio_direction_output(&pctl->gpio_chip,
 							  pin, arg);
 			if (ret)
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 53cf8168b274c5310706512dcd3ba8d4d25f5049..b8ad4375a6b4316f371c869ef93af590721a5d90 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -611,7 +611,7 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (sx150x_pin_is_oscio(pctl, pin)) {
 		switch (param) {
 		case PIN_CONFIG_DRIVE_PUSH_PULL:
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = regmap_read(pctl->regmap,
 					  pctl->data->pri.x789.reg_clock,
 					  &data);
@@ -705,7 +705,7 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		}
 		break;
 
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		ret = sx150x_gpio_get_direction(&pctl->gpio, pin);
 		if (ret < 0)
 			return ret;
@@ -744,7 +744,7 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		arg = pinconf_to_config_argument(configs[i]);
 
 		if (sx150x_pin_is_oscio(pctl, pin)) {
-			if (param == PIN_CONFIG_OUTPUT) {
+			if (param == PIN_CONFIG_LEVEL) {
 				ret = sx150x_gpio_direction_output(&pctl->gpio,
 								   pin, arg);
 				if (ret < 0)
@@ -816,7 +816,7 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 			break;
 
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			ret = sx150x_gpio_direction_output(&pctl->gpio,
 							   pin, arg);
 			if (ret < 0)
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 54c77e0b96e91de8d96ff3cbd0ca88fadc6d55f6..28eb92a2b249fe1bac06684a0d9c43ae1b640914 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -174,7 +174,7 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 			arg = 1;
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if (is_out)
 			arg = 1;
 		break;
@@ -252,7 +252,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 		case PIN_CONFIG_INPUT_ENABLE:
 			output_enabled = false;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			output_enabled = true;
 			value = arg;
 			break;
@@ -314,7 +314,7 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
 	unsigned long config;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
 	return lpi_config_set(state->ctrl, pin, &config, 1);
 }
@@ -332,7 +332,7 @@ static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
 	unsigned long config;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, value);
 
 	return lpi_config_set(state->ctrl, pin, &config, 1);
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..0c50a4ea0f46b2cbeeeeb2cc2ca7c3c74ceb9651 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -319,7 +319,7 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
 		*bit = g->drv_bit;
 		*mask = 7;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 	case PIN_CONFIG_INPUT_ENABLE:
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*bit = g->oe_bit;
@@ -409,7 +409,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		arg = msm_regval_to_drive(arg);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		/* Pin is not output */
 		if (!arg)
 			return -EINVAL;
@@ -488,7 +488,7 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 			else
 				arg = (arg / 2) - 1;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			/* set output value */
 			raw_spin_lock_irqsave(&pctrl->lock, flags);
 			val = msm_readl_io(pctrl, g);
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index b7b15874e488a1406994e483c845dd4608f45538..485b68cc93f8edac07c15aad50ff5c9c7894d8bc 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -438,7 +438,7 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		arg = pad->output_enabled;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		arg = pad->out_value;
 		break;
 	case PMIC_GPIO_CONF_PULL_UP:
@@ -530,7 +530,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			pad->output_enabled = arg ? true : false;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			pad->output_enabled = true;
 			pad->out_value = arg;
 			break;
@@ -737,7 +737,7 @@ static int pmic_gpio_direction_output(struct gpio_chip *chip,
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
 	unsigned long config;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
 	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
 }
@@ -769,7 +769,7 @@ static int pmic_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
 	unsigned long config;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, value);
 
 	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 22d76b1013a313fa241dded006359dcd324deef8..64f8024a865cd3fc18f0e5ebff56f82f970d53b6 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -370,7 +370,7 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		arg = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		arg = pad->out_value;
 		break;
 	case PMIC_MPP_CONF_DTEST_SELECTOR:
@@ -447,7 +447,7 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_INPUT_ENABLE:
 			pad->input_enabled = arg ? true : false;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			pad->output_enabled = true;
 			pad->out_value = arg;
 			break;
@@ -576,7 +576,7 @@ static int pmic_mpp_direction_output(struct gpio_chip *chip,
 	struct pmic_mpp_state *state = gpiochip_get_data(chip);
 	unsigned long config;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
 
 	return pmic_mpp_config_set(state->ctrl, pin, &config, 1);
 }
@@ -605,7 +605,7 @@ static int pmic_mpp_set(struct gpio_chip *chip, unsigned int pin, int value)
 	struct pmic_mpp_state *state = gpiochip_get_data(chip);
 	unsigned long config;
 
-	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, value);
 
 	return pmic_mpp_config_set(state->ctrl, pin, &config, 1);
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index fb37b1c1acb41fdb608c8a233668c1c5ac00d1e2..5c966d51eda7bb661501ee530b4eb4ac966fc80a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -282,7 +282,7 @@ static int pm8xxx_pin_config_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		arg = 1;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if (pin->mode & PM8XXX_GPIO_MODE_OUTPUT)
 			arg = pin->output_value;
 		else
@@ -364,7 +364,7 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
 			pin->mode = PM8XXX_GPIO_MODE_INPUT;
 			banks |= BIT(0) | BIT(1);
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			pin->mode = PM8XXX_GPIO_MODE_OUTPUT;
 			pin->output_value = !!arg;
 			banks |= BIT(0) | BIT(1);
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 6103849af042d6d91c25d5910f13bb1ef8fb9acf..7970fa6e15579e8b7fb79a89589c4b12005c9ba8 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -337,7 +337,7 @@ static int pm8xxx_pin_config_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_INPUT_ENABLE:
 		arg = pin->input;
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		arg = pin->output_value;
 		break;
 	case PIN_CONFIG_POWER_SOURCE:
@@ -392,7 +392,7 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_INPUT_ENABLE:
 			pin->input = true;
 			break;
-		case PIN_CONFIG_OUTPUT:
+		case PIN_CONFIG_LEVEL:
 			pin->output = true;
 			pin->output_value = !!arg;
 			break;
diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 23812116ef42682d8ef667525d4f4486c286b46a..fc4976dbfda780b35e79570f5e9e9df0daa23b12 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -933,7 +933,7 @@ static int rza1_parse_pinmux_node(struct rza1_pinctrl *rza1_pctl,
 		case PIN_CONFIG_INPUT_ENABLE:
 			pinmux_flags |= MUX_FLAGS_SWIO_INPUT;
 			break;
-		case PIN_CONFIG_OUTPUT:	/* for DT backwards compatibility */
+		case PIN_CONFIG_LEVEL:	/* for DT backwards compatibility */
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			pinmux_flags |= MUX_FLAGS_SWIO_OUTPUT;
 			break;
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 823c8fe758e2c00d270d23b63f9f4a87df492a84..3ebb468de830db89a226e751fab48fad670c89b4 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1236,7 +1236,7 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		ret = stm32_pconf_set_bias(bank, offset, 2);
 		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		__stm32_gpio_set(bank, offset, arg);
 		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 3e924aa86cc2faa75eb2fc67b7394d7639a5f898..fabe7efaa837a4fb2220039e12dca102dc6ba33b 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -488,7 +488,7 @@ static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	case PIN_CONFIG_INPUT_ENABLE:
 		break;
 
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		return sppctl_gpio_direction_output(chip, offset, 0);
 
 	case PIN_CONFIG_PERSIST_STATE:
@@ -580,7 +580,7 @@ static int sppctl_pin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		arg = 0;
 		break;
 
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 		if (!sppctl_first_get(&pctl->spp_gchip->chip, pin))
 			return -EINVAL;
 		if (!sppctl_master_get(&pctl->spp_gchip->chip, pin))
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1bcf071b860ebbaf60351a8d17369ba6cd3eff1b..d9245ecec71dc6f580ad4768695349f74c92d209 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -88,9 +88,13 @@ struct pinctrl_map;
  *	passed in the argument on a custom form, else just use argument 1
  *	to indicate low power mode, argument 0 turns low power mode off.
  * @PIN_CONFIG_MODE_PWM: this will configure the pin for PWM
- * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
- * 	value on the line. Use argument 1 to indicate high level, argument 0 to
- *	indicate low level. (Please see Documentation/driver-api/pin-control.rst,
+ * @PIN_CONFIG_LEVEL: setting this will configure the pin as an output and
+ *	drive a value on the line. Use argument 1 to indicate high level,
+ *	argument 0 to indicate low level. Conversely the value of the line
+ *	can be read using this parameter, if and only if that value can be
+ *	represented as a binary 0 or 1 where 0 indicate a low voltage level
+ *	and 1 indicate a high voltage level.
+ *	(Please see Documentation/driver-api/pin-control.rst,
  *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
  * 	without driving a value there. For most platforms this reduces to
@@ -137,7 +141,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT_UV,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
-	PIN_CONFIG_OUTPUT,
+	PIN_CONFIG_LEVEL,
 	PIN_CONFIG_OUTPUT_ENABLE,
 	PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS,
 	PIN_CONFIG_PERSIST_STATE,
diff --git a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
index 9ba14c09c07ffe5115c5494b05c558a5698341f3..3cca750857b68961115e1cde651dc5a6041b233b 100644
--- a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
+++ b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
@@ -69,7 +69,7 @@ static int cirrus_scodec_test_gpio_set_config(struct gpio_chip *gc,
 					      unsigned long config)
 {
 	switch (pinconf_to_config_param(config)) {
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_LEVEL:
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		return -EOPNOTSUPP;
 	default:

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250905-output-value-just-value-edd872186668

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


