Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8243D4261DB
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241667AbhJHB1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239415AbhJHB1d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A66C061762
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so32285337lfa.9
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a82goinfuhMQndAZ1eqxYJiqwbzakFYRTc0Nku7E5EU=;
        b=xf3Cvbd1uHZ2yjcHWjFi5H5ffM/4fm71QLN44vHftTHY6owA066uh/KOufJ4jpzKZV
         8xWmQoACICqT3doiygVInJ9OlxuBzkQ4b1DOVHX/GbfnA8hcuMuvLlYlguXIzgzag3xo
         wD5fpTpbZkyxR5hZI6bCT7U6eW4S9pOwId+NMz4OOpzoGpnoAse89786ENh7BMQOSk8T
         fTwZm2Cl2N7HLi0g8JXuABYzO+OwMM0znyvpwsxqSxKI7rqqVzbS7FPTwkPqt7CUAdi6
         MinbYdkGbVG419oBSxafB1lH8g056F/B6cOPKNjCxLs1wqbMWDKkPrKLQcYyzWSXw6WH
         iLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a82goinfuhMQndAZ1eqxYJiqwbzakFYRTc0Nku7E5EU=;
        b=sXItsKD1KkM4BsDyAV/Tj2AtaNT3q6OjZCXT8xW8HHrbLBWFbJF9kuZySYFtw+jBGu
         oyDK2UKe2pQE45per+SZQc36im4/0Nbq3Z5j5dWJeJYkRXNuAmKBES5IaEgKyAMtUx16
         RjnRDFJUTmuu9Fo0f+/LUj6HWKke5drUrSNQUfHrUurULX++2eWwXbJHDsT5pUxO0cZf
         XDNkhvsMAM9G0vDQAC7KLixygVfBU8CUg4bzCs+S+TcJZdEwQ3wZorhbX4lLVYunLDb3
         fddT6U/DZI9fZgxHqZUPpo+V36lN0NkhH+fJzhjwQlfy1Npf88wXl98gp0gc4q2eSU7y
         YWEw==
X-Gm-Message-State: AOAM531NWZaRoz5+P+SyHqT5IFHgltNp58D0gyGghQfJfzbzZSGBQZir
        sUuQndt/EaSWlX28wKtJUnSPlQ==
X-Google-Smtp-Source: ABdhPJyrWAgYPMSXhEwgdTYwlRaJ7AJbDevlxWuqsjKPPoruZCiJD/Dt1ijoK+76OgbXSXt0AxliXQ==
X-Received: by 2002:a2e:390d:: with SMTP id g13mr394279lja.78.1633656337278;
        Thu, 07 Oct 2021 18:25:37 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 14/25] pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
Date:   Fri,  8 Oct 2021 04:25:13 +0300
Message-Id: <20211008012524.481877-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ssbi-mpp did not have any irqchip support so consumers of this in
device tree would need to call gpio[d]_to_irq() in order to get the
proper IRQ on the underlying PMIC. IRQ chips in device tree should be
usable from the start without the consumer having to make an additional
call to get the proper IRQ on the parent. This patch adds hierarchical
IRQ chip support to the ssbi-mpp code to correct this issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 111 ++++++++++++++++++++----
 1 file changed, 93 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index a90cada1d657..842940594c4a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -87,7 +87,6 @@
 /**
  * struct pm8xxx_pin_data - dynamic configuration for a pin
  * @reg:		address of the control register
- * @irq:		IRQ from the PMIC interrupt controller
  * @mode:		operating mode for the pin (digital, analog or current sink)
  * @input:		pin is input
  * @output:		pin is output
@@ -103,7 +102,6 @@
  */
 struct pm8xxx_pin_data {
 	unsigned reg;
-	int irq;
 
 	u8 mode;
 
@@ -126,6 +124,7 @@ struct pm8xxx_mpp {
 	struct regmap *regmap;
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip chip;
+	struct irq_chip irq;
 
 	struct pinctrl_desc desc;
 	unsigned npins;
@@ -148,6 +147,8 @@ static const struct pin_config_item pm8xxx_conf_items[] = {
 #endif
 
 #define PM8XXX_MAX_MPPS	12
+#define PM8XXX_MPP_PHYSICAL_OFFSET    1
+
 static const char * const pm8xxx_groups[PM8XXX_MAX_MPPS] = {
 	"mpp1", "mpp2", "mpp3", "mpp4", "mpp5", "mpp6", "mpp7", "mpp8",
 	"mpp9", "mpp10", "mpp11", "mpp12",
@@ -492,12 +493,16 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip, unsigned offset)
 	struct pm8xxx_mpp *pctrl = gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
 	bool state;
-	int ret;
+	int ret, irq;
 
 	if (!pin->input)
 		return !!pin->output_value;
 
-	ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
+	irq = chip->to_irq(chip, offset);
+	if (irq < 0)
+		return irq;
+
+	ret = irq_get_irqchip_state(irq, IRQCHIP_STATE_LINE_LEVEL, &state);
 	if (!ret)
 		ret = !!state;
 
@@ -524,18 +529,10 @@ static int pm8xxx_mpp_of_xlate(struct gpio_chip *chip,
 	if (flags)
 		*flags = gpio_desc->args[1];
 
-	return gpio_desc->args[0] - 1;
+	return gpio_desc->args[0] - PM8XXX_MPP_PHYSICAL_OFFSET;
 }
 
 
-static int pm8xxx_mpp_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct pm8xxx_mpp *pctrl = gpiochip_get_data(chip);
-	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
-
-	return pin->irq;
-}
-
 #ifdef CONFIG_DEBUG_FS
 #include <linux/seq_file.h>
 
@@ -558,7 +555,7 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
 		"abus3",
 	};
 
-	seq_printf(s, " mpp%-2d:", offset + 1);
+	seq_printf(s, " mpp%-2d:", offset + PM8XXX_MPP_PHYSICAL_OFFSET);
 
 	switch (pin->mode) {
 	case PM8XXX_MPP_DIGITAL:
@@ -640,7 +637,6 @@ static const struct gpio_chip pm8xxx_mpp_template = {
 	.get = pm8xxx_mpp_get,
 	.set = pm8xxx_mpp_set,
 	.of_xlate = pm8xxx_mpp_of_xlate,
-	.to_irq = pm8xxx_mpp_to_irq,
 	.dbg_show = pm8xxx_mpp_dbg_show,
 	.owner = THIS_MODULE,
 };
@@ -732,6 +728,55 @@ static int pm8xxx_pin_populate(struct pm8xxx_mpp *pctrl,
 	return 0;
 }
 
+static int pm8xxx_mpp_domain_translate(struct irq_domain *domain,
+				   struct irq_fwspec *fwspec,
+				   unsigned long *hwirq,
+				   unsigned int *type)
+{
+	struct pm8xxx_mpp *pctrl = container_of(domain->host_data,
+						 struct pm8xxx_mpp, chip);
+
+	if (fwspec->param_count != 2 ||
+	    fwspec->param[0] < PM8XXX_MPP_PHYSICAL_OFFSET ||
+	    fwspec->param[0] > pctrl->chip.ngpio)
+		return -EINVAL;
+
+	*hwirq = fwspec->param[0] - PM8XXX_MPP_PHYSICAL_OFFSET;
+	*type = fwspec->param[1];
+
+	return 0;
+}
+
+static unsigned int pm8xxx_mpp_child_offset_to_irq(struct gpio_chip *chip,
+						   unsigned int offset)
+{
+	return offset + PM8XXX_MPP_PHYSICAL_OFFSET;
+}
+
+static int pm8821_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
+					    unsigned int child_hwirq,
+					    unsigned int child_type,
+					    unsigned int *parent_hwirq,
+					    unsigned int *parent_type)
+{
+	*parent_hwirq = child_hwirq + 24;
+	*parent_type = child_type;
+
+	return 0;
+}
+
+static int pm8xxx_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
+					    unsigned int child_hwirq,
+					    unsigned int child_type,
+					    unsigned int *parent_hwirq,
+					    unsigned int *parent_type)
+{
+	*parent_hwirq = child_hwirq + 0x80;
+	*parent_type = child_type;
+
+	return 0;
+}
+
 static const struct of_device_id pm8xxx_mpp_of_match[] = {
 	{ .compatible = "qcom,pm8018-mpp", .data = (void *) 6 },
 	{ .compatible = "qcom,pm8038-mpp", .data = (void *) 6 },
@@ -746,7 +791,10 @@ MODULE_DEVICE_TABLE(of, pm8xxx_mpp_of_match);
 static int pm8xxx_mpp_probe(struct platform_device *pdev)
 {
 	struct pm8xxx_pin_data *pin_data;
+	struct irq_domain *parent_domain;
+	struct device_node *parent_node;
 	struct pinctrl_pin_desc *pins;
+	struct gpio_irq_chip *girq;
 	struct pm8xxx_mpp *pctrl;
 	int ret;
 	int i;
@@ -783,9 +831,6 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 
 	for (i = 0; i < pctrl->desc.npins; i++) {
 		pin_data[i].reg = SSBI_REG_ADDR_MPP(i);
-		pin_data[i].irq = platform_get_irq(pdev, i);
-		if (pin_data[i].irq < 0)
-			return pin_data[i].irq;
 
 		ret = pm8xxx_pin_populate(pctrl, &pin_data[i]);
 		if (ret)
@@ -816,6 +861,36 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 	pctrl->chip.of_gpio_n_cells = 2;
 	pctrl->chip.label = dev_name(pctrl->dev);
 	pctrl->chip.ngpio = pctrl->npins;
+
+	parent_node = of_irq_find_parent(pctrl->dev->of_node);
+	if (!parent_node)
+		return -ENXIO;
+
+	parent_domain = irq_find_host(parent_node);
+	of_node_put(parent_node);
+	if (!parent_domain)
+		return -ENXIO;
+
+	pctrl->irq.name = "ssbi-mpp";
+	pctrl->irq.irq_mask_ack = irq_chip_mask_ack_parent;
+	pctrl->irq.irq_unmask = irq_chip_unmask_parent;
+	pctrl->irq.irq_set_type = irq_chip_set_type_parent;
+	pctrl->irq.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
+
+	girq = &pctrl->chip.irq;
+	girq->chip = &pctrl->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
+	girq->parent_domain = parent_domain;
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,pm8821-mpp"))
+		girq->child_to_parent_hwirq = pm8821_mpp_child_to_parent_hwirq;
+	else
+		girq->child_to_parent_hwirq = pm8xxx_mpp_child_to_parent_hwirq;
+	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_twocell;
+	girq->child_offset_to_irq = pm8xxx_mpp_child_offset_to_irq;
+	girq->child_irq_domain_ops.translate = pm8xxx_mpp_domain_translate;
+
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "failed register gpiochip\n");
-- 
2.30.2

