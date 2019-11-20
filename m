Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 989821034BE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 08:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfKTHAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 02:00:21 -0500
Received: from mail-eopbgr740089.outbound.protection.outlook.com ([40.107.74.89]:10070
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725854AbfKTHAU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 02:00:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBtpIfx/nfi69C8xH8rmU2kOW/OokNaS6aUSTbV4ZCfZRljv/CAM/nMNO+3UUoJ2GGA0HRsVa11DwdfOAemy//HrTQPQl+7xi9IoTzNz+7WD18A7zmXD7RAwyzSdLJ24HB0jZ6a31Luq6sss+4aAkQCsnAkQhwC8woMm+oFoBAhOmaQfAiCaWZBOg+u2HZvafs5aAe37Z/t/riPXoqklapBygjGljmX4AVL4fYAfOBesuaJ6UoJ8zD7utjObBkuZm/3pcF4Ltsmj8vAGuPoSP/nJTurPUdGmU8QDFJyuvoa9VQmBxGzx5PUTVRRPBtQUPxGMOz/AWqBjbH2qEmC9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAcKBpV3Htwgn7F/RHYKPBRsx8XBkETN5f60QQms1Dk=;
 b=CDR3MTbGXGUMkJRXCM4jKYYBTWsgtflSwqih8hEMABLYdwYIqck8df92gKUl2+xPXziv6xTYkR0LPIBNUmLIp+9hqBJtj9yGwHL8J/D8ZDfH5dkMQRuC4PhwENQ9MWHXUfpLA6Gg1Tl2uOjtrqiF4JOd2iQJBB4gNIauxk7VY2mduTtcPLpC6+MFSDeAeFkNxGQd/5WbMf5+pf/AiXlLYmJ8ecda4KHQBsWWIxD/6FofVykUomkKqB4aSdS876zINVaqDBDIArS2gVNLGer6PI2mIg9+FXiM2PPjSIHB4804VGwWOHYw0kFzD447q4Oj9OkKMZGqRcQ/1TkMFbCpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAcKBpV3Htwgn7F/RHYKPBRsx8XBkETN5f60QQms1Dk=;
 b=rYhNFu5zy4PFOVs8zbDZcGWhJRvhtlhHkIAF71mPVyWmwhPO/BdmODBi2sfxaAAslWMschTC7wVMyEajh4pAr1QJ2wUTMvu/qLVzx37aKlUw2kCe5mIlE+2B2Mq7eB4JJn5YDdyjLepKxFqUKLInPkWnA5vxZXcSYItV6alo+aY=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3415.namprd13.prod.outlook.com (52.132.246.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8; Wed, 20 Nov 2019 06:59:42 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 06:59:42 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>
CC:     "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 4/5] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Topic: [PATCH v2 4/5] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Index: AQHVn3AVOu1YvEqrSUK2kxGeF7Rovw==
Date:   Wed, 20 Nov 2019 06:59:42 +0000
Message-ID: <1574233128-28114-5-git-send-email-yash.shah@sifive.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::28) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5e9b2fa-a74f-40e4-a3e0-08d76d8737a3
x-ms-traffictypediagnostic: CH2PR13MB3415:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3415934C7BFC42E432641D168C4F0@CH2PR13MB3415.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(39840400004)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(486006)(71200400001)(316002)(8676002)(6636002)(71190400001)(7416002)(8936002)(25786009)(99286004)(2906002)(54906003)(52116002)(76176011)(50226002)(2501003)(478600001)(110136005)(66066001)(86362001)(36756003)(81156014)(81166006)(386003)(6506007)(26005)(4326008)(102836004)(5660300002)(6512007)(476003)(446003)(11346002)(6486002)(186003)(2616005)(6116002)(3846002)(7736002)(305945005)(6436002)(66476007)(66446008)(66946007)(66556008)(14444005)(44832011)(64756008)(107886003)(256004)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3415;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s9qBylCBdRLousmUGLWEDXaIgqFaqGx2DImm5OfCRdjPMWI7F0A/YMLTGjduEmLyKr8DsqtHKgZrn14R6fGdoJFAfIL0SGJfIo0L4rO1t/FQ/P+8uavo5Yivrh6odLft+K6zCZNvSLsrEvJoSeto9flDh4rvup3DBPTuW62xNy7EXu/Rg/1ebSCksdCKD8QMzWINcafjbEboz9ruXBx8VCY/K4KqFsmhvpYfcRxx4faJv+5KQw1PMEUsdCTWGpIA/I6YLWC3QWLFZnhDKb1iL4V2omC/sMMPjscUfAuJfGxaT1D6YqWqx2RHxghxThaU+8qfhgcTx80+urPAFFOtWoDo6IfIiFU9lz0AoYE2lz7AFNZHcexM6S0GwQ7mra4zCHBKQfycYyU25/yKhzJ6Vin21kaR7/U2grZokppyzFYHZ0FXB4rOcpAQODkvBCNh
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e9b2fa-a74f-40e4-a3e0-08d76d8737a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 06:59:42.0606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +p4FfUBtLsVxwQ7F2sZ7fReiFfau3QUlc836E6EztLgWHOiBZoA3y8GOCZpf6oM1zejf7aFFVwHwvz3IL8xqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3415
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds the GPIO driver for SiFive RISC-V SoCs.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Various fixes and code cleanup]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/gpio/Kconfig       |   9 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-sifive.c | 256 +++++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 266 insertions(+)
 create mode 100644 drivers/gpio/gpio-sifive.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e..05e8a41 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -453,6 +453,15 @@ config GPIO_SAMA5D2_PIOBU
 	  The difference from regular GPIOs is that they
 	  maintain their value during backup/self-refresh.
=20
+config GPIO_SIFIVE
+	bool "SiFive GPIO support"
+	depends on OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Say yes here to support the GPIO device on SiFive SoCs.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c..bf7984e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_ARCH_SA1100)		+=3D gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+=3D gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+=3D gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+=3D gpio-sch.o
+obj-$(CONFIG_GPIO_SIFIVE)		+=3D gpio-sifive.o
 obj-$(CONFIG_GPIO_SIOX)			+=3D gpio-siox.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+=3D gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+=3D gpio-spear-spics.o
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
new file mode 100644
index 0000000..02666ae
--- /dev/null
+++ b/drivers/gpio/gpio-sifive.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 SiFive
+ */
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/of_irq.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+
+#define GPIO_INPUT_VAL	0x00
+#define GPIO_INPUT_EN	0x04
+#define GPIO_OUTPUT_EN	0x08
+#define GPIO_OUTPUT_VAL	0x0C
+#define GPIO_RISE_IE	0x18
+#define GPIO_RISE_IP	0x1C
+#define GPIO_FALL_IE	0x20
+#define GPIO_FALL_IP	0x24
+#define GPIO_HIGH_IE	0x28
+#define GPIO_HIGH_IP	0x2C
+#define GPIO_LOW_IE	0x30
+#define GPIO_LOW_IP	0x34
+#define GPIO_OUTPUT_XOR	0x40
+
+#define MAX_GPIO		32
+#define SIFIVE_GPIO_IRQ_OFFSET	7
+
+struct sifive_gpio {
+	void __iomem		*base;
+	struct gpio_chip	gc;
+	struct regmap		*regs;
+	u32			enabled;
+	unsigned int		trigger[MAX_GPIO];
+	unsigned int		irq_parent[MAX_GPIO];
+};
+
+static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
+{
+	unsigned long flags;
+	unsigned int trigger;
+
+	spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
+	trigger =3D (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;
+	regmap_update_bits(chip->regs, GPIO_RISE_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
+	regmap_update_bits(chip->regs, GPIO_FALL_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_EDGE_FALLING) ? BIT(offset) : 0);
+	regmap_update_bits(chip->regs, GPIO_HIGH_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
+	regmap_update_bits(chip->regs, GPIO_LOW_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
+	spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
+}
+
+static int sifive_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip =3D gpiochip_get_data(gc);
+	int offset =3D irqd_to_hwirq(d);
+
+	if (offset < 0 || offset >=3D gc->ngpio)
+		return -EINVAL;
+
+	chip->trigger[offset] =3D trigger;
+	sifive_set_ie(chip, offset);
+	return 0;
+}
+
+static void sifive_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip =3D gpiochip_get_data(gc);
+	int offset =3D irqd_to_hwirq(d) % MAX_GPIO;
+	u32 bit =3D BIT(offset);
+	unsigned long flags;
+
+	irq_chip_enable_parent(d);
+
+	/* Switch to input */
+	gc->direction_input(gc, offset);
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	/* Clear any sticky pending interrupts */
+	regmap_write(chip->regs, GPIO_RISE_IP, bit);
+	regmap_write(chip->regs, GPIO_FALL_IP, bit);
+	regmap_write(chip->regs, GPIO_HIGH_IP, bit);
+	regmap_write(chip->regs, GPIO_LOW_IP, bit);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	/* Enable interrupts */
+	assign_bit(offset, (unsigned long *)&chip->enabled, 1);
+	sifive_set_ie(chip, offset);
+}
+
+static void sifive_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip =3D gpiochip_get_data(gc);
+	int offset =3D irqd_to_hwirq(d) % MAX_GPIO;
+
+	assign_bit(offset, (unsigned long *)&chip->enabled, 0);
+	sifive_set_ie(chip, offset);
+	irq_chip_disable_parent(d);
+}
+
+static void sifive_irq_eoi(struct irq_data *d)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip =3D gpiochip_get_data(gc);
+	int offset =3D irqd_to_hwirq(d) % MAX_GPIO;
+	u32 bit =3D BIT(offset);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	/* Clear all pending interrupts */
+	regmap_write(chip->regs, GPIO_RISE_IP, bit);
+	regmap_write(chip->regs, GPIO_FALL_IP, bit);
+	regmap_write(chip->regs, GPIO_HIGH_IP, bit);
+	regmap_write(chip->regs, GPIO_LOW_IP, bit);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	irq_chip_eoi_parent(d);
+}
+
+static struct irq_chip sifive_irqchip =3D {
+	.name		=3D "sifive-gpio",
+	.irq_set_type	=3D sifive_irq_set_type,
+	.irq_mask	=3D irq_chip_mask_parent,
+	.irq_unmask	=3D irq_chip_unmask_parent,
+	.irq_enable	=3D sifive_irq_enable,
+	.irq_disable	=3D sifive_irq_disable,
+	.irq_eoi	=3D sifive_irq_eoi,
+};
+
+static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					     unsigned int child,
+					     unsigned int child_type,
+					     unsigned int *parent,
+					     unsigned int *parent_type)
+{
+	*parent_type =3D IRQ_TYPE_NONE;
+	*parent =3D child + SIFIVE_GPIO_IRQ_OFFSET;
+	return 0;
+}
+
+static const struct regmap_config sifive_gpio_regmap_config =3D {
+	.reg_bits =3D 32,
+	.reg_stride =3D 4,
+	.val_bits =3D 32,
+	.fast_io =3D true,
+	.disable_locking =3D true,
+};
+
+static int sifive_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *node =3D pdev->dev.of_node;
+	struct device_node *irq_parent;
+	struct irq_domain *parent;
+	struct gpio_irq_chip *girq;
+	struct sifive_gpio *chip;
+	struct resource *res;
+	unsigned long flags;
+	int ret, ngpio;
+
+	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->base)) {
+		dev_err(dev, "failed to allocate device memory\n");
+		return PTR_ERR(chip->base);
+	}
+
+	chip->regs =3D devm_regmap_init_mmio(dev, chip->base,
+					   &sifive_gpio_regmap_config);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	ngpio =3D of_irq_count(node);
+	if (ngpio >=3D MAX_GPIO) {
+		dev_err(dev, "Too many GPIO interrupts (max=3D%d)\n", MAX_GPIO);
+		return -ENXIO;
+	}
+
+	irq_parent =3D of_irq_find_parent(node);
+	if (!irq_parent) {
+		dev_err(dev, "no IRQ parent node\n");
+		return -ENODEV;
+	}
+	parent =3D irq_find_host(irq_parent);
+	if (!parent) {
+		dev_err(dev, "no IRQ parent domain\n");
+		return -ENODEV;
+	}
+
+	ret =3D bgpio_init(&chip->gc, dev, 4,
+			 chip->base + GPIO_INPUT_VAL,
+			 chip->base + GPIO_OUTPUT_VAL,
+			 NULL,
+			 chip->base + GPIO_OUTPUT_EN,
+			 chip->base + GPIO_INPUT_EN,
+			 0);
+	if (ret) {
+		dev_err(dev, "unable to init generic GPIO\n");
+		return ret;
+	}
+
+	spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
+	/* Disable all GPIO interrupts before enabling parent interrupts */
+	regmap_write(chip->regs, GPIO_RISE_IE, 0);
+	regmap_write(chip->regs, GPIO_FALL_IE, 0);
+	regmap_write(chip->regs, GPIO_HIGH_IE, 0);
+	regmap_write(chip->regs, GPIO_LOW_IE, 0);
+	spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
+	chip->enabled =3D 0;
+
+	chip->gc.base =3D -1;
+	chip->gc.ngpio =3D ngpio;
+	chip->gc.label =3D dev_name(dev);
+	chip->gc.parent =3D dev;
+	chip->gc.owner =3D THIS_MODULE;
+	girq =3D &chip->gc.irq;
+	girq->chip =3D &sifive_irqchip;
+	girq->fwnode =3D of_node_to_fwnode(node);
+	girq->parent_domain =3D parent;
+	girq->child_to_parent_hwirq =3D sifive_gpio_child_to_parent_hwirq;
+	girq->handler =3D handle_bad_irq;
+	girq->default_type =3D IRQ_TYPE_NONE;
+
+	platform_set_drvdata(pdev, chip);
+	return gpiochip_add_data(&chip->gc, chip);
+}
+
+static const struct of_device_id sifive_gpio_match[] =3D {
+	{ .compatible =3D "sifive,gpio0" },
+	{ .compatible =3D "sifive,fu540-c000-gpio" },
+	{ },
+};
+
+static struct platform_driver sifive_gpio_driver =3D {
+	.probe		=3D sifive_gpio_probe,
+	.driver =3D {
+		.name	=3D "sifive_gpio",
+		.of_match_table =3D of_match_ptr(sifive_gpio_match),
+	},
+};
+builtin_platform_driver(sifive_gpio_driver)
--=20
2.7.4

