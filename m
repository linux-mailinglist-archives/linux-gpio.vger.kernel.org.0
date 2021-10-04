Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F62421A98
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 01:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237117AbhJDXY0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 19:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236984AbhJDXYY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 19:24:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17585C0613EC
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 16:22:33 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m3so77353870lfu.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Oct 2021 16:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E2YJV+cRv0tFDhiSivfR6SvH37WdzUlDmvLwCor6dDY=;
        b=tmLsAFRWAIEPtpzVlS/gOOReWWq4xy49ClvN3lPA8l5FWZ93q03KKbpX8N/IlDlo0V
         swUqkVEKR8wjb4PZ1eA64EWzlweGdHVzDLZ4bxEyLtBCgIz+gNDjcQfGYR523X58bRgY
         MNUT8hRkBROCkfAozPODs3YPvJE3/hRXDiAQTAvcb3SpUCJF6pfhOXRhuzrrt3751R8d
         +ejVY4sfCAjE2LvBx8GJKl/IUEcMqblSpn/VyXR6NwgJ08lh3zIuhQacoo0InrM4qKXv
         eeRs7sKGX4P88medj/dMXcc//jNDnj2c5MUxricWV2jBjgTZVRBqVXwt+yhCNJCRLS8i
         +Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E2YJV+cRv0tFDhiSivfR6SvH37WdzUlDmvLwCor6dDY=;
        b=6OaDokhXUW9yqQs1mEYnvMA9ll8RM9dZs4Q06TjQ+mHszHY6HvCqcLJf8Heg1QASJX
         3aWOpXWKabag4tpPQcwzsmFoGd3MAP42mTFPjSVYAPA5NMIocxWO28Arp4VC43ZDumuL
         4sAE50WE7EQ74y8kvKZo1hufrsXCVJilRcw6bg5KEY6Df4UTUrQQ/NRvQM8TPopAW5Qa
         pen6A2JfXIIauk445F2LMLYSPPb/s/TkvIiWEHu6Ce9w+jQDe6pygOtQPNeCTuHSuOnW
         KZzqKT0r6+GTPVJuGwrJeMyAq/MKWRRX7pg6SMgoeOT5718OKEstYiG0eM+LUS7zxkWo
         rlaw==
X-Gm-Message-State: AOAM531QgYi6x2MYhYsDNUQ2//D2dkmYgpIdBOdhl4vr28TzeJFkm/ig
        /++tdXPE/Nl2z1sznvc8Fkfpxg==
X-Google-Smtp-Source: ABdhPJxP/kJ1S1dqxw2d3PhYqyv/5YnCKtXvfVgFBRXToL3qCY3cbKMO38U29s/YlPDpxw468ETSMA==
X-Received: by 2002:a05:6512:3990:: with SMTP id j16mr17227941lfu.292.1633389751657;
        Mon, 04 Oct 2021 16:22:31 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h23sm1786219lja.131.2021.10.04.16.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 16:22:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/6] pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip
Date:   Tue,  5 Oct 2021 02:22:25 +0300
Message-Id: <20211004232225.2260665-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
References: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

spmi-mpp did not have any irqchip support so consumers of this in
device tree would need to call gpio[d]_to_irq() in order to get the
proper IRQ on the underlying PMIC. IRQ chips in device tree should be
usable from the start without the consumer having to make an additional
call to get the proper IRQ on the parent. This patch adds hierarchical
IRQ chip support to the spmi-mpp code to correct this issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 86 ++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index a9f994863126..b80723928b7e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -103,7 +103,6 @@
 /**
  * struct pmic_mpp_pad - keep current MPP settings
  * @base: Address base in SPMI device.
- * @irq: IRQ number which this MPP generate.
  * @is_enabled: Set to false when MPP should be put in high Z state.
  * @out_value: Cached pin output value.
  * @output_enabled: Set to true if MPP output logic is enabled.
@@ -121,7 +120,6 @@
  */
 struct pmic_mpp_pad {
 	u16		base;
-	int		irq;
 	bool		is_enabled;
 	bool		out_value;
 	bool		output_enabled;
@@ -143,6 +141,7 @@ struct pmic_mpp_state {
 	struct regmap	*map;
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
+	struct irq_chip irq;
 };
 
 static const struct pinconf_generic_params pmic_mpp_bindings[] = {
@@ -622,16 +621,6 @@ static int pmic_mpp_of_xlate(struct gpio_chip *chip,
 	return gpio_desc->args[0] - PMIC_MPP_PHYSICAL_OFFSET;
 }
 
-static int pmic_mpp_to_irq(struct gpio_chip *chip, unsigned pin)
-{
-	struct pmic_mpp_state *state = gpiochip_get_data(chip);
-	struct pmic_mpp_pad *pad;
-
-	pad = state->ctrl->desc->pins[pin].drv_data;
-
-	return pad->irq;
-}
-
 static void pmic_mpp_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	struct pmic_mpp_state *state = gpiochip_get_data(chip);
@@ -651,7 +640,6 @@ static const struct gpio_chip pmic_mpp_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.of_xlate		= pmic_mpp_of_xlate,
-	.to_irq			= pmic_mpp_to_irq,
 	.dbg_show		= pmic_mpp_dbg_show,
 };
 
@@ -796,13 +784,53 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 	return 0;
 }
 
+static int pmic_mpp_domain_translate(struct irq_domain *domain,
+				      struct irq_fwspec *fwspec,
+				      unsigned long *hwirq,
+				      unsigned int *type)
+{
+	struct pmic_mpp_state *state = container_of(domain->host_data,
+						     struct pmic_mpp_state,
+						     chip);
+
+	if (fwspec->param_count != 2 ||
+	    fwspec->param[0] < 1 || fwspec->param[0] > state->chip.ngpio)
+		return -EINVAL;
+
+	*hwirq = fwspec->param[0] - PMIC_MPP_PHYSICAL_OFFSET;
+	*type = fwspec->param[1];
+
+	return 0;
+}
+
+static unsigned int pmic_mpp_child_offset_to_irq(struct gpio_chip *chip,
+						  unsigned int offset)
+{
+	return offset + PMIC_MPP_PHYSICAL_OFFSET;
+}
+
+static int pmic_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
+					   unsigned int child_hwirq,
+					   unsigned int child_type,
+					   unsigned int *parent_hwirq,
+					   unsigned int *parent_type)
+{
+	*parent_hwirq = child_hwirq + 0xc0;
+	*parent_type = child_type;
+
+	return 0;
+}
+
 static int pmic_mpp_probe(struct platform_device *pdev)
 {
+	struct irq_domain *parent_domain;
+	struct device_node *parent_node;
 	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pindesc;
 	struct pinctrl_desc *pctrldesc;
 	struct pmic_mpp_pad *pad, *pads;
 	struct pmic_mpp_state *state;
+	struct gpio_irq_chip *girq;
 	int ret, npins, i;
 	u32 reg;
 
@@ -857,10 +885,6 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 		pindesc->number = i;
 		pindesc->name = pmic_mpp_groups[i];
 
-		pad->irq = platform_get_irq(pdev, i);
-		if (pad->irq < 0)
-			return pad->irq;
-
 		pad->base = reg + i * PMIC_MPP_ADDRESS_RANGE;
 
 		ret = pmic_mpp_populate(state, pad);
@@ -880,6 +904,34 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 	if (IS_ERR(state->ctrl))
 		return PTR_ERR(state->ctrl);
 
+	parent_node = of_irq_find_parent(state->dev->of_node);
+	if (!parent_node)
+		return -ENXIO;
+
+	parent_domain = irq_find_host(parent_node);
+	of_node_put(parent_node);
+	if (!parent_domain)
+		return -ENXIO;
+
+	state->irq.name = "spmi-mpp",
+	state->irq.irq_ack = irq_chip_ack_parent,
+	state->irq.irq_mask = irq_chip_mask_parent,
+	state->irq.irq_unmask = irq_chip_unmask_parent,
+	state->irq.irq_set_type = irq_chip_set_type_parent,
+	state->irq.irq_set_wake = irq_chip_set_wake_parent,
+	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
+
+	girq = &state->chip.irq;
+	girq->chip = &state->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
+	girq->parent_domain = parent_domain;
+	girq->child_to_parent_hwirq = pmic_mpp_child_to_parent_hwirq;
+	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_fourcell;
+	girq->child_offset_to_irq = pmic_mpp_child_offset_to_irq;
+	girq->child_irq_domain_ops.translate = pmic_mpp_domain_translate;
+
 	ret = gpiochip_add_data(&state->chip, state);
 	if (ret) {
 		dev_err(state->dev, "can't add gpio chip\n");
-- 
2.30.2

