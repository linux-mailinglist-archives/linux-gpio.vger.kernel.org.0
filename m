Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 198CB564C9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfFZIoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:44:21 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44487 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfFZIoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:44:20 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so977925lfm.11
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxs3BeVBcdxLHdi+Parxy8n/C7wBYADjIv/7ru8vFI0=;
        b=tNxzX1jVP2M+/XVPMUBjJztx2fa2/ochZbHKKIzoBXFrXAf9uEyUFTFO29kO+f/3+b
         T8fDtmEN6odb6aTzFBbR3ftb6qCRkztbJ1fVCmnFz2flgNVexsOUUPSrlx7G4AIGTkth
         YMffkyQmNfQYbNXuP5pX9R/SxgfT2WJnILq3aQd8Wl2S+yAmvBI9aeYm4gkmyEzGMuSb
         3ZiBPvx/nXuNlvCXM8FaS/YqzZ65xw9gtDHJXLedu6f3jFlcT0OV0uZfhUbAYDUusolF
         jBkePQQH9iGQHEM522AD41NNF3j22e8YZOeC0PoC7Rz6esuozF3F28jiW4B/L0Qv1SWu
         /FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxs3BeVBcdxLHdi+Parxy8n/C7wBYADjIv/7ru8vFI0=;
        b=RLb1nPHYgXK1AYGqXEFdvmsSv7gOu60AUK/6nRGkof73TZO0CBi3VieSpS9qd36sWF
         FfEWW5jtOXe8iH1BZ/j6qQMY/EFDx1xB7H3mOjzu2aQ1p8chP2dKvxHLEhx1G+9q5Wjt
         WnEb8dgnCEVWcGdlSJPFGgRx8dvBRW2FRnhzjaJHdI3KhEs2XeZUpQgZ3Mtwnnkz28sE
         F3kQMO0wLZ970EWDgwvY26ZdPUhyWmqjGZ6GBUMoMwWJuLItrmBy5eCPJU8m4lh6ojWA
         wPEeiMvvgM2cp85cFD80KQDCf6nT9n3PtZ95rVQiKPpwOtQf19pZxSn+dtV7A7KP6W8u
         AzBg==
X-Gm-Message-State: APjAAAVsXBh/FUDZHEZWjHBb8FOfWjIuUvmkM2ASBUb+Fqe8/GuuuK2A
        lwxOYWPWwGArCwRPg9wb/8qhhvABrg0=
X-Google-Smtp-Source: APXvYqzm3oPwRdUt0tA2lmY4vqiGF3yX/umxnHspwmo+DvD+6w8SZdkXXhUckl2XHSkOLHMt9W66Rw==
X-Received: by 2002:ac2:499b:: with SMTP id f27mr2002246lfl.88.1561538658376;
        Wed, 26 Jun 2019 01:44:18 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y5sm2683635ljj.5.2019.06.26.01.44.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 01:44:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH 3/5] gpio: siox: Pass irqchip when adding gpiochip
Date:   Wed, 26 Jun 2019 10:44:05 +0200
Message-Id: <20190626084407.27976-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626084407.27976-1-linus.walleij@linaro.org>
References: <20190626084407.27976-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Split out bugfixes to separate patches.
---
 drivers/gpio/gpio-siox.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 40067e1535d3..31749c058e33 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -211,6 +211,7 @@ static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int gpio_siox_probe(struct siox_device *sdevice)
 {
 	struct gpio_siox_ddata *ddata;
+	struct gpio_irq_chip *girq;
 	int ret;
 
 	ddata = devm_kzalloc(&sdevice->dev, sizeof(*ddata), GFP_KERNEL);
@@ -239,6 +240,11 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	ddata->ichip.irq_unmask = gpio_siox_irq_unmask;
 	ddata->ichip.irq_set_type = gpio_siox_irq_set_type;
 
+	girq = &ddata->gchip.irq;
+	girq->chip = &ddata->ichip;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
 	ret = gpiochip_add(&ddata->gchip);
 	if (ret) {
 		dev_err(&sdevice->dev,
@@ -246,13 +252,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 		return ret;
 	}
 
-	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
-				   0, handle_level_irq, IRQ_TYPE_NONE);
-	if (ret)
-		dev_err(&sdevice->dev,
-			"Failed to register irq chip (%d)\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int gpio_siox_remove(struct siox_device *sdevice)
-- 
2.20.1

