Return-Path: <linux-gpio+bounces-32008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGVyMxbxm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:17:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552C17204C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F09A9300D752
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3273134678E;
	Mon, 23 Feb 2026 06:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej/s1ACG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81A8346763;
	Mon, 23 Feb 2026 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827468; cv=none; b=juHKfuYvb3wriEFSK4K1uNHyU2aOKXpXorSuQjZTF2dEXZ3Kf/iQ7FL9d9QT+lbstMMzi4y58k0kHIjU0ilepL57n/0SWMUthUtb9TBLKv6LY9dh6hJlJ1+svjX2+n6wAVBEMqs21oiy17IjOYtzpzDLnj6bkzY347kiVwTIKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827468; c=relaxed/simple;
	bh=POrU04cCpey+W4zQF5H63Ny+cH4s0q8KfDFXXNLfiJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1CL8CfvJDcCujXX+TkKGeBoQBAoDg60/Smm5MGdlDzeKehq2Q4MbKqa9QmkPmJDjLLohjjLfuJTKdCDiyZFJms87A9d8WmHC3C/XTCkt4uBeqqA2jGFBtV1dDfYA48yL2eQjaYcYFU644Y2h1LYJlM0Z33ONdzmUNfZWcxC13o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej/s1ACG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F92C116C6;
	Mon, 23 Feb 2026 06:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827467;
	bh=POrU04cCpey+W4zQF5H63Ny+cH4s0q8KfDFXXNLfiJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ej/s1ACGInIOZCvEwGzR6CT10nq7F6Ne7gb0wn1cwXXJODddfaVOvUdDPhJ6GboRG
	 LtA/7AKWgvw5OPS8YmrP96t+C6EGT63/DZQol4XU+yGTiSowwEXfV1Nht3m+mUbPyb
	 HmGRehkEYUG0EB5buajV5Lq0fNOEJsm+B2EvIvHXicCeyU6qEBHArgQNyXVfU+B+yv
	 XK79H1YoklsLa0eQNeFQvFtMROLc0jnTVRfiEcQvUDz094Y2Uz3U9skwhzWQU5Phzg
	 7u2yR8+WrGMCBEZBkpG9Y0IEsd5onUBelx4Fnkv1OZwspvxRXQeWbcW6XBLYGYMEPW
	 K0VDgwBh7Ic0g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
Date: Mon, 23 Feb 2026 14:17:21 +0800
Message-ID: <20260223061726.82161-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32008-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7552C17204C
X-Rspamd-Action: no action

To make the intent clear, access `gpio_bus_type` only when it's ready in
gpiochip_setup_dev().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- Add R-b tag.

v3: https://lore.kernel.org/all/20260213092958.864411-2-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-2-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-7-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f77d5121a8a8..0a73561060dd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -901,6 +901,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
+	gdev->dev.bus = &gpio_bus_type;
+
 	/*
 	 * If fwnode doesn't belong to another device, it's safe to clear its
 	 * initialized flag.
@@ -1082,7 +1084,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * then make sure they get free():ed there.
 	 */
 	gdev->dev.type = &gpio_dev_type;
-	gdev->dev.bus = &gpio_bus_type;
 	gdev->dev.parent = gc->parent;
 	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
@@ -1220,8 +1221,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * we get a device node entry in sysfs under
 	 * /sys/bus/gpio/devices/gpiochipN/dev that can be used for
 	 * coldplug of device nodes and other udev business.
-	 * We can do this only if gpiolib has been initialized.
-	 * Otherwise, defer until later.
+	 * We can do this only if gpiolib has been initialized
+	 * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
 	 */
 	if (gpiolib_initialized) {
 		ret = gpiochip_setup_dev(gdev);
-- 
2.51.0


