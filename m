Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F283987C80
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 16:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406871AbfHIOTW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 10:19:22 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43400 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfHIOTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:19:22 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17so67699869ljk.10
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFP4PggmTnA76WxebWrxZeo52ZgN+d3Rg6ECCeeNQTw=;
        b=AmeOH44d9zaQIoh4t7SQaqj5WAnEzreTtf/lAQSJHCswVeKqdzmz/2rj5lnDg8nHqe
         upuurrM+99+woP4LSyayLMU+/AHrmUkBCQlIeTd1NthyZtjE81avVZuzjFkz/tY7AMYU
         2on2mLtT3Gvd/hl4CgfiYxr2DbqBeSxWKejJxTtOcunU3kFYZEcMSaQa5bifcM0snrMU
         fl87VUJaEYtBTu9q2evT9HLDgMqis7RPIQvuzpPObSoP+M92+XG+pBs0f1Pp0OGlcIPo
         TtVScQc19rYK0Q8QQFBEO9NEjUSVtKiPj08ZbPSNF8hIqPTov1RVQV3UVmEEMDlp6W6q
         vTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aFP4PggmTnA76WxebWrxZeo52ZgN+d3Rg6ECCeeNQTw=;
        b=IVylP9IpFHVEGB+gosftH7Rm10V+7EEuXhrDbHI4swJRtX2wVblSzSXyXcgojoLe6U
         yq8K/gcpgKCcnCJjMraitAV/KWBlMp4H3Ryf/SSbG+AIV8QvjMVHw7cIEgQ9nx6OLiPY
         7x4U52zZHQOvB2PxhDaiI8nfmhS8GtXf+PvuPN+YalqniITZcoAch6UNy9vAI9Brapje
         /c3A2GlYfFAIydvbrbfo8VZH4Ycsi5I2xzhKvwMOTy38+P1qca2TyQeBnUkUIGRqZ7io
         fCAeB9BboALre68vGB58b5Kuxa4/Xl8XaJQFc/Qvl9o3gEb281+LTGuE9jzLQQHIf6f/
         XguA==
X-Gm-Message-State: APjAAAXniRXT6NPFzJAg32P7zWH79qAL2fvi8+HG3TWDr5Q83Ygbe6c6
        qnNa0SC6AkJgjuOSDoh7EjIjzl+sF8Q=
X-Google-Smtp-Source: APXvYqy/W1kF2dl+C7AvY63SlW4rhxFfXHSNi3QdMBa7OGLNm1jGB5sn9gnYvwd3TWbPjPoH3QmEPg==
X-Received: by 2002:a2e:8650:: with SMTP id i16mr11615763ljj.178.1565360360156;
        Fri, 09 Aug 2019 07:19:20 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id l25sm19110785lja.76.2019.08.09.07.19.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:19:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: vf610: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 16:19:16 +0200
Message-Id: <20190809141916.20999-1-linus.walleij@linaro.org>
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

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-vf610.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 7ba668db171b..58776f2d69ff 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -243,6 +243,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
+	struct gpio_irq_chip *girq;
 	struct irq_chip *ic;
 	int i;
 	int ret;
@@ -318,10 +319,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	ic->irq_set_type = vf610_gpio_irq_set_type;
 	ic->irq_set_wake = vf610_gpio_irq_set_wake;
 
-	ret = devm_gpiochip_add_data(dev, gc, port);
-	if (ret < 0)
-		return ret;
-
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)
 		vf610_gpio_writel(0, port->base + PORT_PCR(i));
@@ -329,15 +326,20 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	/* Clear the interrupt status register for all GPIO's */
 	vf610_gpio_writel(~0, port->base + PORT_ISFR);
 
-	ret = gpiochip_irqchip_add(gc, ic, 0, handle_edge_irq, IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev, "failed to add irqchip\n");
-		return ret;
-	}
-	gpiochip_set_chained_irqchip(gc, ic, port->irq,
-				     vf610_gpio_irq_handler);
+	girq = &gc->irq;
+	girq->chip = ic;
+	girq->parent_handler = vf610_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = port->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
 
-	return 0;
+	return devm_gpiochip_add_data(dev, gc, port);
 }
 
 static struct platform_driver vf610_gpio_driver = {
-- 
2.21.0

