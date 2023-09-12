Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64BC379CA7D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 10:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbjILIpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 04:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjILIpg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 04:45:36 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0E2172D
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:45:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5008d16cc36so9092432e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694508299; x=1695113099; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9cYVknfBAeu75UVlteP6kQhTPhNkOUCF7HIJ1iSBek=;
        b=BHJcFJQj+7Gi989PrwVufeL0/jVprTH/C98ODqnBmTKUQyrDmVeS+gmDEvvFTUqLHk
         sG5Ed5/6iCkbaYGnip1T5A9NAijo/m82GAy6AH/e+NBYIbeJmy6setNWtHNLS4I4Lxjv
         SdLkWow07BnWbycPOJKQtgv52o30B2WFCbmOBbunrbAiXM84Gf+GyEuEirm8/SKVPju9
         CHuutqLjF/pR5TgcEJzHrvbM4re0JS8xiXTl2E5ZO243h+7yrDaUvbZv8vSQdiaC5Ogc
         lOeCsKqZ5D6Rt5GfN7QHyJ39juUp68mRF7gPeQihI40u/Ms6YuiFeAOdbnD00hy1YQKL
         6B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694508299; x=1695113099;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9cYVknfBAeu75UVlteP6kQhTPhNkOUCF7HIJ1iSBek=;
        b=bh/Yc7ib70rMRytao7YazGM6DE8EYf9531/W4xhuNMM6unxZ9MWk9cslhHyM6l+hTp
         j+kT3d41iVzxAhFn8bnXTgfpBCQTbaAPD2HmRFSMBvdS2yPvXYrNkYPdBcfy0jR2u2wE
         X9yS+1w0wyBVSY3EahmZ9u6xkygbiwbUY3RnDhCGGFDBJXDno0Mz9/Dz7miTYircbn8V
         HiR4srrC2V3goCxvEETjpRRh2PB5R6O1oMCLqcNhpgdQrUHJf+5eZnjBCBKSAWrMw6JS
         xCwI0Ri44dNrys2PU+f0Lk0HcoAXRN+nApty5JlV6gLSoQueL1k75qI5JoI7FSYcwOql
         V9wA==
X-Gm-Message-State: AOJu0Yx9714DlEdkSoy0kG29Q8Uh/FKuMpCHJN7CbQQquBlwdTI8YHBa
        AEJ7bsnYhI3oiWpr8TxHDiBnkg==
X-Google-Smtp-Source: AGHT+IGSOMHXkbKBRndy/P+lUWb4Fd6BypQox95rPMLgRNO93FsXEf3VhT1aIAsksiNcS/whalhFWg==
X-Received: by 2002:ac2:498f:0:b0:500:d960:8b6f with SMTP id f15-20020ac2498f000000b00500d9608b6fmr8976952lfl.67.1694508299373;
        Tue, 12 Sep 2023 01:44:59 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512040400b004fdc0f2caafsm1671525lfk.48.2023.09.12.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 01:44:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 10:44:52 +0200
Subject: [PATCH] OMAP/gpio: drop MPUIO static base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230912-omap-mpuio-base-v1-1-290d9bd24b23@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAMlAGUC/x3MMQqAMAxA0atIZgO2CqJXEYdUU81gWxoUQby7x
 fEN/z+gnIUVxuqBzJeoxFBg6gqWncLGKGsx2Ma2zWAsxoMSHumUiI6UcaDV0eL7znoHpUqZvdz
 /cZrf9wPfdjC1YQAAAA==
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The OMAP GPIO driver hardcodes the MPIO chip base, but there
is no point: we have already moved all consumers over to using
descriptor look-ups.

Drop the MPUIO GPIO base and use dynamic assignment.

Root out the unused instances of the OMAP_MPUIO() macro and
delete the unused OMAP_GPIO_IS_MPUIO() macro.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Maybe Bartosz can merge this into the GPIO tree with Tony's
et al blessing?
---
 arch/arm/mach-omap1/board-palmte.c      | 5 -----
 drivers/gpio/gpio-omap.c                | 3 +--
 include/linux/platform_data/gpio-omap.h | 3 ---
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
index 7e061d671fde..c917cb2c6e17 100644
--- a/arch/arm/mach-omap1/board-palmte.c
+++ b/arch/arm/mach-omap1/board-palmte.c
@@ -51,11 +51,6 @@
 #define PALMTE_HDQ_GPIO		11
 #define PALMTE_HEADPHONES_GPIO	14
 #define PALMTE_SPEAKER_GPIO	15
-#define PALMTE_DC_GPIO		OMAP_MPUIO(2)
-#define PALMTE_MMC_SWITCH_GPIO	OMAP_MPUIO(4)
-#define PALMTE_MMC1_GPIO	OMAP_MPUIO(6)
-#define PALMTE_MMC2_GPIO	OMAP_MPUIO(7)
-#define PALMTE_MMC3_GPIO	OMAP_MPUIO(11)
 
 static const unsigned int palmte_keymap[] = {
 	KEY(0, 0, KEY_F1),		/* Calendar */
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a927680c66f8..262ec0c1c658 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1048,15 +1048,14 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct device *pm_dev)
 		bank->chip.label = "mpuio";
 		if (bank->regs->wkup_en)
 			bank->chip.parent = &omap_mpuio_device.dev;
-		bank->chip.base = OMAP_MPUIO(0);
 	} else {
 		label = devm_kasprintf(bank->chip.parent, GFP_KERNEL, "gpio-%d-%d",
 				       gpio, gpio + bank->width - 1);
 		if (!label)
 			return -ENOMEM;
 		bank->chip.label = label;
-		bank->chip.base = -1;
 	}
+	bank->chip.base = -1;
 	bank->chip.ngpio = bank->width;
 
 	irq = &bank->chip.irq;
diff --git a/include/linux/platform_data/gpio-omap.h b/include/linux/platform_data/gpio-omap.h
index f377817ce75c..cdd8cfb424f5 100644
--- a/include/linux/platform_data/gpio-omap.h
+++ b/include/linux/platform_data/gpio-omap.h
@@ -144,9 +144,6 @@
 
 #define OMAP_MAX_GPIO_LINES		192
 
-#define OMAP_MPUIO(nr)		(OMAP_MAX_GPIO_LINES + (nr))
-#define OMAP_GPIO_IS_MPUIO(nr)	((nr) >= OMAP_MAX_GPIO_LINES)
-
 #ifndef __ASSEMBLER__
 struct omap_gpio_reg_offs {
 	u16 revision;

---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230912-omap-mpuio-base-9adbacf742fb

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

