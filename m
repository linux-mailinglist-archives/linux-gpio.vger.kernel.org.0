Return-Path: <linux-gpio+bounces-31664-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PX3ESnwjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31664-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:34:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C3134860
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97CB1316D71A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB29310651;
	Fri, 13 Feb 2026 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCboUjWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED35732FA0D;
	Fri, 13 Feb 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975084; cv=none; b=fY5r2b7rx3AqVeBIWGpoGQk6OD/fgED40PQp2IhleGPCuJ11AlaR5zMSgJ4A90K/rZ1x5eQdhpoySIi3KVgyfdsRjip1uY2g36S1CpYxvL+eWJjH+Tes/i29Y22goMt80Op4BOwFL3WnCVfssxI1gWJKPBdUZUeeU4vmvlpZTX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975084; c=relaxed/simple;
	bh=lOvVM0s0yLJNqglO3n3zKCRlmz00D9/9tjJ5GMv3RjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CG6EisafcHklXUwnvXhkh9bsdV3mj0EEEhTea4GkqbTJGTcm9xKha5dzGGLhOkoQ2LeV9VavwrUDd/Wl+WFMXChsMmLmDTP3TsmV6YIowZGE7rb8D46CiM26yqe6upMNMzC18zF6TipZnw3fbYg9cmm3+7w3Oh4EVRdlgsWYW8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCboUjWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE1DC19421;
	Fri, 13 Feb 2026 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975083;
	bh=lOvVM0s0yLJNqglO3n3zKCRlmz00D9/9tjJ5GMv3RjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PCboUjWNXIBsPhFBy9G8zBOKrFO8/WfwUIKn++enI5Z0m7gs7D9eljeNQgMg2cTCf
	 J5gdqHVzfIj1qT+AEqpatv8u4gEm7M5GE+Ap+jbJdcKNftkZs7jlbd1nJWQFlN3js0
	 RlD3VvLokn00reGLZMosApmb5vLN8Axg9UHJAwySlzlZSxJNo9ye/nSaKK4gUAtoCb
	 18wnYfYGYO+5c0e5iY6KofHzQ/DGp1+HyqArQphTbmg8ryUdKVSfhfynSjLVNpSHm0
	 q4OKcNokBcUUw1iRgYM/6/vIMGmPpPSzkMNelpisBw/3iBflgATl3ShZefXEwKPx+F
	 3FqGGecEORDkQ==
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
Subject: [PATCH v3 07/11] gpio: Add revocable provider handle for struct gpio_chip
Date: Fri, 13 Feb 2026 09:29:54 +0000
Message-ID: <20260213092958.864411-8-tzungbi@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-31664-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: E79C3134860
X-Rspamd-Action: no action

The underlying chip can be removed asynchronously.  `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`.

Revocable encapsulates the details.  Add revocable provider handle for
the corresponding struct gpio_chip in struct gpio_device so that it can
start to hide the synchronization details.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-8-tzungbi@kernel.org
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org.
  - Add __rcu for `chip_rp`.
  - Pass pointer of pointer to revocable_provider_revoke().
- Rebase accordingly after applying
  https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-13-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 16 ++++++++++++++--
 drivers/gpio/gpiolib.h |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 74ee7bfb974c..7ef4dc4e6e9e 100644
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
@@ -869,6 +870,8 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	if (gdev->chip_rp)
+		revocable_put(gdev->chip_rp);
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
@@ -1115,6 +1118,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_put_device;
 	}
 
+	gdev->chip_rp = revocable_alloc(gc);
+	if (!gdev->chip_rp) {
+		ret = -ENOMEM;
+		goto err_put_device;
+	}
+
 	gdev->can_sleep = gc->can_sleep;
 	rwlock_init(&gdev->line_state_lock);
 	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
@@ -1144,7 +1153,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_put_device;
+				goto err_free_rp;
 			}
 
 			/*
@@ -1164,7 +1173,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_put_device;
+			goto err_free_rp;
 		}
 	}
 
@@ -1261,6 +1270,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
+err_free_rp:
+	revocable_revoke(gdev->chip_rp);
 err_put_device:
 	gpio_device_put(gdev);
 	goto err_print_message;
@@ -1307,6 +1318,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	revocable_revoke(gdev->chip_rp);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3abb90385829..56643f40e87e 100644
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
+	struct revocable	*chip_rp;
 
 #ifdef CONFIG_PINCTRL
 	/*
-- 
2.53.0.310.g728cabbaf7-goog


