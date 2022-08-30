Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405275A5DD0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 10:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiH3IMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Aug 2022 04:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiH3IMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 04:12:21 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB93DAA4C3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 01:12:19 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id q63so9987051pga.9
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=MBk2nnm5jPvR2jKN1FsnZ000vs/LFS6W/sdktL/Mvis=;
        b=OEs/g0n5T5cy1cL+p7vJ0Swo6MllX5g3m9QeFGFwvGTIIkDu75xZuz8JekMcfhFFOQ
         Unu1LxWbmmfGY60Z2Z0A3s+0azKTXADtX8kJrW+Kt//8lC2KKvdke1l2s17mixbfrYnp
         f2J58ccrvoi0OJ6RcDWQi3nj+nPjZgKny39zPR4JjGTLXBZ/KptxJoT5MwJvNhKCHxdo
         cKx0Tc4c5rgL65QccEE9dGwH2sTOPpHOd42zHCwOdt+owbYru0VprjZVpHkOoojm3hHY
         0w2QvSt/Wj2SC7dTStMmjFdWlxA5LGLxhk241ymQcpKGQhT6LrZ4s30qp8HKIsNIou26
         XM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=MBk2nnm5jPvR2jKN1FsnZ000vs/LFS6W/sdktL/Mvis=;
        b=KyDW5zXt56+IJeG51ZIZbbb98pYWjXi6Ro+2IS1BZumVCvgSZG7vL7y+8i61CZiHGQ
         1HqbvB+HOG8ZU/6DZkT0oZx9xPctXRRFLWI0D24U61TKN+zxue5BZcUKbKsuZklwSAMw
         ycwZjcydelYZzBrC1QhXg6INsGBV57wu5EAGloT0N/1eqZY5GKjHqohIEGZHEQ2U/2aT
         hDa9m7HUTZy58ZQy8aTwJjWhFtPhNsJSwRmzamYW4Yga/4FtVvqRUxzno6mLTpSkO658
         K96oP+At68ZA1OiETvlJghlZcug07zQh6yHH9lZ08c7crZY2KyNV3Uo16JfezireHPBm
         zljw==
X-Gm-Message-State: ACgBeo3shgfyvuwNZx9Lor0b1BxBOZu645il890/TsgzIbUAmiTHxwPe
        dmul9mIWiHQoJPZxE0U3qqZI
X-Google-Smtp-Source: AA6agR7Y5gSLsvSjaAqtvLywlc0OurzraPk+YFwXJz0BZu7eNpBHItuWld0SzvQIFJsy/p94mODHXQ==
X-Received: by 2002:a05:6a00:2489:b0:52f:9d31:c1ce with SMTP id c9-20020a056a00248900b0052f9d31c1cemr20380281pfv.51.1661847139352;
        Tue, 30 Aug 2022 01:12:19 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.245])
        by smtp.gmail.com with ESMTPSA id cq2-20020a17090af98200b001fd8df95decsm5778832pjb.27.2022.08.30.01.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 01:12:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        maz@kernel.org, johan+linaro@kernel.org, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] pinctrl: qcom: spmi-gpio: Make IRQCHIP immutable
Date:   Tue, 30 Aug 2022 13:42:12 +0530
Message-Id: <20220830081212.164709-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The IRQCHIP implementation used inside the gpiochips are not supposed to
be changed during runtime. So let's make the one inside the spmi-gpio
gpiochip immutable.

This fixes the below warning during boot:
gpio gpiochip0: (c440000.spmi:pmic@0:gpio@c000): not an immutable chip, please consider fixing it!

Separate callbacks need to be provided for irq_{mask/unmask} pointers since
the callbacks are supposed to mask/unmask the corresponding parent IRQ in
addition to changing the gpio_desc flags.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Added new callbacks for irq_{mask/unmask} for masking/unmasking the parent
  IRQ that was missing in v1. (Thanks to Marc)
* Modified the commit message accordingly.

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 38 +++++++++++++++++-------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index ccaf40a9c0e6..d40e3b2d38cc 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -171,7 +171,6 @@ struct pmic_gpio_state {
 	struct regmap	*map;
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
-	struct irq_chip irq;
 	u8 usid;
 	u8 pid_base;
 };
@@ -985,6 +984,33 @@ static int pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
 	return 0;
 }
 
+static void pmic_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	irq_chip_mask_parent(data);
+	gpiochip_disable_irq(gc, data->hwirq);
+}
+
+static void pmic_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	irq_chip_unmask_parent(data);
+	gpiochip_enable_irq(gc, data->hwirq);
+}
+
+static const struct irq_chip spmi_gpio_irq_chip = {
+	.name		= "spmi-gpio",
+	.irq_ack	= irq_chip_ack_parent,
+	.irq_mask	= pmic_gpio_irq_mask,
+	.irq_unmask	= pmic_gpio_irq_unmask,
+	.irq_set_type	= irq_chip_set_type_parent,
+	.irq_set_wake	= irq_chip_set_wake_parent,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int pmic_gpio_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain;
@@ -1078,16 +1104,8 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENXIO;
 
-	state->irq.name = "spmi-gpio",
-	state->irq.irq_ack = irq_chip_ack_parent,
-	state->irq.irq_mask = irq_chip_mask_parent,
-	state->irq.irq_unmask = irq_chip_unmask_parent,
-	state->irq.irq_set_type = irq_chip_set_type_parent,
-	state->irq.irq_set_wake = irq_chip_set_wake_parent,
-	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
-
 	girq = &state->chip.irq;
-	girq->chip = &state->irq;
+	gpio_irq_chip_set_chip(girq, &spmi_gpio_irq_chip);
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
-- 
2.25.1

