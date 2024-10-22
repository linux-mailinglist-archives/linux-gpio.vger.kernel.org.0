Return-Path: <linux-gpio+bounces-11765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E89399AB326
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153C01C227C3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9221BE23C;
	Tue, 22 Oct 2024 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eDUT46sf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A641BD4E7;
	Tue, 22 Oct 2024 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612799; cv=none; b=fdSS5vVMvndPYgbh7HEWPLxdHsgEkod5mGPDTmZhENcHsTXgk48MFFMwEDm0R0Sa9dbc8kVmzLLBBzyBmjcEQ0wwCFXgWyA2LuPPKfki6W5GSfAPWV3Y4M7CESq39qfZQ3Qux3fsIkBaKwVQsIOTlHU9Kwj5g1VQulFgtJSY7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612799; c=relaxed/simple;
	bh=69XadKKiDI78Lp6kqnFewdmPOGxINyupE2qVEKlut+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmLUxp2E191xjiGBNOjUabWF9DRoViOGqwwZPqnm//a+tbY3Wvxq6Xk4cw3GtK1mhJDzYOM0fs7j1Sv9poUj7Asrk5K3hVqkPqpGqmdLs0opCGLSK4FsOosCcJA2godJh8aHkw9+kEw9imO9jhndMYCb+WiMpOzwwRq2grz27h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eDUT46sf; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBQxXx018502;
	Tue, 22 Oct 2024 17:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fbDc+QFarBuup0dVO8z2AkVIt6OoyUM+bXyZG2Cj9DI=; b=eDUT46sfaVMY7fkt
	R0bYoMA8O+jl/m7ZypiqYBWAWOYsUCveN1uxId5cX6zTuy3RpIBgpdHDMzcioWmm
	jBswKYEcmSSR94/xkqky9FAEX5cd3d+kXyowkbve527OQrR8aY+pjnvBbo/6hHGF
	w5Vj125BwxjuNOB1+D9zH4quU4xDjmbYhNQB3bpMTVLa0tYayV6vMpI1//2x2PNS
	oknxWvUJI6C8pCcE2p6bsNI87TC3IHhcATGm/HmfF2yym3ZEZ3BLCciVsZQmTWRq
	SBXGv16s9bjWkTRucS3Qyr+07NqSspnB0Gs9xg2TBD+92D0yHLM6xTWA7Awy8+Uk
	wql73Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 197164005F;
	Tue, 22 Oct 2024 17:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 171E6260458;
	Tue, 22 Oct 2024 17:57:32 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:31 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 08/14] pinctrl: stm32: Add RIF support for stm32mp257
Date: Tue, 22 Oct 2024 17:56:52 +0200
Message-ID: <20241022155658.1647350-9-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

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
index 5b9c637ca0c93..b6e7e34508592 100644
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
@@ -35,6 +36,8 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-stm32.h"
 
+#define STM32_GPIO_CID1		1
+
 #define STM32_GPIO_MODER	0x00
 #define STM32_GPIO_TYPER	0x04
 #define STM32_GPIO_SPEEDR	0x08
@@ -48,12 +51,22 @@
 #define STM32_GPIO_SECCFGR	0x30
 #define STM32_GPIO_DELAYRL	0x40
 #define STM32_GPIO_ADVCFGRL	0x48
+#define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
+#define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
 #define STM32_GPIO_ADVCFGR_DLYPATH_POS		0
 #define STM32_GPIO_ADVCFGR_DE_POS		1
 #define STM32_GPIO_ADVCFGR_INVCLK_POS		2
 #define STM32_GPIO_ADVCFGR_RET_POS		3
 
+#define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
+#define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
+#define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
+#define STM32_GPIO_CIDCFGR_SEMWL_CID1	BIT(16 + STM32_GPIO_CID1)
+
+#define STM32_GPIO_SEMCR_SEM_MUTEX	BIT(0)
+#define STM32_GPIO_SEMCR_SEMCID_MASK	GENMASK(5, 4)
+
 /* custom bitfield to backup pin status */
 #define STM32_GPIO_BKP_MODE_SHIFT	0
 #define STM32_GPIO_BKP_MODE_MASK	GENMASK(1, 0)
@@ -126,6 +139,7 @@ struct stm32_gpio_bank {
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
 	bool io_sync_control;
+	bool rif_control;
 };
 
 struct stm32_pinctrl {
@@ -233,6 +247,80 @@ static void stm32_gpio_backup_delay(struct stm32_gpio_bank *bank, u32 offset, u3
 	bank->pin_backup[offset] |= delay << STM32_GPIO_BKP_DELAY_SHIFT;
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
@@ -259,9 +347,26 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
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
@@ -342,12 +447,25 @@ static int stm32_gpio_init_valid_mask(struct gpio_chip *chip,
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
 	.set			= stm32_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
@@ -1529,6 +1647,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
 	bank->io_sync_control = pctl->match_data->io_sync_control;
+	bank->rif_control = pctl->match_data->rif_control;
 	spin_lock_init(&bank->lock);
 
 	if (pctl->domain) {
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 9b319036f206d..b8caebc55cfc5 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -65,6 +65,7 @@ struct stm32_pinctrl_match_data {
 	const unsigned int npins;
 	bool secure_control;
 	bool io_sync_control;
+	bool rif_control;
 };
 
 int stm32_pctl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 293b7acd82a3e..a374918030788 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2543,12 +2543,16 @@ static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 	.pins = stm32mp257_pins,
 	.npins = ARRAY_SIZE(stm32mp257_pins),
 	.io_sync_control = true,
+	.secure_control = true,
+	.rif_control = true,
 };
 
 static struct stm32_pinctrl_match_data stm32mp257_z_match_data = {
 	.pins = stm32mp257_z_pins,
 	.npins = ARRAY_SIZE(stm32mp257_z_pins),
 	.io_sync_control = true,
+	.secure_control = true,
+	.rif_control = true,
 };
 
 static const struct of_device_id stm32mp257_pctrl_match[] = {
-- 
2.34.1


