Return-Path: <linux-gpio+bounces-31465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FC7Kq9jhGkK2wMAu9opvQ
	(envelope-from <linux-gpio+bounces-31465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 10:32:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D221F0D04
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 10:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D686E3034557
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 09:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBFC392810;
	Thu,  5 Feb 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF9hmW7y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC138E5D9;
	Thu,  5 Feb 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283752; cv=none; b=dGZzDLmzkFAEj71J07kNoA7o+Nm+HP1iJ1KRQloy29x9zVRLPxIO1tlROuztbLFIniRjFzZ8zJQpOa/Wln3s62QOO3swnsB2v6K+J2GG1LOgLe0OtKfo19ezTh4PNtZvt5Z6iBt7iQzdPtsQHyA6C+sQUAmzgLka7OkEy6K+x3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283752; c=relaxed/simple;
	bh=DEyMEUPk136lRe1+oXjf7E/xgzmujjzXLznYtwyuRTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7c2xUCf44F8xEW9StkBY+X1SBnQoZDAS9l9ax+/4ejrfWeOw9i3llsTZOgbsryrmD7hnF+FXN6rKExMDQXxB7QLoQORTKKni/rcQmSK5IkU40l3JgqUrQRMuKjth4PW9ON4cSagT7be1ePe+hUUDUTv3dbwEzXBZPGyYd5BE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF9hmW7y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E5FC4CEF7;
	Thu,  5 Feb 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283751;
	bh=DEyMEUPk136lRe1+oXjf7E/xgzmujjzXLznYtwyuRTU=;
	h=From:To:Cc:Subject:Date:From;
	b=UF9hmW7ym4UvBc2PdHLX27wnkftTF9KCY70BRMNx5VCJPL3CEh543a/cR4OubxhD7
	 cGSmss8J1TbGDp0c4QI40YqyjkuwDTxmCXv6P1ZOI6A8G6+sGf2/jnIRPaRNOa6D34
	 7xX9LxT3DA67zjqAYfLCqC0yaOGWBk4Me56LXM7CS0U89Y3a1xKzX8/hUR9qVYx90K
	 EGpIlC6/8JscRmNi6vw2uzzc/s81W4a1I3bTHwlPZYax2daFRM7Fdg+y0Dn/hFsoT2
	 XyiZU/eNqiWba0drfG57+Vro5K7RC7rKIPOwgPUq+ZOdh+/NG4lrKCppNqoD3cKO5s
	 TSZwTErnNB3CQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
Date: Thu,  5 Feb 2026 09:28:40 +0000
Message-ID: <20260205092840.2574840-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31465-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0D221F0D04
X-Rspamd-Action: no action

Since commit aab5c6f20023 ("gpio: set device type for GPIO chips"),
`gdev->dev.release` is unset.  As a result, the reference count to
`gdev->dev` isn't dropped on the error handling paths.

Drop the reference on errors.

Also reorder the instructions to make the error handling simpler.
Now gpiochip_add_data_with_key() roughly looks like:

   >>> Some memory allocation.  Go to ERR ZONE 1 on errors.
   >>> device_initialize().

   gpiodev_release() takes over the responsibility for freeing the
   resources of `gdev->dev`.  The subsequent error handling paths
   shouldn't go through ERR ZONE 1 again which leads to double free.

   >>> Some initialization mainly on `gdev`.
   >>> The rest of initialization.  Go to ERR ZONE 2 on errors.
   >>> Chip registration success and exit.

   >>> ERR ZONE 2.  gpio_device_put() and exit.
   >>> ERR ZONE 1.

Cc: stable@vger.kernel.org
Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Remove the parentheses in the commit message.
- Add code comment before setting the device type.
- Add R-b tag.

v2: https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org
- Reorder the instructions again to make the error handling simpler which
  fixes https://lore.kernel.org/all/20260116081036.352286-2-tzungbi@kernel.org
  too.
- Modify the commit message slightly.

v1: https://lore.kernel.org/all/20260116081036.352286-4-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 101 ++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff..5757c0475990 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -893,13 +893,15 @@ static const struct device_type gpio_dev_type = {
 #define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
 #endif
 
+/*
+ * An initial reference count has been held in gpiochip_add_data_with_key().
+ * The caller should drop the reference via gpio_device_put() on errors.
+ */
 static int gpiochip_setup_dev(struct gpio_device *gdev)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
-	device_initialize(&gdev->dev);
-
 	/*
 	 * If fwnode doesn't belong to another device, it's safe to clear its
 	 * initialized flag.
@@ -965,9 +967,11 @@ static void gpiochip_setup_devs(void)
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
 		ret = gpiochip_setup_dev(gdev);
-		if (ret)
+		if (ret) {
+			gpio_device_put(gdev);
 			dev_err(&gdev->dev,
 				"Failed to initialize gpio device (%d)\n", ret);
+		}
 	}
 }
 
@@ -1048,71 +1052,72 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = 0;
 	int ret;
 
-	/*
-	 * First: allocate and populate the internal stat container, and
-	 * set up the struct device.
-	 */
 	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
 	if (!gdev)
 		return -ENOMEM;
-
-	gdev->dev.type = &gpio_dev_type;
-	gdev->dev.bus = &gpio_bus_type;
-	gdev->dev.parent = gc->parent;
-	rcu_assign_pointer(gdev->chip, gc);
-
 	gc->gpiodev = gdev;
 	gpiochip_set_data(gc, data);
 
-	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
-
 	ret = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (ret < 0)
 		goto err_free_gdev;
 	gdev->id = ret;
 
-	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
+	ret = init_srcu_struct(&gdev->srcu);
 	if (ret)
 		goto err_free_ida;
+	rcu_assign_pointer(gdev->chip, gc);
 
-	if (gc->parent && gc->parent->driver)
-		gdev->owner = gc->parent->driver->owner;
-	else if (gc->owner)
-		/* TODO: remove chip->owner */
-		gdev->owner = gc->owner;
-	else
-		gdev->owner = THIS_MODULE;
+	ret = init_srcu_struct(&gdev->desc_srcu);
+	if (ret)
+		goto err_cleanup_gdev_srcu;
+
+	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
+	if (ret)
+		goto err_cleanup_desc_srcu;
+
+	device_initialize(&gdev->dev);
+	/*
+	 * After this point any allocated resources to `gdev` will be
+	 * free():ed by gpiodev_release().  If you add new resources
+	 * then make sure they get free():ed there.
+	 */
+	gdev->dev.type = &gpio_dev_type;
+	gdev->dev.bus = &gpio_bus_type;
+	gdev->dev.parent = gc->parent;
+	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
 	ret = gpiochip_get_ngpios(gc, &gdev->dev);
 	if (ret)
-		goto err_free_dev_name;
+		goto err_put_device;
+	gdev->ngpio = gc->ngpio;
 
 	gdev->descs = kcalloc(gc->ngpio, sizeof(*gdev->descs), GFP_KERNEL);
 	if (!gdev->descs) {
 		ret = -ENOMEM;
-		goto err_free_dev_name;
+		goto err_put_device;
 	}
 
 	gdev->label = kstrdup_const(gc->label ?: "unknown", GFP_KERNEL);
 	if (!gdev->label) {
 		ret = -ENOMEM;
-		goto err_free_descs;
+		goto err_put_device;
 	}
 
-	gdev->ngpio = gc->ngpio;
 	gdev->can_sleep = gc->can_sleep;
-
 	rwlock_init(&gdev->line_state_lock);
 	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
-
-	ret = init_srcu_struct(&gdev->srcu);
-	if (ret)
-		goto err_free_label;
-
-	ret = init_srcu_struct(&gdev->desc_srcu);
-	if (ret)
-		goto err_cleanup_gdev_srcu;
+#ifdef CONFIG_PINCTRL
+	INIT_LIST_HEAD(&gdev->pin_ranges);
+#endif
+	if (gc->parent && gc->parent->driver)
+		gdev->owner = gc->parent->driver->owner;
+	else if (gc->owner)
+		/* TODO: remove chip->owner */
+		gdev->owner = gc->owner;
+	else
+		gdev->owner = THIS_MODULE;
 
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
@@ -1128,7 +1133,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_cleanup_desc_srcu;
+				goto err_put_device;
 			}
 
 			/*
@@ -1148,14 +1153,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_cleanup_desc_srcu;
+			goto err_put_device;
 		}
 	}
 
-#ifdef CONFIG_PINCTRL
-	INIT_LIST_HEAD(&gdev->pin_ranges);
-#endif
-
 	if (gc->names)
 		gpiochip_set_desc_names(gc);
 
@@ -1249,25 +1250,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
-	if (gdev->dev.release) {
-		/* release() has been registered by gpiochip_setup_dev() */
-		gpio_device_put(gdev);
-		goto err_print_message;
-	}
+err_put_device:
+	gpio_device_put(gdev);
+	goto err_print_message;
+
 err_cleanup_desc_srcu:
 	cleanup_srcu_struct(&gdev->desc_srcu);
 err_cleanup_gdev_srcu:
 	cleanup_srcu_struct(&gdev->srcu);
-err_free_label:
-	kfree_const(gdev->label);
-err_free_descs:
-	kfree(gdev->descs);
-err_free_dev_name:
-	kfree(dev_name(&gdev->dev));
 err_free_ida:
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
 	kfree(gdev);
+
 err_print_message:
 	/* failures here can mean systems won't boot... */
 	if (ret != -EPROBE_DEFER) {
-- 
2.53.0.rc2.204.g2597b5adb4-goog


