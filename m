Return-Path: <linux-gpio+bounces-31374-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCk2NV2SgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31374-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:14:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA45D51AE
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7129D30B6B32
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A98336C59F;
	Tue,  3 Feb 2026 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElBKPToe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB362F12C9;
	Tue,  3 Feb 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099122; cv=none; b=B3wDNu1ul9JPN3dtdvhKNDHzP2I//YgzeQUKDPLoTpGpfrBfHUO3e++xfe5LSVU+qSSpxLdJUBe+mHLoB4GH5x0wViwHXfQ4vp7ZuPgQjPdUSx9KB2k9RpD/anzeQKiTkR6iUSgu1Mt0H6oP4k3zD/atBbvJfdPJrewe4QlHs8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099122; c=relaxed/simple;
	bh=BpRnb8HlJCckOF1TQGnoEDWIxdW1FFDdRoCSkW9rW4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoJQfCbuwWQN+h+Ab0JyRMkXInkcXEVvuYNa/BlMlgp5t7l/B5aUejiemn5Ze2zRCgbyxGMeUWAcbulpDot9mG/U5ITrJeJXm2FB4kVIk49+7tMi+ZuNil4tsprqChHwKkAFvtSSyD/OG8QaCDmaDvTWnmgi47iISPoVIWxLXs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElBKPToe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D38C2BCB3;
	Tue,  3 Feb 2026 06:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099121;
	bh=BpRnb8HlJCckOF1TQGnoEDWIxdW1FFDdRoCSkW9rW4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElBKPToeTRlsfX2w4mOkWQD80NqMYxPCgSvOvlQoDgAb/f98YSYR4WOJUXAscW6Wq
	 IVshiR2JX+wxfW49kpFiCJrFYTQhpI0O1vVJPya/yWdggWfxdyDExXT52RWV7B8ZrU
	 l4+QGJTIL01vOZB4bJns6Qz6SGrSE5gUFsokawqhIaBqg6LPt1JgrjZVQrI1jkksoh
	 jg1FpcJl/O8PAZ2j6uOOrFg27XAaz3Q61y5j6dpVjO8F+eREIpUo8kXmp3tPGhI/TW
	 4NkhEF75EtbChBYvNxP5vgArND3TuPetK/HWyJuH7JEZIedj3674t3Ba4t0OmNBejL
	 xpzKEyKHLYXow==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 04/11] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
Date: Tue,  3 Feb 2026 06:10:51 +0000
Message-ID: <20260203061059.975605-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260203061059.975605-1-tzungbi@kernel.org>
References: <20260203061059.975605-1-tzungbi@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31374-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BA45D51AE
X-Rspamd-Action: no action

Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
checks for struct gpio_chip.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-10-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c  | 12 ++----------
 drivers/gpio/gpiolib-cdev.h  |  3 ++-
 drivers/gpio/gpiolib-sysfs.c | 11 ++---------
 drivers/gpio/gpiolib-sysfs.h |  5 +++--
 drivers/gpio/gpiolib.c       | 24 +++++++++++++++++-------
 5 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2adc3c070908..b89201578516 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2782,9 +2782,9 @@ static const struct file_operations gpio_fileops = {
 #endif
 };
 
-int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
+int gpiolib_cdev_register(struct gpio_device *gdev, struct gpio_chip *gc,
+			  dev_t devt)
 {
-	struct gpio_chip *gc;
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
index b42644cbffb8..16ef1e2e96a0 100644
--- a/drivers/gpio/gpiolib-cdev.h
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -7,7 +7,8 @@
 
 struct gpio_device;
 
-int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
+int gpiolib_cdev_register(struct gpio_device *gdev, struct gpio_chip *gc,
+			  dev_t devt);
 void gpiolib_cdev_unregister(struct gpio_device *gdev);
 
 #endif /* GPIOLIB_CDEV_H */
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 8e6b09d8b559..a4427a5cfa85 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -978,10 +978,9 @@ void gpiod_unexport(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-int gpiochip_sysfs_register(struct gpio_device *gdev)
+int gpiochip_sysfs_register(struct gpio_device *gdev, struct gpio_chip *chip)
 {
 	struct gpiodev_data *data;
-	struct gpio_chip *chip;
 	struct device *parent;
 	int err;
 
@@ -994,12 +993,6 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
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
@@ -1082,7 +1075,7 @@ static int gpiofind_sysfs_register(struct gpio_chip *gc, const void *data)
 	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
-	ret = gpiochip_sysfs_register(gdev);
+	ret = gpiochip_sysfs_register(gdev, gc);
 	if (ret)
 		gpiochip_err(gc, "failed to register the sysfs entry: %d\n", ret);
 
diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
index 93debe8e118c..192b1ee041a6 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -7,13 +7,14 @@ struct gpio_device;
 
 #ifdef CONFIG_GPIO_SYSFS
 
-int gpiochip_sysfs_register(struct gpio_device *gdev);
+int gpiochip_sysfs_register(struct gpio_device *gdev, struct gpio_chip *chip);
 void gpiochip_sysfs_unregister(struct gpio_device *gdev,
 			       struct gpio_chip *chip);
 
 #else
 
-static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
+static inline int gpiochip_sysfs_register(struct gpio_device *gdev,
+					  struct gpio_chip *chip)
 {
 	return 0;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3137e6f1108a..7885dcd1e49d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -882,14 +882,15 @@ static const struct device_type gpio_dev_type = {
 };
 
 #ifdef CONFIG_GPIO_CDEV
-#define gcdev_register(gdev, devt)	gpiolib_cdev_register((gdev), (devt))
+#define gcdev_register(gdev, gc, devt)	\
+		gpiolib_cdev_register((gdev), (gc), (devt))
 #define gcdev_unregister(gdev)		gpiolib_cdev_unregister((gdev))
 #else
 /*
  * gpiolib_cdev_register() indirectly calls device_add(), which is still
  * required even when cdev is not selected.
  */
-#define gcdev_register(gdev, devt)	device_add(&(gdev)->dev)
+#define gcdev_register(gdev, gc, devt)	device_add(&(gdev)->dev)
 #define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
 #endif
 
@@ -897,7 +898,7 @@ static const struct device_type gpio_dev_type = {
  * An initial reference count has been held in gpiochip_add_data_with_key().
  * The caller should drop the reference via gpio_device_put() on errors.
  */
-static int gpiochip_setup_dev(struct gpio_device *gdev)
+static int gpiochip_setup_dev(struct gpio_device *gdev, struct gpio_chip *gc)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
@@ -911,11 +912,11 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	if (fwnode && !fwnode->dev)
 		fwnode_dev_initialized(fwnode, false);
 
-	ret = gcdev_register(gdev, gpio_devt);
+	ret = gcdev_register(gdev, gc, gpio_devt);
 	if (ret)
 		return ret;
 
-	ret = gpiochip_sysfs_register(gdev);
+	ret = gpiochip_sysfs_register(gdev, gc);
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
+		ret = gpiochip_setup_dev(gdev, gc);
 		if (ret) {
 			gpio_device_put(gdev);
 			dev_err(&gdev->dev,
@@ -1221,7 +1231,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
-		ret = gpiochip_setup_dev(gdev);
+		ret = gpiochip_setup_dev(gdev, gc);
 		if (ret)
 			goto err_teardown_shared;
 	}
-- 
2.53.0.rc2.204.g2597b5adb4-goog


