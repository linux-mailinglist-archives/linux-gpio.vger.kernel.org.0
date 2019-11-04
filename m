Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE3BEE285
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 15:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfKDO3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 09:29:42 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6143 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729216AbfKDO3m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Nov 2019 09:29:42 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CD3087D2471086623238;
        Mon,  4 Nov 2019 22:29:30 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 22:29:23 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <treding@nvidia.com>, <narmstrong@baylibre.com>,
        <manivannan.sadhasivam@linaro.org>, <jesper.nilsson@axis.com>,
        <bjorn.andersson@linaro.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2] pinctrl: use devm_platform_ioremap_resource() to simplify code
Date:   Mon, 4 Nov 2019 22:26:54 +0800
Message-ID: <20191104142654.39256-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
References: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
v2: squash all into one patch
---
 drivers/pinctrl/actions/pinctrl-owl.c      |  4 +---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c     |  4 +---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c   |  7 ++-----
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c   |  3 +--
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c      |  6 ++----
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c     |  7 ++-----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c      |  6 ++----
 drivers/pinctrl/pinctrl-artpec6.c          |  4 +---
 drivers/pinctrl/pinctrl-at91-pio4.c        |  3 +--
 drivers/pinctrl/pinctrl-at91.c             |  4 +---
 drivers/pinctrl/pinctrl-bm1880.c           |  4 +---
 drivers/pinctrl/pinctrl-coh901.c           |  4 +---
 drivers/pinctrl/pinctrl-da850-pupd.c       |  4 +---
 drivers/pinctrl/pinctrl-digicolor.c        |  4 +---
 drivers/pinctrl/pinctrl-lpc18xx.c          |  4 +---
 drivers/pinctrl/pinctrl-oxnas.c            |  4 +---
 drivers/pinctrl/pinctrl-pic32.c            |  4 +---
 drivers/pinctrl/pinctrl-pistachio.c        |  4 +---
 drivers/pinctrl/pinctrl-rza2.c             |  4 +---
 drivers/pinctrl/pinctrl-tb10x.c            |  4 +---
 drivers/pinctrl/pinctrl-u300.c             |  4 +---
 drivers/pinctrl/pinctrl-xway.c             |  4 +---
 drivers/pinctrl/pxa/pinctrl-pxa25x.c       | 13 ++++---------
 drivers/pinctrl/pxa/pinctrl-pxa27x.c       | 13 ++++---------
 drivers/pinctrl/qcom/pinctrl-msm.c         |  3 +--
 drivers/pinctrl/spear/pinctrl-plgpio.c     |  4 +---
 drivers/pinctrl/spear/pinctrl-spear.c      |  4 +---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      |  4 +---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |  4 +---
 drivers/pinctrl/tegra/pinctrl-tegra.c      |  3 +--
 drivers/pinctrl/vt8500/pinctrl-wmt.c       |  4 +---
 drivers/pinctrl/zte/pinctrl-zx.c           |  4 +---
 32 files changed, 42 insertions(+), 110 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 5dfe7188a5f8..5a0c8e87aa7c 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -915,7 +915,6 @@ static int owl_gpio_init(struct owl_pinctrl *pctrl)
 int owl_pinctrl_probe(struct platform_device *pdev,
 				struct owl_pinctrl_soc_data *soc_data)
 {
-	struct resource *res;
 	struct owl_pinctrl *pctrl;
 	int ret, i;
 
@@ -923,8 +922,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 	if (!pctrl)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctrl->base = devm_ioremap_resource(&pdev->dev, res);
+	pctrl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->base))
 		return PTR_ERR(pctrl->base);
 
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index bc3b232a727a..f690fc5cd688 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1400,12 +1400,10 @@ static struct pinctrl_desc bcm281xx_pinctrl_desc = {
 static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 {
 	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
-	struct resource *res;
 	struct pinctrl_dev *pctl;
 
 	/* So far We can assume there is only 1 bank of registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pdata->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	pdata->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->reg_base)) {
 		dev_err(&pdev->dev, "Failed to ioremap MEM resource\n");
 		return -ENODEV;
diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index dcab2204c60c..4344c5732400 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -940,7 +940,6 @@ static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
 static int cygnus_pinmux_probe(struct platform_device *pdev)
 {
 	struct cygnus_pinctrl *pinctrl;
-	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
 	unsigned num_pins = ARRAY_SIZE(cygnus_pins);
@@ -953,15 +952,13 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pinctrl);
 	spin_lock_init(&pinctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pinctrl->base0)) {
 		dev_err(&pdev->dev, "unable to map I/O space\n");
 		return PTR_ERR(pinctrl->base0);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	pinctrl->base1 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base1 = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(pinctrl->base1)) {
 		dev_err(&pdev->dev, "unable to map I/O space\n");
 		return PTR_ERR(pinctrl->base1);
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 42f7ab383ad9..3326dba86a11 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -795,8 +795,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	chip->dev = dev;
 	platform_set_drvdata(pdev, chip);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->base = devm_ioremap_resource(dev, res);
+	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->base);
diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 9fabc451550e..32f268f173d1 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1042,8 +1042,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pinctrl);
 	spin_lock_init(&pinctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pinctrl->base0))
 		return PTR_ERR(pinctrl->base0);
 
@@ -1057,8 +1056,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	pinctrl->pinconf_base = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->pinconf_base = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(pinctrl->pinconf_base))
 		return PTR_ERR(pinctrl->pinconf_base);
 
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index e67ae52023ad..8db87e531082 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -613,7 +613,6 @@ static const struct of_device_id nsp_gpio_of_match[] = {
 static int nsp_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct nsp_gpio *chip;
 	struct gpio_chip *gc;
 	u32 val, count;
@@ -631,15 +630,13 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	chip->dev = dev;
 	platform_set_drvdata(pdev, chip);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->base = devm_ioremap_resource(dev, res);
+	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->base);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	chip->io_ctrl = devm_ioremap_resource(dev, res);
+	chip->io_ctrl = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(chip->io_ctrl)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->io_ctrl);
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index 87618a4e90e4..3756fc9d5826 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -571,8 +571,7 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pinctrl);
 	spin_lock_init(&pinctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pinctrl->base0))
 		return PTR_ERR(pinctrl->base0);
 
@@ -586,8 +585,7 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	pinctrl->base2 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base2 = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(pinctrl->base2))
 		return PTR_ERR(pinctrl->base2);
 
diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index e3239cf926f9..986e04ac6b5b 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -936,7 +936,6 @@ static void artpec6_pmx_reset(struct artpec6_pmx *pmx)
 static int artpec6_pmx_probe(struct platform_device *pdev)
 {
 	struct artpec6_pmx *pmx;
-	struct resource *res;
 
 	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
 	if (!pmx)
@@ -944,8 +943,7 @@ static int artpec6_pmx_probe(struct platform_device *pdev)
 
 	pmx->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmx->base = devm_ioremap_resource(&pdev->dev, res);
+	pmx->base = devm_platform_ioremap_resource(pdev, 0);
 
 	if (IS_ERR(pmx->base))
 		return PTR_ERR(pmx->base);
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index e380202eb86a..694912409fd9 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1017,8 +1017,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 	atmel_pioctrl->nbanks = atmel_pioctrl_data->nbanks;
 	atmel_pioctrl->npins = atmel_pioctrl->nbanks * ATMEL_PIO_NPINS_PER_BANK;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	atmel_pioctrl->reg_base = devm_ioremap_resource(dev, res);
+	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pioctrl->reg_base))
 		return -EINVAL;
 
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 117075b5798f..0472f3d3992d 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1811,7 +1811,6 @@ static const struct of_device_id at91_gpio_of_match[] = {
 static int at91_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 	struct at91_gpio_chip *at91_chip = NULL;
 	struct gpio_chip *chip;
 	struct pinctrl_gpio_range *range;
@@ -1839,8 +1838,7 @@ static int at91_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	at91_chip->regbase = devm_ioremap_resource(&pdev->dev, res);
+	at91_chip->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(at91_chip->regbase)) {
 		ret = PTR_ERR(at91_chip->regbase);
 		goto err;
diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index 63b130cb1ffb..f7dff4f14101 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -1308,15 +1308,13 @@ static struct pinctrl_desc bm1880_desc = {
 static int bm1880_pinctrl_probe(struct platform_device *pdev)
 
 {
-	struct resource *res;
 	struct bm1880_pinctrl *pctrl;
 
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctrl->base = devm_ioremap_resource(&pdev->dev, res);
+	pctrl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->base))
 		return PTR_ERR(pctrl->base);
 
diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 063a629be9b2..2905348ff430 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -615,7 +615,6 @@ static struct coh901_pinpair coh901_pintable[] = {
 static int __init u300_gpio_probe(struct platform_device *pdev)
 {
 	struct u300_gpio *gpio;
-	struct resource *memres;
 	struct gpio_irq_chip *girq;
 	int err = 0;
 	int portno;
@@ -633,8 +632,7 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = 0;
 	gpio->dev = &pdev->dev;
 
-	memres = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gpio->base = devm_ioremap_resource(&pdev->dev, memres);
+	gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
diff --git a/drivers/pinctrl/pinctrl-da850-pupd.c b/drivers/pinctrl/pinctrl-da850-pupd.c
index d06f13a79740..5a0a1f20c843 100644
--- a/drivers/pinctrl/pinctrl-da850-pupd.c
+++ b/drivers/pinctrl/pinctrl-da850-pupd.c
@@ -146,14 +146,12 @@ static int da850_pupd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct da850_pupd_data *data;
-	struct resource *res;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->base = devm_ioremap_resource(dev, res);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base)) {
 		dev_err(dev, "Could not map resource\n");
 		return PTR_ERR(data->base);
diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index 7e1ceee5895b..ff702cfbaa28 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -270,7 +270,6 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap, struct device_node *np)
 static int dc_pinctrl_probe(struct platform_device *pdev)
 {
 	struct dc_pinmap *pmap;
-	struct resource *r;
 	struct pinctrl_pin_desc *pins;
 	struct pinctrl_desc *pctl_desc;
 	char *pin_names;
@@ -281,8 +280,7 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
 	if (!pmap)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmap->regs = devm_ioremap_resource(&pdev->dev, r);
+	pmap->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmap->regs))
 		return PTR_ERR(pmap->regs);
 
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 06be55dab341..e4677546aec4 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -1324,15 +1324,13 @@ static int lpc18xx_create_group_func_map(struct device *dev,
 static int lpc18xx_scu_probe(struct platform_device *pdev)
 {
 	struct lpc18xx_scu_data *scu;
-	struct resource *res;
 	int ret;
 
 	scu = devm_kzalloc(&pdev->dev, sizeof(*scu), GFP_KERNEL);
 	if (!scu)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	scu->base = devm_ioremap_resource(&pdev->dev, res);
+	scu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(scu->base))
 		return PTR_ERR(scu->base);
 
diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index 40dc1251432a..674b7b5919df 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -1196,7 +1196,6 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 	struct oxnas_gpio_bank *bank;
 	unsigned int id, ngpios;
 	int irq, ret;
-	struct resource *res;
 	struct gpio_irq_chip *girq;
 
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges",
@@ -1220,8 +1219,7 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 
 	bank = &oxnas_gpio_banks[id];
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	bank->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 7e4c5a08a932..e5d6d3f9753e 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2202,7 +2202,6 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	struct pic32_gpio_bank *bank;
 	u32 id;
 	int irq, ret;
-	struct resource *res;
 	struct gpio_irq_chip *girq;
 
 	if (of_property_read_u32(np, "microchip,gpio-bank", &id)) {
@@ -2217,8 +2216,7 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 
 	bank = &pic32_gpio_banks[id];
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	bank->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index eb40ae9f8639..fa370c171cad 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1435,7 +1435,6 @@ static const struct of_device_id pistachio_pinctrl_of_match[] = {
 static int pistachio_pinctrl_probe(struct platform_device *pdev)
 {
 	struct pistachio_pinctrl *pctl;
-	struct resource *res;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
@@ -1443,8 +1442,7 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pctl->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, pctl);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctl->base = devm_ioremap_resource(&pdev->dev, res);
+	pctl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctl->base))
 		return PTR_ERR(pctl->base);
 
diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
index 3be1d833bf25..e27ed2f34cbe 100644
--- a/drivers/pinctrl/pinctrl-rza2.c
+++ b/drivers/pinctrl/pinctrl-rza2.c
@@ -462,7 +462,6 @@ static const struct pinmux_ops rza2_pinmux_ops = {
 static int rza2_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rza2_pinctrl_priv *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -471,8 +470,7 @@ static int rza2_pinctrl_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 1f64e2e7efd9..ab49bd708969 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -747,7 +747,6 @@ static struct pinctrl_desc tb10x_pindesc = {
 static int tb10x_pinctrl_probe(struct platform_device *pdev)
 {
 	int ret = -EINVAL;
-	struct resource *mem;
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
 	struct device_node *child;
@@ -768,8 +767,7 @@ static int tb10x_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, state);
 	mutex_init(&state->mutex);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	state->base = devm_ioremap_resource(dev, mem);
+	state->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(state->base)) {
 		ret = PTR_ERR(state->base);
 		goto fail;
diff --git a/drivers/pinctrl/pinctrl-u300.c b/drivers/pinctrl/pinctrl-u300.c
index 348423bb39dd..cc306448259e 100644
--- a/drivers/pinctrl/pinctrl-u300.c
+++ b/drivers/pinctrl/pinctrl-u300.c
@@ -1055,7 +1055,6 @@ static struct pinctrl_desc u300_pmx_desc = {
 static int u300_pmx_probe(struct platform_device *pdev)
 {
 	struct u300_pmx *upmx;
-	struct resource *res;
 
 	/* Create state holders etc for this driver */
 	upmx = devm_kzalloc(&pdev->dev, sizeof(*upmx), GFP_KERNEL);
@@ -1064,8 +1063,7 @@ static int u300_pmx_probe(struct platform_device *pdev)
 
 	upmx->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	upmx->virtbase = devm_ioremap_resource(&pdev->dev, res);
+	upmx->virtbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(upmx->virtbase))
 		return PTR_ERR(upmx->virtbase);
 
diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 913d38f29b73..5e3f31b55eb7 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1705,12 +1705,10 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct pinctrl_xway_soc *xway_soc;
-	struct resource *res;
 	int ret, i;
 
 	/* get and remap our register range */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	xway_info.membase[0] = devm_ioremap_resource(&pdev->dev, res);
+	xway_info.membase[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(xway_info.membase[0]))
 		return PTR_ERR(xway_info.membase[0]);
 
diff --git a/drivers/pinctrl/pxa/pinctrl-pxa25x.c b/drivers/pinctrl/pxa/pinctrl-pxa25x.c
index 8d1247078ae5..95640698422f 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa25x.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa25x.c
@@ -216,25 +216,20 @@ static int pxa25x_pinctrl_probe(struct platform_device *pdev)
 	void __iomem *base_af[8];
 	void __iomem *base_dir[4];
 	void __iomem *base_sleep[4];
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_af[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_af[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base_af[0]))
 		return PTR_ERR(base_af[0]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	base_dir[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_dir[0] = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base_dir[0]))
 		return PTR_ERR(base_dir[0]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	base_dir[3] = devm_ioremap_resource(&pdev->dev, res);
+	base_dir[3] = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(base_dir[3]))
 		return PTR_ERR(base_dir[3]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	base_sleep[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_sleep[0] = devm_platform_ioremap_resource(pdev, 3);
 	if (IS_ERR(base_sleep[0]))
 		return PTR_ERR(base_sleep[0]);
 
diff --git a/drivers/pinctrl/pxa/pinctrl-pxa27x.c b/drivers/pinctrl/pxa/pinctrl-pxa27x.c
index 64943e819af6..48ccfb50b23e 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa27x.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa27x.c
@@ -508,25 +508,20 @@ static int pxa27x_pinctrl_probe(struct platform_device *pdev)
 	void __iomem *base_af[8];
 	void __iomem *base_dir[4];
 	void __iomem *base_sleep[4];
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_af[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_af[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base_af[0]))
 		return PTR_ERR(base_af[0]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	base_dir[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_dir[0] = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base_dir[0]))
 		return PTR_ERR(base_dir[0]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	base_dir[3] = devm_ioremap_resource(&pdev->dev, res);
+	base_dir[3] = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(base_dir[3]))
 		return PTR_ERR(base_dir[3]);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	base_sleep[0] = devm_ioremap_resource(&pdev->dev, res);
+	base_sleep[0] = devm_platform_ioremap_resource(pdev, 3);
 	if (IS_ERR(base_sleep[0]))
 		return PTR_ERR(base_sleep[0]);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 763da0be10d6..62fcae9f05ae 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1150,8 +1150,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 				return PTR_ERR(pctrl->regs[i]);
 		}
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
+		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(pctrl->regs[0]))
 			return PTR_ERR(pctrl->regs[0]);
 	}
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index c4c9a2971445..1ebbc49b16f1 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -515,15 +515,13 @@ static int plgpio_probe_dt(struct platform_device *pdev, struct plgpio *plgpio)
 static int plgpio_probe(struct platform_device *pdev)
 {
 	struct plgpio *plgpio;
-	struct resource *res;
 	int ret, irq;
 
 	plgpio = devm_kzalloc(&pdev->dev, sizeof(*plgpio), GFP_KERNEL);
 	if (!plgpio)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	plgpio->base = devm_ioremap_resource(&pdev->dev, res);
+	plgpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(plgpio->base))
 		return PTR_ERR(plgpio->base);
 
diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index 7ec19c73f870..948f56abb9ae 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -358,7 +358,6 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 			struct spear_pinctrl_machdata *machdata)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 	struct spear_pmx *pmx;
 
 	if (!machdata)
@@ -368,8 +367,7 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmx->vbase = devm_ioremap_resource(&pdev->dev, res);
+	pmx->vbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmx->vbase))
 		return PTR_ERR(pmx->vbase);
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0cbca30b75dc..b35c3245ab3f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1385,7 +1385,6 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 	struct pinctrl_pin_desc *pins;
 	struct sunxi_pinctrl *pctl;
 	struct pinmux_ops *pmxops;
-	struct resource *res;
 	int i, ret, last_pin, pin_idx;
 	struct clk *clk;
 
@@ -1396,8 +1395,7 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 
 	raw_spin_lock_init(&pctl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctl->membase = devm_ioremap_resource(&pdev->dev, res);
+	pctl->membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctl->membase))
 		return PTR_ERR(pctl->membase);
 
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index f2fa1f76ebb7..6f7b3767f453 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -873,7 +873,6 @@ int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_padctl *padctl;
 	const struct of_device_id *match;
-	struct resource *res;
 	struct phy *phy;
 	int err;
 
@@ -894,8 +893,7 @@ int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 	match = of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
 	padctl->soc = match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	padctl->regs = devm_ioremap_resource(&pdev->dev, res);
+	padctl->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(padctl->regs))
 		return PTR_ERR(padctl->regs);
 
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index e9a7cbb9aa33..692d8b3e2a20 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -781,8 +781,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < pmx->nbanks; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
+		pmx->regs[i] = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(pmx->regs[i]))
 			return PTR_ERR(pmx->regs[i]);
 	}
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 4d5cd7d8c760..ea910a18b4d7 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -553,10 +553,8 @@ int wmt_pinctrl_probe(struct platform_device *pdev,
 		      struct wmt_pinctrl_data *data)
 {
 	int err;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->base = devm_ioremap_resource(&pdev->dev, res);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
diff --git a/drivers/pinctrl/zte/pinctrl-zx.c b/drivers/pinctrl/zte/pinctrl-zx.c
index 9512045420ec..786bf89487d6 100644
--- a/drivers/pinctrl/zte/pinctrl-zx.c
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -387,7 +387,6 @@ int zx_pinctrl_init(struct platform_device *pdev,
 	struct pinctrl_desc *pctldesc;
 	struct zx_pinctrl *zpctl;
 	struct device_node *np;
-	struct resource *res;
 	int ret;
 
 	zpctl = devm_kzalloc(&pdev->dev, sizeof(*zpctl), GFP_KERNEL);
@@ -396,8 +395,7 @@ int zx_pinctrl_init(struct platform_device *pdev,
 
 	spin_lock_init(&zpctl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	zpctl->base = devm_ioremap_resource(&pdev->dev, res);
+	zpctl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(zpctl->base))
 		return PTR_ERR(zpctl->base);
 
-- 
2.20.1


