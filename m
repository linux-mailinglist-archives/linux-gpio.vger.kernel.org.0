Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B3E157CC1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 14:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgBJNt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 08:49:28 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27264 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727795AbgBJNt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Feb 2020 08:49:27 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01ADjmQc026889;
        Mon, 10 Feb 2020 14:49:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Riic4+z5MgPW8dmxRKqdNYW1VO4rh0gIFgp4hzhs0Vk=;
 b=ArpE8MnzKtc9E+rkyGuA/5SbYdpZ2HjDhRJo7eIU5AeqfMxDT2cWAWs/7PYshUTbP5cL
 FMuPN/lnlZxO3IeXXfGHMsFIyR+Y3yK9d+OypOwE2B5hEDBjNscf523rkrHHoDa+8wfH
 63LDYoARUIvFdhsbWe4tcubp6CHgy5Mg8aFmXvl2R+6wwXn600JJI0jGOFtG3KI0nO6x
 cdXxcCsoNX6Ab3lBvnP8ZxO1mtwT143pVxEEpKH9VPdxShsmM9V/VFzpEwb9eqW43j/g
 qZJ+JGJO3S9imHem8av77G3bmz4L1H5CwjjNvxNHromZCEJ/2o3QkLTt0WdmYtyScuOf ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1uvd2kfj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Feb 2020 14:49:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F4EC10002A;
        Mon, 10 Feb 2020 14:49:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12CBD2BD418;
        Mon, 10 Feb 2020 14:49:06 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb 2020 14:49:05
 +0100
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <marex@denx.de>
Subject: [PATCH 2/2] pinctrl: stm32: Add level interrupt support to gpio irq chip
Date:   Mon, 10 Feb 2020 14:49:01 +0100
Message-ID: <20200210134901.1939-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210134901.1939-1-alexandre.torgue@st.com>
References: <20200210134901.1939-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_04:2020-02-10,2020-02-10 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds level interrupt support to gpio irq chip.

GPIO hardware block is directly linked to EXTI block but EXTI handles
external interrupts only on edge. To be able to handle GPIO interrupt on
level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
is retriggered following interrupt type and gpio line value.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2d5e0435af0a..04e1b062c20e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -89,6 +89,7 @@ struct stm32_gpio_bank {
 	struct pinctrl_gpio_range range;
 	struct fwnode_handle *fwnode;
 	struct irq_domain *domain;
+	u32 irq_type[STM32_GPIO_PINS_PER_BANK];
 	u32 bank_nr;
 	u32 bank_ioport_nr;
 	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
@@ -303,6 +304,48 @@ static const struct gpio_chip stm32_gpio_template = {
 	.get_direction		= stm32_gpio_get_direction,
 };
 
+void stm32_gpio_irq_eoi(struct irq_data *d)
+{
+	struct stm32_gpio_bank *bank = d->domain->host_data;
+	int line;
+
+	irq_chip_eoi_parent(d);
+
+	/* If level interrupt type then retrig */
+	line = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
+	if ((line == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
+	    (line == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
+		irq_chip_retrigger_hierarchy(d);
+};
+
+static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
+{
+	struct stm32_gpio_bank *bank = d->domain->host_data;
+	u32 parent_type;
+
+	bank->irq_type[d->hwirq] = type;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_EDGE_BOTH:
+		parent_type = type;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		parent_type = IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		parent_type = IRQ_TYPE_EDGE_FALLING;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	irq_chip_set_type_parent(d, parent_type);
+
+	return 0;
+};
+
 static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
 {
 	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
@@ -332,11 +375,11 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
 
 static struct irq_chip stm32_gpio_irq_chip = {
 	.name		= "stm32gpio",
-	.irq_eoi	= irq_chip_eoi_parent,
+	.irq_eoi	= stm32_gpio_irq_eoi,
 	.irq_ack	= irq_chip_ack_parent,
 	.irq_mask	= irq_chip_mask_parent,
 	.irq_unmask	= irq_chip_unmask_parent,
-	.irq_set_type	= irq_chip_set_type_parent,
+	.irq_set_type	= stm32_gpio_set_type,
 	.irq_set_wake	= irq_chip_set_wake_parent,
 	.irq_request_resources = stm32_gpio_irq_request_resources,
 	.irq_release_resources = stm32_gpio_irq_release_resources,
-- 
2.17.1

