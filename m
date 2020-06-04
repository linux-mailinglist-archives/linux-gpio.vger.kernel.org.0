Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180651EDA02
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 02:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgFDA2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 20:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgFDA2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 20:28:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABB1C03E96D
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 17:28:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z9so5029644ljh.13
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 17:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VHOWfgLhQyccmK4q8Ldz2IqVj7g3f2Klhib240tNYU=;
        b=HBJAvwNzUOXRnGbLcgIQFhS+ttFVgf08OzqhzrjyAZaqK3Ei9sKm7hM0fTAvvD6wIQ
         ukZAaxFfk440BT3uIQ0YeySkqiFAh90P8Wm7OSPF+s4Dlz2Kfz39JfAErWI6KcrCfN+f
         WBkEMFn9RyXVa6RxL0ITT4Iq8JiLyfuW1uSH1qsBDQAC9Lk2aYHvezfFP/NcURtfiDAi
         c4+ee+YYDRKYNrtobJ8mOmoFzTQJIu/fQNCmozJWZHh+SfDEvDDx7XRLnizvu1EdJucE
         MZhhyrnc0ienyLmEdkT4Op2ip3ZLRvGR6azoaY44LNVzvyTmL7JPs2u0Dm3v0fjTnplG
         M+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VHOWfgLhQyccmK4q8Ldz2IqVj7g3f2Klhib240tNYU=;
        b=WRpu2A5Zzfw0nx8D0rs4e2oUN7FGiWv9V51UNhsxuAkwGHmRkGdR76p989DWndtaA6
         bTmJ/rE98tZR7VF0XdTTev0U7+H5ydnfoTGNJL7S5jHllhGjHmx3bjrSrHiYQkklH5Qo
         Ynu8uAzvZ0byiHSkiwHOS+kp9WhMoshgBM0+LE8gMrKej1gXgu0sbs1KpZRw2/kjtOB+
         Gdg4U+HEUjGfVQRbquYfu3ceVB7aT1lnExpekSzEdcW+CfTVnN9NUsNMV5FSmVqWrCpF
         Hh8oSX2XBDpNkxgjG9A4zwj0ZKobgPdwwi0sOwY0wveHJJ0woI9CK8sYqZzEmxFJiIgM
         7caQ==
X-Gm-Message-State: AOAM533ErZAY1IjmKF0ZY/YuKGvsyjIK+amgg8gYF3DbLjYeOmC4uU73
        qIcHZFpgsAnSRA0sFiBSRS/3oaTt7x8=
X-Google-Smtp-Source: ABdhPJy0NDg5HUyn9p7YobjUOZLS9dC/88XxBVGszvY1kZmURhjaoLE7/mPc6dli1TKekNQUUaUciQ==
X-Received: by 2002:a05:651c:112b:: with SMTP id e11mr859787ljo.134.1591230499361;
        Wed, 03 Jun 2020 17:28:19 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id q4sm1061357lfm.93.2020.06.03.17.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:28:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH] pinctrl: qcom: spmi-gpio: fix warning about irq chip reusage
Date:   Thu,  4 Jun 2020 03:28:17 +0300
Message-Id: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following warnings caused by reusage of the same irq_chip
instance for all spmi-gpio gpio_irq_chip instances. Instead embed
irq_chip into pmic_gpio_state struct.

gpio gpiochip2: (c440000.qcom,spmi:pmic@2:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
gpio gpiochip3: (c440000.qcom,spmi:pmic@4:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
gpio gpiochip4: (c440000.qcom,spmi:pmic@a:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index fe0be8a6ebb7..092a48e4dff5 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -170,6 +170,7 @@ struct pmic_gpio_state {
 	struct regmap	*map;
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
+	struct irq_chip irq;
 };
 
 static const struct pinconf_generic_params pmic_gpio_bindings[] = {
@@ -917,16 +918,6 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	return 0;
 }
 
-static struct irq_chip pmic_gpio_irq_chip = {
-	.name = "spmi-gpio",
-	.irq_ack = irq_chip_ack_parent,
-	.irq_mask = irq_chip_mask_parent,
-	.irq_unmask = irq_chip_unmask_parent,
-	.irq_set_type = irq_chip_set_type_parent,
-	.irq_set_wake = irq_chip_set_wake_parent,
-	.flags = IRQCHIP_MASK_ON_SUSPEND,
-};
-
 static int pmic_gpio_domain_translate(struct irq_domain *domain,
 				      struct irq_fwspec *fwspec,
 				      unsigned long *hwirq,
@@ -1053,8 +1044,16 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENXIO;
 
+	state->irq.name = "spmi-gpio",
+	state->irq.irq_ack = irq_chip_ack_parent,
+	state->irq.irq_mask = irq_chip_mask_parent,
+	state->irq.irq_unmask = irq_chip_unmask_parent,
+	state->irq.irq_set_type = irq_chip_set_type_parent,
+	state->irq.irq_set_wake = irq_chip_set_wake_parent,
+	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
+
 	girq = &state->chip.irq;
-	girq->chip = &pmic_gpio_irq_chip;
+	girq->chip = &state->irq;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
-- 
2.26.2

