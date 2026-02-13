Return-Path: <linux-gpio+bounces-31658-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGCHJX/vjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31658-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:31:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 397591347C2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C4F307BD8E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634632D0C92;
	Fri, 13 Feb 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVdXgZ90"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A152222CB;
	Fri, 13 Feb 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975066; cv=none; b=OT5FBNO02NpIIHs0QOUn4kicVERolEYwr8xgleqS4wrG3cMo/+d7U+XJiu9W5BFrjVFhS6KwXXz3MPNKvX7lcIE9n49PquAVmEremxqIM3mHczdegFJY8t0mmEWiCsQP+4bho1bFym7AXelCB5mGcARQAjnEWkB9pEVIDE5Yqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975066; c=relaxed/simple;
	bh=SyNkwYYpX1Qe4VcjL4R7jtbLw5u6+UPC9JTgSugQXxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVMBhQL/cXmi9gHvLxUBmuaZaupJIDn4hwJW6Gu5r5rv/lgYnkG12Al8lYvkd76DsIJii3F9DsUMmlWIm49iyqQy9m/LELf+FTccJz+AyrbTmgZeKUsgN06wcPB5bZ5/wJVDSLabts/in0kLD9HH9vqKEive5HKTmpZVkKgSr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVdXgZ90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B7FC2BC9E;
	Fri, 13 Feb 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975065;
	bh=SyNkwYYpX1Qe4VcjL4R7jtbLw5u6+UPC9JTgSugQXxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QVdXgZ90DeKdu6KTKSXiCf0MgPWIsb0UtSL3PYn03zsGNK4xyTHzGdAknI46/Pg5x
	 2pCzhTRLan6XNXhw0eIzXUpspEa+Ee9S+ujPR9G9WV5PFBB3HcXHo40HsFbPI1LsUM
	 jnoTz9FCb+Qda4tQIHWltNzqUSFcdzIcuOKcpBhX3vO7lHYsvYbhrHf9Wz7VpmA7FN
	 tY/+SL8Q9UbrhO0Ef8akI4YamZ8qa2ChTGg+j3DsLn2bRTTiS32oIWiC4aVSlOOywU
	 0cMembfGjDEJIUre1B75PlGgTQFEuHYDzsRxVOMYPF+UF4mi+Tbw0NtdSkhzDR1zTY
	 7pEBe3FVuhHGw==
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
Subject: [PATCH v3 01/11] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
Date: Fri, 13 Feb 2026 09:29:48 +0000
Message-ID: <20260213092958.864411-2-tzungbi@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-31658-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 397591347C2
X-Rspamd-Action: no action

To make the intent clear, access `gpio_bus_type` only when it's ready in
gpiochip_setup_dev().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-2-tzungbi@kernel.org
- No changes.

v1: https://lore.kernel.org/all/20260116081036.352286-7-tzungbi@kernel.org

 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5757c0475990..f4dad3e5b5a3 100644
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
@@ -1083,7 +1085,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 * then make sure they get free():ed there.
 	 */
 	gdev->dev.type = &gpio_dev_type;
-	gdev->dev.bus = &gpio_bus_type;
 	gdev->dev.parent = gc->parent;
 	device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
 
@@ -1221,8 +1222,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
2.53.0.310.g728cabbaf7-goog


