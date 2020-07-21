Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0701B22804C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 14:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgGUMwb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 08:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgGUMwa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 08:52:30 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685E4C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 05:52:30 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u25so11606905lfm.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5p9l2h7oULuMDcdpJWOvN0sr4rIBBOAw+sXoQ3u2g7o=;
        b=o4u/PqPqzxiQElL8rBTc4vdmM7RVLBpjy39iUyUzMuQ79QMX05IXLkOAHtsE/l5/Nv
         1uQzuosFiLIRWDam3WX3EXEhrRJ0m1ywUl1fKs5UArH8rFxzqTbusVLw/iPyB8/ihRyt
         RGfo8Ze+Kwh161jbWBW/cENcOVDaXfA9gXXFaZCqN/kCd4Vg9he4p6fpg1obAZArtYbA
         vh6kAyKOgu5vE1VMDXkLesottgKOxToLrBjognlGaDPGeEOyONOBqjAjam3qb4eqhco9
         1oFdfYZ7gbgzjlcx9WtADry6t9jQsOZsaa/aLsdLgvbLLSSiy6xr82otdSvECVH07f+L
         cbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5p9l2h7oULuMDcdpJWOvN0sr4rIBBOAw+sXoQ3u2g7o=;
        b=LHk9udAJapBMfcVIze7bog86zZpicZvllbKHpTzsOJEXr7250VbH6C4SGbE0YvtQId
         0xxe7b1W4n7Jn7Dow4MkkfiZNGAPeF9SIAxWi6BPPCch5/IVUO9uwUThJaYTDmZvd/OJ
         w0xcKelQibFZdLSo+XLrvqHR6JC85brZySpX6bSU8z/5z/5C1Mw2kSpYUB6uqDRNVJ7y
         SJ/BMLyXbtzfJ96sop6stlIqCb/QGK+unBn61fgV491o3R77ntDMQb283mPwSDxvZW+h
         PQI+DvKPCRCmx8RTV/uzM87jGRF6jVB4i/UAgLsx4lLjB9yr96KmPM2q2Mm1ad5mYZmv
         od4g==
X-Gm-Message-State: AOAM533wUDbjGa7J+Qlm8+dwyXnY9ggoTNjWV8D0TwCRW9HF0oUzUDox
        rFA5+bgNGR2Mkj+VKH3IF1A8FRIYWeo=
X-Google-Smtp-Source: ABdhPJwTZQgcDz3MDHybMAwN4BxmA5K5DKvPPlEkYtl+UeUQ8M7bOixNXZ4sXB59WbbyAr+U4l5Flg==
X-Received: by 2002:a05:6512:6cc:: with SMTP id u12mr12623251lff.148.1595335948559;
        Tue, 21 Jul 2020 05:52:28 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b9sm2308825lfi.88.2020.07.21.05.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 05:52:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>,
        Lars Poeschel <poeschel@lemonage.de>,
        Jason Kridner <jkridner@gmail.com>
Subject: [PATCH] pinctrl: mcp23s08: Use irqchip template
Date:   Tue, 21 Jul 2020 14:52:23 +0200
Message-Id: <20200721125223.344411-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add_nested() and
gpiochip_set_nested_irqchip(). The irqchip is instead
added while adding the gpiochip.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Phil Reid <preid@electromag.com.au>
Cc: Lars Poeschel <poeschel@lemonage.de>
Cc: Jason Kridner <jkridner@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 44 ++++++++++--------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 151931b593f6..42b12ea14d6b 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -522,29 +522,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 	return 0;
 }
 
-static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
-{
-	struct gpio_chip *chip = &mcp->chip;
-	int err;
-
-	err =  gpiochip_irqchip_add_nested(chip,
-					   &mcp->irq_chip,
-					   0,
-					   handle_simple_irq,
-					   IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(chip->parent,
-			"could not connect irqchip to gpiochip: %d\n", err);
-		return err;
-	}
-
-	gpiochip_set_nested_irqchip(chip,
-				    &mcp->irq_chip,
-				    mcp->irq);
-
-	return 0;
-}
-
 /*----------------------------------------------------------------------*/
 
 int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
@@ -589,10 +566,6 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (ret < 0)
 		goto fail;
 
-	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
-	if (ret < 0)
-		goto fail;
-
 	mcp->irq_controller =
 		device_property_read_bool(dev, "interrupt-controller");
 	if (mcp->irq && mcp->irq_controller) {
@@ -629,11 +602,22 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	}
 
 	if (mcp->irq && mcp->irq_controller) {
-		ret = mcp23s08_irqchip_setup(mcp);
-		if (ret)
-			goto fail;
+		struct gpio_irq_chip *girq = &mcp->chip.irq;
+
+		girq->chip = &mcp->irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+		girq->threaded = true;
 	}
 
+	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
+	if (ret < 0)
+		goto fail;
+
 	mcp->pinctrl_desc.pctlops = &mcp_pinctrl_ops;
 	mcp->pinctrl_desc.confops = &mcp_pinconf_ops;
 	mcp->pinctrl_desc.npins = mcp->chip.ngpio;
-- 
2.26.2

