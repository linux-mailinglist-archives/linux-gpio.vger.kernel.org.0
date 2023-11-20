Return-Path: <linux-gpio+bounces-264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D47117F1725
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 16:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 510B31F24EC7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D641CFBE;
	Mon, 20 Nov 2023 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxflux.de header.i=@luxflux.de header.b="pt6sunw3";
	dkim=permerror (0-bit key) header.d=luxflux.de header.i=@luxflux.de header.b="R1Dz9jPY"
X-Original-To: linux-gpio@vger.kernel.org
X-Greylist: delayed 963 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Nov 2023 07:18:34 PST
Received: from mailrelay4-3.pub.mailoutpod2-cph3.one.com (mailrelay4-3.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:503::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9CCC8
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 07:18:34 -0800 (PST)
X-HalOne-ID: d2e259de-87b5-11ee-825f-2dc64a403fa2
Received: from mailrelay5.pub.mailoutpod3-cph3.one.com (unknown [104.37.34.42])
	by mailrelay4 (Halon) with ESMTPS
	id d2e259de-87b5-11ee-825f-2dc64a403fa2;
	Mon, 20 Nov 2023 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=luxflux.de; s=rsa1;
	h=mime-version:content-transfer-encoding:content-type:date:to:from:subject:
	 message-id:from;
	bh=ebpCrqYrMT/uyG4AWj1nWIbU0GFc9hT8Hh2J2N48ncs=;
	b=pt6sunw3wC9BMO4+gS7ctLNe1dsDfYe2RJ8h2YfLbn9U0wKy3s0zwaqkyYlUoFEwqMtygsg99I/El
	 uroCMZwgCjW21g1NgeKePd5ySVjxPtBnac01BTvcwrB6mGfbLCp/tYwESvb8+U8/2oXIKOzJZ4jIlH
	 QwF4m9GfgRXaRB0ynnFKuTYehXDq2/aT3s3p/rJ8N9fZmaAge9MknV9DbeOD0TGQ89UwGkffukw1dB
	 fDU0f+9PH8Raj1bMG4WaPkY4S3X7FObEy6yDkkDM+GRdZkaiX3r08U4qO/MUDoW+y/HpnpU1nKcQZg
	 QyhbFuRDcnA3EqmeKzbZV+mJ7yVLobA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=luxflux.de; s=ed1;
	h=mime-version:content-transfer-encoding:content-type:date:to:from:subject:
	 message-id:from;
	bh=ebpCrqYrMT/uyG4AWj1nWIbU0GFc9hT8Hh2J2N48ncs=;
	b=R1Dz9jPY0tqSxN6NAUqmQP+rZV7BcnCvn2R3BjfL7afYM3+LJb1wIBGR3wJBp9o91brow8VwiKurB
	 nWEvfyCDQ==
X-HalOne-ID: d19abf82-87b5-11ee-9115-2b77c2ae2e64
Received: from pc001.ad.luxflux.de (unknown [212.71.215.41])
	by mailrelay5 (Halon) with ESMTPSA
	id d19abf82-87b5-11ee-9115-2b77c2ae2e64;
	Mon, 20 Nov 2023 15:02:29 +0000 (UTC)
Message-ID: <b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel@luxflux.de>
Subject: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H support
From: Christian Seiler <c.seiler@luxflux.de>
To: linux-gpio@vger.kernel.org
Date: Mon, 20 Nov 2023 16:02:28 +0100
Organization: LuxFlux GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The Advantech PCIe-1761H is a 8-channel relay and 8-channel isolated
digital input card. It provides 4 relays with NC/NO/COM connections,
4 relays with NO/COM connections, and 8 non-polar isolated digital inputs.
It supports interrupt generation and debouncing.

[Note to reviewers: this is my first submission of a Linux kernel driver,
and I don't expect the current code to be included as-is, hence the [RFC]
tag.

There is an out of tree driver for this card by the vendor themselves, but
that doesn't support the standard Linux GPIO interface. While I did look
at that driver's source code to figure out which registers are relevant
for this card, the code in this driver is either my own or taken from
various tutorials and other GPIO drivers that are part of the kernel. (The
vendor driver itself is marked MODULE_LICENSE("GPL"); though.) The vendor
driver also supports a variety of cards, but I can't test those, so I have
only implemented this specific model.

Additionally, I had an issue with the current git master branch (basically
6.7.0rc2); I had to fake-implement PIN_CONFIG_PERSIST_STATE in set_config,
otherwise GPIO_GET_LINEHANDLE_IOCTL would fail with -EOPNOTSUPP; this was
called via gpiolib's linehandle_create() invoking gpiolib's
gpiod_set_transitory(), which then invoke's the driver's set_config. I
believe other GPIO drivers that implement set_config but not PERSIST_STATE
(i.e. most of them) will currently also fail in the same manner, so I
don't think that gpiolib's current behavior here is intended.]

Signed-off-by: Christian Seiler <c.seiler@luxflux.de>
---
 MAINTAINERS                        |   6 +
 drivers/gpio/Kconfig               |  12 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-adv-pcie-1761h.c | 561 +++++++++++++++++++++++++++++
 4 files changed, 580 insertions(+)
 create mode 100644 drivers/gpio/gpio-adv-pcie-1761h.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..4b8498081426 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -528,6 +528,12 @@ S:	Maintained
 F:	Documentation/scsi/advansys.rst
 F:	drivers/scsi/advansys.c
=20
+ADVANTECH PCIE-1761H DRIVER
+M:	Christian Seiler <c.seiler@luxflux.de>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-adv-pcie-1761h.c
+
 ADVANTECH SWBTN DRIVER
 M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b3a133ed31ee..ba743f182346 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -138,6 +138,18 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
=20
+config GPIO_ADVANTECH_PCIE_1761H
+	tristate "Advantech PCIe-1761H GPIO"
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to build support for the Advantech PCIe-1761H
+	  industrial GPIO device.
+
+	  This driver does NOT support the older Advantech PCI-1761H. (PCI
+	  vs. PCI Express.)
+
+	  If driver is built as a module it will be called gpio-adv-pcie-1761h.
+
 config GPIO_ALTERA
 	tristate "Altera GPIO"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index eb73b5d633eb..280f4131aca0 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_GPIO_74X164)		+=3D gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+=3D gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)			+=3D gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+=3D gpio-adp5520.o
+obj-$(CONFIG_GPIO_ADVANTECH_PCIE_1761H) +=3D gpio-adv-pcie-1761h.o
 obj-$(CONFIG_GPIO_AGGREGATOR)		+=3D gpio-aggregator.o
 obj-$(CONFIG_GPIO_ALTERA_A10SR)		+=3D gpio-altera-a10sr.o
 obj-$(CONFIG_GPIO_ALTERA)  		+=3D gpio-altera.o
diff --git a/drivers/gpio/gpio-adv-pcie-1761h.c b/drivers/gpio/gpio-adv-pci=
e-1761h.c
new file mode 100644
index 000000000000..11cc0a0507a8
--- /dev/null
+++ b/drivers/gpio/gpio-adv-pcie-1761h.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GPIO driver for the Advantech PCIe-1761H device
+ * Copyright (C) 2023 Christian Seiler
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/pci.h>
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/bitops.h>
+
+#define ADVANTECH_VENDOR_ID 0x13fe
+#define PCIE1761H_PRODUCT_ID 0x0071
+
+#define PCIE1761H_META_BAR_INDEX 0
+#define PCIE1761H_META_BAR_SIZE 128
+#define PCIE1761H_CONTROL_BAR_INDEX 1
+#define PCIE1761H_CONTROL_BAR_SIZE 1024
+
+#define PCIE1761H_META_OFFSET_BOARD_ID 0x00
+#define PCIE1761H_META_OFFSET_PCB_VER 0x04
+#define PCIE1761H_META_OFFSET_FW_VER 0x08
+
+#define PCIE1761H_OFFSET_IRQFLAG 0x000
+#define PCIE1761H_OFFSET_DO 0x100
+#define PCIE1761H_OFFSET_DI 0x104
+
+#define PCIE1761H_OFFSET_DICTL_INT_FALLING_EDGE 0x162
+#define PCIE1761H_OFFSET_DICTL_INT_RISING_EDGE 0x163
+
+#define PCIE1761H_OFFSET_DICTL_DEBOUNCE_ENABLE 0x167
+#define PCIE1761H_OFFSET_DICTL_DEBOUNCE_TIME 0x16C
+
+static u8 adv_pcie_1761h_convert_debounce_timing(unsigned long time_us)
+{
+	/* Get the next power of 2, but only in a range from
+	 * 2^4 (16) to 2^17 (131072). The actual setting value
+	 * in the register then has an offset of 3. The mapping
+	 * is thus 7 -> 16us, 8 -> 32us, ..., 20 -> 131072 us.
+	 */
+	if (time_us > 0)
+		return (u8)clamp((int)fls_long(time_us - 1), 4, 17) + 3;
+	else
+		return 0;
+}
+
+static struct pci_device_id adv_pcie_1761h_ids[] =3D {
+	{ PCI_DEVICE(ADVANTECH_VENDOR_ID, PCIE1761H_PRODUCT_ID) },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, adv_pcie_1761h_ids);
+
+struct adv_pcie_1761h_gpiochip {
+	void __iomem *metadata_regs;
+	void __iomem *control_regs;
+	struct gpio_chip chip;
+
+	char pcb_version[16];
+	char firmware_version[16];
+	int board_id;
+	char gpiochip_label[32];
+
+	raw_spinlock_t lock;
+	u8 irq_enabled;
+	u8 irq_rising;
+	u8 irq_falling;
+	u8 irq_masked;
+	u8 debounce[8];
+};
+
+static struct adv_pcie_1761h_gpiochip *
+irq_data_to_adv_pcie_1761h_gpiochip(struct irq_data *data)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
+
+	return container_of(gc, struct adv_pcie_1761h_gpiochip, chip);
+}
+
+static void adv_pcie_1761h_set_multiple(struct gpio_chip *chip,
+					unsigned long *mask,
+					unsigned long *bits)
+{
+	u8 val;
+	struct adv_pcie_1761h_gpiochip *card =3D gpiochip_get_data(chip);
+
+	val =3D ioread8(card->control_regs + PCIE1761H_OFFSET_DO);
+	val =3D (val & *mask) | *bits;
+	iowrite8(val, card->control_regs + PCIE1761H_OFFSET_DO);
+}
+
+static void adv_pcie_1761h_set(struct gpio_chip *chip, unsigned int channe=
l,
+			       int value)
+{
+	unsigned long mask =3D 0, bits =3D 0;
+
+	if (channel >=3D 8)
+		return;
+
+	mask =3D ~(1 << channel);
+	bits =3D (value << channel);
+	adv_pcie_1761h_set_multiple(chip, &mask, &bits);
+}
+
+static int adv_pcie_1761h_get_multiple(struct gpio_chip *chip,
+				       unsigned long *mask, unsigned long *bits)
+{
+	u8 val_out;
+	u8 val_in;
+	unsigned long raw_state;
+	struct adv_pcie_1761h_gpiochip *card =3D gpiochip_get_data(chip);
+
+	val_out =3D ioread8(card->control_regs + PCIE1761H_OFFSET_DO);
+	val_in =3D ioread8(card->control_regs + PCIE1761H_OFFSET_DI);
+	raw_state =3D val_out | (val_in << 8);
+	*bits =3D (raw_state & *mask);
+	return 0;
+}
+
+static int adv_pcie_1761h_get(struct gpio_chip *chip, unsigned int channel=
)
+{
+	unsigned long mask =3D 0, bits =3D 0;
+
+	mask =3D (1 << channel);
+	adv_pcie_1761h_get_multiple(chip, &mask, &bits);
+	return bits ? 1 : 0;
+}
+
+static int adv_pcie_1761h_get_direction(struct gpio_chip *chip,
+					unsigned int channel)
+{
+	if (channel < 8)
+		return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_IN;
+}
+
+static int adv_pcie_1761h_direction_input(struct gpio_chip *chip,
+					  unsigned int channel)
+{
+	if (channel < 8 || channel >=3D 16)
+		return -EINVAL;
+	return 0;
+}
+
+static int adv_pcie_1761h_direction_output(struct gpio_chip *chip,
+					   unsigned int channel, int value)
+{
+	if (channel >=3D 8)
+		return -EINVAL;
+
+	adv_pcie_1761h_set(chip, channel, value);
+	return 0;
+}
+
+/* This function assumes that the lock has already been taken by the
+ * caller!
+ */
+static void adv_pcie_1761h_update_debounce(struct adv_pcie_1761h_gpiochip =
*card)
+{
+	/* The card has only a single debounce time setting for all
+	 * 8 inputs, but can enable debounce on each input
+	 * individually if necessary. We always use the max debounce
+	 * time across all inputs for the debounce time register.
+	 */
+	u8 max_debounce =3D 0;
+
+	for (int i =3D 0; i < 8; ++i)
+		max_debounce =3D max(card->debounce[i], max_debounce);
+	iowrite8(max_debounce,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_DEBOUNCE_TIME);
+}
+
+static int adv_pcie_1761h_set_debounce(struct gpio_chip *chip,
+				       unsigned int channel,
+				       unsigned long time_us)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D gpiochip_get_data(chip);
+	u8 debounce_value =3D adv_pcie_1761h_convert_debounce_timing(time_us);
+	u8 mask =3D BIT(channel - 8);
+	u8 enable;
+	unsigned long flags;
+
+	if (channel < 8 || channel >=3D 16)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&card->lock, flags);
+	enable =3D ioread8(card->control_regs +
+			 PCIE1761H_OFFSET_DICTL_DEBOUNCE_ENABLE);
+	if (time_us > 0)
+		enable |=3D mask;
+	else
+		enable &=3D ~mask;
+	iowrite8(enable,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_DEBOUNCE_ENABLE);
+	card->debounce[channel - 8] =3D debounce_value;
+	adv_pcie_1761h_update_debounce(card);
+	raw_spin_unlock_irqrestore(&card->lock, flags);
+
+	return 0;
+}
+
+static int adv_pcie_1761h_set_config(struct gpio_chip *chip,
+				     unsigned int channel, unsigned long config)
+{
+	enum pin_config_param param =3D pinconf_to_config_param(config);
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return adv_pcie_1761h_set_debounce(
+			chip, channel, pinconf_to_config_argument(config));
+	case PIN_CONFIG_PERSIST_STATE:
+		/* FIXME: pretend that we support this via software, even
+		 * though this can only be changed via a dip switch on the
+		 * actual board, and we (probably) can't even read out the
+		 * current setting.
+		 */
+		return 0;
+
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const char *const adv_pcie_1761h_line_names[] =3D {
+	"RELAY0", "RELAY1", "RELAY2", "RELAY3", "RELAY4", "RELAY5",
+	"RELAY6", "RELAY7", "IDI0",   "IDI1",	"IDI2",	  "IDI3",
+	"IDI4",	  "IDI5",   "IDI6",   "IDI7",
+};
+
+static const struct gpio_chip template_chip =3D {
+	.owner =3D THIS_MODULE,
+	.get_direction =3D adv_pcie_1761h_get_direction,
+	.direction_input =3D adv_pcie_1761h_direction_input,
+	.direction_output =3D adv_pcie_1761h_direction_output,
+	.set_config =3D adv_pcie_1761h_set_config,
+	.set =3D adv_pcie_1761h_set,
+	.set_multiple =3D adv_pcie_1761h_set_multiple,
+	.get =3D adv_pcie_1761h_get,
+	.get_multiple =3D adv_pcie_1761h_get_multiple,
+	.base =3D -1,
+	.ngpio =3D 16,
+	.names =3D adv_pcie_1761h_line_names,
+	.can_sleep =3D false,
+};
+
+/* This function assumes that the lock has already been taken by the
+ * caller!
+ */
+static void adv_pcie_1761h_update_irq(struct adv_pcie_1761h_gpiochip *card=
)
+{
+	u8 new_rising =3D card->irq_enabled & card->irq_rising &
+			~card->irq_masked;
+	u8 new_falling =3D card->irq_enabled & card->irq_falling &
+			 ~card->irq_masked;
+	iowrite8(new_rising,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_INT_RISING_EDGE);
+	iowrite8(new_falling,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_INT_FALLING_EDGE);
+}
+
+static void adv_pcie_1761h_irq_ack(struct irq_data *data)
+{
+}
+
+static void adv_pcie_1761h_irq_unmask(struct irq_data *data)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D
+		irq_data_to_adv_pcie_1761h_gpiochip(data);
+	unsigned long channel =3D irqd_to_hwirq(data);
+	u8 mask =3D BIT(channel - 8);
+	unsigned long flags;
+
+	gpiochip_enable_irq(&card->chip, irqd_to_hwirq(data));
+	raw_spin_lock_irqsave(&card->lock, flags);
+	card->irq_masked |=3D mask;
+	adv_pcie_1761h_update_irq(card);
+	raw_spin_unlock_irqrestore(&card->lock, flags);
+}
+
+static void adv_pcie_1761h_irq_mask(struct irq_data *data)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D
+		irq_data_to_adv_pcie_1761h_gpiochip(data);
+	unsigned long channel =3D irqd_to_hwirq(data);
+	u8 mask =3D BIT(channel - 8);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&card->lock, flags);
+	card->irq_masked &=3D ~mask;
+	adv_pcie_1761h_update_irq(card);
+	raw_spin_unlock_irqrestore(&card->lock, flags);
+	gpiochip_disable_irq(&card->chip, channel);
+}
+
+static void adv_pcie_1761h_irq_enable(struct irq_data *data)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D
+		irq_data_to_adv_pcie_1761h_gpiochip(data);
+	unsigned long channel =3D irqd_to_hwirq(data);
+	u8 mask =3D BIT(channel - 8);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&card->lock, flags);
+	card->irq_enabled |=3D mask;
+	adv_pcie_1761h_update_irq(card);
+	raw_spin_unlock_irqrestore(&card->lock, flags);
+}
+
+static void adv_pcie_1761h_irq_disable(struct irq_data *data)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D
+		irq_data_to_adv_pcie_1761h_gpiochip(data);
+	unsigned long channel =3D irqd_to_hwirq(data);
+	u8 mask =3D BIT(channel - 8);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&card->lock, flags);
+	card->irq_enabled &=3D ~mask;
+	adv_pcie_1761h_update_irq(card);
+	raw_spin_unlock_irqrestore(&card->lock, flags);
+}
+
+static int adv_pcie_1761h_irq_set_type(struct irq_data *data,
+				       unsigned int flow_type)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D
+		irq_data_to_adv_pcie_1761h_gpiochip(data);
+	unsigned long channel =3D irqd_to_hwirq(data);
+	u8 mask =3D BIT(channel - 8);
+	unsigned long flags;
+
+	if (channel < 8 || channel >=3D 16)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&card->lock, flags);
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		card->irq_rising |=3D mask;
+		card->irq_falling &=3D ~mask;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		card->irq_rising &=3D ~mask;
+		card->irq_falling |=3D mask;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		card->irq_rising |=3D mask;
+		card->irq_falling |=3D mask;
+		break;
+	default:
+		return -EINVAL;
+	}
+	adv_pcie_1761h_update_irq(card);
+	raw_spin_unlock_irqrestore(&card->lock, flags);
+	return 0;
+}
+
+static const struct irq_chip adv_pcie_1761h_gpio_irqchip =3D {
+	.name =3D "gpio-adv-pcie-1761h",
+	.irq_enable =3D adv_pcie_1761h_irq_enable,
+	.irq_disable =3D adv_pcie_1761h_irq_disable,
+	.irq_ack =3D adv_pcie_1761h_irq_ack,
+	.irq_mask =3D adv_pcie_1761h_irq_mask,
+	.irq_unmask =3D adv_pcie_1761h_irq_unmask,
+	.irq_set_type =3D adv_pcie_1761h_irq_set_type,
+	.flags =3D IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
+{
+	struct adv_pcie_1761h_gpiochip *card =3D data;
+	unsigned long pending;
+
+	if (card =3D=3D NULL)
+		return IRQ_HANDLED;
+
+	/* Read out which lines were set */
+	raw_spin_lock(&card->lock);
+	pending =3D ioread32(card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
+	raw_spin_unlock(&card->lock);
+
+	if (!pending)
+		return IRQ_NONE;
+
+	for_each_set_bit(irq, &pending, card->chip.ngpio - 8)
+		generic_handle_domain_irq(card->chip.irq.domain, irq + 8);
+
+	/* Reset the IRQ flags for those lines */
+	raw_spin_lock(&card->lock);
+	iowrite32(pending, card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
+	raw_spin_unlock(&card->lock);
+
+	return IRQ_HANDLED;
+}
+
+static int adv_pcie_1761h_probe(struct pci_dev *pdev,
+				const struct pci_device_id *id)
+{
+	struct device *const dev =3D &pdev->dev;
+	struct adv_pcie_1761h_gpiochip *card;
+	int err;
+	u32 pcb_ver, fw_ver;
+	struct gpio_irq_chip *girq;
+
+	err =3D pci_resource_len(pdev, PCIE1761H_META_BAR_INDEX);
+	if (err !=3D PCIE1761H_META_BAR_SIZE) {
+		dev_err(dev,
+			"Unsupported BAR%d size %d for Advantech PCIe-1761H (Expected %d)\n",
+			PCIE1761H_META_BAR_INDEX, err, PCIE1761H_META_BAR_SIZE);
+		return -1;
+	}
+	err =3D pci_resource_len(pdev, PCIE1761H_CONTROL_BAR_INDEX);
+	if (err !=3D PCIE1761H_CONTROL_BAR_SIZE) {
+		dev_err(dev,
+			"Unsupported BAR%d size %d for Advantech PCIe-1761H (Expected %d)\n",
+			PCIE1761H_CONTROL_BAR_INDEX, err,
+			PCIE1761H_CONTROL_BAR_SIZE);
+		return -1;
+	}
+
+	err =3D pcim_enable_device(pdev);
+	if (err < 0) {
+		dev_err(dev, "could not enable the device\n");
+		return err;
+	}
+
+	err =3D pcim_iomap_regions(pdev,
+				 BIT(PCIE1761H_META_BAR_INDEX) |
+					 BIT(PCIE1761H_CONTROL_BAR_INDEX),
+				 KBUILD_MODNAME);
+	if (err < 0) {
+		dev_err(dev, "could not map BAR%d/BAR%d of device\n",
+			PCIE1761H_META_BAR_INDEX, PCIE1761H_CONTROL_BAR_INDEX);
+		return err;
+	}
+
+	card =3D devm_kzalloc(dev, sizeof(struct adv_pcie_1761h_gpiochip),
+			    GFP_KERNEL);
+	if (card =3D=3D NULL)
+		return -ENOMEM;
+
+	card->metadata_regs =3D pcim_iomap_table(pdev)[PCIE1761H_META_BAR_INDEX];
+	if (card->metadata_regs =3D=3D NULL) {
+		dev_err(dev, "invalid pointer for BAR%d\n",
+			PCIE1761H_META_BAR_INDEX);
+		return -1;
+	}
+	card->control_regs =3D
+		pcim_iomap_table(pdev)[PCIE1761H_CONTROL_BAR_INDEX];
+	if (card->control_regs =3D=3D NULL) {
+		dev_err(dev,
+			"invalid pointer for BAR%d\n",
+			PCIE1761H_CONTROL_BAR_INDEX);
+		return -1;
+	}
+
+	/* The board id is a 4bit number that the user can set via a
+	 * set of dip switches on the board; this can be used to
+	 * distinguish multiple boards of the same type in the system.
+	 * We'll encode the board id in the chip label so that
+	 * userspace still has access to that information.
+	 */
+	card->board_id =3D
+		ioread8(card->metadata_regs + PCIE1761H_META_OFFSET_BOARD_ID) &
+		0x0f;
+	snprintf(card->gpiochip_label, sizeof(card->gpiochip_label),
+		 "adv-pcie-1761h:%d", card->board_id);
+
+	/* Format the version numbers in the same manner as
+	 * the Advantech software displays them on Windows.
+	 */
+	pcb_ver =3D ioread32(card->metadata_regs + PCIE1761H_META_OFFSET_PCB_VER)=
;
+	snprintf(card->pcb_version, sizeof(card->pcb_version), "%02X %02d-%d",
+		 (pcb_ver >> 16) & 0xff, (pcb_ver >> 8) & 0xff, pcb_ver & 0xf);
+	fw_ver =3D ioread32(card->metadata_regs + PCIE1761H_META_OFFSET_FW_VER);
+	snprintf(card->firmware_version, sizeof(card->firmware_version),
+		 "%d.%d.%d.%d", (fw_ver >> 24) & 0xff, (fw_ver >> 16) & 0xff,
+		 (fw_ver >> 8) & 0xff, fw_ver & 0xff);
+
+	dev_info(dev,
+		 "Found Advantech PCIe-1761H with PCB version %s, firmware version %s, b=
oard id %d\n",
+		 card->pcb_version, card->firmware_version, card->board_id);
+
+	pci_set_drvdata(pdev, card);
+
+	card->chip =3D template_chip;
+	card->chip.label =3D card->gpiochip_label;
+	card->chip.parent =3D dev;
+
+	girq =3D &card->chip.irq;
+	gpio_irq_chip_set_chip(girq, &adv_pcie_1761h_gpio_irqchip);
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler =3D NULL;
+	girq->num_parents =3D 0;
+	girq->parents =3D NULL;
+	girq->default_type =3D IRQ_TYPE_NONE;
+	girq->handler =3D handle_edge_irq;
+
+	raw_spin_lock_init(&card->lock);
+
+	/* Disable interrupts on the device in case they were still
+	 * active previously.
+	 */
+	iowrite8(0x00,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_INT_RISING_EDGE);
+	iowrite8(0x00,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_INT_FALLING_EDGE);
+	card->irq_enabled =3D 0;
+	card->irq_rising =3D 0xff;
+	card->irq_falling =3D 0;
+	card->irq_masked =3D 0;
+
+	/* Reset any interrupts that may have still been pending in the
+	 * device.
+	 */
+	iowrite32(0xff, card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
+
+	/* Disable the debounce logic, so that we are in a well-defined
+	 * state every time we start up.
+	 */
+	iowrite8(0,
+		 card->control_regs + PCIE1761H_OFFSET_DICTL_DEBOUNCE_ENABLE);
+	iowrite8(0, card->control_regs + PCIE1761H_OFFSET_DICTL_DEBOUNCE_TIME);
+
+	/* Don't reset the DO states here, because the card has a dip
+	 * switch that can be used to tell it to remember the last DO
+	 * state upon powering on; if the user selected that mode we
+	 * don't want to blindly reset that state.
+	 */
+
+	err =3D devm_gpiochip_add_data(dev, &card->chip, card);
+	if (err < 0) {
+		dev_err(dev, "can't initialize gpiochip\n");
+		return err;
+	}
+
+	err =3D devm_request_irq(dev, pdev->irq, adv_pcie_1761h_irq_handler,
+			       IRQF_SHARED, KBUILD_MODNAME, card);
+	if (err) {
+		dev_err(dev, "can't set up interrupt handler\n");
+		return err;
+	}
+	return 0;
+}
+
+static struct pci_driver adv_pcie_1761h_driver =3D {
+	.name =3D "gpio-adv-pcie-1761h",
+	.id_table =3D adv_pcie_1761h_ids,
+	.probe =3D adv_pcie_1761h_probe,
+};
+
+module_pci_driver(adv_pcie_1761h_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Seiler <c.seiler@luxflux.de>");
+MODULE_DESCRIPTION("Advantech PCIe-1761H GPIO driver");
--=20
2.39.2



