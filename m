Return-Path: <linux-gpio+bounces-35164-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BAcEbF032mFTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35164-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:21:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B921B403B49
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3328131333C3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623153783D1;
	Wed, 15 Apr 2026 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="gmt0lluC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934043431F5
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251775; cv=none; b=LNPrvYRTvb67HL+z3xUPY+qfQL0LPl4Qun2Wvv9s/6YFiWwvtgLdmiCxD9o2fJ6LJqNu4Vn73Hp16HKe2JC3x+FJeqBmSs/RpzAgw7TwCn/c3M29OuaDcsKt1pQ1VJbWUztPCLUdK/Hrfnox3SHsIrjwhPJmeze1QjiCJMLB9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251775; c=relaxed/simple;
	bh=2JbAD/DSNBNfRE24tbvNZj/0IfyRuIUOcjNQsNfyiZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHra6eNihZ97C+3fQgSgIwuSzkeh9n8PapfWZRBGB1wSZ43XhDhStEKUjYQ9mNrwxyTqa7MLSXjAegN3nCaDeXphAhN+yOis9yNWoDBSbX2qiSIj2fGeiaVfC1OPigWA0bVVsHCZePgcTfqKyx+wEEEKkdCaQ+U2kwXd6aw4L2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=gmt0lluC; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fwdqs5853zyTB;
	Wed, 15 Apr 2026 13:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776251769;
	bh=yfWCJrrXvC+OtV0W0WCKQPC1fpYnvPmsr7D+XYucFmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gmt0lluCphkmSE2abwtDdfupMf8+4KqSVto9p7MkRdKDt6HvEtLcXmwNMDZWOkTKd
	 ApnXYc7oQmVdmVwNVUsm4Cxj/v7Gba5QNpOOlqAMv8abd44BF4fq2JMt4jlQzb4QNS
	 WgoYXy6Jd4AoFMks5EUsoqywMPzRX0e3fRU2FSbHVamJ8BWJRFYYkANTSfNts75mLj
	 6j0Q6UgaHihJpsVm+8POxRS6kUGnYm3yRGe68yGvsewctLlLwTESxbxmCPBDBVeE+Y
	 3PBW9E0Kl2g6478aQgjdl/kX6fyoSplXsHWqyxUvqrqTvF58uYGSbnQZHPlsA2Q5k3
	 pzuWGypY3CkEw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fwdqr6Jzwzw5F;
	Wed, 15 Apr 2026 13:16:08 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 15 Apr 2026 13:15:41 +0200
Subject: [PATCH 6.12.y 2/2] gpiolib: fix race condition for gdev->srcu
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-6-12-gpiolib-cve-2026-22986-v1-2-3a7a6de332eb@cherry.de>
References: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
In-Reply-To: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, stable@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 =?utf-8?q?Pawe=C5=82_Narewski?= <pawel.narewski@nokia.com>, 
 Jakub Lewalski <jakub.lewalski@nokia.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[0leil.net,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[0leil.net:s=20231125];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35164-lists,linux-gpio=lfdr.de,kernel];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[0leil.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0leil.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,cherry.de:mid,cherry.de:email]
X-Rspamd-Queue-Id: B921B403B49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Paweł Narewski <pawel.narewski@nokia.com>

[ Upstream commit a7ac22d53d0990152b108c3f4fe30df45fcb0181 ]

If two drivers were calling gpiochip_add_data_with_key(), one may be
traversing the srcu-protected list in gpio_name_to_desc(), meanwhile
other has just added its gdev in gpiodev_add_to_list_unlocked().
This creates a non-mutexed and non-protected timeframe, when one
instance is dereferencing and using &gdev->srcu, before the other
has initialized it, resulting in crash:

[    4.935481] Unable to handle kernel paging request at virtual address ffff800272bcc000
[    4.943396] Mem abort info:
[    4.943400]   ESR = 0x0000000096000005
[    4.943403]   EC = 0x25: DABT (current EL), IL = 32 bits
[    4.943407]   SET = 0, FnV = 0
[    4.943410]   EA = 0, S1PTW = 0
[    4.943413]   FSC = 0x05: level 1 translation fault
[    4.943416] Data abort info:
[    4.943418]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[    4.946220]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    4.955261]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    4.955268] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000038e6c000
[    4.961449] [ffff800272bcc000] pgd=0000000000000000
[    4.969203] , p4d=1000000039739003
[    4.979730] , pud=0000000000000000
[    4.980210] phandle (CPU): 0x0000005e, phandle (BE): 0x5e000000 for node "reset"
[    4.991736] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
...
[    5.121359] pc : __srcu_read_lock+0x44/0x98
[    5.131091] lr : gpio_name_to_desc+0x60/0x1a0
[    5.153671] sp : ffff8000833bb430
[    5.298440]
[    5.298443] Call trace:
[    5.298445]  __srcu_read_lock+0x44/0x98
[    5.309484]  gpio_name_to_desc+0x60/0x1a0
[    5.320692]  gpiochip_add_data_with_key+0x488/0xf00
    5.946419] ---[ end trace 0000000000000000 ]---

Move initialization code for gdev fields before it is added to
gpio_devices, with adjacent initialization code.
Adjust goto statements  to reflect modified order of operations

Fixes: 47d8b4c1d868 ("gpio: add SRCU infrastructure to struct gpio_device")
Reviewed-by: Jakub Lewalski <jakub.lewalski@nokia.com>
Signed-off-by: Paweł Narewski <pawel.narewski@nokia.com>
[Bartosz: fixed a build issue, removed stray newline]
Link: https://lore.kernel.org/r/20251224082641.10769-1-bartosz.golaszewski@oss.qualcomm.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
[missing commit fcc8b637c542 ("gpiolib: switch the line state notifier
 to atomic"), commit dcb73cbaaeb3 ("gpio: cdev: use raw notifier for
 line state events") and commit d4f335b410dd ("gpiolib: rename GPIO chip
 printk macros") in 6.12.y.
 Both notifiers as well as both srcu inits are moved before the
 scoped_guard, following same logic as in a7ac22d53d09.
 Rest is changes to git context only.]
Cc: stable@vger.kernel.org # 6.12
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/gpio/gpiolib.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3f9019cc832ac..5c8cd81656963 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -988,6 +988,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gdev->ngpio = gc->ngpio;
 	gdev->can_sleep = gc->can_sleep;
 
+	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
+	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
+
+	ret = init_srcu_struct(&gdev->srcu);
+	if (ret)
+		goto err_free_label;
+
+	ret = init_srcu_struct(&gdev->desc_srcu);
+	if (ret)
+		goto err_cleanup_gdev_srcu;
+
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
@@ -1002,7 +1013,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_free_label;
+				goto err_cleanup_desc_srcu;
 			}
 
 			/*
@@ -1022,21 +1033,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_free_label;
+			goto err_cleanup_desc_srcu;
 		}
 	}
 
-	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
-	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
-
-	ret = init_srcu_struct(&gdev->srcu);
-	if (ret)
-		goto err_remove_from_list;
-
-	ret = init_srcu_struct(&gdev->desc_srcu);
-	if (ret)
-		goto err_cleanup_gdev_srcu;
-
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -1046,11 +1046,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	ret = gpiochip_set_names(gc);
 	if (ret)
-		goto err_cleanup_desc_srcu;
+		goto err_remove_from_list;
 
 	ret = gpiochip_init_valid_mask(gc);
 	if (ret)
-		goto err_cleanup_desc_srcu;
+		goto err_remove_from_list;
 
 	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
 		struct gpio_desc *desc = &gdev->descs[desc_index];
@@ -1117,10 +1117,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	of_gpiochip_remove(gc);
 err_free_valid_mask:
 	gpiochip_free_valid_mask(gc);
-err_cleanup_desc_srcu:
-	cleanup_srcu_struct(&gdev->desc_srcu);
-err_cleanup_gdev_srcu:
-	cleanup_srcu_struct(&gdev->srcu);
 err_remove_from_list:
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
@@ -1130,6 +1126,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gpio_device_put(gdev);
 		goto err_print_message;
 	}
+err_cleanup_desc_srcu:
+	cleanup_srcu_struct(&gdev->desc_srcu);
+err_cleanup_gdev_srcu:
+	cleanup_srcu_struct(&gdev->srcu);
 err_free_label:
 	kfree_const(gdev->label);
 err_free_descs:

-- 
2.53.0


