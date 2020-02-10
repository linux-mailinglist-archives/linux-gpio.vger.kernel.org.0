Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08C7157CBC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 14:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgBJNt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 08:49:26 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27388 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727558AbgBJNt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Feb 2020 08:49:26 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01ADjnMT027085;
        Mon, 10 Feb 2020 14:49:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2LPP53kZYmHtlL5dGE8TqJ5G+UvsVYZ0tIBu17vFOOI=;
 b=ok7ZrewK0qvAIaFR/P2ySVWXtiE34iaCQiLhnWJiD/ZoDir595UPg86alEB4MOLji6es
 QrXbzsFkthoqhz8QvtCB7Ags3mV5opNlj/EmKvJIUBmgYy75llrktQs2rUmhqP6Hl+Mp
 T0UIiuOUy6TYrx5rDFr5yEJR6gXm3HQEr3Ib175gfRwXaqcx+wcFQadI3i2Dc2he9Q+K
 ZBrv9DQ3K9EJV/M1lL1orrpX17Kzv4+3cY6A+9zckrHJvI6vV9MvkEgf1+6S8cmdMT6m
 +EvLb2hqPzDbJL9aqLUNXAhNsIkSJWrMW2hJnGhkerZfG1jmCeffu5oIHGBXNcyDnud3 mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1uvd2kfe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Feb 2020 14:49:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B5AE100038;
        Mon, 10 Feb 2020 14:49:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 69E8E2BD418;
        Mon, 10 Feb 2020 14:49:05 +0100 (CET)
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
Subject: [PATCH 1/2] irqchip/stm32: Add irq retrigger support
Date:   Mon, 10 Feb 2020 14:49:00 +0100
Message-ID: <20200210134901.1939-2-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210134901.1939-1-alexandre.torgue@st.com>
References: <20200210134901.1939-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_04:2020-02-10,2020-02-10 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This commit introduces retrigger support for stm32_ext_h chip.
It consists to rise the GIC interrupt mapped to an EXTI line.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index e00f2fa27f00..c971d115edb4 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -604,12 +604,24 @@ static void stm32_exti_h_syscore_deinit(void)
 	unregister_syscore_ops(&stm32_exti_h_syscore_ops);
 }
 
+static int stm32_exti_h_retrigger(struct irq_data *d)
+{
+	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	void __iomem *base = chip_data->host_data->base;
+	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
+
+	writel_relaxed(mask, base + stm32_bank->swier_ofst);
+
+	return irq_chip_retrigger_hierarchy(d);
+}
+
 static struct irq_chip stm32_exti_h_chip = {
 	.name			= "stm32-exti-h",
 	.irq_eoi		= stm32_exti_h_eoi,
 	.irq_mask		= stm32_exti_h_mask,
 	.irq_unmask		= stm32_exti_h_unmask,
-	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_retrigger		= stm32_exti_h_retrigger,
 	.irq_set_type		= stm32_exti_h_set_type,
 	.irq_set_wake		= stm32_exti_h_set_wake,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND,
-- 
2.17.1

