Return-Path: <linux-gpio+bounces-32011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDakCl3xm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:19:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D265A1720A5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 120B13028117
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408D63491EB;
	Mon, 23 Feb 2026 06:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzVybFTX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD1348889;
	Mon, 23 Feb 2026 06:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827473; cv=none; b=VusRuPfn+3T3e4DqNyWLEZM1kjbRFDbfzKR6zzPf2v7N//5dI1p/mopeMm3NqvXFEUCPjMqMrYGEQTwIOgAF56PTtr4b7ijBMOXsbDoIPmopCzxeETX5swGvU2eQvCqJVapyJLN/GYcvZxV85GZuwKYyC4iF3Z/6jlOoFOH9Lbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827473; c=relaxed/simple;
	bh=ndt6VgQG8rMzKlDaZB5HulAjbnNY2Y9JIC1Ii/WSyW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCJ24ExdV4m8KmiIHDdFk/ZTRa3tCA4fBuaWUlV0EexlJ/bPQpYeXsKtPNe7k3fm7LEaUOHNvurdE9yh0Ni9y3oWrQTjIh2M01FFdMCx+VgC/Wlgh8pEBORQF1viXDk5jDq85CZDKvDyTYnwh6uGODwzKDnQ8nQH4j8q1lWshxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzVybFTX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B90C2BC86;
	Mon, 23 Feb 2026 06:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827472;
	bh=ndt6VgQG8rMzKlDaZB5HulAjbnNY2Y9JIC1Ii/WSyW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzVybFTXF53e0CysCSnd6ImU9V89wP4/I4iWYcnhr73B6ZB8E9EPnsO6831UrfPpB
	 ZyYJScuMjzMWdKG9YiqZ9b2I/vBxRCmPUjUBRKIfrItGZ4GMS+pjfzweVCJ5ftWU5h
	 MFd0JZfk9+Nc1HnPxXAu3zAuYI7WZEspBLkCLXPzInT2+4oVoEwgz1KT2MWsnV72Bt
	 Ak9tDg1ZMWZnWslEpyhkZGjocrNENeISF6ca3CVSwEObQQ23/lM+TvlHckn11Q2e31
	 DI/JX7312D+eXlMZu8tZ06ayDnjvYi1Vo6GSjOZDkzrxML+DqmTkmdD82Xodn0Xttx
	 gTcXDmgzhPDfg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 4/6] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
Date: Mon, 23 Feb 2026 14:17:24 +0800
Message-ID: <20260223061726.82161-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32011-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D265A1720A5
X-Rspamd-Action: no action

Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
checks for struct gpio_chip.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- To be consistent, rename `chip` -> `gc`.
- Add lockdep checks.

v3: https://lore.kernel.org/all/20260213092958.864411-5-tzungbi@kernel.org
- Pass struct gpio_chip * only.

v2: https://lore.kernel.org/all/20260203061059.975605-5-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-10-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c  | 14 ++++----------
 drivers/gpio/gpiolib-cdev.h  |  2 +-
 drivers/gpio/gpiolib-sysfs.c | 21 ++++++++-------------
 drivers/gpio/gpiolib-sysfs.h |  4 ++--
 drivers/gpio/gpiolib.c       | 24 +++++++++++++++++-------
 5 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 73ae77f0f213..a154b04e9316 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2782,11 +2782,13 @@ static const struct file_operations gpio_fileops = {
 #endif
 };
 
-int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
+int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 {
-	struct gpio_chip *gc;
+	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
+	lockdep_assert_held(&gdev->srcu);
+
 	cdev_init(&gdev->chrdev, &gpio_fileops);
 	gdev->chrdev.owner = THIS_MODULE;
 	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
@@ -2802,14 +2804,6 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 		return ret;
 	}
 
-	guard(srcu)(&gdev->srcu);
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc) {
-		cdev_device_del(&gdev->chrdev, &gdev->dev);
-		destroy_workqueue(gdev->line_state_wq);
-		return -ENODEV;
-	}
-
 	gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
 
 	return 0;
diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
index b42644cbffb8..4a9cb3335d99 100644
--- a/drivers/gpio/gpiolib-cdev.h
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -7,7 +7,7 @@
 
 struct gpio_device;
 
-int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
+int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt);
 void gpiolib_cdev_unregister(struct gpio_device *gdev);
 
 #endif /* GPIOLIB_CDEV_H */
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 1c25a7dd3db4..748a3eb1bf35 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -983,13 +983,15 @@ void gpiod_unexport(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-int gpiochip_sysfs_register(struct gpio_device *gdev)
+int gpiochip_sysfs_register(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	struct gpiodev_data *data;
-	struct gpio_chip *chip;
 	struct device *parent;
 	int err;
 
+	lockdep_assert_held(&gdev->srcu);
+
 	/*
 	 * Many systems add gpio chips for SOC support very early,
 	 * before driver model support is available.  In those cases we
@@ -999,18 +1001,12 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	if (!class_is_registered(&gpio_class))
 		return 0;
 
-	guard(srcu)(&gdev->srcu);
-
-	chip = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!chip)
-		return -ENODEV;
-
 	/*
 	 * For sysfs backward compatibility we need to preserve this
 	 * preferred parenting to the gpio_chip parent field, if set.
 	 */
-	if (chip->parent)
-		parent = chip->parent;
+	if (gc->parent)
+		parent = gc->parent;
 	else
 		parent = &gdev->dev;
 
@@ -1029,7 +1025,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 						    MKDEV(0, 0), data,
 						    gpiochip_groups,
 						    GPIOCHIP_NAME "%d",
-						    chip->base);
+						    gc->base);
 	if (IS_ERR(data->cdev_base)) {
 		err = PTR_ERR(data->cdev_base);
 		kfree(data);
@@ -1085,10 +1081,9 @@ void gpiochip_sysfs_unregister(struct gpio_chip *gc)
  */
 static int gpiofind_sysfs_register(struct gpio_chip *gc, const void *data)
 {
-	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
-	ret = gpiochip_sysfs_register(gdev);
+	ret = gpiochip_sysfs_register(gc);
 	if (ret)
 		gpiochip_err(gc, "failed to register the sysfs entry: %d\n", ret);
 
diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
index fd5db5384681..d0998de043a2 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -7,12 +7,12 @@ struct gpio_device;
 
 #ifdef CONFIG_GPIO_SYSFS
 
-int gpiochip_sysfs_register(struct gpio_device *gdev);
+int gpiochip_sysfs_register(struct gpio_chip *gc);
 void gpiochip_sysfs_unregister(struct gpio_chip *gc);
 
 #else
 
-static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
+static inline int gpiochip_sysfs_register(struct gpio_chip *gc)
 {
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d5070c538ba5..44635e9a29c3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -881,14 +881,14 @@ static const struct device_type gpio_dev_type = {
 };
 
 #ifdef CONFIG_GPIO_CDEV
-#define gcdev_register(gdev, devt)	gpiolib_cdev_register((gdev), (devt))
+#define gcdev_register(gc, devt)	gpiolib_cdev_register((gc), (devt))
 #define gcdev_unregister(gdev)		gpiolib_cdev_unregister((gdev))
 #else
 /*
  * gpiolib_cdev_register() indirectly calls device_add(), which is still
  * required even when cdev is not selected.
  */
-#define gcdev_register(gdev, devt)	device_add(&(gdev)->dev)
+#define gcdev_register(gc, devt)	device_add(&(gc)->gpiodev->dev)
 #define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
 #endif
 
@@ -896,8 +896,9 @@ static const struct device_type gpio_dev_type = {
  * An initial reference count has been held in gpiochip_add_data_with_key().
  * The caller should drop the reference via gpio_device_put() on errors.
  */
-static int gpiochip_setup_dev(struct gpio_device *gdev)
+static int gpiochip_setup_dev(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
@@ -910,11 +911,11 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	if (fwnode && !fwnode->dev)
 		fwnode_dev_initialized(fwnode, false);
 
-	ret = gcdev_register(gdev, gpio_devt);
+	ret = gcdev_register(gc, gpio_devt);
 	if (ret)
 		return ret;
 
-	ret = gpiochip_sysfs_register(gdev);
+	ret = gpiochip_sysfs_register(gc);
 	if (ret)
 		goto err_remove_device;
 
@@ -961,13 +962,22 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
 static void gpiochip_setup_devs(void)
 {
 	struct gpio_device *gdev;
+	struct gpio_chip *gc;
 	int ret;
 
 	guard(srcu)(&gpio_devices_srcu);
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		ret = gpiochip_setup_dev(gdev);
+		guard(srcu)(&gdev->srcu);
+
+		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		if (!gc) {
+			dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
+			continue;
+		}
+
+		ret = gpiochip_setup_dev(gc);
 		if (ret) {
 			gpio_device_put(gdev);
 			dev_err(&gdev->dev,
@@ -1225,7 +1235,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
-		ret = gpiochip_setup_dev(gdev);
+		ret = gpiochip_setup_dev(gc);
 		if (ret)
 			goto err_teardown_shared;
 	}
-- 
2.51.0


