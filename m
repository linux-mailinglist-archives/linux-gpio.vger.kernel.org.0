Return-Path: <linux-gpio+bounces-25754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BE3B4977F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344B83B46B3
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 17:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB711A255C;
	Mon,  8 Sep 2025 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="SjTFownS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F5221FB1;
	Mon,  8 Sep 2025 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757353517; cv=none; b=nrhEiRWLqeSJw/ClgYBSlMJEvqeGWmEn0bfpNF/cocPNG1UegWey7xQjVwEXZ3R5OwfWR+nph89+jsNp6VTPwbW3seG4XDSa5W0thlow+6nASNDuovkXPHAr6lq3I9OGMQkNl31RRmFYUr8TI+LkPlQiDtKbSo7Tz5idjSQhhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757353517; c=relaxed/simple;
	bh=wYxFkTcsG9A+svAb2trQ263cp1OncA5duFC3BZcs83w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjPLHtWRbhcHgIRxFyOXf1DgbekREXPLWMcxZzGsyLrI8GVqpgmMxzAt2/WDl9rAJD5iOKHj5ztUNW/FraoKCUFyf53Ix5kv6aRI8PAoYvGSCxp4KZKr/Bi1w0VPrhklwkQzxZHAJ1JgtnVNe4f+tpM9Y40/g2Hjj6DABg6fg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=SjTFownS; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id DFB4540E9FFE;
	Mon,  8 Sep 2025 13:38:37 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1757353112; x=1759167513; bh=wYxFkTcsG9A+svAb2trQ263cp1OncA5duFC
	3BZcs83w=; b=SjTFownSYuHjMf6JO/9vvYgbhBvvurTgNX9lynJXtWOcCy7S7Wm
	8udeKu87rTbbdEqDRRfa2y/mtySnBEa0ccZnnlfql0UCjCBUSyHl4Eaa2ao8OlHv
	dgWJVOhgf4E3MAUOJbPNzIsxJiz6OBOrBGyKRnxTctm9WHSDnP8RH5X8=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id R6wlR9ABILMv; Mon,  8 Sep 2025 13:38:32 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id C41A645735E9;
	Mon,  8 Sep 2025 13:38:32 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH] gpio: mpsse: support bryx radio interface kit
Date: Mon,  8 Sep 2025 13:38:04 -0400
Message-ID: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This device is based on the FT232H, which only has one MPSSE.
Luckily, FT232H is pretty much a drop-in for the FT2232H which I wrote
this driver for originally... It just populates with only one USB
interface rather than two!

This device is hotpluggable, and only two lines are exposed by the
hardware, with strict directionality imposed by the design. As a result,
there are some plumbing-y changes I made to support a wider range of
MPSSE-based devices in the future.

There are a few things at play here:
* Restructure things so we can limit capabilities for
  different devices. In the case of the radio interface
  kit, only two lines are connected, and each is
  unidirectional.
* This device is hotpluggable, which caused me to realize the
  synchronization stuff on the driver wasn't sound.
  I added a queue for tearing down the polling worker using an
  RCU-protected list of workers. It's possible to stop and start
  a worker, which could cause multiple workers to briefly exist
  and need to be torn down. I would love some feedback on this
  approach though!
* Lastly, we change the format of the label to expose some useful
  information about the device to userspace to help distinguish
  different devices. Maybe there's a more clever, better way to
  get this data with udev or something, but it seemed like there
  was a disconnect there. I'm not really married to doing it this
  way :)

We've been using this driver out of tree for a little while now
on our devices without issues. With that being said, we're on an
older kernel (Debian 13), so this version has seen less testing.

Please let me know what you think and if this would be better served by
a patch series or something. I originally structured it that way, but it
became kinda a pain working on two different histories in parallel, and
the synchronization stuff took several iterations to get right.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 drivers/gpio/gpio-mpsse.c | 319 ++++++++++++++++++++++++++++++--------
 1 file changed, 257 insertions(+), 62 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 9f42bb30b4ec..af57e7cbf969 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -17,7 +17,7 @@ struct mpsse_priv {
 	struct usb_device *udev;     /* USB device encompassing all MPSSEs */
 	struct usb_interface *intf;  /* USB interface for this MPSSE */
 	u8 intf_id;                  /* USB interface number for this MPSSE */
-	struct work_struct irq_work; /* polling work thread */
+	struct list_head workers;    /* polling work threads */
 	struct mutex irq_mutex;	     /* lock over irq_data */
 	atomic_t irq_type[16];	     /* pin -> edge detection type */
 	atomic_t irq_enabled;
@@ -26,6 +26,9 @@ struct mpsse_priv {
 	u8 gpio_outputs[2];	     /* Output states for GPIOs [L, H] */
 	u8 gpio_dir[2];		     /* Directions for GPIOs [L, H] */
=20
+	unsigned long dir_in;        /* Bitmask of valid input pins  */
+	unsigned long dir_out;       /* Bitmask of valid output pins */
+
 	u8 *bulk_in_buf;	     /* Extra recv buffer to grab status bytes */
=20
 	struct usb_endpoint_descriptor *bulk_in;
@@ -34,6 +37,15 @@ struct mpsse_priv {
 	struct mutex io_mutex;	    /* sync I/O with disconnect */
 };
=20
+struct mpsse_worker {
+	struct mpsse_priv  *priv;
+	struct work_struct  work;
+	atomic_t       cancelled;
+	struct list_head    list;   /* linked list */
+	struct list_head destroy;   /* teardown linked list */
+	struct rcu_head     rcu;    /* synchronization */
+};
+
 struct bulk_desc {
 	bool tx;	            /* direction of bulk transfer */
 	u8 *data;                   /* input (tx) or output (rx) */
@@ -43,8 +55,27 @@ struct bulk_desc {
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
+static struct mpsse_quirk bryx_brik_quirk =3D {
+	.names =3D {
+		[3] =3D "Push to Talk",
+		[5] =3D "Channel Activity",
+	},
+	.dir_out =3D ~BIT(3),	/* Push to Talk     */
+	.dir_in  =3D ~BIT(5),	/* Channel Activity */
+};
+
 static const struct usb_device_id gpio_mpsse_table[] =3D {
 	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
+	{ USB_DEVICE(0x0403, 0x6988),     /* FTDI, assigned to Bryx */
+	  .driver_info =3D (kernel_ulong_t)&bryx_brik_quirk},
 	{ }                               /* Terminating entry */
 };
=20
@@ -160,6 +191,32 @@ static int gpio_mpsse_get_bank(struct mpsse_priv *pr=
iv, u8 bank)
 	return buf;
 }
=20
+static int mpsse_ensure_supported(struct gpio_chip *chip,
+				  unsigned long *mask, int direction)
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
+	unsupported =3D *mask & supported;
+	if (unsupported) {
+		dev_err(&priv->udev->dev,
+			"mpsse: GPIO %ld doesn't support %s\n",
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
@@ -167,6 +224,10 @@ static int gpio_mpsse_set_multiple(struct gpio_chip =
*chip, unsigned long *mask,
 	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
=20
+	ret =3D mpsse_ensure_supported(chip, mask, GPIO_LINE_DIRECTION_OUT);
+	if (ret)
+		return ret;
+
 	guard(mutex)(&priv->io_mutex);
 	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
 		bank =3D i / 8;
@@ -194,6 +255,10 @@ static int gpio_mpsse_get_multiple(struct gpio_chip =
*chip, unsigned long *mask,
 	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
=20
+	ret =3D mpsse_ensure_supported(chip, mask, GPIO_LINE_DIRECTION_IN);
+	if (ret)
+		return ret;
+
 	guard(mutex)(&priv->io_mutex);
 	for_each_set_clump8(i, bank_mask, mask, chip->ngpio) {
 		bank =3D i / 8;
@@ -242,9 +307,15 @@ static int gpio_mpsse_gpio_set(struct gpio_chip *chi=
p, unsigned int offset,
 static int gpio_mpsse_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
+	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
 	int bank =3D (offset & 8) >> 3;
 	int bank_offset =3D offset & 7;
+	unsigned long mask =3D BIT(offset);
+
+	ret =3D mpsse_ensure_supported(chip, &mask, GPIO_LINE_DIRECTION_OUT);
+	if (ret)
+		return ret;
=20
 	scoped_guard(mutex, &priv->io_mutex)
 		priv->gpio_dir[bank] |=3D BIT(bank_offset);
@@ -255,15 +326,20 @@ static int gpio_mpsse_direction_output(struct gpio_=
chip *chip,
 static int gpio_mpsse_direction_input(struct gpio_chip *chip,
 				      unsigned int offset)
 {
+	int ret;
 	struct mpsse_priv *priv =3D gpiochip_get_data(chip);
 	int bank =3D (offset & 8) >> 3;
 	int bank_offset =3D offset & 7;
+	unsigned long mask =3D BIT(offset);
+
+	ret =3D mpsse_ensure_supported(chip, &mask, GPIO_LINE_DIRECTION_IN);
+	if (ret)
+		return ret;
=20
 	guard(mutex)(&priv->io_mutex);
 	priv->gpio_dir[bank] &=3D ~BIT(bank_offset);
-	gpio_mpsse_set_bank(priv, bank);
=20
-	return 0;
+	return gpio_mpsse_set_bank(priv, bank);
 }
=20
 static int gpio_mpsse_get_direction(struct gpio_chip *chip,
@@ -284,76 +360,111 @@ static int gpio_mpsse_get_direction(struct gpio_ch=
ip *chip,
 	return ret;
 }
=20
-static void gpio_mpsse_poll(struct work_struct *work)
+static void gpio_mpsse_stop(struct mpsse_worker *worker)
+{
+	cancel_work_sync(&worker->work);
+	devm_kfree(&worker->priv->udev->dev, worker);
+}
+
+static void gpio_mpsse_poll(struct work_struct *my_work)
 {
 	unsigned long pin_mask, pin_states, flags;
 	int irq_enabled, offset, err, value, fire_irq,
 		irq, old_value[16], irq_type[16];
-	struct mpsse_priv *priv =3D container_of(work, struct mpsse_priv,
-					       irq_work);
+	struct mpsse_worker *worker;
+	struct mpsse_worker *my_worker =3D container_of(my_work, struct mpsse_w=
orker, work);
+	struct mpsse_priv *priv =3D my_worker->priv;
+	struct list_head destructors =3D LIST_HEAD_INIT(destructors);
=20
 	for (offset =3D 0; offset < priv->gpio.ngpio; ++offset)
 		old_value[offset] =3D -1;
=20
-	while ((irq_enabled =3D atomic_read(&priv->irq_enabled))) {
-		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
-		/* Cleanup will trigger at the end of the loop */
-		guard(mutex)(&priv->irq_mutex);
-
-		pin_mask =3D 0;
-		pin_states =3D 0;
-		for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
-			irq_type[offset] =3D atomic_read(&priv->irq_type[offset]);
-			if (irq_type[offset] !=3D IRQ_TYPE_NONE &&
-			    irq_enabled & BIT(offset))
-				pin_mask |=3D BIT(offset);
-			else
-				old_value[offset] =3D -1;
+	scoped_guard(mutex, &priv->irq_mutex) {
+		rcu_read_lock();
+		list_for_each_entry_rcu(worker, &priv->workers, list) {
+			/* Don't stop ourselves */
+			if (worker =3D=3D my_worker)
+				continue;
+			list_del_rcu(&worker->list);
+			/* Give worker a chance to terminate itself */
+			atomic_set(&worker->cancelled, 1);
+			/* Keep track of stuff to cancel */
+			INIT_LIST_HEAD(&worker->destroy);
+			list_add(&worker->destroy, &destructors);
 		}
+		rcu_read_unlock();
+		/* Make sure list consumers are finished before we tear down */
+		synchronize_rcu();
+		list_for_each_entry(worker, &destructors, destroy)
+			gpio_mpsse_stop(worker);
+	}
=20
-		err =3D gpio_mpsse_get_multiple(&priv->gpio, &pin_mask,
-					      &pin_states);
-		if (err) {
-			dev_err_ratelimited(&priv->intf->dev,
-					    "Error polling!\n");
-			continue;
-		}
+	while ((irq_enabled =3D atomic_read(&priv->irq_enabled)) &&
+	       !atomic_read(&my_worker->cancelled)) {
+		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
=20
-		/* Check each value */
-		for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
-			if (old_value[offset] =3D=3D -1)
+		/* Cleanup will trigger at the end of the loop */
+		/* We can't just lock here, otherwise we'll deadlock with
+		 * the worker teardown
+		 */
+		scoped_cond_guard(mutex_try, continue, &priv->irq_mutex) {
+			pin_mask =3D 0;
+			pin_states =3D 0;
+			for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
+				irq_type[offset] =3D
+					atomic_read(&priv->irq_type[offset]);
+				if (irq_type[offset] !=3D IRQ_TYPE_NONE &&
+				    irq_enabled & BIT(offset))
+					pin_mask |=3D BIT(offset);
+				else
+					old_value[offset] =3D -1;
+			}
+
+			err =3D gpio_mpsse_get_multiple(&priv->gpio, &pin_mask,
+						      &pin_states);
+			if (err) {
+				dev_err_ratelimited(&priv->intf->dev,
+						    "Error polling!\n");
 				continue;
+			}
=20
-			fire_irq =3D 0;
-			value =3D pin_states & BIT(offset);
-
-			switch (irq_type[offset]) {
-			case IRQ_TYPE_EDGE_RISING:
-				fire_irq =3D value > old_value[offset];
-				break;
-			case IRQ_TYPE_EDGE_FALLING:
-				fire_irq =3D value < old_value[offset];
-				break;
-			case IRQ_TYPE_EDGE_BOTH:
-				fire_irq =3D value !=3D old_value[offset];
-				break;
+			/* Check each value */
+			for (offset =3D 0; offset < priv->gpio.ngpio; ++offset) {
+				if (old_value[offset] =3D=3D -1)
+					continue;
+
+				fire_irq =3D 0;
+				value =3D pin_states & BIT(offset);
+
+				switch (irq_type[offset]) {
+				case IRQ_TYPE_EDGE_RISING:
+					fire_irq =3D value > old_value[offset];
+					break;
+				case IRQ_TYPE_EDGE_FALLING:
+					fire_irq =3D value < old_value[offset];
+					break;
+				case IRQ_TYPE_EDGE_BOTH:
+					fire_irq =3D value !=3D old_value[offset];
+					break;
+				}
+				if (!fire_irq)
+					continue;
+
+				irq =3D irq_find_mapping(priv->gpio.irq.domain,
+						       offset);
+				local_irq_save(flags);
+				generic_handle_irq(irq);
+				local_irq_disable();
+				local_irq_restore(flags);
 			}
-			if (!fire_irq)
-				continue;
=20
-			irq =3D irq_find_mapping(priv->gpio.irq.domain,
-					       offset);
-			local_irq_save(flags);
-			generic_handle_irq(irq);
-			local_irq_disable();
-			local_irq_restore(flags);
+			/* Sync back values so we can refer to them next tick */
+			for (offset =3D 0; offset < priv->gpio.ngpio; ++offset)
+				if (irq_type[offset] !=3D IRQ_TYPE_NONE &&
+				    irq_enabled & BIT(offset))
+					old_value[offset] =3D
+						pin_states & BIT(offset);
 		}
-
-		/* Sync back values so we can refer to them next tick */
-		for (offset =3D 0; offset < priv->gpio.ngpio; ++offset)
-			if (irq_type[offset] !=3D IRQ_TYPE_NONE &&
-			    irq_enabled & BIT(offset))
-				old_value[offset] =3D pin_states & BIT(offset);
 	}
 }
=20
@@ -370,21 +481,38 @@ static int gpio_mpsse_set_irq_type(struct irq_data =
*irqd, unsigned int type)
=20
 static void gpio_mpsse_irq_disable(struct irq_data *irqd)
 {
+	struct mpsse_worker *worker;
 	struct mpsse_priv *priv =3D irq_data_get_irq_chip_data(irqd);
=20
 	atomic_and(~BIT(irqd->hwirq), &priv->irq_enabled);
 	gpiochip_disable_irq(&priv->gpio, irqd->hwirq);
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(worker, &priv->workers, list) {
+		/* Can't actually do teardown in IRQ context (blocks...) */
+		atomic_set(&worker->cancelled, 1);
+	}
+	rcu_read_unlock();
 }
=20
 static void gpio_mpsse_irq_enable(struct irq_data *irqd)
 {
+	struct mpsse_worker *worker;
 	struct mpsse_priv *priv =3D irq_data_get_irq_chip_data(irqd);
=20
 	gpiochip_enable_irq(&priv->gpio, irqd->hwirq);
 	/* If no-one else was using the IRQ, enable it */
 	if (!atomic_fetch_or(BIT(irqd->hwirq), &priv->irq_enabled)) {
-		INIT_WORK(&priv->irq_work, gpio_mpsse_poll);
-		schedule_work(&priv->irq_work);
+		worker =3D devm_kmalloc(&priv->udev->dev, sizeof(*worker), GFP_KERNEL)=
;
+		if (!worker)
+			return;
+
+		worker->priv =3D priv;
+		INIT_LIST_HEAD(&worker->list);
+		INIT_WORK(&worker->work, gpio_mpsse_poll);
+		schedule_work(&worker->work);
+
+		list_add_rcu(&worker->list, &priv->workers);
 	}
 }
=20
@@ -404,18 +532,50 @@ static void gpio_mpsse_ida_remove(void *data)
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
+	/* If bit is set in both, set to 0 (NAND) */
+	*valid_mask =3D ~priv->dir_in | ~priv->dir_out;
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
+	*valid_mask =3D ~priv->dir_in;
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
@@ -436,9 +596,15 @@ static int gpio_mpsse_probe(struct usb_interface *in=
terface,
 	if (err)
 		return err;
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
@@ -452,10 +618,17 @@ static int gpio_mpsse_probe(struct usb_interface *i=
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
+	}
+
 	err =3D usb_find_common_endpoints(interface->cur_altsetting,
 					&priv->bulk_in, &priv->bulk_out,
 					NULL, NULL);
@@ -494,6 +667,7 @@ static int gpio_mpsse_probe(struct usb_interface *int=
erface,
 	priv->gpio.irq.parents =3D NULL;
 	priv->gpio.irq.default_type =3D IRQ_TYPE_NONE;
 	priv->gpio.irq.handler =3D handle_simple_irq;
+	priv->gpio.irq.init_valid_mask =3D mpsse_irq_init_valid_mask;
=20
 	err =3D devm_gpiochip_add_data(dev, &priv->gpio, priv);
 	if (err)
@@ -504,7 +678,28 @@ static int gpio_mpsse_probe(struct usb_interface *in=
terface,
=20
 static void gpio_mpsse_disconnect(struct usb_interface *intf)
 {
+	struct mpsse_worker *worker;
 	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
+	struct list_head destructors =3D LIST_HEAD_INIT(destructors);
+
+	scoped_guard(mutex, &priv->irq_mutex) {
+		rcu_read_lock();
+		list_for_each_entry_rcu(worker, &priv->workers, list) {
+			list_del_rcu(&worker->list);
+			/* Give worker a chance to terminate itself */
+			atomic_set(&worker->cancelled, 1);
+			/* Keep track of stuff to cancel */
+			INIT_LIST_HEAD(&worker->destroy);
+			list_add(&worker->destroy, &destructors);
+		}
+		rcu_read_unlock();
+		/* Make sure list consumers are finished before we tear down */
+		synchronize_rcu();
+		list_for_each_entry(worker, &destructors, destroy)
+			gpio_mpsse_stop(worker);
+	}
+
+	rcu_barrier();
=20
 	priv->intf =3D NULL;
 	usb_set_intfdata(intf, NULL);
--=20
2.47.0


