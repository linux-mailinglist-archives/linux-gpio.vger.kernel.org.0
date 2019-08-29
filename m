Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F14EA1CFF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfH2OiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:38:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38835 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbfH2OiM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:38:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so4136673wme.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u8Ebk7QWN+LKifxQ3AQ5Izn0oOsKOrrKqkWevkW/A00=;
        b=EcliQ+vOmLp3SblL1HLYAa8iir+biJd+OuLdMsEJFq9COfCD7D0KPcbfpzpd4s3622
         h3BFVLHJEYzZOhzbRW2DmbiY9b05s0etnxIm1RMbEYLcyHvvHY8I9W1PvblE1bLP2eRj
         yFKZ1WL9uSrCLhsYv9+dBIat5Fida7JjXleICprcESjn8+zj+aHaS32gauGTBgKgWR7c
         thEy5wAK3ZO0qcoZlvaS34DRBe/JVWG3N6q1TYz6zUviwAk7qTJoBWELthZUjperax30
         SGsXChmwh9WqBrQjk2+JYk6cYmT/cGHpKdB+6vDDRXbdwEVHXXZC4U61HiCVQqhLvVdu
         kabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u8Ebk7QWN+LKifxQ3AQ5Izn0oOsKOrrKqkWevkW/A00=;
        b=JFdGqHNLMQyq9W9dI2vT187uc+HYJ/TZrO8YmTKIfLEXPCEruQL/mSXfSexSaNQfNe
         YarDjLX42f4uWtcmH4BsMiiJTCcmNzZwRhtVcSOFL29LSQSMJSBFzamqOOYyw2dODPrt
         gIAIupoCAL+w865sfCiOtkkkQy/XRgXVOd6Q01CNDPH0i/Ayb0P1qnVXMg0GDuOlmzjZ
         DtM4JMciWL/dHAezTaGKuGPft7AD50dnu054W/pCijJAPyWGcbgFnAdgiNI7ep5AJ9Iw
         50KbDTmQsSkZFKUXpEGhyD2eJb90sujJID2+ZoY+vB4ONmrCzYbTmTfVssTCTCigqa8s
         7TEQ==
X-Gm-Message-State: APjAAAUb7JoIiGlraNma9zcwY08Apwgyl/8HIXXut8RFXrhqPnE99MLm
        kLfBqxw7UaiJNbSnvn0qWRqJ6A==
X-Google-Smtp-Source: APXvYqyZPJd9llioD6vMb/qjxHg/Ic6BXTeCoVOfUAhQH3SeuOwXjfdHya2X39hvaybpiH5Oblo68A==
X-Received: by 2002:a7b:c933:: with SMTP id h19mr11498491wml.177.1567089490210;
        Thu, 29 Aug 2019 07:38:10 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 6/9] gpio: ath79: use devm_platform_ioremap_resource_nocache()
Date:   Thu, 29 Aug 2019 16:37:39 +0200
Message-Id: <20190829143742.24726-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devm_platform_ioremap_resource_nocache() helper for memory
range mapping instead of devm_ioremap_nocache() combined with a call to
platform_get_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-ath79.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index f1a5ea9b3de2..c2c5d7dd2575 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -226,7 +226,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct ath79_gpio_ctrl *ctrl;
 	struct gpio_irq_chip *girq;
-	struct resource *res;
 	u32 ath79_gpio_count;
 	bool oe_inverted;
 	int err;
@@ -256,12 +255,9 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	ctrl->base = devm_ioremap_nocache(dev, res->start, resource_size(res));
-	if (!ctrl->base)
-		return -ENOMEM;
+	ctrl->base = devm_platform_ioremap_resource_nocache(pdev, 0);
+	if (IS_ERR(ctrl->base))
+		return PTR_ERR(ctrl->base);
 
 	raw_spin_lock_init(&ctrl->lock);
 	err = bgpio_init(&ctrl->gc, dev, 4,
-- 
2.21.0

