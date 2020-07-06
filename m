Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CCD2153C0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 10:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgGFILf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 04:11:35 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:4742 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728536AbgGFILc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 04:11:32 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0667rscg012104;
        Mon, 6 Jul 2020 10:11:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+WZHIdwRTPieJW/Mf4tbydfBXpegEoEpTyEHH1Sf3Wo=;
 b=Oe8sn2UCo50GcvGSLFIdEG3KQA7ihvsNogI5oMPxqsfGb5QSIjaB1xEVhD65ivZ6wnp4
 7y+ChCvCjCpISIit8Ti7BaGzzus8gHZfocRP1UQFEu7IC7asltH1O4TdWN9oD8iREmJO
 0P6z1FHmw+XXr2xAVWPv7uCHS7GUsaR+G3d7Wqglh9o4gGdrJE1GRg+l8VKPNtiEGBjU
 WdJkxfIJad2pc+7Fih4dL+m86m43w8myVh5kkImu2/82AxdkCNz1OV/Ctjd1JA/yNo61
 lhP4M/iVpCXh79PcgvPs9JtO8WNXNmYczAohDPKnWmnne0Xt64rS9yTs+UBOZPJdm0X3 HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 322ew925ww-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 10:11:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9812410002A;
        Mon,  6 Jul 2020 10:11:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BB372ADA14;
        Mon,  6 Jul 2020 10:11:16 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jul 2020 10:11:16
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <marex@denx.de>,
        <alexandre.torgue@st.com>
Subject: [RESEND PATCH] irqchip/stm32-exti: Use the hwspin_lock_timeout_in_atomic() API
Date:   Mon, 6 Jul 2020 10:11:15 +0200
Message-ID: <20200706081115.25180-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-06_04:2020-07-06,2020-07-06 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Fabien Dessenne <fabien.dessenne@st.com>

Now that the hwspin_lock_timeout_in_atomic() API is available use it.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index faa8482c8246..c7ab69694931 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -25,7 +25,6 @@
 #define IRQS_PER_BANK 32
 
 #define HWSPNLCK_TIMEOUT	1000 /* usec */
-#define HWSPNLCK_RETRY_DELAY	100  /* usec */
 
 struct stm32_exti_bank {
 	u32 imr_ofst;
@@ -277,55 +276,24 @@ static int stm32_exti_set_type(struct irq_data *d,
 	return 0;
 }
 
-static int stm32_exti_hwspin_lock(struct stm32_exti_chip_data *chip_data)
-{
-	int ret, timeout = 0;
-
-	if (!chip_data->host_data->hwlock)
-		return 0;
-
-	/*
-	 * Use the x_raw API since we are under spin_lock protection.
-	 * Do not use the x_timeout API because we are under irq_disable
-	 * mode (see __setup_irq())
-	 */
-	do {
-		ret = hwspin_trylock_raw(chip_data->host_data->hwlock);
-		if (!ret)
-			return 0;
-
-		udelay(HWSPNLCK_RETRY_DELAY);
-		timeout += HWSPNLCK_RETRY_DELAY;
-	} while (timeout < HWSPNLCK_TIMEOUT);
-
-	if (ret == -EBUSY)
-		ret = -ETIMEDOUT;
-
-	if (ret)
-		pr_err("%s can't get hwspinlock (%d)\n", __func__, ret);
-
-	return ret;
-}
-
-static void stm32_exti_hwspin_unlock(struct stm32_exti_chip_data *chip_data)
-{
-	if (chip_data->host_data->hwlock)
-		hwspin_unlock_raw(chip_data->host_data->hwlock);
-}
-
 static int stm32_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct stm32_exti_chip_data *chip_data = gc->private;
 	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct hwspinlock *hwlock = chip_data->host_data->hwlock;
 	u32 rtsr, ftsr;
 	int err;
 
 	irq_gc_lock(gc);
 
-	err = stm32_exti_hwspin_lock(chip_data);
-	if (err)
-		goto unlock;
+	if (hwlock) {
+		err = hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			pr_err("%s can't get hwspinlock (%d)\n", __func__, err);
+			goto unlock;
+		}
+	}
 
 	rtsr = irq_reg_readl(gc, stm32_bank->rtsr_ofst);
 	ftsr = irq_reg_readl(gc, stm32_bank->ftsr_ofst);
@@ -338,7 +306,8 @@ static int stm32_irq_set_type(struct irq_data *d, unsigned int type)
 	irq_reg_writel(gc, ftsr, stm32_bank->ftsr_ofst);
 
 unspinlock:
-	stm32_exti_hwspin_unlock(chip_data);
+	if (hwlock)
+		hwspin_unlock_in_atomic(hwlock);
 unlock:
 	irq_gc_unlock(gc);
 
@@ -504,15 +473,20 @@ static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
 {
 	struct stm32_exti_chip_data *chip_data = irq_data_get_irq_chip_data(d);
 	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	struct hwspinlock *hwlock = chip_data->host_data->hwlock;
 	void __iomem *base = chip_data->host_data->base;
 	u32 rtsr, ftsr;
 	int err;
 
 	raw_spin_lock(&chip_data->rlock);
 
-	err = stm32_exti_hwspin_lock(chip_data);
-	if (err)
-		goto unlock;
+	if (hwlock) {
+		err = hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			pr_err("%s can't get hwspinlock (%d)\n", __func__, err);
+			goto unlock;
+		}
+	}
 
 	rtsr = readl_relaxed(base + stm32_bank->rtsr_ofst);
 	ftsr = readl_relaxed(base + stm32_bank->ftsr_ofst);
@@ -525,7 +499,8 @@ static int stm32_exti_h_set_type(struct irq_data *d, unsigned int type)
 	writel_relaxed(ftsr, base + stm32_bank->ftsr_ofst);
 
 unspinlock:
-	stm32_exti_hwspin_unlock(chip_data);
+	if (hwlock)
+		hwspin_unlock_in_atomic(hwlock);
 unlock:
 	raw_spin_unlock(&chip_data->rlock);
 
-- 
2.17.1

