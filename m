Return-Path: <linux-gpio+bounces-29172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72367C91116
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7913ACB64
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 07:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3952C21DC;
	Fri, 28 Nov 2025 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="nQcZ7VB4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E31123EAB6;
	Fri, 28 Nov 2025 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764316274; cv=none; b=HwLCBhdN60S+sbmy7IJ64GOI8FILtHrnusTqCdErzdAYPfeao9evaujHsrEHTuJQeHc9G+tOdYwigSTGB0EdK2p2MFIq3f4OnfhZLKYtK0MNH9Y3+TWOPd3/5V9IGoLtwt0Zaz1++qb3FPFXsSrsGmMc1Z9OTRWIQt9IxVKkZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764316274; c=relaxed/simple;
	bh=AgfdnGHcufp1cHsZs9JnwwvxHg2kBMg6z7h/C7vYnuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oODHaGnf2LNaDQ0tFZgV0qx4zo/esZrMIqnRCgJgp2Yh4pkWKp8OIL5nPKulUvxgG2BZoVXUvFyQGzHTK27R+g0vVMoBEMffPkT77fzScpSNf7XCwib+6o1LewzWC8wPuODg+rb1FWFEbv7cxLSnxM8Y65STRYfgVmrF9yVXlOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=nQcZ7VB4; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1764316263;
	bh=+wau2Z6P5D47pvsY5qkYrhK3UNLKxLkFOW/hFuNUWYY=;
	h=From:To:Cc:Subject:Date:From;
	b=nQcZ7VB4m7gQu+ZuX0fNu0P3ZZhrxkdVwZswQVld59lUTWEznrJP0WILClBv3qZC9
	 NegpvQEyq/za+qOu/RuuVWlNRbfM5rtviOrb5UhevvYT6x6tK7SNk/pMQ7y9cFpazf
	 dy1awlavJZvrF0ydbxhfS00LtmjteUP75up9AdOo=
Received: from stargazer (unknown [IPv6:2409:8a4c:e2c:66f0::256])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4865866E6D;
	Fri, 28 Nov 2025 02:51:00 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: linux-gpio@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	Xi Ruoyao <xry111@xry111.site>,
	stable@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
Date: Fri, 28 Nov 2025 15:50:32 +0800
Message-ID: <20251128075033.255821-1-xry111@xry111.site>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The manuals of 2K2000 says both BIT_CTRL_MODE and BYTE_CTRL_MODE are
supported but the latter is recommended.  Also on 2K3000, per the ACPI
DSDT the GPIO controller is compatible with 2K2000, but it fails to
operate GPIOs 62 and 63 (and maybe others) using BIT_CTRL_MODE.
Using BYTE_CTRL_MODE also makes those 2K3000 GPIOs work.

Fixes: 3feb70a61740 ("gpio: loongson: add more gpio chip support")
Cc: stable@vger.kernel.org
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 drivers/gpio/gpio-loongson-64bit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 02f181cb219e..82d4c3aa4d2f 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -407,11 +407,11 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data0 = {
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 	.label = "ls2k2000_gpio",
-	.mode = BIT_CTRL_MODE,
-	.conf_offset = 0x0,
-	.in_offset = 0x20,
-	.out_offset = 0x10,
-	.inten_offset = 0x30,
+	.mode = BYTE_CTRL_MODE,
+	.conf_offset = 0x800,
+	.in_offset = 0xa00,
+	.out_offset = 0x900,
+	.inten_offset = 0xb00,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
-- 
2.52.0


