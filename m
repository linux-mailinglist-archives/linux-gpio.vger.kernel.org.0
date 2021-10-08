Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748AC4261E1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238388AbhJHB1n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhJHB1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349F9C06176F
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so32213536lfd.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E2YJV+cRv0tFDhiSivfR6SvH37WdzUlDmvLwCor6dDY=;
        b=L0KijY6p8P4ir96ydYttFpDY6QH7wz+RURuOgIU/aV3EWWykzGCdoVOkpmyqYnWJCU
         f/uf8ZfYuItGUqG2gOYku+cVct63S3Ox/oYW7iWw9tkZFDTaFXmgNlmTCAlcmQJnFuYh
         NJ9YmcW+Ruh9GVh8CmEWV5ci7N536jf8ZQH1h55ZS8xtubS4+Kl7cCabNakQ9b/RzTFc
         30FEZFZojfOcK4/XAFxqk3OU/n0UHEuaaCEHL5/MqqW9VdActROsO2bRnb74c1B7QrWq
         EQVQ1+vhgA03SY9HBbOuHb7tTXqvVd6HztM9Lh4QtQpVHTYse6HGhRJPwTUDwWBug6AZ
         7vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E2YJV+cRv0tFDhiSivfR6SvH37WdzUlDmvLwCor6dDY=;
        b=YxvV/zQ/MMVXKfkSBAzxgva+aSsYWpSRccOJt8gyqxi4Ri29EkPZXzTV/r1MdcJ3Ry
         gDZ1r+P2/5xkW66y06bqwhYpU85o0xOJQMXU2GxQLuW7ZgswmucQW0t0hvY+MiEuobvz
         c2sDR5HqXGwu9XTDcOqu0uEUx7iRVOBjCvq8q74Ni8e7nDVj96Eb7PeAdRcSIgcGNscK
         o5p7omCmFIirRdOaAGKA4cyMStF8wXvEIB+sJ1RNlBU0RaIFHgnLhxGl2Dm6iAgfsJw4
         DPmdItCac8t4pW+fuTCIvTdPngyLAilj2AcifBTql0GKr1DjzPigk6aG8D+uhCjEFuke
         tapw==
X-Gm-Message-State: AOAM532ly05CnEa7E3wegNhHOw1unYTm0WVQ0Yskr7xpDSnB+MmCeLHy
        AK9XEyIny73WBbvQvoDXSrebnw==
X-Google-Smtp-Source: ABdhPJyGwjFnyCZSXMbAczCm3yhItxSe5Z2ebqnWOQPvdvsNhrKXnVRm0g4xXVG/NH284jySo0arAw==
X-Received: by 2002:a05:6512:260f:: with SMTP id bt15mr7472700lfb.134.1633656338589;
        Thu, 07 Oct 2021 18:25:38 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 16/25] pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip
Date:   Fri,  8 Oct 2021 04:25:15 +0300
Message-Id: <20211008012524.481877-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
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

