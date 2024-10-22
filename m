Return-Path: <linux-gpio+bounces-11769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 455149AB334
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BECE1C22BAC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAD61C32FB;
	Tue, 22 Oct 2024 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ozSpUxJC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7611C2304;
	Tue, 22 Oct 2024 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612808; cv=none; b=Guxcrf2dHQNA+6CEZkdGblDGkSuSyC/A9C1oM37FSh2jEzflVfFXARRMaoM7H12mqM1osOxXPwUX+DEX5DqX5qbnHkjvfCG0HGS33eJeBCEcPbfhReNdx/NDDQfo8t0szA9M4E6VBomQPefe2dH7jZDG9mn6jKOMVFEtTGHKjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612808; c=relaxed/simple;
	bh=wLnnBghack8ZNCRmrRNGMeCYIblSOxd0C2lSOPPzP9M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rRNp2X8m2hFeiqBJUfKmzAU7yqZB8hBaPz8/nwXqBSkP++UYBH3kr7ySL9eNPA9ZGXx2l+dwW9Nccfn3CbAyABeLrM803Xe3NGVlerS9pbVTGXzEbIKnKWOTfxfDytQHE7SF2QRD+2r0zUIxK2QocyEqYLzT1GZsmBgYQBF2FkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ozSpUxJC; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBJ7jN002432;
	Tue, 22 Oct 2024 17:59:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Bw5MaQ0OoGuslWFtuF3ptugn/kB1bzv9qFUMIFdQhH4=; b=ozSpUxJCIKC+Dg7I
	i9mgn2QWCJiLhAzqwRon00lO757MPCBDabMFAU6TadvhydESVdxw+nlP6Qzf5nlV
	OB74qL+uOZFx2SZbBFHJONZFPlsmQ9aYpR6J0b+37T89vfqv8Zu2xwy3iwHYcyRQ
	fTbyAyML0V8fFPS7gx//dO5fiZom+iqvMihucDhlZS9tXpxLYxVwgn/WvnWoVhNs
	ofDk8TZWR/5McvD9ABrdk/zJH+qzgCVadFvS9zoIzT51dZHZ3JfvDvGIsQj5clB8
	Bv7KSzwCayZpobLJe1jlUgCZQG6IDD9dwaFCT349MHqKxml39UiJTysY74d5QyIf
	xPfciQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42c6w6x3sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 272F440052;
	Tue, 22 Oct 2024 17:58:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF9CD26E85A;
	Tue, 22 Oct 2024 17:57:30 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:30 +0200
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
Subject: [PATCH 06/14] pinctrl: stm32: Support IO synchronization parameters
Date: Tue, 22 Oct 2024 17:56:50 +0200
Message-ID: <20241022155658.1647350-7-antonio.borneo@foss.st.com>
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

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

Support the following IO synchronization parameters:
- Delay (in ns)
- Delay path (input / output)
- Clock edge (single / double edge)
- Clock inversion
- Retiming
These settings allow a fine tuning of the high speed interface signals.

Update the debugfs pinconf-pins entry so it shows these parameters if one
of them is set.

Enable this feature for the stm32mp257 SoC.

Co-developed-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 207 +++++++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |   2 +
 3 files changed, 210 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index b387f6caaf3f0..5b9c637ca0c93 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -46,6 +46,13 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 #define STM32_GPIO_SECCFGR	0x30
+#define STM32_GPIO_DELAYRL	0x40
+#define STM32_GPIO_ADVCFGRL	0x48
+
+#define STM32_GPIO_ADVCFGR_DLYPATH_POS		0
+#define STM32_GPIO_ADVCFGR_DE_POS		1
+#define STM32_GPIO_ADVCFGR_INVCLK_POS		2
+#define STM32_GPIO_ADVCFGR_RET_POS		3
 
 /* custom bitfield to backup pin status */
 #define STM32_GPIO_BKP_MODE_SHIFT	0
@@ -58,12 +65,23 @@
 #define STM32_GPIO_BKP_PUPD_MASK	GENMASK(9, 8)
 #define STM32_GPIO_BKP_TYPE		10
 #define STM32_GPIO_BKP_VAL		11
+#define STM32_GPIO_BKP_ADVCFG_SHIFT	12
+#define STM32_GPIO_BKP_ADVCFG_MASK	GENMASK(15, 12)
+#define STM32_GPIO_BKP_DELAY_SHIFT	16
+#define STM32_GPIO_BKP_DELAY_MASK	GENMASK(19, 16)
 
 #define STM32_GPIO_PINS_PER_BANK 16
 #define STM32_GPIO_IRQ_LINE	 16
 
 #define SYSCFG_IRQMUX_MASK GENMASK(3, 0)
 
+/* Vendor specific pin configurations */
+#define STM32_GPIO_PIN_CONFIG_DELAY_PATH	(PIN_CONFIG_END + 1)
+#define STM32_GPIO_PIN_CONFIG_CLK_EDGE		(PIN_CONFIG_END + 2)
+#define STM32_GPIO_PIN_CONFIG_CLK_TYPE		(PIN_CONFIG_END + 3)
+#define STM32_GPIO_PIN_CONFIG_RETIME		(PIN_CONFIG_END + 4)
+#define STM32_GPIO_PIN_CONFIG_DELAY		(PIN_CONFIG_END + 5)
+
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
@@ -79,6 +97,14 @@ static const char * const stm32_gpio_functions[] = {
 	"reserved",
 };
 
+static const struct pinconf_generic_params stm32_gpio_bindings[] = {
+	{"st,io-delay-path",	STM32_GPIO_PIN_CONFIG_DELAY_PATH,	0},
+	{"st,io-clk-edge",	STM32_GPIO_PIN_CONFIG_CLK_EDGE,		0},
+	{"st,io-clk-type",	STM32_GPIO_PIN_CONFIG_CLK_TYPE,		0},
+	{"st,io-retime",	STM32_GPIO_PIN_CONFIG_RETIME,		0},
+	{"st,io-delay",		STM32_GPIO_PIN_CONFIG_DELAY,		0},
+};
+
 struct stm32_pinctrl_group {
 	const char *name;
 	unsigned long config;
@@ -99,6 +125,7 @@ struct stm32_gpio_bank {
 	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
+	bool io_sync_control;
 };
 
 struct stm32_pinctrl {
@@ -194,6 +221,18 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 	bank->pin_backup[offset] |= bias << STM32_GPIO_BKP_PUPD_SHIFT;
 }
 
+static void stm32_gpio_backup_advcfg(struct stm32_gpio_bank *bank, u32 offset, u32 bpos, u32 bval)
+{
+	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_ADVCFG_SHIFT + bpos);
+	bank->pin_backup[offset] |= bval << (STM32_GPIO_BKP_ADVCFG_SHIFT + bpos);
+}
+
+static void stm32_gpio_backup_delay(struct stm32_gpio_bank *bank, u32 offset, u32 delay)
+{
+	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_DELAY_MASK;
+	bank->pin_backup[offset] |= delay << STM32_GPIO_BKP_DELAY_SHIFT;
+}
+
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
@@ -1051,6 +1090,106 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 	return (val >> (offset * 2));
 }
 
+static int stm32_pconf_set_advcfgr(struct stm32_gpio_bank *bank, int offset, u32 bpos, u32 bval)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	int advcfgr_offset = STM32_GPIO_ADVCFGRL + (offset / 8) * 4;
+	int advcfgr_bit = bpos + (offset % 8) * 4;
+	unsigned long flags;
+	int err = 0;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return -ENOTSUPP;
+
+	spin_lock_irqsave(&bank->lock, flags);
+
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
+	}
+
+	val = readl_relaxed(bank->base + advcfgr_offset);
+	val &= ~BIT(advcfgr_bit);
+	val |= bval << advcfgr_bit;
+	writel_relaxed(val, bank->base + advcfgr_offset);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+	stm32_gpio_backup_advcfg(bank, offset, bpos, bval);
+
+unlock:
+	spin_unlock_irqrestore(&bank->lock, flags);
+
+	return err;
+}
+
+static u32 stm32_pconf_get_advcfgr(struct stm32_gpio_bank *bank, int offset, u32 bpos)
+{
+	int advcfgr_offset = STM32_GPIO_ADVCFGRL + (offset / 8) * 4;
+	int advcfgr_bit = bpos + (offset % 8) * 4;
+	u32 val;
+
+	val = readl_relaxed(bank->base + advcfgr_offset);
+	val &= BIT(advcfgr_bit);
+
+	return val >> advcfgr_bit;
+}
+
+static int stm32_pconf_set_delay(struct stm32_gpio_bank *bank, int offset, u32 delay)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	int delay_offset = STM32_GPIO_DELAYRL + (offset / 8) * 4;
+	int delay_shift = (offset % 8) * 4;
+	unsigned long flags;
+	int err = 0;
+	u32 val;
+
+	if (!bank->io_sync_control)
+		return -ENOTSUPP;
+
+	spin_lock_irqsave(&bank->lock, flags);
+
+	if (pctl->hwlock) {
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		if (err) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			goto unlock;
+		}
+	}
+
+	val = readl_relaxed(bank->base + delay_offset);
+	val &= ~GENMASK(delay_shift + 3, delay_shift);
+	val |= (delay << delay_shift);
+	writel_relaxed(val, bank->base + delay_offset);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+	stm32_gpio_backup_delay(bank, offset, delay);
+
+unlock:
+	spin_unlock_irqrestore(&bank->lock, flags);
+
+	return err;
+}
+
+static u32 stm32_pconf_get_delay(struct stm32_gpio_bank *bank, int offset)
+{
+	int delay_offset = STM32_GPIO_DELAYRL + (offset / 8) * 4;
+	int delay_shift = (offset % 8) * 4;
+	u32 val;
+
+	val = readl_relaxed(bank->base + delay_offset);
+	val &= GENMASK(delay_shift + 3, delay_shift);
+
+	return val >> delay_shift;
+}
+
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
@@ -1118,6 +1257,21 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		__stm32_gpio_set(bank, offset, arg);
 		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
+	case STM32_GPIO_PIN_CONFIG_DELAY_PATH:
+		ret = stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_POS, arg);
+		break;
+	case STM32_GPIO_PIN_CONFIG_CLK_EDGE:
+		ret = stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DE_POS, arg);
+		break;
+	case STM32_GPIO_PIN_CONFIG_CLK_TYPE:
+		ret = stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_INVCLK_POS, arg);
+		break;
+	case STM32_GPIO_PIN_CONFIG_RETIME:
+		ret = stm32_pconf_set_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_RET_POS, arg);
+		break;
+	case STM32_GPIO_PIN_CONFIG_DELAY:
+		ret = stm32_pconf_set_delay(bank, offset, arg);
+		break;
 	default:
 		ret = -ENOTSUPP;
 	}
@@ -1260,6 +1414,22 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 3:
 		break;
 	}
+
+	if (bank->io_sync_control) {
+		u32 retime, clk_type, clk_edge, delay_path, delay;
+
+		retime = stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_RET_POS);
+		clk_type = stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_INVCLK_POS);
+		clk_edge = stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DE_POS);
+		delay_path = stm32_pconf_get_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_POS);
+		delay = stm32_pconf_get_delay(bank, offset);
+
+		if (retime || clk_type || clk_edge || delay_path || delay)
+			seq_printf(s, " - Retime:%d InvClk:%d DblEdge:%d DelayIn:%d",
+				   retime, clk_type, clk_edge, delay_path);
+		if (delay)
+			seq_printf(s, " - Delay: %d (%d ps)", delay, delay * 250);
+	}
 }
 
 static const struct pinconf_ops stm32_pconf_ops = {
@@ -1358,6 +1528,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
+	bank->io_sync_control = pctl->match_data->io_sync_control;
 	spin_lock_init(&bank->lock);
 
 	if (pctl->domain) {
@@ -1604,6 +1775,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
+	pctl->pctl_desc.num_custom_params = ARRAY_SIZE(stm32_gpio_bindings);
+	pctl->pctl_desc.custom_params = stm32_gpio_bindings;
 	pctl->dev = &pdev->dev;
 
 	pctl->pctl_dev = devm_pinctrl_register(&pdev->dev, &pctl->pctl_desc,
@@ -1663,6 +1836,16 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused stm32_pinctrl_restore_advcfgr(struct stm32_gpio_bank *bank,
+							int offset, u32 bpos)
+{
+	u32 val;
+
+	val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_ADVCFG_SHIFT + bpos);
+	val >>= (STM32_GPIO_BKP_ADVCFG_SHIFT + bpos);
+	return stm32_pconf_set_advcfgr(bank, offset, bpos, val);
+}
+
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 					struct stm32_pinctrl *pctl, u32 pin)
 {
@@ -1720,6 +1903,30 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 	if (ret)
 		return ret;
 
+	if (bank->io_sync_control) {
+		ret = stm32_pinctrl_restore_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DLYPATH_POS);
+		if (ret)
+			return ret;
+
+		ret = stm32_pinctrl_restore_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_DE_POS);
+		if (ret)
+			return ret;
+
+		ret = stm32_pinctrl_restore_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_INVCLK_POS);
+		if (ret)
+			return ret;
+
+		ret = stm32_pinctrl_restore_advcfgr(bank, offset, STM32_GPIO_ADVCFGR_RET_POS);
+		if (ret)
+			return ret;
+
+		val = bank->pin_backup[offset] & STM32_GPIO_BKP_DELAY_MASK;
+		val >>= STM32_GPIO_BKP_DELAY_SHIFT;
+		ret = stm32_pconf_set_delay(bank, offset, val);
+		if (ret)
+			return ret;
+	}
+
 	if (pin_is_irq)
 		regmap_field_write(pctl->irqmux[offset], bank->bank_ioport_nr);
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index a5f62fb271442..9b319036f206d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -64,6 +64,7 @@ struct stm32_pinctrl_match_data {
 	const struct stm32_desc_pin *pins;
 	const unsigned int npins;
 	bool secure_control;
+	bool io_sync_control;
 };
 
 int stm32_pctl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 23aebd4695e99..293b7acd82a3e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2542,11 +2542,13 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 	.pins = stm32mp257_pins,
 	.npins = ARRAY_SIZE(stm32mp257_pins),
+	.io_sync_control = true,
 };
 
 static struct stm32_pinctrl_match_data stm32mp257_z_match_data = {
 	.pins = stm32mp257_z_pins,
 	.npins = ARRAY_SIZE(stm32mp257_z_pins),
+	.io_sync_control = true,
 };
 
 static const struct of_device_id stm32mp257_pctrl_match[] = {
-- 
2.34.1


