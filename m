Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C22961CD
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbfHTOAC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 10:00:02 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39666 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730115AbfHTOAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 10:00:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id x4so5232902ljj.6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SPeETwTtdte0J8tWKb47NzI2JHXSv9wBHtQSqBHm7M=;
        b=c6P+TTSkcMPtHRWACPSXXJ4M4uXHOzHo5JJxbtGOYSHYtMkGdcq+pDNhUgX3pqNhdI
         +MSxeQvBtmeKy7pCOoiRMxO+5t31JPY2bjUxYmvKfbSUz7F3bLnoFlCcFLzwV+idQuU/
         itnFD/wcavbaGBYOQe6nU3E7086BZIOBj+PHg0G9XlCKYj57yRb5KC0/aqW3bg+OfxVB
         EAuhyVCQVuvF1mITX2BR83AjszjFw/NzjwZI97yBrMshRRHxuf1SaICUgzXr4yUOPjga
         /RgDuiaBofj+CFlvy/1S5whfpVKW8nqr0j0Tu+TPsPGGei50qNot06/R3R5bi62nORkq
         p/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SPeETwTtdte0J8tWKb47NzI2JHXSv9wBHtQSqBHm7M=;
        b=n60AWPnbYNqTZW2RvakzMxTRph5Y9W9O644yc83rfAHUHGjLSDfnLSrGxaj08fLVku
         k8yEQHJEOhEa0/wm4KJrj923cRHp+NAVUpCtP4c5bn1fcgzj6AtdSdBkW8ZkVqM7sow0
         PlA/jO7ZRRaNKBeJTtmNkzTY0Rm3Uis2OiUeuUJQW/T1bMw1U5EXl8l4LnBLWWEy7iBP
         GuCdXf13ruiOQvZ/Z8TiwL65JAAjQFi44eMvJ6X9KFqQ3etxcfxFwBtflJNsJif8lgGk
         rXT96uCFvHbMTUCG6sDrj27eMuWZ+gywketemiNsohROWs0qt9gbMPNWZ+/7JZcNCQP1
         IyJQ==
X-Gm-Message-State: APjAAAU+dBX4El7rtmQaJaYoZErjhCsXpRIHXBu2N4vYj/mQs5mnov5h
        sUGjQzOwlYsrT1q64FqfwVPkNCLUzI4=
X-Google-Smtp-Source: APXvYqwb1zCsljUqqph0VfTVJe/33CGQGgxBCYENlB1otLW4fDf2chStsP0WNns7DbVTqhiQK7lXTQ==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr15607039ljn.89.1566309600093;
        Tue, 20 Aug 2019 07:00:00 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w6sm2871543lff.80.2019.08.20.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 06:59:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2 v3] pinctrl: rza2: Drop driver use of consumer flags
Date:   Tue, 20 Aug 2019 15:59:54 +0200
Message-Id: <20190820135955.14391-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These flags are for consumers of GPIO lines, not for
drivers.

Cc: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- New patch for just this.
---
 drivers/pinctrl/pinctrl-rza2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
index 5b951c7422cc..b0806667e94c 100644
--- a/drivers/pinctrl/pinctrl-rza2.c
+++ b/drivers/pinctrl/pinctrl-rza2.c
@@ -115,7 +115,7 @@ static void rza2_pin_to_gpio(void __iomem *pfc_base, unsigned int offset,
 	mask16 = RZA2_PDR_MASK << (pin * 2);
 	reg16 &= ~mask16;
 
-	if (dir == GPIOF_DIR_IN)
+	if (dir)
 		reg16 |= RZA2_PDR_INPUT << (pin * 2);	/* pin as input */
 	else
 		reg16 |= RZA2_PDR_OUTPUT << (pin * 2);	/* pin as output */
@@ -134,18 +134,18 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
 	reg16 = (reg16 >> (pin * 2)) & RZA2_PDR_MASK;
 
 	if (reg16 == RZA2_PDR_OUTPUT)
-		return GPIOF_DIR_OUT;
+		return 0;
 
 	if (reg16 == RZA2_PDR_INPUT)
-		return GPIOF_DIR_IN;
+		return 1;
 
 	/*
 	 * This GPIO controller has a default Hi-Z state that is not input or
 	 * output, so force the pin to input now.
 	 */
-	rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_IN);
+	rza2_pin_to_gpio(priv->base, offset, 1);
 
-	return GPIOF_DIR_IN;
+	return 1;
 }
 
 static int rza2_chip_direction_input(struct gpio_chip *chip,
@@ -153,7 +153,7 @@ static int rza2_chip_direction_input(struct gpio_chip *chip,
 {
 	struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
 
-	rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_IN);
+	rza2_pin_to_gpio(priv->base, offset, 1);
 
 	return 0;
 }
@@ -191,7 +191,7 @@ static int rza2_chip_direction_output(struct gpio_chip *chip,
 	struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
 
 	rza2_chip_set(chip, offset, val);
-	rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_OUT);
+	rza2_pin_to_gpio(priv->base, offset, 0);
 
 	return 0;
 }
-- 
2.21.0

