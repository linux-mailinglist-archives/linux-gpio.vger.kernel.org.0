Return-Path: <linux-gpio+bounces-31661-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOvRGnvvjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31661-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:31:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B11347BB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A69843006987
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B05E2D9EC5;
	Fri, 13 Feb 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnUp4c4i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F432695F;
	Fri, 13 Feb 2026 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975075; cv=none; b=XsIwDUYcO6kPNogT8/vprfUFeRgGH91JgzaA8tjZY1owJGJbhXNoTWn6YId3Xa+kDJT5QxB+A+5PEBygRkxEjTXW7+4oPYKvCI+GfI/8I8t8snguqt9seyZYoeHkeMAmLF1XIrt/rHUJP7EsL2SrOK2BfCrsJ37hMDT3gkuEFWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975075; c=relaxed/simple;
	bh=a0Nuy0UYMO/xZM1sfMO/NhXKrBeZbiAntWD51TL+aEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goJK/X4CmxvUJs4mg6BhdSJWLsCh5UIUjpnnZVATGBccynLESyRbN1tVgQtpVaJwitYj+5EZUCF0v4dWSOvyNq95cS3Xi+4XolYJfbw+dy9smUc4BFqp+sryJ3IrVbuEVZJZjufKVCbrfzGkYxjullKJlr/99togWvc3PRQ8Y3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnUp4c4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F388BC116C6;
	Fri, 13 Feb 2026 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975074;
	bh=a0Nuy0UYMO/xZM1sfMO/NhXKrBeZbiAntWD51TL+aEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnUp4c4igH3L73SeFnlJHue+5d6oQX4YIFccDtCwThwzVbiuoGmNVpWCP++xvgp8c
	 JN9UAfUcP95a0oEQ5e32iacV967RH6sawoW7qHfmylfXOizHVNRZ016E2Xyeq/qmzC
	 NJA4OOMxZn3nJEAmDTlD/8Xmh7dlkaD7FGt8YFCFBdmr9KJ7JzJVV5wuKChmVGVIhz
	 jwBCbLKLTH6PX4XK6NgpqB524QGAbsAQ7LA19p11lamvyE/8noVXXgEz+hOkdW+Hdz
	 XqBxYxW1s4EJsYt6H9FMAK9DrkxgVNLR+3Z5QBaQiPx99Ef0E2H3ZzsV9Mr3N2KbrW
	 4fIfQr9yf4dKg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/11] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
Date: Fri, 13 Feb 2026 09:29:51 +0000
Message-ID: <20260213092958.864411-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
In-Reply-To: <20260213092958.864411-1-tzungbi@kernel.org>
References: <20260213092958.864411-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-31661-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F7B11347BB
X-Rspamd-Action: no action

Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
checks for struct gpio_chip.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Pass struct gpio_chip * only.

v2: https://lore.kernel.org/all/20260203061059.975605-5-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-10-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c  | 12 ++----------
 drivers/gpio/gpiolib-cdev.h  |  2 +-
 drivers/gpio/gpiolib-sysfs.c | 13 +++----------
 drivers/gpio/gpiolib-sysfs.h |  4 ++--
 drivers/gpio/gpiolib.c       | 24 +++++++++++++++++-------
 5 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2adc3c070908..b028198adba8 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2782,9 +2782,9 @@ static const struct file_operations gpio_fileops = {
 #endif
 };
 
-int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
+int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 {
-	struct gpio_chip *gc;
+	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
 	cdev_init(&gdev->chrdev, &gpio_fileops);
@@ -2802,14 +2802,6 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
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
index 97e269f30945..3fdcfa0c7d42 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -978,10 +978,10 @@ void gpiod_unexport(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-int gpiochip_sysfs_register(struct gpio_device *gdev)
+int gpiochip_sysfs_register(struct gpio_chip *chip)
 {
+	struct gpio_device *gdev = chip->gpiodev;
 	struct gpiodev_data *data;
-	struct gpio_chip *chip;
 	struct device *parent;
 	int err;
 
@@ -994,12 +994,6 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
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
@@ -1080,10 +1074,9 @@ void gpiochip_sysfs_unregister(struct gpio_chip *chip)
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
index 9ee2f9dd268f..aacc8e6454a4 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -7,12 +7,12 @@ struct gpio_device;
 
 #ifdef CONFIG_GPIO_SYSFS
 
-int gpiochip_sysfs_register(struct gpio_device *gdev);
+int gpiochip_sysfs_register(struct gpio_chip *chip);
 void gpiochip_sysfs_unregister(struct gpio_chip *chip);
 
 #else
 
-static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
+static inline int gpiochip_sysfs_register(struct gpio_chip *chip)
 {
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3ff57b1e51bf..74ee7bfb974c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -882,14 +882,14 @@ static const struct device_type gpio_dev_type = {
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
 
@@ -897,8 +897,9 @@ static const struct device_type gpio_dev_type = {
  * An initial reference count has been held in gpiochip_add_data_with_key().
  * The caller should drop the reference via gpio_device_put() on errors.
  */
-static int gpiochip_setup_dev(struct gpio_device *gdev)
+static int gpiochip_setup_dev(struct gpio_chip *gc)
 {
+	struct gpio_device *gdev = gc->gpiodev;
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
@@ -911,11 +912,11 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
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
 
@@ -962,13 +963,22 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
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
@@ -1226,7 +1236,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
-		ret = gpiochip_setup_dev(gdev);
+		ret = gpiochip_setup_dev(gc);
 		if (ret)
 			goto err_teardown_shared;
 	}
-- 
2.53.0.310.g728cabbaf7-goog


