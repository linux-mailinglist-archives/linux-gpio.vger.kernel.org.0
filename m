Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F4E1F5C1B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 21:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgFJTlO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 15:41:14 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52496 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgFJTlL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 15:41:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200610194109euoutp029b6545bd5eb8fb1ad0877a93011d2b45~XRhmkHHlU1153211532euoutp02q
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 19:41:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200610194109euoutp029b6545bd5eb8fb1ad0877a93011d2b45~XRhmkHHlU1153211532euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591818069;
        bh=fFCienO75+Qf7crfUfU3/vcjrJG4zRPt66+gonKZNJ4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=H2yln9Yi6xXt0sW7oKnb5B9mk1TGVnvTF8ww36F219V/mbd8Wdm+OAxajgP98jAVM
         /CzpjgS0kA2DyorHmgS/Z/s2Z7ALEVlKKHKBDTGqGCdfSeiFlZnxM3HPVnXXmK9avD
         BVQxbDu9m8nJceTplBAUtOHrKuBjgKWkI4JxQfWw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200610194108eucas1p1b8ccf0f1be01c15609e401f7220fbd3a~XRhly6xMS0684706847eucas1p15;
        Wed, 10 Jun 2020 19:41:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.FB.61286.45731EE5; Wed, 10
        Jun 2020 20:41:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200610194107eucas1p1b22f0c8e3e13551940efd6093df505a3~XRhlX-icN0889108891eucas1p1R;
        Wed, 10 Jun 2020 19:41:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200610194107eusmtrp23144c16293600e26f77b05ff1473daea~XRhlXWIHl0299202992eusmtrp2T;
        Wed, 10 Jun 2020 19:41:07 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-c8-5ee13754e569
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A9.3E.07950.35731EE5; Wed, 10
        Jun 2020 20:41:07 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200610194107eusmtip28f230edc47e05d59da2b0e3d10976990~XRhk0gXSZ1294112941eusmtip2S;
        Wed, 10 Jun 2020 19:41:07 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3] pinctrl: samsung: Use bank name as irqchip name
Date:   Wed, 10 Jun 2020 21:40:52 +0200
Message-Id: <20200610194052.6434-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsWy7djPc7oh5g/jDL7PELbYOGM9q8X1L89Z
        Lc6f38BuMeXPciaLzfP/MFrMOL+PyWLtkbvsFofftLNarNr1h9GB02PnrLvsHptWdbJ53Lm2
        h82jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mr69sym45Vjx4+R2tgbGx6ZdjJwcEgImEk3b
        jzJ1MXJxCAmsYJSYcvYUI4TzhVHi96JP7BDOZ0aJfdP+ssO0nFjXzAaRWM4osfjHQWa4lvMv
        ZjCDVLEJGEp0ve1iA7FFBBwlfm5YxQpSxCywjUnifNchsISwgLPEyfdXWEFsFgFVie2nXjCC
        2LwCNhLHZr2GWicvsXrDAbANEgKP2SSu7j/KApFwkVi08DwThC0s8er4FqgGGYn/O+czQTQ0
        M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9AZ3AA3aQpsX6XPkTYUWLqx4tMIGEJAT6JG28FQcLM
        QOakbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiVmCNtD4nPbdDBbSCBWYtHTm2wTGOVmIexawMi4
        ilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzBFnP53/NMOxq+Xkg4xCnAwKvHwGux9ECfE
        mlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqem
        FqQWwWSZODilGhhb+mujzdaumPP7yxTpJYacQvZcEt4XL5oklRw9l/nsPDt//M7mj4uZr83c
        uv+LTZN2V/ndVYEyUq9uqD4u0JpaXHV53zM5XZPovMTUGXqGGYteLVi5Oyxa4U966afU2QIn
        ozu6potpPTANeysqrlVyRdzWtrR9ne9Nk+O7L27xU2Hc+nnfH3YlluKMREMt5qLiRAAENhCe
        DQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsVy+t/xe7rB5g/jDL7cNrPYOGM9q8X1L89Z
        Lc6f38BuMeXPciaLzfP/MFrMOL+PyWLtkbvsFofftLNarNr1h9GB02PnrLvsHptWdbJ53Lm2
        h82jb8sqRo/Pm+QCWKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJS
        czLLUov07RL0Mr69sym45Vjx4+R2tgbGx6ZdjJwcEgImEifWNbN1MXJxCAksZZRoOfqQDSIh
        I3FyWgMrhC0s8edaF1TRJ0aJyV03mUESbAKGEl1vu8AaRAScJW682ssCUsQssItJomXNYbCE
        MFDi5PsrYJNYBFQltp96wQhi8wrYSByb9ZodYoO8xOoNB5gnMPIsYGRYxSiSWlqcm55bbKRX
        nJhbXJqXrpecn7uJERiY24793LKDsetd8CFGAQ5GJR5eg70P4oRYE8uKK3MPMUpwMCuJ8Dqd
        PR0nxJuSWFmVWpQfX1Sak1p8iNEUaPlEZinR5Hxg1OSVxBuaGppbWBqaG5sbm1koifN2CByM
        ERJITyxJzU5NLUgtgulj4uCUamCMXBN0m813VtWdnjcVaz+5Mjzfc+e2xXz9kCMi2w4WXH9z
        6bHqoq95b/4fX/UkeIm9ce1qruDKxGJF5UmPsjYJTt364Kmho65jmI63+dbMHRLbjwQ0X5rc
        J3Q5znmH0rGi3vXa5zN7mtp89XZo9N07eHG7u2/FA5OjaydZSUw7/ivigOazfllOJZbijERD
        Leai4kQAFHdbX2ICAAA=
X-CMS-MailID: 20200610194107eucas1p1b22f0c8e3e13551940efd6093df505a3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200610194107eucas1p1b22f0c8e3e13551940efd6093df505a3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200610194107eucas1p1b22f0c8e3e13551940efd6093df505a3
References: <CGME20200610194107eucas1p1b22f0c8e3e13551940efd6093df505a3@eucas1p1.samsung.com>
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

Handling of the eint_wake_mask_value has been reworked, because each bank
has now its own exynos_irq_chip structure allocated.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v3:
- fixed rebase issue after applying onto linux-next

v2: https://patchwork.kernel.org/patch/11597975/
- reordered code to fix error handling
- fixed eint_wakeup_mask_value handling
- added __init annotations

v1: https://patchwork.kernel.org/patch/11594897/
- initial version
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 58 +++++++++++++-----------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 84501c785473..b9ea09fabf84 100644
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
@@ -360,10 +368,10 @@ exynos_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 	pmu_regs = drvdata->retention_ctrl->priv;
 	dev_info(drvdata->dev,
 		 "Setting external wakeup interrupt mask: 0x%x\n",
-		 irq_chip->eint_wake_mask_value);
+		 *irq_chip->eint_wake_mask_value);
 
 	regmap_write(pmu_regs, irq_chip->eint_wake_mask_reg,
-		     irq_chip->eint_wake_mask_value);
+		     *irq_chip->eint_wake_mask_value);
 }
 
 static void
@@ -382,10 +390,11 @@ s5pv210_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 
 	clk_base = (void __iomem *) drvdata->retention_ctrl->priv;
 
-	__raw_writel(irq_chip->eint_wake_mask_value,
+	__raw_writel(*irq_chip->eint_wake_mask_value,
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

