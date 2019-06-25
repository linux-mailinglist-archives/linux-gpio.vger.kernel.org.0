Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE73854D5C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 13:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbfFYLSa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 07:18:30 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43668 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbfFYLSa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 07:18:30 -0400
Received: by mail-lj1-f195.google.com with SMTP id 16so15822293ljv.10
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 04:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+R91olza62R92mGPd18XWhzqCeYD6MJApyTtJVndtV8=;
        b=C+svq5Eg5oghWryhZBQoNfhzkI0LJKvWt1LgZrYiphCJUgA0Smi4mG/r1/6+SX/jvl
         gpZxq3TKQfbd/PgqAJFmJGMFp3w5t64DcZ8mfOZ1SQdn/2Pi0qYrWz+t3WKB0+nkRHZZ
         Dy+TkD9EbNSmLaIhQrzVETfx87FHCc5WsyHYcJGeBkm7Pr0DlPuMjCXSKbqHYMJn8Wli
         2wbccNkrWcr5t8MlSAkmh8qlpzhmt9XBIo/cA1LUX9Oabvlk327XBfHUnOQ6m1bR3sZS
         M8CHhzcGZ0QdIogSE7rjNRQJ550rRcIRHRMTCaqaedOlHQduBQ5Wm7v0Kx40HMn+h2G2
         M2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+R91olza62R92mGPd18XWhzqCeYD6MJApyTtJVndtV8=;
        b=kc166W6mmRxJV40NHSZbqwVGiSKtlJbErGbehOPC+UG+HMji9QYBdDxmKc0knwMgz5
         NVtg2WVxtbUDc153tnqR69UbokWfyOhbR5qCd5BFCNgQwovHSXld4oDGw3D6qNkvpQeL
         mbjmjeX3ldB82PSwwKQolozYG7i27Cl2RqUsS5dgWWopBtv5063TihI5ez/JX2pe4FMr
         dc7r0V7QiH2d56jv3ObpI0fpjshvupRY7IZgq1+VaPYkC1/yXqUmifuNieuDq+U+xbeH
         w+NjUqq3EvydPKRPTe4EXJobeG+YJLX8+90gz5RrMean0n8Qz+R0e4Vf1zzjMOeMr5LL
         1adA==
X-Gm-Message-State: APjAAAWb2iEhe7PyxZgLxDHrImSgz3guxKqOhGagEUZcwpxjUs+vPe7m
        11ks75EVPuUQcQCPIIqICUM6UpB0QAQ=
X-Google-Smtp-Source: APXvYqz8RIpBqGhlPR/Cs4CRVt/55/53spZMfg2Pc90Xd2U76LLniYk99+QgmmDZCdt1NJaGFhucGA==
X-Received: by 2002:a2e:9c41:: with SMTP id t1mr35072597ljj.6.1561461507958;
        Tue, 25 Jun 2019 04:18:27 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w28sm2201770ljd.12.2019.06.25.04.18.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 04:18:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] gpio: pl061: Pass irqchip when adding gpiochip
Date:   Tue, 25 Jun 2019 13:18:24 +0200
Message-Id: <20190625111824.28482-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index dc42571e6fdc..84af248f5172 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -286,6 +286,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct pl061 *pl061;
+	struct gpio_irq_chip *girq;
 	int ret, irq;
 
 	pl061 = devm_kzalloc(dev, sizeof(*pl061), GFP_KERNEL);
@@ -313,10 +314,6 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	pl061->gc.parent = dev;
 	pl061->gc.owner = THIS_MODULE;
 
-	ret = gpiochip_add_data(&pl061->gc, pl061);
-	if (ret)
-		return ret;
-
 	/*
 	 * irq_chip support
 	 */
@@ -335,19 +332,24 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 	pl061->parent_irq = irq;
 
-	ret = gpiochip_irqchip_add(&pl061->gc, &pl061->irq_chip,
-				   0, handle_bad_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_info(&adev->dev, "could not add irqchip\n");
+	girq = &pl061->gc.irq;
+	girq->chip = &pl061->irq_chip;
+	girq->parent_handler = pl061_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
+	if (ret)
 		return ret;
-	}
-	gpiochip_set_chained_irqchip(&pl061->gc, &pl061->irq_chip,
-				     irq, pl061_irq_handler);
 
 	amba_set_drvdata(adev, pl061);
-	dev_info(&adev->dev, "PL061 GPIO chip @%pa registered\n",
-		 &adev->res.start);
+	dev_info(dev, "PL061 GPIO chip %s registered\n", dev_name(dev));
 
 	return 0;
 }
-- 
2.20.1

