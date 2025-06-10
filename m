Return-Path: <linux-gpio+bounces-21226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427C6AD3B34
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDBD17BC9D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DD1EA7DB;
	Tue, 10 Jun 2025 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AaUfUI5X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC7155CB3;
	Tue, 10 Jun 2025 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565981; cv=none; b=j50TgxG0pkM+QDo89MrOTT2BoFWAxp/e5azRbLS3mgoxhMrA3oZj+wUyLLjB2RKC+YwD2+lC+s/YAbpRhZzBaINO2HUDsEyXg0xjyVdTtzeVBcrgp4Don6ROk9499BJaiAaN+27ElDMs4/nEzodAO+We+ucIZ7jdnwU6UlW8kGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565981; c=relaxed/simple;
	bh=gNl3a4tZLxzGDztiuPUIX6r9bBbJyTeoFGHv1U3cjy0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uh/xNJu2eV7HuZYo4HWnbLrsXhsG6yHNWCeO/7Dt5XVhe6NoPkwNi3NFwqfpOV7e5X9ygIyMGtPvBkPyAgHdorTe2mQq3curFJc23cjTod4JQrLBv5dP8zHZ59ruNPpsE+P1WL+AiqUvfQb8vx6wJRhmNmnSmKJUvLAn/qreew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AaUfUI5X; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLKZJ000488;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/btPUl6pjzYs9vKDzKPJBqLPa3JcDc59VuLKN5W68tM=; b=AaUfUI5X6cuLxvYn
	nYhanMe9zFs9dOfO44R1kWLOgV5eG4pV/xzRxV+ER0QWHDtoFv8Mkrek+bdPINjD
	VOwb93YZGCITjdvBL2xk9tPNPYoFM4YWDrzsEPg03sqdqag7WQC2fwR2A7tzUnEH
	c9CMgfYrIS5DeamvmQ1945QOMKzwQpYkp/GPvrNwCJXi7VwY0PSlqKR2tgOE0L8n
	tzgW//xDSyjQ5Y2pd5Hb5lXxRA6Fwar5WjCY5+ASihymScuI+y0VWN5fc08ZL702
	4skEt+eRI9//ZvsoRK/y7Q8P66Q+HkyiiKZkYPxHtL8vdcv8rcJCj/W565QOpSYa
	cIEslA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cntb30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DE8740060;
	Tue, 10 Jun 2025 16:31:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD303B39A07;
	Tue, 10 Jun 2025 16:30:47 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:47 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v2 3/5] pinctrl: stm32: Add RIF support for stm32mp257
Date: Tue, 10 Jun 2025 16:30:40 +0200
Message-ID: <20250610143042.295376-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01

On SoC stm32mp257, GPIO supports security and isolation compliant
with the Resource Isolation Framework (RIF). Each GPIO line can be
assigned to different security and compartment domains.

Add the generic code to handle the RIF configuration set by the
secure world and initialize the GPIO valid mask accordingly.

Enable the RIF support for stm32mp257.

Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 121 ++++++++++++++++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |   4 +
 3 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index e0e3e649976b8..e7621f9b00056 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -6,6 +6,7 @@
  *
  * Heavily based on Mediatek's pinctrl driver
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/hwspinlock.h>
@@ -36,6 +37,8 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-stm32.h"
 
+#define STM32_GPIO_CID1		1
+
 #define STM32_GPIO_MODER	0x00
 #define STM32_GPIO_TYPER	0x04
 #define STM32_GPIO_SPEEDR	0x08
@@ -47,6 +50,8 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 #define STM32_GPIO_SECCFGR	0x30
+#define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
+#define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
 /* custom bitfield to backup pin status */
 #define STM32_GPIO_BKP_MODE_SHIFT	0
@@ -60,6 +65,14 @@
 #define STM32_GPIO_BKP_TYPE		10
 #define STM32_GPIO_BKP_VAL		11
 
+#define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
+#define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
+#define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
+#define STM32_GPIO_CIDCFGR_SEMWL_CID1	BIT(16 + STM32_GPIO_CID1)
+
+#define STM32_GPIO_SEMCR_SEM_MUTEX	BIT(0)
+#define STM32_GPIO_SEMCR_SEMCID_MASK	GENMASK(5, 4)
+
 #define STM32_GPIO_PINS_PER_BANK 16
 #define STM32_GPIO_IRQ_LINE	 16
 
@@ -98,6 +111,7 @@ struct stm32_gpio_bank {
 	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
+	bool rif_control;
 };
 
 struct stm32_pinctrl {
@@ -194,6 +208,80 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 	bank->pin_backup[offset] |= bias << STM32_GPIO_BKP_PUPD_SHIFT;
 }
 
+/* RIF functions */
+
+static bool stm32_gpio_rif_valid(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
+{
+	u32 cid;
+
+	cid = readl_relaxed(bank->base + STM32_GPIO_CIDCFGR(gpio_nr));
+
+	if (!(cid & STM32_GPIO_CIDCFGR_CFEN))
+		return true;
+
+	if (!(cid & STM32_GPIO_CIDCFGR_SEMEN)) {
+		if (FIELD_GET(STM32_GPIO_CIDCFGR_SCID_MASK, cid) == STM32_GPIO_CID1)
+			return true;
+
+		return false;
+	}
+
+	if (cid & STM32_GPIO_CIDCFGR_SEMWL_CID1)
+		return true;
+
+	return false;
+}
+
+static bool stm32_gpio_rif_acquire_semaphore(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
+{
+	u32 cid, sem;
+
+	cid = readl_relaxed(bank->base + STM32_GPIO_CIDCFGR(gpio_nr));
+
+	if (!(cid & STM32_GPIO_CIDCFGR_CFEN))
+		return true;
+
+	if (!(cid & STM32_GPIO_CIDCFGR_SEMEN)) {
+		if (FIELD_GET(STM32_GPIO_CIDCFGR_SCID_MASK, cid) == STM32_GPIO_CID1)
+			return true;
+
+		return false;
+	}
+
+	if (!(cid & STM32_GPIO_CIDCFGR_SEMWL_CID1))
+		return false;
+
+	sem = readl_relaxed(bank->base + STM32_GPIO_SEMCR(gpio_nr));
+	if (sem & STM32_GPIO_SEMCR_SEM_MUTEX) {
+		if (FIELD_GET(STM32_GPIO_SEMCR_SEMCID_MASK, sem) == STM32_GPIO_CID1)
+			return true;
+
+		return false;
+	}
+
+	writel_relaxed(STM32_GPIO_SEMCR_SEM_MUTEX, bank->base + STM32_GPIO_SEMCR(gpio_nr));
+
+	sem = readl_relaxed(bank->base + STM32_GPIO_SEMCR(gpio_nr));
+	if (sem & STM32_GPIO_SEMCR_SEM_MUTEX &&
+	    FIELD_GET(STM32_GPIO_SEMCR_SEMCID_MASK, sem) == STM32_GPIO_CID1)
+		return true;
+
+	return false;
+}
+
+static void stm32_gpio_rif_release_semaphore(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
+{
+	u32 cid;
+
+	cid = readl_relaxed(bank->base + STM32_GPIO_CIDCFGR(gpio_nr));
+
+	if (!(cid & STM32_GPIO_CIDCFGR_CFEN))
+		return;
+
+	if (cid & STM32_GPIO_CIDCFGR_SEMEN)
+		writel_relaxed(0, bank->base + STM32_GPIO_SEMCR(gpio_nr));
+}
+
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
@@ -220,9 +308,26 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 	}
 
+	if (bank->rif_control) {
+		if (!stm32_gpio_rif_acquire_semaphore(bank, offset)) {
+			dev_err(pctl->dev, "pin %d not available.\n", pin);
+			return -EINVAL;
+		}
+	}
+
 	return pinctrl_gpio_request(chip, offset);
 }
 
+static void stm32_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
+
+	pinctrl_gpio_free(chip, offset);
+
+	if (bank->rif_control)
+		stm32_gpio_rif_release_semaphore(bank, offset);
+}
+
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
@@ -306,12 +411,25 @@ static int stm32_gpio_init_valid_mask(struct gpio_chip *chip,
 		}
 	}
 
+	if (bank->rif_control) {
+		for (i = 0; i < ngpios; i++) {
+			if (!test_bit(i, valid_mask))
+				continue;
+
+			if (stm32_gpio_rif_valid(bank, i))
+				continue;
+
+			dev_dbg(pctl->dev, "RIF semaphore ownership conflict, GPIO %u", i);
+			clear_bit(i, valid_mask);
+		}
+	}
+
 	return 0;
 }
 
 static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
-	.free			= pinctrl_gpio_free,
+	.free			= stm32_gpio_free,
 	.get			= stm32_gpio_get,
 	.set_rv			= stm32_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
@@ -1350,6 +1468,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
+	bank->rif_control = pctl->match_data->rif_control;
 	spin_lock_init(&bank->lock);
 
 	if (pctl->domain) {
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 8790fef2d58a2..ed525f5bdd7cd 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -63,6 +63,7 @@ struct stm32_pinctrl_match_data {
 	const struct stm32_desc_pin *pins;
 	const unsigned int npins;
 	bool secure_control;
+	bool rif_control;
 };
 
 int stm32_pctl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 23aebd4695e99..984587207956a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2542,11 +2542,15 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 	.pins = stm32mp257_pins,
 	.npins = ARRAY_SIZE(stm32mp257_pins),
+	.secure_control = true,
+	.rif_control = true,
 };
 
 static struct stm32_pinctrl_match_data stm32mp257_z_match_data = {
 	.pins = stm32mp257_z_pins,
 	.npins = ARRAY_SIZE(stm32mp257_z_pins),
+	.secure_control = true,
+	.rif_control = true,
 };
 
 static const struct of_device_id stm32mp257_pctrl_match[] = {
-- 
2.34.1


