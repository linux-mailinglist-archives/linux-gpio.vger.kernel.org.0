Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF533EAF78
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 06:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238248AbhHME4n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 00:56:43 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:12140 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236136AbhHME4m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 00:56:42 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 21:56:16 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 21:56:14 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Aug 2021 10:25:48 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 26D3D1894; Fri, 13 Aug 2021 10:25:46 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
Date:   Fri, 13 Aug 2021 10:25:30 +0530
Message-Id: <1628830531-14648-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
References: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: David Collins <collinsd@codeaurora.org>

pmic_gpio_child_to_parent_hwirq() and
gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
spmi-gpio irqspec to an SPMI controller irqspec.  When they do
this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
This translation results in an incorrect irqspec for secondary
PMICs that don't have a slave ID of 0 as well as for PMIC chips
which have GPIO peripherals located at a base address other than
0xC000.

Correct this issue by passing the slave ID of the pinctrl-spmi-
gpio device's parent in the SPMI controller irqspec and by
calculating the peripheral ID base from the device tree 'reg'
property of the pinctrl-spmi-gpio device.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 98bf0e2..dbae168 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2014, 2016-2021 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/gpio/driver.h>
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/spmi.h>
 #include <linux/types.h>
 
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
@@ -171,6 +172,8 @@ struct pmic_gpio_state {
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
 	struct irq_chip irq;
+	u8 usid;
+	u8 pid_base;
 };
 
 static const struct pinconf_generic_params pmic_gpio_bindings[] = {
@@ -949,12 +952,36 @@ static int pmic_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
 					   unsigned int *parent_hwirq,
 					   unsigned int *parent_type)
 {
-	*parent_hwirq = child_hwirq + 0xc0;
+	struct pmic_gpio_state *state = gpiochip_get_data(chip);
+
+	*parent_hwirq = child_hwirq + state->pid_base;
 	*parent_type = child_type;
 
 	return 0;
 }
 
+static void *pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type)
+{
+	struct pmic_gpio_state *state = gpiochip_get_data(chip);
+	struct irq_fwspec *fwspec;
+
+	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
+
+	fwspec->param_count = 4;
+	fwspec->param[0] = state->usid;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = 0;
+	fwspec->param[3] = parent_type;
+
+	return fwspec;
+}
+
 static int pmic_gpio_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain;
@@ -965,6 +992,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	struct pmic_gpio_pad *pad, *pads;
 	struct pmic_gpio_state *state;
 	struct gpio_irq_chip *girq;
+	const struct spmi_device *parent_spmi_dev;
 	int ret, npins, i;
 	u32 reg;
 
@@ -984,6 +1012,9 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 
 	state->dev = &pdev->dev;
 	state->map = dev_get_regmap(dev->parent, NULL);
+	parent_spmi_dev = to_spmi_device(dev->parent);
+	state->usid = parent_spmi_dev->usid;
+	state->pid_base = reg >> 8;
 
 	pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
 	if (!pindesc)
@@ -1059,7 +1090,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
 	girq->parent_domain = parent_domain;
 	girq->child_to_parent_hwirq = pmic_gpio_child_to_parent_hwirq;
-	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_fourcell;
+	girq->populate_parent_alloc_arg = pmic_gpio_populate_parent_fwspec;
 	girq->child_offset_to_irq = pmic_gpio_child_offset_to_irq;
 	girq->child_irq_domain_ops.translate = pmic_gpio_domain_translate;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

