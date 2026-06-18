Return-Path: <linux-gpio+bounces-38696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Reo1NvgfNGqzPAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:42:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAE6A1A7F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:42:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0leil.net header.s=20231125 header.b=g0fPEter;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38696-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38696-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=0leil.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A9F730BD3D7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EC333F8DC;
	Thu, 18 Jun 2026 16:40:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C9E3264CA
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 16:40:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800803; cv=none; b=NH4PFd1lyRfudghlhQU2ajcRbiwxvgH3D6p6VokKisHFpsnVg26r0rNxrj/er0dT6j4LNp9A1+WwLfQZZEGAG51QSBga1YWt+6MGj6WWsDNvwewrs7N+Bo8GUEaHL+rCQ/g5VGH1wKjE+iiT/rQ4mbaL4XU0vt7olUUtQ2tBkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800803; c=relaxed/simple;
	bh=gvDtyKKRc5B9UEF59xuKQspNmOi26PAt5LZIsgw98KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwBZT6DNyP7oxaQjCmBdZsWAw5ctfRovfSQyY0s+IdEKUOU2wf9H/MBsAy1cjYPo/KQO6zhTOMqMl6GC8SvK9pCfySPSI0sNtjwzsLbQKRy3q1LPKKPyc05w25gRmDhgpDN6HP8c1+RJKfu6QA4Xf98reNpDION3eV7krFl0O7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=g0fPEter; arc=none smtp.client-ip=84.16.66.175
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gh5sP0BjJzsWs;
	Thu, 18 Jun 2026 18:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1781800456;
	bh=hqg/IL1ba3qKpxYFJe4fZUb6gzeztPvCmhL1/+z0Agg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g0fPEterWrHYmuncwppr6AtO1Tqkkw1wkedjki0bDLgYY/DFDgd7DQQSypVng2U57
	 LdGGQ4AN37FLMRrW+sg8ZxCGOafLdiRRBwf9S3/ODXMdWPQnK4r6mX5wVv/wzAvO6X
	 h7LVNYuGos303oWf1ENLjnkszKvFRrSllAWdEDNSYWuYnJ+iWR6scjS2b5G3eKmmaq
	 oYPtITgWqbTXQqDXZ9zOZwfZiXagILDazfUQ9hvjjKvD/aDjO4SacFTB26hxtXTmPO
	 fFImLWrCuqXC59ug++wbe6KNmYiLjjSCnOL81oIN7OxLhAKWTQfkl3n3NC3Wq7C9lG
	 5qXAjLseo8PRA==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gh5sN1694zhxm;
	Thu, 18 Jun 2026 18:34:16 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 18 Jun 2026 18:34:01 +0200
Subject: [PATCH 6.12.y v2 1/3] gpiolib: Extract gpiochip_choose_fwnode()
 for wider use
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-6-12-cve-2026-31732-v2-1-42cc54b7bf04@cherry.de>
References: <20260618-6-12-cve-2026-31732-v2-0-42cc54b7bf04@cherry.de>
In-Reply-To: <20260618-6-12-cve-2026-31732-v2-0-42cc54b7bf04@cherry.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[0leil.net,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[0leil.net:s=20231125];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38696-lists,linux-gpio=lfdr.de,kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:gregkh@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:stable@vger.kernel.org,m:quentin.schulz@cherry.de,m:andriy.shevchenko@linux.intel.com,m:mathieu.dubois-briand@bootlin.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[0leil.net:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email,intel.com:email,0leil.net:dkim,0leil.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CAE6A1A7F

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 375790f18396b2ba706e031b150c58cd37b45a11 ]

Extract gpiochip_choose_fwnode() for the future use in another function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Link: https://lore.kernel.org/r/20250213195621.3133406-2-andriy.shevchenko@linux.intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Stable-dep-of: 16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/gpio/gpiolib.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5c8cd81656963..d48a57b899f79 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -883,6 +883,21 @@ void *gpiochip_get_data(struct gpio_chip *gc)
 }
 EXPORT_SYMBOL_GPL(gpiochip_get_data);
 
+/*
+ * If the calling driver provides the specific firmware node,
+ * use it. Otherwise use the one from the parent device, if any.
+ */
+static struct fwnode_handle *gpiochip_choose_fwnode(struct gpio_chip *gc)
+{
+	if (gc->fwnode)
+		return gc->fwnode;
+
+	if (gc->parent)
+		return dev_fwnode(gc->parent);
+
+	return NULL;
+}
+
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev)
 {
 	u32 ngpios = gc->ngpio;
@@ -942,14 +957,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gc->gpiodev = gdev;
 	gpiochip_set_data(gc, data);
 
-	/*
-	 * If the calling driver did not initialize firmware node,
-	 * do it here using the parent device, if any.
-	 */
-	if (gc->fwnode)
-		device_set_node(&gdev->dev, gc->fwnode);
-	else if (gc->parent)
-		device_set_node(&gdev->dev, dev_fwnode(gc->parent));
+	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {

-- 
2.54.0


