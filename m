Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE0C1F5626
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 15:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgFJNur (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 09:50:47 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39107 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgFJNuq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 09:50:46 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200610135044euoutp026e0ffc4ebee2572cc181481a938f0dc5~XMvqAPAM_1157511575euoutp02M
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 13:50:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200610135044euoutp026e0ffc4ebee2572cc181481a938f0dc5~XMvqAPAM_1157511575euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591797044;
        bh=BQdeWgG35Bj71xUO9vvKIOqxc2rmwgJFfxKGcOSQuCE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LKDxCoh57Co5Wvj/Htf1301U5fphf55K1lQ3XetGEw3j0ny7veghYSld+OnS6egIn
         WYgvifbo2d7iWq9g+MPyMv/Q0KRsk5MDv8SHkKx6/7Y19MD3iE2xRKMU3jRHxGppkB
         HpJgtX89zWMbJaqWXgXm+se+Y3ZKyD6xqSgEJKTY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200610135044eucas1p25f0f253232fd62e7fdaa4d4fc242feaa~XMvpsDFA60381103811eucas1p2E;
        Wed, 10 Jun 2020 13:50:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.00.61286.435E0EE5; Wed, 10
        Jun 2020 14:50:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200610135044eucas1p2604d36df3a8715f456c80a5761b1bffc~XMvpTSC2V0795507955eucas1p27;
        Wed, 10 Jun 2020 13:50:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200610135044eusmtrp2645bb8a81864c87f52e0acff01061e4f~XMvpSlMtO2129321293eusmtrp2M;
        Wed, 10 Jun 2020 13:50:44 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-92-5ee0e534925f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F5.0A.08375.335E0EE5; Wed, 10
        Jun 2020 14:50:43 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200610135043eusmtip291b8068598e608b63ec3d274048a0bf1~XMvo3-ya51787417874eusmtip2F;
        Wed, 10 Jun 2020 13:50:43 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2] pinctrl: samsung: Use bank name as irqchip name
Date:   Wed, 10 Jun 2020 15:48:24 +0200
Message-Id: <20200610134824.13053-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsWy7djPc7omTx/EGSxvlbDYOGM9q8X1L89Z
        Lc6f38BuMeXPciaLzfP/MFrMOL+PyWLtkbvsFofftLNarNr1h9GB02PnrLvsHptWdbJ53Lm2
        h82jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mk6t2MRW8MmqYur7K6wNjP/0uxg5OCQETCT2
        LCvpYuTiEBJYwSix/fwiRgjnC6PEjgvPmCCcz4wSb9a+Ze9i5ATr2H2mixkisZxRovnacxa4
        lr5nh1lAqtgEDCW63naxgdgiAo4SPzesYgUpYhbYxiRxvusQWEJYwFnixM+ZrCA2i4CqxLXV
        JxlBbF4BW4nW6VfZINbJS6zecABsnYTAczaJJ23HmSESLhI79m2HuklY4tXxLVC2jMT/nfOZ
        IBqaGSUenlvLDuH0MEpcbprBCFFlLXHn3C82UBgwC2hKrN+lDxF2lOj5+IAFEjR8EjfeCoKE
        mYHMSdumM0OEeSU62oQgqtUkZh1fB7f24IVLUCUeEud/iYCEhQRiJVYe/cg2gVFuFsKqBYyM
        qxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQITxOl/xz/tYPx6KekQowAHoxIPr8HeB3FC
        rIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZq
        akFqEUyWiYNTqoGxsm+XabGq8OKmswmWIW9Er/RZf/Bbwn1SZ8nDsulLb71adPzAXbtnTSle
        8ZdPX77FN/3JcgcWrX157ibWt+x+HfuyP/vwoyuBybs9V70+1RHwKrN1m/m0yd3fklJeiDXs
        7Hsbfi3RZev7F5O8qi7PWBeawJljXx1t8e5wkqgI/6SdGRtra9RLlFiKMxINtZiLihMB9Eux
        5wwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsVy+t/xe7rGTx/EGbzcaW2xccZ6VovrX56z
        Wpw/v4HdYsqf5UwWm+f/YbSYcX4fk8XaI3fZLQ6/aWe1WLXrD6MDp8fOWXfZPTat6mTzuHNt
        D5tH35ZVjB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk
        5mSWpRbp2yXoZZxasYmt4JNVxdT3V1gbGP/pdzFyckgImEjsPtPFDGILCSxllHj/QgoiLiNx
        cloDK4QtLPHnWhdbFyMXUM0nRokHi2YwgSTYBAwlut6CJDg5RAScJW682ssCUsQssItJomXN
        YbCEMFDixM+ZYJNYBFQlrq0+yQhi8wrYSrROv8oGsUFeYvWGA8wTGHkWMDKsYhRJLS3OTc8t
        NtQrTswtLs1L10vOz93ECAzMbcd+bt7BeGlj8CFGAQ5GJR5eg70P4oRYE8uKK3MPMUpwMCuJ
        8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEUaPlEZinR5Hxg1OSVxBuaGppbWBqaG5sbm1koifN2
        CByMERJITyxJzU5NLUgtgulj4uCUamDk8G6Y/Unt5I0/K3qdqtJ8D6rw9H7TLf5fsi+UoWRO
        r7pgrfLag3b/dqfaH3y9sz/2iEbvo9sbJ9/1tzKZbRaz5Hin8okJLA3zDxfualo5adoSrgfy
        Nrff+56tfiVyfZniOuZ1Nu8uzdr3QcLOxCrQQu25/TbLM86Pbafc51PYduDlovUrNLczKLEU
        ZyQaajEXFScCAPwZcYRiAgAA
X-CMS-MailID: 20200610135044eucas1p2604d36df3a8715f456c80a5761b1bffc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200610135044eucas1p2604d36df3a8715f456c80a5761b1bffc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200610135044eucas1p2604d36df3a8715f456c80a5761b1bffc
References: <CGME20200610135044eucas1p2604d36df3a8715f456c80a5761b1bffc@eucas1p2.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the bank name as the irqchip name. This name is later visible in
/proc/interrupts, what makes it possible to easily identify each
GPIO interrupt.

/proc/interrupts before this patch:
143:    0     exynos4210_wkup_irq_chip   7 Edge      hdmi
144:    0     exynos4210_wkup_irq_chip   6 Level     wm8994
145:    1     exynos4210_wkup_irq_chip   7 Edge      max77686-pmic, max77686-rtc
146:    1     exynos_gpio_irq_chip   3 Edge      3-0048

/proc/interrupts after this patch:
143:    0     gpx3   7 Edge      hdmi
144:    0     gpx3   6 Level     wm8994
145:    1     gpx0   7 Edge      max77686-pmic, max77686-rtc
146:    1     gpm2   3 Edge      3-0048

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- reordered code to fix error handling
- fixed eint_wakeup_mask_value handling
- added __init annotations

v1: https://patchwork.kernel.org/patch/11594897/
- initial version
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 52 +++++++++++++-----------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 84501c785473..21a800134c42 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -38,7 +38,7 @@ struct exynos_irq_chip {
 	u32 eint_con;
 	u32 eint_mask;
 	u32 eint_pend;
-	u32 eint_wake_mask_value;
+	u32 *eint_wake_mask_value;
 	u32 eint_wake_mask_reg;
 	void (*set_eint_wakeup_mask)(struct samsung_pinctrl_drv_data *drvdata,
 				     struct exynos_irq_chip *irq_chip);
@@ -207,7 +207,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 /*
  * irq_chip for gpio interrupts.
  */
-static struct exynos_irq_chip exynos_gpio_irq_chip = {
+static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst = {
 	.chip = {
 		.name = "exynos_gpio_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -274,7 +274,7 @@ struct exynos_eint_gpio_save {
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
  */
-int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
+__init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct samsung_pin_bank *bank;
 	struct device *dev = d->dev;
@@ -297,6 +297,15 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
 		if (bank->eint_type != EINT_TYPE_GPIO)
 			continue;
+
+		bank->irq_chip = devm_kmemdup(dev, &exynos_gpio_irq_chip,
+					   sizeof(*bank->irq_chip), GFP_KERNEL);
+		if (!bank->irq_chip) {
+			ret = -ENOMEM;
+			goto err_domains;
+		}
+		bank->irq_chip->chip.name = bank->name;
+
 		bank->irq_domain = irq_domain_add_linear(bank->of_node,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
@@ -313,7 +322,6 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 			goto err_domains;
 		}
 
-		bank->irq_chip = &exynos_gpio_irq_chip;
 	}
 
 	return 0;
@@ -338,9 +346,9 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 	pr_info("wake %s for irq %d\n", on ? "enabled" : "disabled", irqd->irq);
 
 	if (!on)
-		our_chip->eint_wake_mask_value |= bit;
+		*our_chip->eint_wake_mask_value |= bit;
 	else
-		our_chip->eint_wake_mask_value &= ~bit;
+		*our_chip->eint_wake_mask_value &= ~bit;
 
 	return 0;
 }
@@ -386,6 +394,7 @@ s5pv210_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 		     clk_base + irq_chip->eint_wake_mask_reg);
 }
 
+static u32 eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED;
 /*
  * irq_chip for wakeup interrupts
  */
@@ -403,7 +412,7 @@ static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+	.eint_wake_mask_value = &eint_wake_mask_value,
 	/* Only differences with exynos4210_wkup_irq_chip: */
 	.eint_wake_mask_reg = S5PV210_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = s5pv210_pinctrl_set_eint_wakeup_mask,
@@ -423,7 +432,7 @@ static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+	.eint_wake_mask_value = &eint_wake_mask_value,
 	.eint_wake_mask_reg = EXYNOS_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
@@ -442,7 +451,7 @@ static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS7_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS7_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+	.eint_wake_mask_value = &eint_wake_mask_value,
 	.eint_wake_mask_reg = EXYNOS5433_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
@@ -513,7 +522,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
  * exynos_eint_wkup_init() - setup handling of external wakeup interrupts.
  * @d: driver data of samsung pinctrl driver.
  */
-int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
+__init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
 	struct device_node *wkup_np = NULL;
@@ -521,7 +530,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	struct samsung_pin_bank *bank;
 	struct exynos_weint_data *weint_data;
 	struct exynos_muxed_weint_data *muxed_data;
-	struct exynos_irq_chip *irq_chip;
+	const struct exynos_irq_chip *irq_chip;
 	unsigned int muxed_banks = 0;
 	unsigned int i;
 	int idx, irq;
@@ -531,12 +540,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 		match = of_match_node(exynos_wkup_irq_ids, np);
 		if (match) {
-			irq_chip = kmemdup(match->data,
-				sizeof(*irq_chip), GFP_KERNEL);
-			if (!irq_chip) {
-				of_node_put(np);
-				return -ENOMEM;
-			}
+			irq_chip = match->data;
 			wkup_np = np;
 			break;
 		}
@@ -549,6 +553,14 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		if (bank->eint_type != EINT_TYPE_WKUP)
 			continue;
 
+		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
+					      GFP_KERNEL);
+		if (!bank->irq_chip) {
+			of_node_put(wkup_np);
+			return -ENOMEM;
+		}
+		bank->irq_chip->chip.name = bank->name;
+
 		bank->irq_domain = irq_domain_add_linear(bank->of_node,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
@@ -557,8 +569,6 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENXIO;
 		}
 
-		bank->irq_chip = irq_chip;
-
 		if (!of_find_property(bank->of_node, "interrupts", NULL)) {
 			bank->eint_type = EINT_TYPE_WKUP_MUX;
 			++muxed_banks;
@@ -657,10 +667,6 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 				irq_chip = bank->irq_chip;
 				irq_chip->set_eint_wakeup_mask(drvdata,
 							       irq_chip);
-			} else if (bank->irq_chip != irq_chip) {
-				dev_warn(drvdata->dev,
-					 "More than one external wakeup interrupt chip configured (bank: %s). This is not supported by hardware nor by driver.\n",
-					 bank->name);
 			}
 		}
 	}
-- 
2.17.1

