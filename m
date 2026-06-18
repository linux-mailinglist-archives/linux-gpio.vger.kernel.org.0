Return-Path: <linux-gpio+bounces-38693-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z1yrIRkeNGrhOwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38693-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:34:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7E26A19CA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0leil.net header.s=20231125 header.b=BU1XZ7FU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38693-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38693-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=0leil.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB9D30580B5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455FD316189;
	Thu, 18 Jun 2026 16:34:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F12E7360
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 16:34:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800461; cv=none; b=DWnxhK0J4akLQykOn7UXGdo8BaNv8FChhrvAL96hIUHxYw9p3PqURTh/QLu6EZBXDX6Fp2ZYIXj/PZODCD5DLh9YamPCoVJMF1rkAZzWnS6mrJCSzB3lGjJNkbsaj1Eq2BXzZUn+Ao6Xfp75uaSvLhcRy/Im2aUCA4PBTJ7HE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800461; c=relaxed/simple;
	bh=ME3ZcMKS/hWLtou4vdCJXrzxiRlawZIdnuFhqaSkM/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShBpStTJLQjbhl859X/UE1fFKbc+nUKyj7KKuD6i9vLwzSpAmMFViKWzWxyWWEK2Ey+bbJbQ4GxsRgTAj6ymWEQyLvLGDBgJL3VEj+BjX0MqZCVeQMyLw5bhzk0UCwpOHOZxZ+HeescJy5zZ7e2H+0igNn2FhAI/bMAtY/t8EmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=BU1XZ7FU; arc=none smtp.client-ip=83.166.143.170
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gh5sP4YSzzt14;
	Thu, 18 Jun 2026 18:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1781800457;
	bh=TkQ3lby2jZ3TWGL6H0BK6IVgs2BEGZiYajsHidsHN40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BU1XZ7FU7HEG61JK2fZ2/EvFTLUxOZqkMPoc1xq+AAgRvBDUYsFWpFtQ7kPzyliyG
	 rsx5FJeC6RywRA9N2l0aAL+UCDEQx/JOG/Ef3bDnQKKXbFuJjUyZNdgAoOq0PiDhfm
	 DH1FikikxfGxxazDO3WrVxANkiKJvQEKJ3NAd+Bnq2v5Qk+8yef6uH0Ovi1Kh3ltbN
	 cnnA3WJBO7l7Xnyqwniw09eCL9PaPsT2DEJxNv0gPp99bhdflP8ik3fqcQwgV99Oo5
	 sL/3OreNMzGlLlCy91WZanegT4wGGorKzqCxLG9MY/EVL7/tEAOR4uJRJj+CZU3zSO
	 eAH125VrWYtVQ==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gh5sN5l5czfv2;
	Thu, 18 Jun 2026 18:34:16 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 18 Jun 2026 18:34:02 +0200
Subject: [PATCH 6.12.y v2 2/3] gpiolib: Remove redundant assignment of
 return variable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-6-12-cve-2026-31732-v2-2-42cc54b7bf04@cherry.de>
References: <20260618-6-12-cve-2026-31732-v2-0-42cc54b7bf04@cherry.de>
In-Reply-To: <20260618-6-12-cve-2026-31732-v2-0-42cc54b7bf04@cherry.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[0leil.net,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[0leil.net:s=20231125];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38693-lists,linux-gpio=lfdr.de,kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:gregkh@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:stable@vger.kernel.org,m:quentin.schulz@cherry.de,m:andriy.shevchenko@linux.intel.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0leil.net:dkim,0leil.net:from_mime,vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cherry.de:mid,cherry.de:email,bgdev.pl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A7E26A19CA

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 550300b9a295a591e0721a31f8c964a4bc08d51c ]

In some functions the returned variable is assigned to 0 and then
reassigned to the actual value. Remove redundant assignments.

In one case make it more clear that the assignment is not needed.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20250416095645.2027695-9-andriy.shevchenko@linux.intel.com
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Stable-dep-of: 16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/gpio/gpiolib.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d48a57b899f79..97a32e6f901fc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -939,7 +939,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	struct gpio_device *gdev;
 	unsigned int desc_index;
 	int base = 0;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * First: allocate and populate the internal stat container, and
@@ -959,11 +959,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
-	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
-	if (gdev->id < 0) {
-		ret = gdev->id;
+	ret = ida_alloc(&gpio_ida, GFP_KERNEL);
+	if (ret < 0)
 		goto err_free_gdev;
-	}
+	gdev->id = ret;
 
 	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	if (ret)
@@ -2882,7 +2881,7 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output);
  */
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
-	int ret = 0;
+	int ret;
 
 	VALIDATE_DESC(desc);
 
@@ -2915,7 +2914,7 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
  */
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
-	int ret = 0;
+	int ret;
 
 	VALIDATE_DESC(desc);
 

-- 
2.54.0


