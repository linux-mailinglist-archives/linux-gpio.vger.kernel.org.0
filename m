Return-Path: <linux-gpio+bounces-27089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D77BD9CEC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2395118A4155
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B907D3148C4;
	Tue, 14 Oct 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="vOkd5/E8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0352D2248B4;
	Tue, 14 Oct 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449700; cv=none; b=Jm3SoDiEhVVarIWeT4nPeZzXYWY57EOZFn20Ljd+54/iojsAwgr0DR75zxwpht0d0JoI/eLEFh40g3L7YPheQbOFrhQF1wc60arnI1Nu+AbSLQErdt/p1y2RPluknwjTxuNMaDp4OANPEQ26KqRxAEGRXMbMQWhPeLMF1oDFgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449700; c=relaxed/simple;
	bh=3Epu06VcjWm+1JsJ7I7XQPOB/r2L7TQ1igsaW/licK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGqf8N7BIC12jl1fbnQkjqogPsGpB+NGqNqM9RtHmooCuUWVzCrsr8OCT2L8Z5HgyoAg6RNIvpS5oj18KUwJ2esweHxMWV81wRnqUIB7SbaMSJrqHjRE9LLpvM4RkGmkGaPySBfevuu3pz9uUKDhLpNdB8mPeiK0IMGjvtuiBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=vOkd5/E8; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 3CB84457383A;
	Tue, 14 Oct 2025 09:41:05 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1760449261; x=1762263662; bh=3Epu0
	6VcjWm+1JsJ7I7XQPOB/r2L7TQ1igsaW/licK0=; b=vOkd5/E8w8FcWEnSP8/X3
	2UidWyQHB1/p9mktBpX4kjtm24NLUjUn6+pCkXgJfjC673HUjWB5WkdZ1opcMvdN
	ELpEThYIIbM+AYcG+HBguE88zi/up0PxMCNXaA92nnHhjRP34X/O/JSVIjbV2PvM
	uwMCUKrbjGmflPPkr3rFv4=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6zeqtw6ciXHL; Tue, 14 Oct 2025 09:41:01 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id D32FF404985A;
	Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v5 3/4] gpio: mpsse: add quirk support
Date: Tue, 14 Oct 2025 09:35:29 -0400
Message-ID: <20251014133530.3592716-4-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
References: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Builds out a facility for specifying compatible lines directions and
labels for MPSSE-based devices.

* dir_in/out are bitmask of lines that can go in/out. 1 means
  compatible, 0 means incompatible.
* names is an array of line names which will be exposed to userspace.

Also changes the chip label format to include some more useful
information about the device to help identify it from userspace.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpsse.c | 109 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 6ec940f6b371..5ca00dd51a63 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -29,6 +29,9 @@ struct mpsse_priv {
 	u8 gpio_outputs[2];	     /* Output states for GPIOs [L, H] */
 	u8 gpio_dir[2];		     /* Directions for GPIOs [L, H] */
=20
+	unsigned long dir_in;        /* Bitmask of valid input pins  */
+	unsigned long dir_out;       /* Bitmask of valid output pins */
+
 	u8 *bulk_in_buf;	     /* Extra recv buffer to grab status bytes */
=20
 	struct usb_endpoint_descriptor *bulk_in;
@@ -54,6 +57,14 @@ struct bulk_desc {
 	int timeout;
 };
=20
+#define MPSSE_NGPIO 16
+
+struct mpsse_quirk {
+	const char   *names[MPSSE_NGPIO]; /* Pin names, if applicable     */
+	unsigned long dir_in;             /* Bitmask of valid input pins  */
+	unsigned long dir_out;            /* Bitmask of valid output pins */
+};
+
 static const struct usb_device_id gpio_mpsse_table[] =3D {
 	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
 	{ }                               /* Terminating entry */
@@ -171,6 +182,32 @@ static int gpio_mpsse_get_bank(struct mpsse_priv *pr=
iv, u8 bank)
 	return buf;
 }
=20
+static int mpsse_ensure_supported(struct gpio_chip *chip,
+				  unsigned long mask, int direction)
+{
+	unsigned long supported, unsupported;
+	char *type =3D "input";
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+
+	supported =3D priv->dir_in;
+	if (direction =3D=3D GPIO_LINE_DIRECTION_OUT) {
+		supported =3D priv->dir_out;
+		type =3D "output";
+	}
+
+	/* An invalid bit was in the provided mask */
+	unsupported =3D mask & ~supported;
+	if (unsupported) {
+		dev_err(&priv->udev->dev,
+			"mpsse: GPIO %lu doesn't support %s\n",
+			find_first_bit(&unsupported, sizeof(unsupported) * 8),
+			type);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long=
 *mask,
 				   unsigned long *bits)
 {
@@ -178,6 +215,10 @@ static int gpio_mpsse_set_multiple(struct gpio_chip =
*chip, unsigned long *mask,
 	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
=20
+	ret =3D mpsse_ensure_supported(chip, *mask, GPIO_LINE_DIRECTION_OUT);
+	if (ret)
+		return ret;
+
 	guard(mutex)(&priv->io_mutex);
 	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
 		bank =3D i / 8;
@@ -205,6 +246,10 @@ static int gpio_mpsse_get_multiple(struct gpio_chip =
*chip, unsigned long *mask,
 	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
=20
+	ret =3D mpsse_ensure_supported(chip, *mask, GPIO_LINE_DIRECTION_IN);
+	if (ret)
+		return ret;
+
 	guard(mutex)(&priv->io_mutex);
 	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
 		bank =3D i / 8;
@@ -253,10 +298,15 @@ static int gpio_mpsse_gpio_set(struct gpio_chip *ch=
ip, unsigned int offset,
 static int gpio_mpsse_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
+	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
 	int bank =3D (offset & 8) >> 3;
 	int bank_offset =3D offset & 7;
=20
+	ret =3D mpsse_ensure_supported(chip, BIT(offset), GPIO_LINE_DIRECTION_O=
UT);
+	if (ret)
+		return ret;
+
 	scoped_guard(mutex, &priv->io_mutex)
 		priv->gpio_dir[bank] |=3D BIT(bank_offset);
=20
@@ -266,10 +316,15 @@ static int gpio_mpsse_direction_output(struct gpio_=
chip *chip,
 static int gpio_mpsse_direction_input(struct gpio_chip *chip,
 				      unsigned int offset)
 {
+	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
 	int bank =3D (offset & 8) >> 3;
 	int bank_offset =3D offset & 7;
=20
+	ret =3D mpsse_ensure_supported(chip, BIT(offset), GPIO_LINE_DIRECTION_I=
N);
+	if (ret)
+		return ret;
+
 	guard(mutex)(&priv->io_mutex);
 	priv->gpio_dir[bank] &=3D ~BIT(bank_offset);
=20
@@ -482,18 +537,49 @@ static void gpio_mpsse_ida_remove(void *data)
 	ida_free(&gpio_mpsse_ida, priv->id);
 }
=20
+static int mpsse_init_valid_mask(struct gpio_chip *chip,
+				 unsigned long *valid_mask,
+				 unsigned int ngpios)
+{
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+
+	if (WARN_ON(priv =3D=3D NULL))
+		return -ENODEV;
+
+	*valid_mask =3D priv->dir_in | priv->dir_out;
+
+	return 0;
+}
+
+static void mpsse_irq_init_valid_mask(struct gpio_chip *chip,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
+
+	if (WARN_ON(priv =3D=3D NULL))
+		return;
+
+	/* Can only use IRQ on input capable pins */
+	*valid_mask =3D priv->dir_in;
+}
+
 static int gpio_mpsse_probe(struct usb_interface *interface,
 			    const struct usb_device_id *id)
 {
 	struct mpsse_priv *priv;
 	struct device *dev;
+	char *serial;
 	int err;
+	struct mpsse_quirk *quirk =3D (void *)id->driver_info;
=20
 	dev =3D &interface->dev;
 	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
=20
+	INIT_LIST_HEAD(&priv->workers);
+
 	priv->udev =3D usb_get_dev(interface_to_usbdev(interface));
 	priv->intf =3D interface;
 	priv->intf_id =3D interface->cur_altsetting->desc.bInterfaceNumber;
@@ -520,9 +606,15 @@ static int gpio_mpsse_probe(struct usb_interface *in=
terface,
=20
 	raw_spin_lock_init(&priv->irq_spin);
=20
+	serial =3D priv->udev->serial;
+	if (!serial)
+		serial =3D "NONE";
+
 	priv->gpio.label =3D devm_kasprintf(dev, GFP_KERNEL,
-					  "gpio-mpsse.%d.%d",
-					  priv->id, priv->intf_id);
+					  "MPSSE%04x:%04x.%d.%d.%s",
+					  id->idVendor, id->idProduct,
+					  priv->intf_id, priv->id,
+					  serial);
 	if (!priv->gpio.label)
 		return -ENOMEM;
=20
@@ -536,10 +628,20 @@ static int gpio_mpsse_probe(struct usb_interface *i=
nterface,
 	priv->gpio.get_multiple =3D gpio_mpsse_get_multiple;
 	priv->gpio.set_multiple =3D gpio_mpsse_set_multiple;
 	priv->gpio.base =3D -1;
-	priv->gpio.ngpio =3D 16;
+	priv->gpio.ngpio =3D MPSSE_NGPIO;
 	priv->gpio.offset =3D priv->intf_id * priv->gpio.ngpio;
 	priv->gpio.can_sleep =3D 1;
=20
+	if (quirk) {
+		priv->dir_out =3D quirk->dir_out;
+		priv->dir_in =3D quirk->dir_in;
+		priv->gpio.names =3D quirk->names;
+		priv->gpio.init_valid_mask =3D mpsse_init_valid_mask;
+	} else {
+		priv->dir_in =3D U16_MAX;
+		priv->dir_out =3D U16_MAX;
+	}
+
 	err =3D usb_find_common_endpoints(interface->cur_altsetting,
 					&priv->bulk_in, &priv->bulk_out,
 					NULL, NULL);
@@ -578,6 +680,7 @@ static int gpio_mpsse_probe(struct usb_interface *int=
erface,
 	priv->gpio.irq.parents =3D NULL;
 	priv->gpio.irq.default_type =3D IRQ_TYPE_NONE;
 	priv->gpio.irq.handler =3D handle_simple_irq;
+	priv->gpio.irq.init_valid_mask =3D mpsse_irq_init_valid_mask;
=20
 	err =3D devm_gpiochip_add_data(dev, &priv->gpio, priv);
 	if (err)
--=20
2.47.0


