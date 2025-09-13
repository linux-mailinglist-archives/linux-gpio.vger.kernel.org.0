Return-Path: <linux-gpio+bounces-26100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D6B56294
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 20:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC9CA03F0A
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1124D224B00;
	Sat, 13 Sep 2025 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/iWz7Su"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF231223328;
	Sat, 13 Sep 2025 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757788994; cv=none; b=dini9ULuh5Zh5UPnLagzBbSdRAVcl43hKqmlVL1Z6zsiK2mRgcdo6XmuA/9skMgLsi2Oj/dBZ+ped1x0HPpVMz7WgUc1CeF4x3X9okQqNB16mCTq3MU9oRtKOTvSawS/WnAabpWTQwzuv5Pq7BEXjmo3NCS61vpCROtsGedfjY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757788994; c=relaxed/simple;
	bh=P9zNQbpjM4dOEm9L47SJ7SlA7XkHbYy8y+w+FSmxEEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfHCZR1EWyvgSgb5P4pnjAGcARzzX/5aIu50cDeVSnRtJPDhweadLMbxcT+wVw55CRes0ctl8dEHsAOJR1+3r5qBjLrwq+CSmr6Un5qm7p7ecN2SuvxxFoXz+4XORfajY8dyJnjb/A4TtW9gP/1eUSq33cmIA7cGCcwQk6CG1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/iWz7Su; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7289BC4CEEB;
	Sat, 13 Sep 2025 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757788993;
	bh=P9zNQbpjM4dOEm9L47SJ7SlA7XkHbYy8y+w+FSmxEEg=;
	h=From:To:Cc:Subject:Date:From;
	b=F/iWz7SuNQX4joEzsoFgw1MA8IBqB6MnC+FQE7eJiBjF0+St84rmnIb99Qfrk2A2B
	 M/yhi4MEvjF5aHjlP0+AUDBHVO2AOX+oroVrsVn6/jfjLV1WYXKrn/GCHwrFNk76hu
	 ESTwsDWueEa1a3/XquIOw1ztx+B/NEZmEDHemAkPXIg452MiLUNdDmSRSC8NCuZfLx
	 sJrea/IvYvsombP0GOg5v6pu6Va0zlkQwKkXvu7F7oRVQwwEfJW9UiVDNqj3Km/IBt
	 IlBY02pUhRU9nxwZknfO0kELDyTiDqzUANje13kmHoN3eZbsivYxPwRhWR0za9dFrd
	 L6LkKJu4TFLwA==
From: Hans de Goede <hansg@kernel.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-gpio@vger.kernel.org,
	stable@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] gpiolib: Extend software-node support to support secondary software-nodes
Date: Sat, 13 Sep 2025 20:43:09 +0200
Message-ID: <20250913184309.81881-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a software-node gets added to a device which already has another
fwnode as primary node it will become the secondary fwnode for that
device.

Currently if a software-node with GPIO properties ends up as the secondary
fwnode then gpiod_find_by_fwnode() will fail to find the GPIOs.

Add a check to gpiod_find_by_fwnode() to try a software-node lookup on
the secondary fwnode if the GPIO was not found in the primary fwnode.

Fixes: e7f9ff5dc90c ("gpiolib: add support for software nodes")
Cc: stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
I found this issue while testing "platform/x86: x86-android-tablets:
convert wm1502 devices to GPIO references":
https://lore.kernel.org/platform-driver-x86/20250810-x86-andoroid-tablet-v2-7-9c7a1b3c32b2@gmail.com/
which adds a software node with GPIO lookup info the a spi-10WM5102:00
device which has an ACPI fwnode as primary fwnode.
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0d2b470a252e..b619fea498c8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4601,6 +4601,12 @@ static struct gpio_desc *gpiod_find_by_fwnode(struct fwnode_handle *fwnode,
 		desc = swnode_find_gpio(fwnode, con_id, idx, lookupflags);
 	}
 
+	if (desc == ERR_PTR(-ENOENT) && fwnode && is_software_node(fwnode->secondary)) {
+		dev_dbg(consumer, "using secondary-swnode '%pfw' for '%s' GPIO lookup\n",
+			fwnode->secondary, name);
+		desc = swnode_find_gpio(fwnode->secondary, con_id, idx, lookupflags);
+	}
+
 	return desc;
 }
 
-- 
2.51.0


