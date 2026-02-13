Return-Path: <linux-gpio+bounces-31668-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC6zL6/wjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31668-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:36:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318B1348D7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1089831B73F3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DB134D917;
	Fri, 13 Feb 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTeHzrz7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1501834D4F1;
	Fri, 13 Feb 2026 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975096; cv=none; b=eRK7bk6OFlyoPRCf9wQGMewX9dI+qmMZFIXwSEWhGE9iAxfEk5nbrRdDMinsAC2sA4jRMj4D/P+4KYVhYsjRpeVJmq4V/urlreLRJ4ykQhKa2FUpiVRQIMPwrEEwYT7Mh8A0LhKz2iHw1DLhmZOcPr7wHBJCkqIqrhhCIX9zF3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975096; c=relaxed/simple;
	bh=HELCfPtNvCvEoazpaboPAkrUFqcVe3WmgWs+WHvPHis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoq4UdfYFZ0kNv55m4v2xNFwI8Y7rm4njQskaRZ7nrAXD/2NzxYf9wYdFaP7v0l41B4FgZ5j4XEUacOlssJ+gN+dU+VN/PNNTCuE4RCsbFQCbJpLDsj8iaQKdQ1BHAT1Gu2BJ78KjoHeMM9CWSVHScNX6E7yAhgjiA2AB91GdwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTeHzrz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1832EC2BC86;
	Fri, 13 Feb 2026 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975095;
	bh=HELCfPtNvCvEoazpaboPAkrUFqcVe3WmgWs+WHvPHis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTeHzrz7fBmNzxotEJYS7hqWo2i21aU5yS451f2gH4/xkQC65J7JEaSfuZGwdEp5h
	 qaRw7SH2+YHJ0Rk5gqCgL3oitiq+K51odE8tuTAeeEgp0d17UyPa0HZ8ae5wphzFaW
	 lK+sU9wfAR3J5aTT+riG+cP75ynvcG2RU1WDeSQv+exRBfecv1A3VBDzrnN4sUCPi3
	 i2lmYTCSj3ZBMF7fDJ2EZplvqZIUTErpa9VUGxj7axVVGeDT/Iy8GNjWPN2wynTXag
	 AO7PGO4RDDfwNAOWi7Els9HNOtwzbfDr2Fs2QrmZ8tCRzve1DKP3RX4ohb0iPkfpDr
	 FoBArUrhNA9Rw==
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
Subject: [PATCH v3 11/11] gpio: Remove unused `chip` and `srcu` in struct gpio_device
Date: Fri, 13 Feb 2026 09:29:58 +0000
Message-ID: <20260213092958.864411-12-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-31668-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4318B1348D7
X-Rspamd-Action: no action

`chip` and `srcu` in struct gpio_device are unused as their usages are
replaced to use revocable.  Remove them.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-12-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-24-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 26 +-------------------------
 drivers/gpio/gpiolib.h |  4 ----
 2 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2ba78add3417..01be9f6978f2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -423,8 +423,6 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->get_direction))
 		return -EOPNOTSUPP;
 
@@ -875,7 +873,6 @@ static void gpiodev_release(struct device *dev)
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
-	cleanup_srcu_struct(&gdev->srcu);
 	kfree(gdev);
 }
 
@@ -1076,14 +1073,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_gdev;
 	gdev->id = ret;
 
-	ret = init_srcu_struct(&gdev->srcu);
-	if (ret)
-		goto err_free_ida;
-	rcu_assign_pointer(gdev->chip, gc);
-
 	ret = init_srcu_struct(&gdev->desc_srcu);
 	if (ret)
-		goto err_cleanup_gdev_srcu;
+		goto err_free_ida;
 
 	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	if (ret)
@@ -1276,8 +1268,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 err_cleanup_desc_srcu:
 	cleanup_srcu_struct(&gdev->desc_srcu);
-err_cleanup_gdev_srcu:
-	cleanup_srcu_struct(&gdev->srcu);
 err_free_ida:
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
@@ -1314,8 +1304,6 @@ void gpiochip_remove(struct gpio_chip *gc)
 	synchronize_srcu(&gpio_devices_srcu);
 
 	/* Numb the device, cancelling all outstanding operations */
-	rcu_assign_pointer(gdev->chip, NULL);
-	synchronize_srcu(&gdev->srcu);
 	revocable_revoke(gdev->chip_rp);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
@@ -2815,8 +2803,6 @@ static int gpiochip_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->direction_input))
 		return -EOPNOTSUPP;
 
@@ -2832,8 +2818,6 @@ static int gpiochip_direction_output(struct gpio_chip *gc, unsigned int offset,
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->direction_output))
 		return -EOPNOTSUPP;
 
@@ -2921,8 +2905,6 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(unlikely(!gc->set)))
 		return -EOPNOTSUPP;
 
@@ -3270,8 +3252,6 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	/* Make sure this is called after checking for gc->get(). */
 	ret = gc->get(gc, offset);
 	if (ret > 1)
@@ -3323,8 +3303,6 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (gc->get_multiple) {
 		int ret;
 
@@ -3668,8 +3646,6 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 	unsigned int i;
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (gc->set_multiple) {
 		ret = gc->set_multiple(gc, mask, bits);
 		if (ret > 0)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a254a57f37f5..6a97d9726c20 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -28,7 +28,6 @@
  * @chrdev: character device for the GPIO device
  * @id: numerical ID number for the GPIO chip
  * @owner: helps prevent removal of modules exporting active GPIOs
- * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
  * @descs: array of ngpio descriptors.
  * @valid_mask: If not %NULL, holds bitmask of GPIOs which are valid to be
@@ -51,7 +50,6 @@
  *                 process context
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
- * @srcu: protects the pointer to the underlying GPIO chip
  * @chip_rp: revocable provider handle for the corresponding struct gpio_chip.
  * @pin_ranges: range of pins served by the GPIO driver
  *
@@ -65,7 +63,6 @@ struct gpio_device {
 	struct cdev		chrdev;
 	int			id;
 	struct module		*owner;
-	struct gpio_chip __rcu	*chip;
 	struct gpio_desc	*descs;
 	unsigned long		*valid_mask;
 	struct srcu_struct	desc_srcu;
@@ -79,7 +76,6 @@ struct gpio_device {
 	rwlock_t		line_state_lock;
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
-	struct srcu_struct	srcu;
 	struct revocable	*chip_rp;
 
 #ifdef CONFIG_PINCTRL
-- 
2.53.0.310.g728cabbaf7-goog


