Return-Path: <linux-gpio+bounces-8748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD007952284
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 21:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C00C2811E4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 19:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F061BBBC3;
	Wed, 14 Aug 2024 19:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="VjlaJGSh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE57139D15;
	Wed, 14 Aug 2024 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662927; cv=none; b=ngOpS8oyUknJNHxkLaoNoHdVR90rG2jaBHjU+blFO7MhXET7wCWEt9nFvzil6ZkZHItwumdQjMiAWityY6wTkSqdzyfBnV3cEyiROnxS8jH1rIC/o/TmPzo0aSsESw6ZQARhAOBTfcdK1WW4ad2hkQsQ4QY3UGxi16cn9cp1x0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662927; c=relaxed/simple;
	bh=d6G6qgyrkkPJm5O6WHl3CHMrBB3C0SZavBuOfDYtglY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pw0YlKzBjwOfaDx7+MXZMOSauSQrhCBWQCz3XX+F/xVJW4/ANyFnQFqhteSY4h+fYDCKlhqD7VBcqpHd6GGgupK9vqoikZQs7U07/eS4MNjvwXRBej9+H6ji5OB+H/PAMJ1sJFEI30zgJIUcQfRxoEKTjYxbnWR003jgrqm/PfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=VjlaJGSh; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2A3C3404CC2A;
	Wed, 14 Aug 2024 15:15:23 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1723662921; x=1725477322; bh=d6G6qgyrkkPJm5O6WHl3CHMrBB3C0SZavBu
	OfDYtglY=; b=VjlaJGShaY2gjc15DZoEd3VQ91VYtpyiiaGKDLWecvtDiNuTTFB
	W3Q1FtHdPcdMEMKEHbLnum5U8xkl+h1WGY1bgE5MltC1IonX7NDEpe5OO0hiufUd
	elD1KtZ5gue0EcAuDwU7CzbVD3YEzofpQb7uehWuXcfgLVQB0dUF6zuE=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id htBMDTk7_tVg; Wed, 14 Aug 2024 15:15:21 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id B520145735E9;
	Wed, 14 Aug 2024 15:15:21 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH] gpio: add support for FTDI's MPSSE as GPIO
Date: Wed, 14 Aug 2024 15:15:09 -0400
Message-ID: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
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
---
 drivers/gpio/Kconfig      |   6 +
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-mpsse.c | 569 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 576 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpsse.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c..1afe42d2adec 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1837,6 +1837,12 @@ config GPIO_VIPERBOARD
 	  River Tech's viperboard.h for detailed meaning
 	  of the module parameters.
=20
+config GPIO_MPSSE
+	tristate "FTDI MPSSE GPIO support"
+	help
+	  GPIO driver for FTDI's MPSSE interface. These can do input and
+	  output. Each MPSSE provides 16 IO pins.
+
 endmenu
=20
 menu "Virtual GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d..9774824e120f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_GPIO_MOCKUP)		+=3D gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXTET)		+=3D gpio-moxtet.o
 obj-$(CONFIG_GPIO_MPC5200)		+=3D gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+=3D gpio-mpc8xxx.o
+obj-$(CONFIG_GPIO_MPSSE)		+=3D gpio-mpsse.o
 obj-$(CONFIG_GPIO_MSC313)		+=3D gpio-msc313.o
 obj-$(CONFIG_GPIO_MT7621)		+=3D gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+=3D gpio-mvebu.o
diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
new file mode 100644
index 000000000000..b0db85856b45
--- /dev/null
+++ b/drivers/gpio/gpio-mpsse.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * FTDI MPSSE GPIO support
+ *
+ * Based on code by Anatolij Gustschin
+ *
+ * Copyright (C) 2024 Mary Strodl <mstrodl@csh.rit.edu>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/mutex.h>
+#include <linux/usb.h>
+
+struct mpsse_priv {
+	struct gpio_chip gpio;
+	struct usb_device *udev;     /* USB device encompassing all MPSSEs */
+	struct usb_interface *intf;  /* USB interface for this MPSSE */
+	u8 intf_id;                  /* USB interface number for this MPSSE */
+	struct irq_chip irq;
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
+	mutex_lock(&priv->io_mutex);
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
+	mutex_unlock(&priv->io_mutex);
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
+	mutex_lock(&priv->io_mutex);
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
+	mutex_unlock(&priv->io_mutex);
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
+	set_bit(offset, &mask);
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
+	set_bit(offset, &mask);
+	if (value)
+		set_bit(offset, &bits);
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
+	mutex_lock(&priv->io_mutex);
+	priv->gpio_dir[bank] |=3D BIT(bank_offset);
+	mutex_unlock(&priv->io_mutex);
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
+	mutex_lock(&priv->io_mutex);
+	priv->gpio_dir[bank] &=3D ~BIT(bank_offset);
+	gpio_mpsse_set_bank(priv, bank);
+	mutex_unlock(&priv->io_mutex);
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
+	mutex_lock(&priv->io_mutex);
+	/* MPSSE directions are inverted */
+	if (priv->gpio_dir[bank] & BIT(bank_offset))
+		ret =3D 0;
+	else
+		ret =3D 1;
+	mutex_unlock(&priv->io_mutex);
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
+		mutex_lock(&priv->irq_mutex);
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
+		if (err)
+			dev_err_ratelimited(&priv->intf->dev,
+					    "Error polling!\n");
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
+
+		mutex_unlock(&priv->irq_mutex);
+		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
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
+static int gpio_mpsse_irq_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	int ret;
+
+	ret =3D irq_set_chip_data(irq, d->host_data);
+	if (ret < 0)
+		return ret;
+	irq_set_chip_and_handler(irq, &gpio_mpsse_irq_chip, handle_simple_irq);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static void gpio_mpsse_irq_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops gpio_mpsse_irq_ops =3D {
+	.map =3D gpio_mpsse_irq_map,
+	.unmap =3D gpio_mpsse_irq_unmap,
+	.xlate =3D irq_domain_xlate_twocell,
+};
+
+static int gpio_mpsse_probe(struct usb_interface *interface,
+			    const struct usb_device_id *id)
+{
+	struct mpsse_priv *priv;
+	struct device *dev;
+	int err, irq, offset;
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
+	devm_mutex_init(dev, &priv->io_mutex);
+	devm_mutex_init(dev, &priv->irq_mutex);
+
+	priv->gpio.label =3D devm_kasprintf(dev, GFP_KERNEL,
+					  "gpio-mpsse.%d.%d",
+					  priv->id, priv->intf_id);
+	if (!priv->gpio.label) {
+		err =3D -ENOMEM;
+		goto err;
+	}
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
+		goto err;
+
+	priv->bulk_in_buf =3D devm_kmalloc(dev, usb_endpoint_maxp(priv->bulk_in=
),
+					 GFP_KERNEL);
+	if (!priv->bulk_in_buf) {
+		err =3D -ENOMEM;
+		goto err;
+	}
+
+	usb_set_intfdata(interface, priv);
+
+
+	/* Reset mode, needed to correctly enter MPSSE mode */
+	err =3D usb_control_msg(priv->udev, usb_sndctrlpipe(priv->udev, 0),
+			      SET_BITMODE_REQUEST,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      MODE_RESET, priv->intf_id + 1, NULL, 0,
+			      USB_CTRL_SET_TIMEOUT);
+	if (err)
+		goto err;
+
+	/* Enter MPSSE mode */
+	err =3D usb_control_msg(priv->udev, usb_sndctrlpipe(priv->udev, 0),
+			      SET_BITMODE_REQUEST,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      MODE_MPSSE, priv->intf_id + 1, NULL, 0,
+			      USB_CTRL_SET_TIMEOUT);
+	if (err)
+		goto err;
+
+	gpio_irq_chip_set_chip(&priv->gpio.irq, &gpio_mpsse_irq_chip);
+
+	priv->gpio.irq.domain =3D irq_domain_create_linear(dev_fwnode(dev),
+							 priv->gpio.ngpio,
+							 &gpio_mpsse_irq_ops,
+							 priv);
+
+	for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
+		irq =3D irq_create_mapping(priv->gpio.irq.domain, offset);
+		if (irq < 0) {
+			err =3D irq;
+			goto err;
+		}
+	}
+
+	priv->gpio.irq.parent_handler =3D NULL;
+	priv->gpio.irq.num_parents =3D 0;
+	priv->gpio.irq.parents =3D NULL;
+	priv->gpio.irq.default_type =3D IRQ_TYPE_NONE;
+	priv->gpio.irq.handler =3D handle_simple_irq;
+
+	err =3D devm_gpiochip_add_data(dev, &priv->gpio, priv);
+	if (err)
+		goto err_irq_domain;
+
+	return 0;
+
+err_irq_domain:
+	irq_domain_remove(priv->gpio.irq.domain);
+
+err:
+	ida_simple_remove(&gpio_mpsse_ida, priv->id);
+
+	return err;
+}
+
+static void gpio_mpsse_disconnect(struct usb_interface *intf)
+{
+	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
+
+	ida_simple_remove(&gpio_mpsse_ida, priv->id);
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
+MODULE_ALIAS("gpio-mpsse");
+MODULE_AUTHOR("Mary Strodl <mstrodl@csh.rit.edu>");
+MODULE_DESCRIPTION("MPSSE GPIO driver");
+MODULE_LICENSE("GPL");
--=20
2.45.2


