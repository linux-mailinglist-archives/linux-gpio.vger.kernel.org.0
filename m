Return-Path: <linux-gpio+bounces-6466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2D8C951A
	for <lists+linux-gpio@lfdr.de>; Sun, 19 May 2024 16:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27970B2127A
	for <lists+linux-gpio@lfdr.de>; Sun, 19 May 2024 14:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEB94AEE3;
	Sun, 19 May 2024 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freemail.hu header.i=@freemail.hu header.b="OHk9Jm0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out.freemail.hu (fmfe13.freemail.hu [46.107.16.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB9C4C3D0;
	Sun, 19 May 2024 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.107.16.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716130681; cv=none; b=Bn7tkdRChuzc7vSmqmKDEiwhzuQaoAao3RSvLLIc5MMeAdgRahjL9FOyr/LAIzHq2zvKs5XnR4yuddmEqbMmMTW5h+To2T/+3Pz3GqN5PpyLI1IGuLc1P9y0T/ZySteBrYjEkKvth3XC31k3+GVXnO8NE5/tSzru8lOwFFYJKWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716130681; c=relaxed/simple;
	bh=dWYOsLIM7FL8+/64nPxITcuD7Qb2BvNMwaAg0W2ZHg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OKdQLjlxAuU4q99oGdhygBeDLXXnCWse22d+HOogGeSZ5DaSCZfXCTVSDOuP33A344jMUxDdqaFgog3vlUEhj9i3wFcbZ2U4O0RbRRghwVDZSjKHrL2XLFIzm7SX5nlBicqJuQlb+bTRDtPIWCW/ZeVjEpmCNxCV3Qe1iP83zWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freemail.hu; spf=pass smtp.mailfrom=freemail.hu; dkim=fail (2048-bit key) header.d=freemail.hu header.i=@freemail.hu header.b=OHk9Jm0i reason="signature verification failed"; arc=none smtp.client-ip=46.107.16.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freemail.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freemail.hu
Received: from fizweb.elte.hu (fizweb.elte.hu [157.181.183.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4Vj3WC6mS0z2wb;
	Sun, 19 May 2024 16:49:27 +0200 (CEST)
From: egyszeregy@freemail.hu
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] gpiolib: Introduce "linux,gpiochip-name" property for device tree of GPIO controller.
Date: Sun, 19 May 2024 16:49:20 +0200
Message-Id: <20240519144920.14804-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1716130168;
	s=20181004; d=freemail.hu;
	h=From:To:Cc:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=1538; bh=0GQttIYVZJFn3RowTVlnrJ+Xt0DDilmFIEg9l1RqqJA=;
	b=OHk9Jm0iKdTFvzScjmcsHlxMIVR1jFsbsshLzUR5mEHD8v9kK6ByNumfSwwzzirz
	G7ItD5IAnuLl8cbjI1JEwkuP8ssUPmr5VTEl3tIfh0/gy48o628DQKvRLQv1OHRtbmE
	pqAh85X0rwz8S/XXHxj7X+5DIFb5jBEanFDgAlwhYI2btBDYjC2P9vF4s1PZ/Elrxcz
	awFCWJa0rvbJLUw/RPRwPm5PzjbhxfQOjxnHcs7ewvbeB/JhK8WzBaTb9okX1zRQ6hi
	bFKwgJfIIe4v9EG7Ii+1mTeBsWLOZewvCVdF9wh6Sx/JLmD+PKRHhdp2fjKJGlDiv/p
	Q5G2v5ofiA==

From: Benjamin Szőke <egyszeregy@freemail.hu>

Optionally, a GPIO controller may have a "linux,gpiochip-name" property.
This is a string which is defining a custom suffix name for gpiochip in
/dev/gpiochip-<name> format. It helps to improve software portability
between various SoCs and reduce complexities of hardware related codes
in SWs.

Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
---
 drivers/gpio/gpiolib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ce94e37bcbee..e24d8db1d054 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -860,6 +860,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *lock_key,
 			       struct lock_class_key *request_key)
 {
+	const char *name;
 	struct gpio_device *gdev;
 	unsigned int desc_index;
 	int base = 0;
@@ -896,7 +897,16 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_gdev;
 	}
 
-	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
+	/*
+	 * If "linux,gpiochip-name" is specified in device tree, use /dev/gpiochip-<name>
+	 * in Linux userspace, otherwise use /dev/gpiochip<id>.
+	 */
+	ret = device_property_read_string(gc->parent, "linux,gpiochip-name", &name);
+	if (ret < 0)
+		ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
+	else
+		ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "-%s", name);
+
 	if (ret)
 		goto err_free_ida;
 
-- 
2.39.3


