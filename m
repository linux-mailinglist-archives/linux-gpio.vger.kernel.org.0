Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055083030CC
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 01:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbhAZAFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 19:05:09 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:41506 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732109AbhAZAEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 19:04:34 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210126000322epoutp0485f123da89ad7045f1d0c798a9651f6a~dn068-k7p0311903119epoutp04p
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 00:03:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210126000322epoutp0485f123da89ad7045f1d0c798a9651f6a~dn068-k7p0311903119epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611619402;
        bh=7Ch/Cw/ibhmd/lv7J4j+Df5Vc3rvStqETWmBpC50Mho=;
        h=From:To:Cc:Subject:Date:References:From;
        b=G1lBgCeFIhrwVnCeql/qNBbKJ7ISm0MAe8vl98cMtHK8exdt6cY7f7V/+fvcPziTz
         /sM+PSOkJ9NZ6ZmuS1ynoOMipQiQngOwIcawzASqZUzOZx5GfaEXPIgGQ2wmdOf1Rf
         ZBB9Wj6I1s+Zo7YD6x2q5aaZAit1vKpvjErUpYxc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20210126000321epcas2p425ec3830abd081dc087860f7c3f7f9fa~dn06N9N_F1737517375epcas2p4D;
        Tue, 26 Jan 2021 00:03:21 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.191]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4DPn4k2MQyz4x9Pt; Tue, 26 Jan
        2021 00:03:18 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        85.9A.10621.44C5F006; Tue, 26 Jan 2021 09:03:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20210126000316epcas2p3b790bf8a68ecb66169342b7736722183~dn01QAkXy0542005420epcas2p3I;
        Tue, 26 Jan 2021 00:03:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210126000316epsmtrp11272a0e03f52006f342aaa7d3e9201d6~dn01PPRra0990109901epsmtrp1I;
        Tue, 26 Jan 2021 00:03:16 +0000 (GMT)
X-AuditID: b6c32a45-34dff7000001297d-9a-600f5c44a972
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        9D.D8.08745.34C5F006; Tue, 26 Jan 2021 09:03:15 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210126000315epsmtip20051eed19f69df503ca4d4f08968add5~dn009rorM0958109581epsmtip2i;
        Tue, 26 Jan 2021 00:03:15 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2] pinctrl: samsung: use raw_spinlock for locking
Date:   Tue, 26 Jan 2021 09:03:07 +0900
Message-Id: <20210126000307.28311-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgk+LIzCtJLcpLzFFi42LZdljTQtclhj/B4NMqDYvL+7Utzp/fwG4x
        5c9yJotNj6+xWmye/4fRYsb5fUwWh9+0s1qs2vWH0YHDY+esu+wem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYIvKsclITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
        CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BoWKBXnJhbXJqXrpec
        n2tlaGBgZApUmZCTcfvVdsaCt64VS+5ENTBesu5i5OSQEDCRuPxuMiuILSSwg1FixoLSLkYu
        IPsTo8TxBUcZIZzPQM7UmWwwHWfuf2aFSOxilPjedh6q6iOjxJHlU5lBqtgEdCW2PH8FlhAR
        WMkosfz5QiYQh1lgEqPEu+fPwTYKCzhJ/L2zGMxmEVCVuDbtH9gOXgE7ibPr7zFD7JOXOLn2
        MBNEXFDi5MwnLCA2M1C8eetsqJpb7BI/vkhA2C4S7xbdgLpVWOLV8S3sELaUxMv+NnaQIyQE
        uhklWh/9h0qsZpTobPSBsO0lfk3fAnQQB9ACTYn1u/RBTAkBZYkjt6DW8kl0HP7LDhHmleho
        E4JoVJc4sH06C4QtK9E95zMrhO0h8WLOcmZI+MZKbPu7jmkCo/wsJM/MQvLMLIS9CxiZVzGK
        pRYU56anFhsVGCJH6iZGcJLUct3BOPntB71DjEwcjIcYJTiYlUR4d+vxJAjxpiRWVqUW5ccX
        leakFh9iNAUG70RmKdHkfGCaziuJNzQ1MjMzsDS1MDUzslAS5y02eBAvJJCeWJKanZpakFoE
        08fEwSnVwLR+7wuLKat3nX2Twyu6Jfvg5tSFZw359tbcWhP6LNGk4dCMBn67M55zi3/9ZK28
        8Y1t1s2505bzTt/ae/zfwgP7vt01fHL1XdeH5Pun917melvLzy13wy+DYZe/rs025i+RpoWb
        BYNqG70O8c34Vrni0Z481h2/4qRWNb7o53v2lWXj7y07Fl315Nmw9wgPT7S48kqHqblnD2S2
        C8YXTDc6ckjxkLlXM0v4qg9G6fWyc/Q0VuUmXfR6FSLl9f+Py+n25S+/Vpc0JcQwPuNUuuW4
        7Pe3gxqXMp+8k4j/qfNA/EP36WJetn+/hCoONx11/LpBbbNJOq9KAJtwtoXl1RWWB03566oi
        WaqsDE0+MT5XYinOSDTUYi4qTgQA9zsKJBsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSvK5zDH+CweFmc4vL+7Utzp/fwG4x
        5c9yJotNj6+xWmye/4fRYsb5fUwWh9+0s1qs2vWH0YHDY+esu+wem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYIvisklJzcksSy3St0vgyrj9ajtjwVvXiiV3ohoYL1l3MXJySAiYSJy5/5m1
        i5GLQ0hgB6PEos4v7BAJWYln73ZA2cIS91uOQBW9Z5R4uGAXWIJNQFdiy/NXjCAJEYHVjBLb
        JkwBc5gFpjFKrNrXxgJSJSzgJPH3zmJWEJtFQFXi2rR/bCA2r4CdxNn195ghVshLnFx7mAki
        LihxcuYTsF5moHjz1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85
        P3cTIzhwtbR2MO5Z9UHvECMTB+MhRgkOZiUR3t16PAlCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
        eS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MJ0r+PfDekZ9/DTuI3H2056Iqfan9Cz42uB3W1J1
        f9PHtg8na4KEXJ69W6mZnLoy9tk6ew7RDxFXIkqz0la0TVQ/+aV+352XOfmnzneXzr08v/9W
        t/G9W7tbVdU5Sr5sCmhWmdq38esXJk3LPIElpZdUmVxnrmEy+X/w/PdfGzKeTJKKrm4Wy/0R
        4mcWL+L2ynLDK/b6G9VH3um/WjC37Z4hk6lAf8eagLKW/26bth4sFFFentZ+kTFnwstVOy9s
        u9/AVKXEb7jk29oi9tS/RrMua0xgvLv/HXvM98720rvHQlQkbsTwO364U2zD+N0s4/jLJH5z
        1hyZurQLKV+FVp4KdTnxfGJ13vNXT6tydyixFGckGmoxFxUnAgDEHJw1ywIAAA==
X-CMS-MailID: 20210126000316epcas2p3b790bf8a68ecb66169342b7736722183
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210126000316epcas2p3b790bf8a68ecb66169342b7736722183
References: <CGME20210126000316epcas2p3b790bf8a68ecb66169342b7736722183@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch converts spin_[lock|unlock] functions of pin bank to
raw_spinlock to support preempt-rt. This can avoid BUG() assertion when
irqchip callbacks are triggerred. Spinlocks can be converted rt_mutex
which is preemptible when we apply preempt-rt patches.

According to "Documentation/driver-api/gpio/driver.rst",

"Realtime considerations: a realtime compliant GPIO driver should not
use spinlock_t or any sleepable APIs (like PM runtime) as part of its
irqchip implementation.

- spinlock_t should be replaced with raw_spinlock_t.[1]
"

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Change from v1:
 - Fix compile error for s3c64xx pinctrl driver

 drivers/pinctrl/samsung/pinctrl-exynos.c  | 16 ++++++++--------
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  4 ++--
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.c | 22 +++++++++++-----------
 drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
 5 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index b9ea09fabf84..0cd7f33cdf25 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -58,13 +58,13 @@ static void exynos_irq_mask(struct irq_data *irqd)
 	unsigned long mask;
 	unsigned long flags;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = readl(bank->eint_base + reg_mask);
 	mask |= 1 << irqd->hwirq;
 	writel(mask, bank->eint_base + reg_mask);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 static void exynos_irq_ack(struct irq_data *irqd)
@@ -97,13 +97,13 @@ static void exynos_irq_unmask(struct irq_data *irqd)
 	if (irqd_get_trigger_type(irqd) & IRQ_TYPE_LEVEL_MASK)
 		exynos_irq_ack(irqd);
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = readl(bank->eint_base + reg_mask);
 	mask &= ~(1 << irqd->hwirq);
 	writel(mask, bank->eint_base + reg_mask);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
@@ -169,14 +169,14 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
 	con |= EXYNOS_PIN_FUNC_EINT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return 0;
 }
@@ -192,14 +192,14 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
 	con |= EXYNOS_PIN_FUNC_INPUT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	gpiochip_unlock_as_irq(&bank->gpio_chip, irqd->hwirq);
 }
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 2223ead5bd72..00d77d6946b5 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -145,14 +145,14 @@ static void s3c24xx_eint_set_function(struct samsung_pinctrl_drv_data *d,
 	shift = pin * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	val = readl(reg);
 	val &= ~(mask << shift);
 	val |= bank->eint_func << shift;
 	writel(val, reg);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 static int s3c24xx_eint_type(struct irq_data *data, unsigned int type)
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index b8166e3fe4ce..53e2a6412add 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -286,14 +286,14 @@ static void s3c64xx_irq_set_function(struct samsung_pinctrl_drv_data *d,
 	shift = shift * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	val = readl(reg);
 	val &= ~(mask << shift);
 	val |= bank->eint_func << shift;
 	writel(val, reg);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 /*
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 608eb5a07248..376876bd6605 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -400,14 +400,14 @@ static void samsung_pinmux_setup(struct pinctrl_dev *pctldev, unsigned selector,
 		reg += 4;
 	}
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	data = readl(reg + type->reg_offset[PINCFG_TYPE_FUNC]);
 	data &= ~(mask << shift);
 	data |= func->val << shift;
 	writel(data, reg + type->reg_offset[PINCFG_TYPE_FUNC]);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 /* enable a specified pinmux by writing to registers */
@@ -451,7 +451,7 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 	width = type->fld_width[cfg_type];
 	cfg_reg = type->reg_offset[cfg_type];
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	mask = (1 << width) - 1;
 	shift = pin_offset * width;
@@ -468,7 +468,7 @@ static int samsung_pinconf_rw(struct pinctrl_dev *pctldev, unsigned int pin,
 		*config = PINCFG_PACK(cfg_type, data);
 	}
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return 0;
 }
@@ -561,9 +561,9 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_value(gc, offset, value);
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 /* gpiolib gpio_get callback function */
@@ -626,9 +626,9 @@ static int samsung_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 	ret = samsung_gpio_set_direction(gc, offset, true);
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 	return ret;
 }
 
@@ -640,10 +640,10 @@ static int samsung_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set_value(gc, offset, value);
 	ret = samsung_gpio_set_direction(gc, offset, false);
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return ret;
 }
@@ -1057,7 +1057,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_offset = bdata->eint_offset;
 		bank->name = bdata->name;
 
-		spin_lock_init(&bank->slock);
+		raw_spin_lock_init(&bank->slock);
 		bank->drvdata = d;
 		bank->pin_base = d->nr_pins;
 		d->nr_pins += bank->nr_pins;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 379f34a9a482..de44f8ec330b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -171,7 +171,7 @@ struct samsung_pin_bank {
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range grange;
 	struct exynos_irq_chip *irq_chip;
-	spinlock_t slock;
+	raw_spinlock_t slock;
 
 	u32 pm_save[PINCFG_TYPE_NUM + 1]; /* +1 to handle double CON registers*/
 };
-- 
2.30.0

