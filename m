Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB7E4ED692
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 01:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbfKDASe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 19:18:34 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43393 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbfKDAS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 19:18:27 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BC0DC886BF;
        Mon,  4 Nov 2019 13:18:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572826702;
        bh=3d+87pJD+9JxCO78338MvYnALIMGTLDz/d5FKJ1YG6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=PUiGZ17GbTcpTnBBbL6mkHoooSH5hGEcvYmcxxcaJlJOaPdL2zlQMUjj6mDi1HWk0
         dpeVFZ34NK+ycQMJ4w8Bw0aye47v7Lo7AuOUAOxFuPYThHy8sYvEJbBAPI9KIj6oz3
         Sc/FBDOc2Gz+AB6w1UsNBpOxgg2asEoJ368dj5VHe/DzPrrRN1iJ3rkVnvmg7wlk3e
         4MwH6/nn6u/MI2HwHLjOY7Gbhr74kwAJ1GjsXnLbbX5hGQYI4xaeffzzLscsU1o1WU
         +uHA1eLzfQ4roMxRyiXhjHK22sbCH73vUBYNb7IN09jtOufLUWsG4l1zPkvepKbb+m
         ViizGoVlx9UfQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbf6e4a0001>; Mon, 04 Nov 2019 13:18:21 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4854913EF06;
        Mon,  4 Nov 2019 13:18:18 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 725FD28005D; Mon,  4 Nov 2019 13:18:19 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/2] pinctrl: bcm: nsp: use gpiolib infrastructure for interrupts
Date:   Mon,  4 Nov 2019 13:18:18 +1300
Message-Id: <20191104001819.2300-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz>
References: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use more of the gpiolib infrastructure for handling interrupts. The
root interrupt still needs to be handled manually as it is shared with
other peripherals on the SoC.

This will allow multiple instances of this driver to be supported and
will clean up gracefully on failure thanks to the device managed APIs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---

Notes:
    Changes in v3:
    - retain old irqchip name for ABI compatilbilty
    - add revew from Florian
    Changes in v2:
    - none

 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 105 ++++++++++---------------
 1 file changed, 42 insertions(+), 63 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm=
/pinctrl-nsp-gpio.c
index e67ae52023ad..45ae29b22548 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -64,17 +64,16 @@
  * @gc: GPIO chip
  * @pctl: pointer to pinctrl_dev
  * @pctldesc: pinctrl descriptor
- * @irq_domain: pointer to irq domain
  * @lock: lock to protect access to I/O registers
  */
 struct nsp_gpio {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *io_ctrl;
+	struct irq_chip irqchip;
 	struct gpio_chip gc;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
-	struct irq_domain *irq_domain;
 	raw_spinlock_t lock;
 };
=20
@@ -136,8 +135,8 @@ static inline bool nsp_get_bit(struct nsp_gpio *chip,=
 enum base_type address,
=20
 static irqreturn_t nsp_gpio_irq_handler(int irq, void *data)
 {
-	struct nsp_gpio *chip =3D (struct nsp_gpio *)data;
-	struct gpio_chip gc =3D chip->gc;
+	struct gpio_chip *gc =3D (struct gpio_chip *)data;
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	int bit;
 	unsigned long int_bits =3D 0;
 	u32 int_status;
@@ -155,14 +154,14 @@ static irqreturn_t nsp_gpio_irq_handler(int irq, vo=
id *data)
 		level &=3D readl(chip->base + NSP_GPIO_INT_MASK);
 		int_bits =3D level | event;
=20
-		for_each_set_bit(bit, &int_bits, gc.ngpio) {
+		for_each_set_bit(bit, &int_bits, gc->ngpio) {
 			/*
 			 * Clear the interrupt before invoking the
 			 * handler, so we do not leave any window
 			 */
 			writel(BIT(bit), chip->base + NSP_GPIO_EVENT);
 			generic_handle_irq(
-				irq_linear_revmap(chip->irq_domain, bit));
+				irq_linear_revmap(gc->irq.domain, bit));
 		}
 	}
=20
@@ -171,7 +170,8 @@ static irqreturn_t nsp_gpio_irq_handler(int irq, void=
 *data)
=20
 static void nsp_gpio_irq_ack(struct irq_data *d)
 {
-	struct nsp_gpio *chip =3D irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	unsigned gpio =3D d->hwirq;
 	u32 val =3D BIT(gpio);
 	u32 trigger_type;
@@ -189,7 +189,8 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
  */
 static void nsp_gpio_irq_set_mask(struct irq_data *d, bool unmask)
 {
-	struct nsp_gpio *chip =3D irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	unsigned gpio =3D d->hwirq;
 	u32 trigger_type;
=20
@@ -202,7 +203,8 @@ static void nsp_gpio_irq_set_mask(struct irq_data *d,=
 bool unmask)
=20
 static void nsp_gpio_irq_mask(struct irq_data *d)
 {
-	struct nsp_gpio *chip =3D irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	unsigned long flags;
=20
 	raw_spin_lock_irqsave(&chip->lock, flags);
@@ -212,7 +214,8 @@ static void nsp_gpio_irq_mask(struct irq_data *d)
=20
 static void nsp_gpio_irq_unmask(struct irq_data *d)
 {
-	struct nsp_gpio *chip =3D irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	unsigned long flags;
=20
 	raw_spin_lock_irqsave(&chip->lock, flags);
@@ -222,7 +225,8 @@ static void nsp_gpio_irq_unmask(struct irq_data *d)
=20
 static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	struct nsp_gpio *chip =3D irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
 	unsigned gpio =3D d->hwirq;
 	bool level_low;
 	bool falling;
@@ -265,16 +269,6 @@ static int nsp_gpio_irq_set_type(struct irq_data *d,=
 unsigned int type)
 	return 0;
 }
=20
-static struct irq_chip nsp_gpio_irq_chip =3D {
-	.name =3D "gpio-a",
-	.irq_enable =3D nsp_gpio_irq_unmask,
-	.irq_disable =3D nsp_gpio_irq_mask,
-	.irq_ack =3D nsp_gpio_irq_ack,
-	.irq_mask =3D nsp_gpio_irq_mask,
-	.irq_unmask =3D nsp_gpio_irq_unmask,
-	.irq_set_type =3D nsp_gpio_irq_set_type,
-};
-
 static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 {
 	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
@@ -322,13 +316,6 @@ static int nsp_gpio_get(struct gpio_chip *gc, unsign=
ed gpio)
 	return !!(readl(chip->base + NSP_GPIO_DATA_IN) & BIT(gpio));
 }
=20
-static int nsp_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
-
-	return irq_linear_revmap(chip->irq_domain, offset);
-}
-
 static int nsp_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	return 1;
@@ -613,10 +600,9 @@ static const struct of_device_id nsp_gpio_of_match[]=
 =3D {
 static int nsp_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
-	struct resource *res;
 	struct nsp_gpio *chip;
 	struct gpio_chip *gc;
-	u32 val, count;
+	u32 val;
 	int irq, ret;
=20
 	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &val)) {
@@ -631,15 +617,13 @@ static int nsp_gpio_probe(struct platform_device *p=
dev)
 	chip->dev =3D dev;
 	platform_set_drvdata(pdev, chip);
=20
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->base =3D devm_ioremap_resource(dev, res);
+	chip->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->base);
 	}
=20
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	chip->io_ctrl =3D devm_ioremap_resource(dev, res);
+	chip->io_ctrl =3D devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(chip->io_ctrl)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->io_ctrl);
@@ -659,44 +643,44 @@ static int nsp_gpio_probe(struct platform_device *p=
dev)
 	gc->direction_output =3D nsp_gpio_direction_output;
 	gc->set =3D nsp_gpio_set;
 	gc->get =3D nsp_gpio_get;
-	gc->to_irq =3D nsp_gpio_to_irq;
=20
 	/* optional GPIO interrupt support */
 	irq =3D platform_get_irq(pdev, 0);
 	if (irq > 0) {
-		/* Create irq domain so that each pin can be assigned an IRQ.*/
-		chip->irq_domain =3D irq_domain_add_linear(gc->of_node, gc->ngpio,
-							 &irq_domain_simple_ops,
-							 chip);
-		if (!chip->irq_domain) {
-			dev_err(&pdev->dev, "Couldn't allocate IRQ domain\n");
-			return -ENXIO;
-		}
+		struct gpio_irq_chip *girq;
+		struct irq_chip *irqc;
=20
-		/* Map each gpio to an IRQ and set the handler for gpiolib. */
-		for (count =3D 0; count < gc->ngpio; count++) {
-			int irq =3D irq_create_mapping(chip->irq_domain, count);
+		irqc =3D &chip->irqchip;
+		irqc->name =3D "gpio-a";
+		irqc->irq_ack =3D nsp_gpio_irq_ack;
+		irqc->irq_mask =3D nsp_gpio_irq_mask;
+		irqc->irq_unmask =3D nsp_gpio_irq_unmask;
+		irqc->irq_set_type =3D nsp_gpio_irq_set_type;
=20
-			irq_set_chip_and_handler(irq, &nsp_gpio_irq_chip,
-						 handle_simple_irq);
-			irq_set_chip_data(irq, chip);
-		}
+		val =3D readl(chip->base + NSP_CHIP_A_INT_MASK);
+		val =3D val | NSP_CHIP_A_GPIO_INT_BIT;
+		writel(val, (chip->base + NSP_CHIP_A_INT_MASK));
=20
 		/* Install ISR for this GPIO controller. */
-		ret =3D devm_request_irq(&pdev->dev, irq, nsp_gpio_irq_handler,
-				       IRQF_SHARED, "gpio-a", chip);
+		ret =3D devm_request_irq(dev, irq, nsp_gpio_irq_handler,
+				       IRQF_SHARED, "gpio-a", &chip->gc);
 		if (ret) {
 			dev_err(&pdev->dev, "Unable to request IRQ%d: %d\n",
 				irq, ret);
-			goto err_rm_gpiochip;
+			return ret;
 		}
=20
-		val =3D readl(chip->base + NSP_CHIP_A_INT_MASK);
-		val =3D val | NSP_CHIP_A_GPIO_INT_BIT;
-		writel(val, (chip->base + NSP_CHIP_A_INT_MASK));
+		girq =3D &chip->gc.irq;
+		girq->chip =3D irqc;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler =3D NULL;
+		girq->num_parents =3D 0;
+		girq->parents =3D NULL;
+		girq->default_type =3D IRQ_TYPE_NONE;
+		girq->handler =3D handle_simple_irq;
 	}
=20
-	ret =3D gpiochip_add_data(gc, chip);
+	ret =3D devm_gpiochip_add_data(dev, gc, chip);
 	if (ret < 0) {
 		dev_err(dev, "unable to add GPIO chip\n");
 		return ret;
@@ -705,15 +689,10 @@ static int nsp_gpio_probe(struct platform_device *p=
dev)
 	ret =3D nsp_gpio_register_pinconf(chip);
 	if (ret) {
 		dev_err(dev, "unable to register pinconf\n");
-		goto err_rm_gpiochip;
+		return ret;
 	}
=20
 	return 0;
-
-err_rm_gpiochip:
-	gpiochip_remove(gc);
-
-	return ret;
 }
=20
 static struct platform_driver nsp_gpio_driver =3D {
--=20
2.23.0

