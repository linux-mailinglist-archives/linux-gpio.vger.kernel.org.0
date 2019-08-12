Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12AB8A078
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 16:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfHLOOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 10:14:52 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43370 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfHLOOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 10:14:52 -0400
Received: by mail-lf1-f65.google.com with SMTP id c19so74344530lfm.10
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzmnAdrBvsTZy+67KBYbLZLd3TwZRwodBLS97SMtlW8=;
        b=h/OJVRArzpDHivjI5N+uRdVNF6wdfPOxQcg+TygzViu/2jqAzdLn7l5O4SBmKNJj9J
         za+KaHwqxyz4vfdWLCTG9EIbx0PN/89xuF07fW/y4k1ACw4S/fMYQaL82VWB4Eu9rGIF
         +pvqOVL3Qaf6sc1gS6qxZl3UDepP4QDochamjS75gOkVLHIEt3fqVrvpUEDSsVKCcg78
         Jo7lms5C0epHW1xbxM9hysfEPtH2zrHMQeusoq0yOAKhWGu3zRG3L3Es3CULaaqtmFQj
         kYdTqbRklCFywE4WO7fJU8l+RkUMjKYbxZ8yskFi7pkFCob1uVbezyOGIEk5cYnafP8f
         j51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzmnAdrBvsTZy+67KBYbLZLd3TwZRwodBLS97SMtlW8=;
        b=DzmkP2gmGwct85fwndt5G5NP1p+sN3mK0epirsT4F5hVfbCNfy4E6l86mbE4O4liQW
         SUUvJPP/cbd6U7CUaL5HmpwPm8pK92bx6oiDu/ZLjODY9iQOMfLIxGjMj7FEl6vf+kYg
         TXnPlO35sCiJbokgHJxo3wGyrVBmeVeGAJT1GkeCQnQHYXPsixvnnw7kgvxjiCtcL7Hp
         oZss69In06mu8wohtX4sm0blsDtAM7t2yec7VO18kopk3zeMd46/Gk3ux6s6YTusajvw
         fpUYc9JgFWzTR9NljjB2bBSocv1nxfIiVDvzTuKpi049DsS6m0bXd+0k0PnBXQ8fClCQ
         6g9A==
X-Gm-Message-State: APjAAAUB9+uQM2MNrBkj0dhuvMQsmao5FygwtRNs+ShuDGAHFw0S7x62
        L746fMOwFi9aM76kz1jer0J1lxm7suY=
X-Google-Smtp-Source: APXvYqyW7u6j//of/gJte+tq4eIyp34Jtd3mbHwKzcgNic7gRYvRcXqns91OcRPMZTIzwGULLaQKwA==
X-Received: by 2002:a19:7908:: with SMTP id u8mr19786982lfc.178.1565619290113;
        Mon, 12 Aug 2019 07:14:50 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d16sm6051251lfl.29.2019.08.12.07.14.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 07:14:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] pinctrl: intel: baytrail: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 16:14:46 +0200
Message-Id: <20190812141446.1090-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Andy: when you're happy with this you can either supply an
ACK and I will merge it or you can merge it into your tree
for a later pull request, just tell me what you prefer.
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 38 ++++++++++++++----------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index e5a112a8e067..57faddca3710 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1533,6 +1533,28 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	if (!vg->saved_context)
 		return -ENOMEM;
 #endif
+
+	/* set up interrupts  */
+	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
+	if (irq_rc && irq_rc->start) {
+		struct gpio_irq_chip *girq;
+
+		byt_gpio_irq_init_hw(vg);
+
+		girq = &gc->irq;
+		girq->chip = &byt_irqchip;
+		girq->parent_handler = byt_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = (unsigned int)irq_rc->start;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+	}
+
 	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
 	if (ret) {
 		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
@@ -1546,22 +1568,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		return ret;
 	}
 
-	/* set up interrupts  */
-	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
-	if (irq_rc && irq_rc->start) {
-		byt_gpio_irq_init_hw(vg);
-		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
-					   handle_bad_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
-			return ret;
-		}
-
-		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
-					     (unsigned)irq_rc->start,
-					     byt_gpio_irq_handler);
-	}
-
 	return ret;
 }
 
-- 
2.21.0

