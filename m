Return-Path: <linux-gpio+bounces-31371-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCVaL9uRgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31371-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:12:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8FD5117
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8007A3053B08
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E88A2F12C9;
	Tue,  3 Feb 2026 06:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oa1RfMNw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D7369964;
	Tue,  3 Feb 2026 06:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099113; cv=none; b=RV/vX82LG64aC1hXYyFveTYJAR4qPswRAgJg5YHeZrKEqFM00L+d3W1hMWxS4LZI0wNTQcNnRA9mn/P2+qtQSJs2tXE+p1FJVOdRjihm3LKldqiskyQTHRe9DLnjGtCoEV3pKPqEptcWy48hYNKjca7oYfsOtbiLvmGcR7tYmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099113; c=relaxed/simple;
	bh=9YxyRXQE5kVPwTtGkSgy0U2f3ePQUxO3G44Txlw2CP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCosR/2QEXpep2CnKwkYCwSElKuIlIRvK1p+VjCsgWQawzSdL0Pa6PPWsPFWa4i3pYFSvOSIER6VPv9fxT2sqgwUooEmfvJYtxCIMvJDcFWa0DFwvAtuccLbN00cRzLuYrFakV55We/JiC52UMh+kEYWVyuva3VTWbu73DkMpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oa1RfMNw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F45C2BC86;
	Tue,  3 Feb 2026 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099113;
	bh=9YxyRXQE5kVPwTtGkSgy0U2f3ePQUxO3G44Txlw2CP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oa1RfMNwz78iW7e/YjWiAp+BQrjFLnw4oJUi5eeGIFaIR/6nuXdTboMq4FhSCeCj9
	 rizGM7Yk+AGmnSWqNWV62R0s1aIYY1jq70rowLWkrgjYHDSmQUjcfilgTRzyVzpcrm
	 BzqATe1xT19KJl9RmnJBCCo095Iu6C3nEqqVECgx5zPIwSjFQ73KczvN+k9QYp5eZo
	 ATrVYq8vtCEaaJo+PiRoa6mlJNKgl8GQoCjAY5TGDZ/rzXFpzC19UO7M/43ExFHe96
	 J9ZY0q94KX8eTtfw/3C9/MNWLGfB9nPmqFk4XDn2jBV6kEg6GroFURhWiflEyqWcSJ
	 82pynaxkGxUJg==
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
Subject: [PATCH v2 01/11] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
Date: Tue,  3 Feb 2026 06:10:48 +0000
Message-ID: <20260203061059.975605-2-tzungbi@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-31371-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 67A8FD5117
X-Rspamd-Action: no action

To make the intent clear, access `gpio_bus_type` only when it's ready in
gpiochip_setup_dev().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-7-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 039cd3e56baf..f51f53511ae3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -902,6 +902,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	int ret;
 
+	gdev->dev.bus = &gpio_bus_type;
+
 	/*
 	 * If fwnode doesn't belong to another device, it's safe to clear its
 	 * initialized flag.
@@ -1078,7 +1080,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	device_initialize(&gdev->dev);
 	gdev->dev.type = &gpio_dev_type;
-	gdev->dev.bus = &gpio_bus_type;
 	gdev->dev.parent = gc->parent;
 	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
@@ -1216,8 +1217,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
2.53.0.rc2.204.g2597b5adb4-goog


