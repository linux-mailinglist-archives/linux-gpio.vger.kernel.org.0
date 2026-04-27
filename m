Return-Path: <linux-gpio+bounces-35576-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKWKGt5s72kcBQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35576-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:04:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7463473F7F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2239430899BC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60E73D1CA5;
	Mon, 27 Apr 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQFCB0i8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6E3D091F;
	Mon, 27 Apr 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298381; cv=none; b=OjfbEbk9CMfJt13LVcYXjPzi+5ckVHJylSIAEtpu6MeisdHgWs5TxBM75PWcDxvX7lfZo9/avu7D2eMvw4pfU/jnJSyfp6buLJqLQkGNWPNpWTQ2GR2rOn+e12618J31UMw0GG3e/26oB13OlQ69xxn438ZWhzzecjAGmLH3Vg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298381; c=relaxed/simple;
	bh=irxhZkaKfHIdVHdouqfkKfKuqE/ET7mMdjnf9j6+Uqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDbGW1aU4D0q0r5X0J0+NsVjH5mx0QTeqxlQVRh5MiTj7zkQ82Mml3tEdVQXCsiGzCQ3MrFx2Q7klFXbMb6pmEbbTZJFKtVODlbmvUE8F9+pbP+XaLVEc3Qm4QuKn0MCuUDd6uF54fKOrbqwprxJcRP54V8b2DYGeFfEHA4lrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQFCB0i8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE6EC19425;
	Mon, 27 Apr 2026 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777298381;
	bh=irxhZkaKfHIdVHdouqfkKfKuqE/ET7mMdjnf9j6+Uqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UQFCB0i8RnoicHTdB5ChZ9u5kx/wt8bHiruBuO6TOzJ4E1WFCJSYjUEjnObXvupAE
	 ubwhaySFuk3vfT4udljzz1D8i8eictuz2oxMMl5gJouZ5YPMmWNc2pPjMNvltFYOVh
	 qKY70/u64NryUQbffWGc6wU8Js3JZznCpMi09fnz94vz5l6/o6yfFxUcxwVC0uNt0u
	 5b7hrKqDtqwSNmoF+DMTnBj7swxbIcnrvb/JNJp7WKrijPCxPHHbqDnjLl7zc8HZeu
	 cSGh3ai2LrbEPC5HfmFZYz56k1NHTpTwfJmUcKLVUXufcBwn+EYPU/GR6Nro5KeaKi
	 YOVg5hjAIIrxg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v9 3/9] gpio: Add revocable provider handle for struct gpio_chip
Date: Mon, 27 Apr 2026 21:58:35 +0800
Message-ID: <20260427135841.96266-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427135841.96266-1-tzungbi@kernel.org>
References: <20260427135841.96266-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C7463473F7F
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-35576-lists,linux-gpio=lfdr.de];
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

The underlying chip can be removed asynchronously.  `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`.

Revocable encapsulates the details.  Add revocable provider handle for
the corresponding struct gpio_chip in struct gpio_device so that it can
start to hide the synchronization details.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v9:
- New to the series.
- Use static allocated resource provider.
- Rename "chip_rp" -> "chip_rev".

v4 - v8:
- Doesn't exist.

v3: https://lore.kernel.org/all/20260213092958.864411-8-tzungbi@kernel.org
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-8-tzungbi@kernel.org
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org.
  - Add __rcu for `chip_rp`.
  - Pass pointer of pointer to revocable_provider_revoke().
- Rebase accordingly after applying
  https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-13-tzungbi@kernel.org

---
 drivers/gpio/gpiolib.c | 7 +++++++
 drivers/gpio/gpiolib.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..20448d5aab93 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -23,6 +23,7 @@
 #include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
@@ -874,6 +875,7 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	revocable_embed_destroy(&gdev->chip_rev);
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
@@ -1167,6 +1169,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_cleanup_desc_srcu;
 
+	ret = revocable_embed_init(&gdev->chip_rev, gc);
+	if (ret)
+		goto err_cleanup_desc_srcu;
+
 	device_initialize(&gdev->dev);
 	/*
 	 * After this point any allocated resources to `gdev` will be
@@ -1389,6 +1395,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	revocable_revoke(&gdev->chip_rev);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index dc4cb61a9318..4e2e98f61f5a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/revocable.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/srcu.h>
@@ -55,6 +56,7 @@ struct fwnode_handle;
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
  * @srcu: protects the pointer to the underlying GPIO chip
+ * @chip_rev: revocable provider handle for the corresponding struct gpio_chip.
  * @pin_ranges: range of pins served by the GPIO driver
  *
  * This state container holds most of the runtime variable data
@@ -82,6 +84,7 @@ struct gpio_device {
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;
+	struct revocable	chip_rev;
 
 #ifdef CONFIG_PINCTRL
 	/*
-- 
2.51.0


