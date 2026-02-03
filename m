Return-Path: <linux-gpio+bounces-31377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NDEHu2SgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:17:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CBD520D
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44AD43114675
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6D1214204;
	Tue,  3 Feb 2026 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iU/6X18K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0FC36B04D;
	Tue,  3 Feb 2026 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099130; cv=none; b=GkFQ5Yz9Iw1zsCL5ykCpwgpxZj4xrf/oYNGi4wDLCdtzVtDQ5Gr1YfEHykOfRKfBzfLKhFx0qYzsh8PrqbHexeXC0SLGWorh3wfyyjNv1eJZHhOTf0FPGqr8D5bxydDuOSEL5qzuUkGUx2fE4scVvJ1Z0sU/5YOk1mAJBAGa61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099130; c=relaxed/simple;
	bh=GShNgLrfw5AGXnpJDchEQqstj+ZhEH+iv4NR8Iw7sOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1/UCca0C+dMFqFU3uZ5zcWitQlk1N2Pnonb0cZJV7RxpDh5N1X0wiLAkrPHXP1Is3AWojPhQCVb0zrM7H1Z9BpUqfM9e4k5vkgAFh09ysv+T46oX5atA49tqsbmf9U8zXbgipVirdVskHr2E/nfuMz2izshKbdZmjTDdExtfps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iU/6X18K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBA2C19425;
	Tue,  3 Feb 2026 06:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099129;
	bh=GShNgLrfw5AGXnpJDchEQqstj+ZhEH+iv4NR8Iw7sOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iU/6X18KmXOgVfT+J0b8LVmdk5ir+wOYclDA55dWi8JyqqFvcoYf8LF4LPzmZhQLZ
	 TeVdSWDRgPR38rgTGEDnrRquyj8IHzsvPHBnvXgonDTmQYNv+DW0VuoDjEqUteie7X
	 9bPrJs5bVAkBQczBU7N+2ETunZaXAYp0tA6KeuKyYB7Jw2rqAkC6JegPESEwDddpEP
	 DAUqG1iIbmHcyRWGmEf2sVLsEWqNZgdaSmbxu0Vpo6zIlIaj1M3ihYO270/Sig+yL3
	 FPExWP3PDiWT06ze1RqJwYeuNw0uOvvYx/7dpCpnZiu8IE33zMs8BT03FbKu9jJ3Kr
	 A4jcYllGZw1bQ==
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
Subject: [PATCH v2 07/11] gpio: Add revocable provider handle for struct gpio_chip
Date: Tue,  3 Feb 2026 06:10:54 +0000
Message-ID: <20260203061059.975605-8-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31377-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC0CBD520D
X-Rspamd-Action: no action

The underlying chip can be removed asynchronously.  `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`.

Revocable encapsulates the details.  Add revocable provider handle for
the corresponding struct gpio_chip in struct gpio_device so that it can
start to hide the synchronization details.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org.
  - Add __rcu for `chip_rp`.
  - Pass pointer of pointer to revocable_provider_revoke().
- Rebase accordingly after applying
  https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-13-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 20 ++++++++++++++++++--
 drivers/gpio/gpiolib.h |  2 ++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7885dcd1e49d..fdae10ec3a17 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -22,6 +22,7 @@
 #include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
@@ -1110,6 +1111,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_put_device;
 	}
 
+	gdev->chip_rp = revocable_provider_alloc(gc);
+	if (!gdev->chip_rp) {
+		ret = -ENOMEM;
+		goto err_put_device;
+	}
+
 	gdev->can_sleep = gc->can_sleep;
 	rwlock_init(&gdev->line_state_lock);
 	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
@@ -1139,7 +1146,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_put_device;
+				goto err_free_rp;
 			}
 
 			/*
@@ -1159,7 +1166,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_put_device;
+			goto err_free_rp;
 		}
 	}
 
@@ -1256,6 +1263,14 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
+err_free_rp:
+	/*
+	 * Unlike other allocated resources for `gdev` can be freed
+	 * in gpiodev_release().  Call revocable_provider_revoke()
+	 * here as it's designed to be called when the chip is gone
+	 * (i.e., gpiochip_remove()).
+	 */
+	revocable_provider_revoke(&gdev->chip_rp);
 err_put_device:
 	gpio_device_put(gdev);
 	goto err_print_message;
@@ -1302,6 +1317,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	revocable_provider_revoke(&gdev->chip_rp);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3abb90385829..cd136d5b52e9 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -52,6 +52,7 @@
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
  * @srcu: protects the pointer to the underlying GPIO chip
+ * @chip_rp: revocable provider handle for the corresponding struct gpio_chip.
  * @pin_ranges: range of pins served by the GPIO driver
  *
  * This state container holds most of the runtime variable data
@@ -79,6 +80,7 @@ struct gpio_device {
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;
+	struct revocable_provider __rcu *chip_rp;
 
 #ifdef CONFIG_PINCTRL
 	/*
-- 
2.53.0.rc2.204.g2597b5adb4-goog


