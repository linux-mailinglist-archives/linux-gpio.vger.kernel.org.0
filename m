Return-Path: <linux-gpio+bounces-26525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C581B960D6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 15:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BBF3AC664
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A172518E20;
	Tue, 23 Sep 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="moJdee5+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081882899;
	Tue, 23 Sep 2025 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635120; cv=none; b=ZwtHapYNoeMpb/mvmirzZj1DXUui3H5iXKGeGEenchlhRSgQs34Vt4MrR4kKUKvXwJ1ajJTh4NGF8iVIwLU7M8L+oe31Z412fBiuAm1hoNFByXCPnNN8tatog6rOdEpvcyJl3vXO5SaKSl1jcs4fR5yLF2nJETFcr/jGNb5vqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635120; c=relaxed/simple;
	bh=sNMYxx8eNQ1b4YRiDuuw/6BFoIoZ9ZZySBEWUMcauaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXKvxpjOsHwvwjYEJlml45/Z/PUNKzFwIAtTS14D13INP8o6u+VOXJyI/cSM6KskyDh5fXu2q1MqrLVjfEoBzWose9HpICVnWssFHFdo5bzHnoZ4H4cYQ6RNEdHkShwx2nzCUxWuN7omAtVHvzQwtUIJo0vaP1XyMOGx/1i/2FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=moJdee5+; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id DA016401CF12;
	Tue, 23 Sep 2025 09:35:27 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1758634522; x=1760448923; bh=sNMYx
	x8eNQ1b4YRiDuuw/6BFoIoZ9ZZySBEWUMcauaQ=; b=moJdee5+oQ3hPRmXab3sl
	WhT6IrwrCr+LSzNxlGyxjIAPNp8K8qUSmwuyg+eZLP43VrZ5wUugJtAU2cDhCnuU
	irJjgjsXR3NK4KnVJH4FJODsHwJgyobYmHOhFL09/Yf86I3mVMF5yqKgO8RDK/lY
	biPxvxAdMisF72EzsEGRMU=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3oU7AxC76Z_I; Tue, 23 Sep 2025 09:35:22 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id C924B45735E9;
	Tue, 23 Sep 2025 09:35:22 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Date: Tue, 23 Sep 2025 09:33:02 -0400
Message-ID: <20250923133304.273529-2-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250923133304.273529-1-mstrodl@csh.rit.edu>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When an IRQ worker is running, unplugging the device would cause a
crash. The sealevel hardware this driver was written for was not
hotpluggable, so I never realized it.

This change uses RCU to create a list of workers, which it tears down on
disconnect.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 drivers/gpio/gpio-mpsse.c | 119 +++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 9f42bb30b4ec..af9a9196ac9d 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -10,6 +10,7 @@
 #include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/usb.h>
=20
 struct mpsse_priv {
@@ -17,8 +18,10 @@ struct mpsse_priv {
 	struct usb_device *udev;     /* USB device encompassing all MPSSEs */
 	struct usb_interface *intf;  /* USB interface for this MPSSE */
 	u8 intf_id;                  /* USB interface number for this MPSSE */
-	struct work_struct irq_work; /* polling work thread */
+	struct list_head workers;    /* polling work threads */
 	struct mutex irq_mutex;	     /* lock over irq_data */
+	struct mutex irq_race;	     /* race for polling worker teardown */
+	raw_spinlock_t irq_spin;     /* protects worker list */
 	atomic_t irq_type[16];	     /* pin -> edge detection type */
 	atomic_t irq_enabled;
 	int id;
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
@@ -261,9 +273,8 @@ static int gpio_mpsse_direction_input(struct gpio_chi=
p *chip,
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
@@ -284,18 +295,55 @@ static int gpio_mpsse_get_direction(struct gpio_chi=
p *chip,
 	return ret;
 }
=20
-static void gpio_mpsse_poll(struct work_struct *work)
+static void gpio_mpsse_stop(struct mpsse_worker *worker)
+{
+	cancel_work_sync(&worker->work);
+	kfree(worker);
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
+	/*
+	 * We only want one worker. Workers race to acquire irq_race and tear
+	 * down all other workers. This is a cond guard so that we don't deadlo=
ck
+	 * trying to cancel a worker.
+	 */
+	scoped_cond_guard(mutex_try, ;, &priv->irq_race) {
+		scoped_guard(rcu) {
+			list_for_each_entry_rcu(worker, &priv->workers, list) {
+				/* Don't stop ourselves */
+				if (worker =3D=3D my_worker)
+					continue;
+
+				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
+					list_del_rcu(&worker->list);
+
+				/* Give worker a chance to terminate itself */
+				atomic_set(&worker->cancelled, 1);
+				/* Keep track of stuff to cancel */
+				INIT_LIST_HEAD(&worker->destroy);
+				list_add(&worker->destroy, &destructors);
+			}
+		}
+		/* Make sure list consumers are finished before we tear down */
+		synchronize_rcu();
+		list_for_each_entry(worker, &destructors, destroy)
+			gpio_mpsse_stop(worker);
+	}
+
+	while ((irq_enabled =3D atomic_read(&priv->irq_enabled)) &&
+	       !atomic_read(&my_worker->cancelled)) {
 		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
 		/* Cleanup will trigger at the end of the loop */
 		guard(mutex)(&priv->irq_mutex);
@@ -370,21 +418,41 @@ static int gpio_mpsse_set_irq_type(struct irq_data =
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
+	/* Can't actually do teardown in IRQ context (blocks...) */
+	scoped_guard(rcu)
+		list_for_each_entry_rcu(worker, &priv->workers, list)
+			atomic_set(&worker->cancelled, 1);
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
+		/*
+		 * Can't be devm because it uses a non-raw spinlock (illegal in
+		 * this context, where a raw spinlock is held by our caller)
+		 */
+		worker =3D kzalloc(sizeof(*worker), GFP_KERNEL);
+		if (!worker)
+			return;
+
+		worker->priv =3D priv;
+		INIT_LIST_HEAD(&worker->list);
+		INIT_WORK(&worker->work, gpio_mpsse_poll);
+		schedule_work(&worker->work);
+
+		scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
+			list_add_rcu(&worker->list, &priv->workers);
 	}
 }
=20
@@ -436,6 +504,12 @@ static int gpio_mpsse_probe(struct usb_interface *in=
terface,
 	if (err)
 		return err;
=20
+	err =3D devm_mutex_init(dev, &priv->irq_race);
+	if (err)
+		return err;
+
+	raw_spin_lock_init(&priv->irq_spin);
+
 	priv->gpio.label =3D devm_kasprintf(dev, GFP_KERNEL,
 					  "gpio-mpsse.%d.%d",
 					  priv->id, priv->intf_id);
@@ -504,7 +578,34 @@ static int gpio_mpsse_probe(struct usb_interface *in=
terface,
=20
 static void gpio_mpsse_disconnect(struct usb_interface *intf)
 {
+	struct mpsse_worker *worker;
 	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
+	struct list_head destructors =3D LIST_HEAD_INIT(destructors);
+
+	/*
+	 * Lock prevents double-free of worker from here and the teardown
+	 * step at the beginning of gpio_mpsse_poll
+	 */
+	scoped_guard(mutex, &priv->irq_race) {
+		scoped_guard(rcu) {
+			list_for_each_entry_rcu(worker, &priv->workers, list) {
+				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
+					list_del_rcu(&worker->list);
+
+				/* Give worker a chance to terminate itself */
+				atomic_set(&worker->cancelled, 1);
+				/* Keep track of stuff to cancel */
+				INIT_LIST_HEAD(&worker->destroy);
+				list_add(&worker->destroy, &destructors);
+			}
+		}
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


