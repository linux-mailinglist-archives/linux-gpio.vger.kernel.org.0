Return-Path: <linux-gpio+bounces-11104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56CA996B6A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 15:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0665AB20CD5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 13:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DCC192B77;
	Wed,  9 Oct 2024 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="vXLSgg7q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D322EEF;
	Wed,  9 Oct 2024 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479533; cv=none; b=Qogp0lsUdyutBawBmjqpOhOkN/vxhMMJD//R141WHk49TxA53kdSutZdZ8d2h1Le+F0paa1vPACmuuyughtXJC9vrOL3t3FVYBDIK8dlcpRMPUSHwxGIhLHilwQWghCzwvEecHl1gXZrmMaS9ViVehy/UFgBKofMXVkdyA6QruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479533; c=relaxed/simple;
	bh=Xw7MrZeIpxhsngrgGPwG1JyfKzwbBGL+HHoX/J3AEpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1yrPRBqzJd26wrCls9KrmJ0DXqz9ZmOdX6MkbRUEEP0qzYMojdSPfwIqo8NB3fMgWIKZ0kJNdOk0JYZ+JiYI+yVMRAEiiDfhmcvvGi+am0AnwrPWtKkDlmyc65JvLjoet1B03tUQQDuUU3hwt83oYtSANU0wyuZ+1FDQxHn5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=vXLSgg7q; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 1FEF840F09A7;
	Wed,  9 Oct 2024 09:12:03 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1728479522; x=1730293923; bh=Xw7MrZeIpxhsngrgGPwG1JyfKzwbBGL+HHo
	X/J3AEpU=; b=vXLSgg7qK1lzkCNAbb2K1pIUBYr6PwfCP6YmtS63yXuoPvwHQn0
	VuuXl5Kd+49YgAO9/rBYDiJ2xVvRbAW6CF61/58yAbm8Y2eUUWMZgGlb5A1LOJIZ
	g99fX8QkdJga/P9zGeQRw78VnOZuM+MG4iBc+r5FAvSK7MNDg9wIM010=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MX4-nzqQHPH3; Wed,  9 Oct 2024 09:12:02 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id ED7CF45735E9;
	Wed,  9 Oct 2024 09:12:01 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v5] gpio: add support for FTDI's MPSSE as GPIO
Date: Wed,  9 Oct 2024 09:11:31 -0400
Message-ID: <20241009131131.1618329-1-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FTDI FT2232H is a USB to GPIO chip. Sealevel produces some devices
with this chip. FT2232H presents itself as a composite device with two
interfaces (each is an "MPSSE"). Each MPSSE has two banks (high and low)
of 8 GPIO each. I believe some MPSSE's have only one bank, but I don't
know how to identify them (I don't have any for testing) and as a result
are unsupported for the time being.

Additionally, this driver provides software polling-based interrupts for
edge detection. For the Sealevel device I have to test with, this works
well because there is hardware debouncing. From talking to Sealevel's
people, this is their preferred way to do edge detection.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(Resent because I forgot to cc gregkh last time)
Changes since v3:
* Use devm to manage ida (de)allocation (thanks Bartosz)
* Address whitespace nits (thanks Bartosz)

 drivers/gpio/Kconfig      |   7 +
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-mpsse.c | 522 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 530 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpsse.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..cbe3baa1b3de 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1844,6 +1844,13 @@ config GPIO_VIPERBOARD
 	  River Tech's viperboard.h for detailed meaning
 	  of the module parameters.
=20
+config GPIO_MPSSE
+	tristate "FTDI MPSSE GPIO support"
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO driver for FTDI's MPSSE interface. These can do input and
+	  output. Each MPSSE provides 16 IO pins.
+
 endmenu
=20
 menu "Virtual GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1429e8c0229b..cc5d5519ba4b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -114,6 +114,7 @@ obj-$(CONFIG_GPIO_MOCKUP)		+=3D gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXTET)		+=3D gpio-moxtet.o
 obj-$(CONFIG_GPIO_MPC5200)		+=3D gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+=3D gpio-mpc8xxx.o
+obj-$(CONFIG_GPIO_MPSSE)		+=3D gpio-mpsse.o
 obj-$(CONFIG_GPIO_MSC313)		+=3D gpio-msc313.o
 obj-$(CONFIG_GPIO_MT7621)		+=3D gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+=3D gpio-mvebu.o
diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
new file mode 100644
index 000000000000..3ab6651d2226
--- /dev/null
+++ b/drivers/gpio/gpio-mpsse.c
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * FTDI MPSSE GPIO support
+ *
+ * Based on code by Anatolij Gustschin
+ *
+ * Copyright (C) 2024 Mary Strodl <mstrodl@csh.rit.edu>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/mutex.h>
+#include <linux/usb.h>
+
+struct mpsse_priv {
+	struct gpio_chip gpio;
+	struct usb_device *udev;     /* USB device encompassing all MPSSEs */
+	struct usb_interface *intf;  /* USB interface for this MPSSE */
+	u8 intf_id;                  /* USB interface number for this MPSSE */
+	struct work_struct irq_work; /* polling work thread */
+	struct mutex irq_mutex;	     /* lock over irq_data */
+	atomic_t irq_type[16];	     /* pin -> edge detection type */
+	atomic_t irq_enabled;
+	int id;
+
+	u8 gpio_outputs[2];	     /* Output states for GPIOs [L, H] */
+	u8 gpio_dir[2];		     /* Directions for GPIOs [L, H] */
+
+	u8 *bulk_in_buf;	     /* Extra recv buffer to grab status bytes */
+
+	struct usb_endpoint_descriptor *bulk_in;
+	struct usb_endpoint_descriptor *bulk_out;
+
+	struct mutex io_mutex;	    /* sync I/O with disconnect */
+};
+
+struct bulk_desc {
+	bool tx;	            /* direction of bulk transfer */
+	u8 *data;                   /* input (tx) or output (rx) */
+	int len;                    /* Length of `data` if tx, or length of */
+				    /* Data to read if rx */
+	int len_actual;		    /* Length successfully transferred */
+	int timeout;
+};
+
+static const struct usb_device_id gpio_mpsse_table[] =3D {
+	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
+	{ }                               /* Terminating entry */
+};
+
+MODULE_DEVICE_TABLE(usb, gpio_mpsse_table);
+
+static DEFINE_IDA(gpio_mpsse_ida);
+
+/* MPSSE commands */
+#define SET_BITS_CMD 0x80
+#define GET_BITS_CMD 0x81
+
+#define SET_BITMODE_REQUEST 0x0B
+#define MODE_MPSSE (2 << 8)
+#define MODE_RESET 0
+
+/* Arbitrarily decided. This could probably be much less */
+#define MPSSE_WRITE_TIMEOUT 5000
+#define MPSSE_READ_TIMEOUT 5000
+
+/* 1 millisecond, also pretty arbitrary */
+#define MPSSE_POLL_INTERVAL 1000
+
+static int mpsse_bulk_xfer(struct usb_interface *intf, struct bulk_desc =
*desc)
+{
+	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
+	struct usb_device *udev =3D priv->udev;
+	unsigned int pipe;
+	int ret;
+
+	if (desc->tx)
+		pipe =3D usb_sndbulkpipe(udev, priv->bulk_out->bEndpointAddress);
+	else
+		pipe =3D usb_rcvbulkpipe(udev, priv->bulk_in->bEndpointAddress);
+
+	ret =3D usb_bulk_msg(udev, pipe, desc->data, desc->len,
+			   &desc->len_actual, desc->timeout);
+	if (ret)
+		dev_dbg(&udev->dev, "mpsse: bulk transfer failed: %d\n", ret);
+
+	return ret;
+}
+
+static int mpsse_write(struct usb_interface *intf,
+		       u8 *buf, size_t len)
+{
+	int ret;
+	struct bulk_desc desc;
+
+	desc.len_actual =3D 0;
+	desc.tx =3D true;
+	desc.data =3D buf;
+	desc.len =3D len;
+	desc.timeout =3D MPSSE_WRITE_TIMEOUT;
+
+	ret =3D mpsse_bulk_xfer(intf, &desc);
+
+	return ret;
+}
+
+static int mpsse_read(struct usb_interface *intf, u8 *buf, size_t len)
+{
+	int ret;
+	struct bulk_desc desc;
+	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
+
+	desc.len_actual =3D 0;
+	desc.tx =3D false;
+	desc.data =3D priv->bulk_in_buf;
+	/* Device sends 2 additional status bytes, read len + 2 */
+	desc.len =3D min_t(size_t, len + 2, usb_endpoint_maxp(priv->bulk_in));
+	desc.timeout =3D MPSSE_READ_TIMEOUT;
+
+	ret =3D mpsse_bulk_xfer(intf, &desc);
+	if (ret)
+		return ret;
+
+	/* Did we get enough data? */
+	if (desc.len_actual < desc.len)
+		return -EIO;
+
+	memcpy(buf, desc.data + 2, desc.len_actual - 2);
+
+	return ret;
+}
+
+static int gpio_mpsse_set_bank(struct mpsse_priv *priv, u8 bank)
+{
+	int ret;
+	u8 tx_buf[3] =3D {
+		SET_BITS_CMD | (bank << 1),
+		priv->gpio_outputs[bank],
+		priv->gpio_dir[bank],
+	};
+
+	ret =3D mpsse_write(priv->intf, tx_buf, 3);
+
+	return ret;
+}
+
+static int gpio_mpsse_get_bank(struct mpsse_priv *priv, u8 bank)
+{
+	int ret;
+	u8 buf =3D GET_BITS_CMD | (bank << 1);
+
+	ret =3D mpsse_write(priv->intf, &buf, 1);
+	if (ret)
+		return ret;
+
+	ret =3D mpsse_read(priv->intf, &buf, 1);
+	if (ret)
+		return ret;
+
+	return buf;
+}
+
+static void gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned lon=
g *mask,
+				    unsigned long *bits)
+{
+	unsigned long i, bank, bank_mask, bank_bits;
+	int ret;
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+
+	guard(mutex)(&priv->io_mutex);
+	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
+		bank =3D i / 8;
+
+		if (bank_mask) {
+			bank_bits =3D bitmap_get_value8(bits, i);
+			/* Zero out pins we want to change */
+			priv->gpio_outputs[bank] &=3D ~bank_mask;
+			/* Set pins we care about */
+			priv->gpio_outputs[bank] |=3D bank_bits & bank_mask;
+
+			ret =3D gpio_mpsse_set_bank(priv, bank);
+			if (ret)
+				dev_err(&priv->intf->dev,
+					"Couldn't set values for bank %ld!",
+					bank);
+		}
+	}
+}
+
+static int gpio_mpsse_get_multiple(struct gpio_chip *chip, unsigned long=
 *mask,
+				   unsigned long *bits)
+{
+	unsigned long i, bank, bank_mask;
+	int ret;
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+
+	guard(mutex)(&priv->io_mutex);
+	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
+		bank =3D i / 8;
+
+		if (bank_mask) {
+			ret =3D gpio_mpsse_get_bank(priv, bank);
+			if (ret < 0)
+				return ret;
+
+			bitmap_set_value8(bits, ret & bank_mask, i);
+		}
+	}
+
+	return 0;
+}
+
+static int gpio_mpsse_gpio_get(struct gpio_chip *chip, unsigned int offs=
et)
+{
+	int err;
+	unsigned long mask =3D 0, bits =3D 0;
+
+	__set_bit(offset, &mask);
+	err =3D gpio_mpsse_get_multiple(chip, &mask, &bits);
+	if (err)
+		return err;
+
+	/* =3D=3D is not guaranteed to give 1 if true */
+	if (bits)
+		return 1;
+	else
+		return 0;
+}
+
+static void gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int off=
set,
+			       int value)
+{
+	unsigned long mask =3D 0, bits =3D 0;
+
+	__set_bit(offset, &mask);
+	if (value)
+		__set_bit(offset, &bits);
+
+	gpio_mpsse_set_multiple(chip, &mask, &bits);
+}
+
+static int gpio_mpsse_direction_output(struct gpio_chip *chip,
+				       unsigned int offset, int value)
+{
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+	int bank =3D (offset & 8) >> 3;
+	int bank_offset =3D offset & 7;
+
+	scoped_guard(mutex, &priv->io_mutex)
+		priv->gpio_dir[bank] |=3D BIT(bank_offset);
+
+	gpio_mpsse_gpio_set(chip, offset, value);
+
+	return 0;
+}
+
+static int gpio_mpsse_direction_input(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+	int bank =3D (offset & 8) >> 3;
+	int bank_offset =3D offset & 7;
+
+	guard(mutex)(&priv->io_mutex);
+	priv->gpio_dir[bank] &=3D ~BIT(bank_offset);
+	gpio_mpsse_set_bank(priv, bank);
+
+	return 0;
+}
+
+static int gpio_mpsse_get_direction(struct gpio_chip *chip,
+				    unsigned int offset)
+{
+	int ret;
+	int bank =3D (offset & 8) >> 3;
+	int bank_offset =3D offset & 7;
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+
+	guard(mutex)(&priv->io_mutex);
+	/* MPSSE directions are inverted */
+	if (priv->gpio_dir[bank] & BIT(bank_offset))
+		ret =3D GPIO_LINE_DIRECTION_OUT;
+	else
+		ret =3D GPIO_LINE_DIRECTION_IN;
+
+	return ret;
+}
+
+static void gpio_mpsse_poll(struct work_struct *work)
+{
+	unsigned long pin_mask, pin_states, flags;
+	int irq_enabled, offset, err, value, fire_irq,
+		irq, old_value[16], irq_type[16];
+	struct mpsse_priv *priv =3D container_of(work, struct mpsse_priv,
+					       irq_work);
+
+	for (offset =3D 0; offset < priv->gpio.ngpio; ++offset)
+		old_value[offset] =3D -1;
+
+	while ((irq_enabled =3D atomic_read(&priv->irq_enabled))) {
+		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
+		/* Cleanup will trigger at the end of the loop */
+		guard(mutex)(&priv->irq_mutex);
+
+		pin_mask =3D 0;
+		pin_states =3D 0;
+		for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
+			irq_type[offset] =3D atomic_read(&priv->irq_type[offset]);
+			if (irq_type[offset] !=3D IRQ_TYPE_NONE &&
+			    irq_enabled & BIT(offset))
+				pin_mask |=3D BIT(offset);
+			else
+				old_value[offset] =3D -1;
+		}
+
+		err =3D gpio_mpsse_get_multiple(&priv->gpio, &pin_mask,
+					      &pin_states);
+		if (err) {
+			dev_err_ratelimited(&priv->intf->dev,
+					    "Error polling!\n");
+			continue;
+		}
+
+		/* Check each value */
+		for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
+			if (old_value[offset] =3D=3D -1)
+				continue;
+
+			fire_irq =3D 0;
+			value =3D pin_states & BIT(offset);
+
+			switch (irq_type[offset]) {
+			case IRQ_TYPE_EDGE_RISING:
+				fire_irq =3D value > old_value[offset];
+				break;
+			case IRQ_TYPE_EDGE_FALLING:
+				fire_irq =3D value < old_value[offset];
+				break;
+			case IRQ_TYPE_EDGE_BOTH:
+				fire_irq =3D value !=3D old_value[offset];
+				break;
+			}
+			if (!fire_irq)
+				continue;
+
+			irq =3D irq_find_mapping(priv->gpio.irq.domain,
+					       offset);
+			local_irq_save(flags);
+			generic_handle_irq(irq);
+			local_irq_disable();
+			local_irq_restore(flags);
+		}
+
+		/* Sync back values so we can refer to them next tick */
+		for (offset =3D 0; offset < priv->gpio.ngpio; ++offset)
+			if (irq_type[offset] !=3D IRQ_TYPE_NONE &&
+			    irq_enabled & BIT(offset))
+				old_value[offset] =3D pin_states & BIT(offset);
+	}
+}
+
+static int gpio_mpsse_set_irq_type(struct irq_data *irqd, unsigned int t=
ype)
+{
+	int offset;
+	struct mpsse_priv *priv =3D irq_data_get_irq_chip_data(irqd);
+
+	offset =3D irqd->hwirq;
+	atomic_set(&priv->irq_type[offset], type & IRQ_TYPE_EDGE_BOTH);
+
+	return 0;
+}
+
+static void gpio_mpsse_irq_disable(struct irq_data *irqd)
+{
+	struct mpsse_priv *priv =3D irq_data_get_irq_chip_data(irqd);
+
+	atomic_and(~BIT(irqd->hwirq), &priv->irq_enabled);
+	gpiochip_disable_irq(&priv->gpio, irqd->hwirq);
+}
+
+static void gpio_mpsse_irq_enable(struct irq_data *irqd)
+{
+	struct mpsse_priv *priv =3D irq_data_get_irq_chip_data(irqd);
+
+	gpiochip_enable_irq(&priv->gpio, irqd->hwirq);
+	/* If no-one else was using the IRQ, enable it */
+	if (!atomic_fetch_or(BIT(irqd->hwirq), &priv->irq_enabled)) {
+		INIT_WORK(&priv->irq_work, gpio_mpsse_poll);
+		schedule_work(&priv->irq_work);
+	}
+}
+
+static const struct irq_chip gpio_mpsse_irq_chip =3D {
+	.name =3D "gpio-mpsse-irq",
+	.irq_enable =3D gpio_mpsse_irq_enable,
+	.irq_disable =3D gpio_mpsse_irq_disable,
+	.irq_set_type =3D gpio_mpsse_set_irq_type,
+	.flags =3D IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void gpio_mpsse_ida_remove(void *data)
+{
+	struct mpsse_priv *priv =3D data;
+
+	ida_simple_remove(&gpio_mpsse_ida, priv->id);
+}
+
+static int gpio_mpsse_probe(struct usb_interface *interface,
+			    const struct usb_device_id *id)
+{
+	struct mpsse_priv *priv;
+	struct device *dev;
+	int err;
+
+	dev =3D &interface->dev;
+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->udev =3D usb_get_dev(interface_to_usbdev(interface));
+	priv->intf =3D interface;
+	priv->intf_id =3D interface->cur_altsetting->desc.bInterfaceNumber;
+
+	priv->id =3D ida_simple_get(&gpio_mpsse_ida, 0, 0, GFP_KERNEL);
+	if (priv->id < 0)
+		return priv->id;
+
+	err =3D devm_add_action_or_reset(dev, gpio_mpsse_ida_remove, priv);
+	if (err)
+		return err;
+
+	devm_mutex_init(dev, &priv->io_mutex);
+	devm_mutex_init(dev, &priv->irq_mutex);
+
+	priv->gpio.label =3D devm_kasprintf(dev, GFP_KERNEL,
+					  "gpio-mpsse.%d.%d",
+					  priv->id, priv->intf_id);
+	if (!priv->gpio.label)
+		return -ENOMEM;
+
+	priv->gpio.owner =3D THIS_MODULE;
+	priv->gpio.parent =3D interface->usb_dev;
+	priv->gpio.get_direction =3D gpio_mpsse_get_direction;
+	priv->gpio.direction_input =3D gpio_mpsse_direction_input;
+	priv->gpio.direction_output =3D gpio_mpsse_direction_output;
+	priv->gpio.get =3D gpio_mpsse_gpio_get;
+	priv->gpio.set =3D gpio_mpsse_gpio_set;
+	priv->gpio.get_multiple =3D gpio_mpsse_get_multiple;
+	priv->gpio.set_multiple =3D gpio_mpsse_set_multiple;
+	priv->gpio.base =3D -1;
+	priv->gpio.ngpio =3D 16;
+	priv->gpio.offset =3D priv->intf_id * priv->gpio.ngpio;
+	priv->gpio.can_sleep =3D 1;
+
+	err =3D usb_find_common_endpoints(interface->cur_altsetting,
+					&priv->bulk_in, &priv->bulk_out,
+					NULL, NULL);
+	if (err)
+		return err;
+
+	priv->bulk_in_buf =3D devm_kmalloc(dev, usb_endpoint_maxp(priv->bulk_in=
),
+					 GFP_KERNEL);
+	if (!priv->bulk_in_buf)
+		return -ENOMEM;
+
+	usb_set_intfdata(interface, priv);
+
+	/* Reset mode, needed to correctly enter MPSSE mode */
+	err =3D usb_control_msg(priv->udev, usb_sndctrlpipe(priv->udev, 0),
+			      SET_BITMODE_REQUEST,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      MODE_RESET, priv->intf_id + 1, NULL, 0,
+			      USB_CTRL_SET_TIMEOUT);
+	if (err)
+		return err;
+
+	/* Enter MPSSE mode */
+	err =3D usb_control_msg(priv->udev, usb_sndctrlpipe(priv->udev, 0),
+			      SET_BITMODE_REQUEST,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      MODE_MPSSE, priv->intf_id + 1, NULL, 0,
+			      USB_CTRL_SET_TIMEOUT);
+	if (err)
+		return err;
+
+	gpio_irq_chip_set_chip(&priv->gpio.irq, &gpio_mpsse_irq_chip);
+
+	priv->gpio.irq.parent_handler =3D NULL;
+	priv->gpio.irq.num_parents =3D 0;
+	priv->gpio.irq.parents =3D NULL;
+	priv->gpio.irq.default_type =3D IRQ_TYPE_NONE;
+	priv->gpio.irq.handler =3D handle_simple_irq;
+
+	err =3D devm_gpiochip_add_data(dev, &priv->gpio, priv);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void gpio_mpsse_disconnect(struct usb_interface *intf)
+{
+	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
+
+	priv->intf =3D NULL;
+	usb_set_intfdata(intf, NULL);
+	usb_put_dev(priv->udev);
+}
+
+static struct usb_driver gpio_mpsse_driver =3D {
+	.name           =3D "gpio-mpsse",
+	.probe          =3D gpio_mpsse_probe,
+	.disconnect     =3D gpio_mpsse_disconnect,
+	.id_table       =3D gpio_mpsse_table,
+};
+
+module_usb_driver(gpio_mpsse_driver);
+
+MODULE_AUTHOR("Mary Strodl <mstrodl@csh.rit.edu>");
+MODULE_DESCRIPTION("MPSSE GPIO driver");
+MODULE_LICENSE("GPL");
--=20
2.45.2


