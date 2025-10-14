Return-Path: <linux-gpio+bounces-27088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E682BD9CE3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D58544E99DD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 13:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473F72F6169;
	Tue, 14 Oct 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="Ec91ub/t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E1E23815D;
	Tue, 14 Oct 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449700; cv=none; b=ZNXP5abIaSXWUN+50rXmcIuqCx2X8eWLG4s7wco8PIHoKSkF65LGMTFr7hRXUChJ6QHo+jnGqIyndQxKUzZ/h15VhxoUULVu4vT9GcWsi2afCUnLbJvemm9GD3OOXZ172zV+LqyUMSGOtioYcFDn0U2Rz3oroLv6324tVfo3FwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449700; c=relaxed/simple;
	bh=2au2EWuqFAW/ufblT0JZMLLWaWfoQJ25m+Sz43vOVN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNL0HUZ0KeasloIVRwlZT5FnXhXAo+X2/YN2twrLlLHLtbXEIMsBCWVdOcJEGEMIOPPZ19gaRt3R6wmoancjImakRLeXCOmyWQpfvLqr9bhFGqdgwj6WjtboSEHazDKpR4+eDKJpYE37W57uPJ+WqgHhk6YK4A+isgN20zO63lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=Ec91ub/t; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2FE74400A7CC;
	Tue, 14 Oct 2025 09:41:05 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1760449261; x=1762263662; bh=2au2E
	WuqFAW/ufblT0JZMLLWaWfoQJ25m+Sz43vOVN8=; b=Ec91ub/tne7ITT8sp8S4r
	3fEc2cqDXea7R/WcWWqqRt1KQrHuEWEI7Pfn+5EJ7bhF8607OzKPB3P9clsN45x+
	henyCbwrEYC84hJdtWCYvPQCNd3ths4l0dqC5H/5xENxUgKvJqqz9Kp+GHMkD7yz
	R/dqjR0eAx1Qtem5dp92vo=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gdAQ7PfIOW0J; Tue, 14 Oct 2025 09:41:01 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id A162D4010E02;
	Tue, 14 Oct 2025 09:40:56 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v5 2/4] gpio: mpsse: ensure worker is torn down
Date: Tue, 14 Oct 2025 09:35:28 -0400
Message-ID: <20251014133530.3592716-3-mstrodl@csh.rit.edu>
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

When an IRQ worker is running, unplugging the device would cause a
crash. The sealevel hardware this driver was written for was not
hotpluggable, so I never realized it.

This change uses a spinlock to protect a list of workers, which
it tears down on disconnect.

Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpsse.c | 106 +++++++++++++++++++++++++++++++++++---
 1 file changed, 99 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index c508d9e33054..6ec940f6b371 100644
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
@@ -34,6 +37,14 @@ struct mpsse_priv {
 	struct mutex io_mutex;	    /* sync I/O with disconnect */
 };
=20
+struct mpsse_worker {
+	struct mpsse_priv  *priv;
+	struct work_struct  work;
+	atomic_t       cancelled;
+	struct list_head    list;   /* linked list */
+	struct list_head destroy;   /* teardown linked list */
+};
+
 struct bulk_desc {
 	bool tx;	            /* direction of bulk transfer */
 	u8 *data;                   /* input (tx) or output (rx) */
@@ -283,18 +294,62 @@ static int gpio_mpsse_get_direction(struct gpio_chi=
p *chip,
 	return ret;
 }
=20
-static void gpio_mpsse_poll(struct work_struct *work)
+/*
+ * Stops all workers except `my_worker`.
+ * Safe to call only when `irq_race` is held.
+ */
+static void gpio_mpsse_stop_all_except(struct mpsse_priv *priv,
+				       struct mpsse_worker *my_worker)
+{
+	struct mpsse_worker *worker, *worker_tmp;
+	struct list_head destructors =3D LIST_HEAD_INIT(destructors);
+
+	scoped_guard(raw_spinlock_irqsave, &priv->irq_spin) {
+		list_for_each_entry_safe(worker, worker_tmp,
+					 &priv->workers, list) {
+			/* Don't stop ourselves */
+			if (worker =3D=3D my_worker)
+				continue;
+
+			list_del(&worker->list);
+
+			/* Give worker a chance to terminate itself */
+			atomic_set(&worker->cancelled, 1);
+			/* Keep track of stuff to cancel */
+			INIT_LIST_HEAD(&worker->destroy);
+			list_add(&worker->destroy, &destructors);
+		}
+	}
+
+	list_for_each_entry_safe(worker, worker_tmp,
+				 &destructors, destroy) {
+		list_del(&worker->destroy);
+		cancel_work_sync(&worker->work);
+		kfree(worker);
+	}
+}
+
+static void gpio_mpsse_poll(struct work_struct *my_work)
 {
 	unsigned long pin_mask, pin_states, flags;
 	int irq_enabled, offset, err, value, fire_irq,
 		irq, old_value[16], irq_type[16];
-	struct mpsse_priv *priv =3D container_of(work, struct mpsse_priv,
-					       irq_work);
+	struct mpsse_worker *my_worker =3D container_of(my_work, struct mpsse_w=
orker, work);
+	struct mpsse_priv *priv =3D my_worker->priv;
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
+	scoped_cond_guard(mutex_try, return, &priv->irq_race)
+		gpio_mpsse_stop_all_except(priv, my_worker);
+
+	while ((irq_enabled =3D atomic_read(&priv->irq_enabled)) &&
+	       !atomic_read(&my_worker->cancelled)) {
 		usleep_range(MPSSE_POLL_INTERVAL, MPSSE_POLL_INTERVAL + 1000);
 		/* Cleanup will trigger at the end of the loop */
 		guard(mutex)(&priv->irq_mutex);
@@ -369,21 +424,45 @@ static int gpio_mpsse_set_irq_type(struct irq_data =
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
+	/*
+	 * Can't actually do teardown in IRQ context (it blocks).
+	 * As a result, these workers will stick around until irq is reenabled
+	 * or device gets disconnected
+	 */
+	scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
+		list_for_each_entry(worker, &priv->workers, list)
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
+		worker =3D kzalloc(sizeof(*worker), GFP_NOWAIT);
+		if (!worker)
+			return;
+
+		worker->priv =3D priv;
+		INIT_LIST_HEAD(&worker->list);
+		INIT_WORK(&worker->work, gpio_mpsse_poll);
+		schedule_work(&worker->work);
+
+		scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
+			list_add(&worker->list, &priv->workers);
 	}
 }
=20
@@ -435,6 +514,12 @@ static int gpio_mpsse_probe(struct usb_interface *in=
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
@@ -505,6 +590,13 @@ static void gpio_mpsse_disconnect(struct usb_interfa=
ce *intf)
 {
 	struct mpsse_priv *priv =3D usb_get_intfdata(intf);
=20
+	/*
+	 * Lock prevents double-free of worker from here and the teardown
+	 * step at the beginning of gpio_mpsse_poll
+	 */
+	scoped_guard(mutex, &priv->irq_race)
+		gpio_mpsse_stop_all_except(priv, NULL);
+
 	priv->intf =3D NULL;
 	usb_set_intfdata(intf, NULL);
 	usb_put_dev(priv->udev);
--=20
2.47.0


