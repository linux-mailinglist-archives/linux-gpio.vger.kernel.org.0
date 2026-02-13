Return-Path: <linux-gpio+bounces-31660-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qESIOrjvjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31660-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:32:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 572361347FD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB3C73107F02
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8725E325706;
	Fri, 13 Feb 2026 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMIo1mj8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C452D9EC5;
	Fri, 13 Feb 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975072; cv=none; b=pN5pS29fs+4n33gIrjd6O+4GW2Mo90WEHhgRQ+Q/ANxuP4bAKFxNKU2OYIP2U3sHCppydFr7M+Q3Pwy9damNUaW4klu17q5xtURAHoDpzB4UrXvQo2E4AkPKi/qq2Fk/TK8TgKVbkz01EyN/gkZsbrn9kQKQWxQUeyjWLatQb+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975072; c=relaxed/simple;
	bh=4lmvZJ5YXxkra6JcPmvMDUqSNsmp29GAkCIdsIEWkuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8roDDZPNtsq+obwI/3kFj2Zp3NHWkxPxNSRb8hOe34oy8mdO4k429tSxVoGhGrW9U5hkcd0/KZjwIV7O4xc4zWMwcN3XztsR4DYDOS1aix3Dsalg/R7naClPcG3VDx4GWq/Uhp2pZo6hl02R+yO1PzW9/bSp7vJa8ml75Mdh94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMIo1mj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B40C16AAE;
	Fri, 13 Feb 2026 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975071;
	bh=4lmvZJ5YXxkra6JcPmvMDUqSNsmp29GAkCIdsIEWkuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SMIo1mj82G6ZnNlKvnBix9OuoB6aqLPuw2r1mfW1Lp77VtUZaBPmEe9QMjwsAdOjE
	 x0Uv53q0HLxoPV1BFcRSoVllV2VlYl0aJ4YEEv1YGPHvNb08Z1W753mCte1fY1D/xZ
	 AEmR+PHTsXvJeckQu3sAlkxAdgdOoa0hlJVpQqy7V5fWYdSMWeN4pnI+Mh4W0R4vUZ
	 TQHzkwIHSSjpAkniDPQRtH44mbzg6Q+HWEtZZlS0uWL0+iaLc6bJFg6te4z054HOGS
	 Supv+oceFGs8qKUGM1ktNNocrDUHr0JlunVw+vJ9Vqu8a0GrFiYLv39HROq/2w4/Yy
	 MpzsVQxPRsrcA==
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
Subject: [PATCH v3 03/11] gpio: sysfs: Remove redundant check for struct gpio_chip
Date: Fri, 13 Feb 2026 09:29:50 +0000
Message-ID: <20260213092958.864411-4-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-31660-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 572361347FD
X-Rspamd-Action: no action

gpiochip_sysfs_unregister() is only called by gpiochip_remove() where
the struct gpio_chip is ensured.

Remove the redundant check.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Pass struct gpio_chip * only.

v2: https://lore.kernel.org/all/20260203061059.975605-4-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-9-tzungbi@kernel.org

 drivers/gpio/gpiolib-sysfs.c | 10 ++--------
 drivers/gpio/gpiolib-sysfs.h |  4 ++--
 drivers/gpio/gpiolib.c       |  2 +-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index cd553acf3055..97e269f30945 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -1048,11 +1048,11 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 	return 0;
 }
 
-void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+void gpiochip_sysfs_unregister(struct gpio_chip *chip)
 {
+	struct gpio_device *gdev = chip->gpiodev;
 	struct gpiodev_data *data;
 	struct gpio_desc *desc;
-	struct gpio_chip *chip;
 
 	scoped_guard(mutex, &sysfs_lock) {
 		data = gdev_get_data(gdev);
@@ -1066,12 +1066,6 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 		kfree(data);
 	}
 
-	guard(srcu)(&gdev->srcu);
-
-	chip = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!chip)
-		return;
-
 	/* unregister gpiod class devices owned by sysfs */
 	for_each_gpio_desc_with_flag(chip, desc, GPIOD_FLAG_SYSFS) {
 		gpiod_unexport(desc);
diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.h
index b794b396d6a5..9ee2f9dd268f 100644
--- a/drivers/gpio/gpiolib-sysfs.h
+++ b/drivers/gpio/gpiolib-sysfs.h
@@ -8,7 +8,7 @@ struct gpio_device;
 #ifdef CONFIG_GPIO_SYSFS
 
 int gpiochip_sysfs_register(struct gpio_device *gdev);
-void gpiochip_sysfs_unregister(struct gpio_device *gdev);
+void gpiochip_sysfs_unregister(struct gpio_chip *chip);
 
 #else
 
@@ -17,7 +17,7 @@ static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
 	return 0;
 }
 
-static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
+static inline void gpiochip_sysfs_unregister(struct gpio_chip *chip)
 {
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1a3fd7600835..3ff57b1e51bf 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1286,7 +1286,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	struct gpio_device *gdev = gc->gpiodev;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
-	gpiochip_sysfs_unregister(gdev);
+	gpiochip_sysfs_unregister(gc);
 	gpiochip_free_hogs(gc);
 	gpiochip_free_remaining_irqs(gc);
 
-- 
2.53.0.310.g728cabbaf7-goog


