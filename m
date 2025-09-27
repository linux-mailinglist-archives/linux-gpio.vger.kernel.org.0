Return-Path: <linux-gpio+bounces-26641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68966BA592B
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 07:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C20B4E0804
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 05:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0FA222578;
	Sat, 27 Sep 2025 05:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="squFCJkG";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xE6S+r2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F218FDAF;
	Sat, 27 Sep 2025 05:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758949348; cv=none; b=izMw+vaYlvAZzvdPyeYlUTHQ/vs10SOxAUSyfLu5M6yi2WwYFz4ABEv7yATDq1sqwB9hBQP1pj/I5+OBPlkLEP02VF1AJQ6lIaTeq65F8ij0cnFav7T3zU2+XTPLLOCUR52r0Fj1aK/QQjW4YkdcVlslncDKtQnckuu5FmJ8rR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758949348; c=relaxed/simple;
	bh=MpdOunzwRix8r+I6dz4W5XzomAmmpf9+SZqztmWlQWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmfMxv+8n7MDrgnCubG5I7EzSODp4CgmqFwFm55aOlgLiU91W1jfPIA1/5scO5QnVl0Z9hvdTote6qNu/9sqt81TfRsAQtfvaiAExNOlkQXWm9Zg4ZZ+xOx7/2YUjjQ8yElDzf2a8fr0L4UoOlVKOVeDQgFOvx4nhTJujGfVMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=squFCJkG; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xE6S+r2y; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949156; bh=DWdXLvFu30yYvjltQxnE0pJ
	9kE3gyhS9Vq00c5VUKSU=; b=squFCJkGPyKQGu2syC4oXR3X0o5JP4wYYRdGY8WjUIK+wLQu5a
	b2fDD1QFZ1UMC2A18BjynkKrUh1VdG2Uo07QwUkW0zRQ/eHIQ+Z47jI3Z++HfY10XadHQB6NYwP
	FljSqk8MomKME7YYPOhPofg1XCr/dRVKhB3mUnj99OLU2KSuhO5qWlR6KoUoJmP3RGR3AkeSRMr
	ekDrI0/3urVjcj2PeMU0EC9lqybN2FNx7zLqpXdCP2QVLEhGIQ0donb3xfWP3B1t9KasZoP/8b1
	x/NjqhabtuVcDNEYAtUDZIDQ3krNmLZqXvVwFcUuKCrifvLnvaFOfhS5lluSO6ldE6A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949156; bh=DWdXLvFu30yYvjltQxnE0pJ
	9kE3gyhS9Vq00c5VUKSU=; b=xE6S+r2yuMtthxGPUz48JuxFTe3Lc6QqhYjub/HRYdMGg7pIoT
	Z2aTXtfPzEkPlgL7L0TD03lIbCv30yTGuGBA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 27 Sep 2025 11:59:07 +0700
Subject: [PATCH v3 2/3] gpio: rda: Make IRQ optional
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-rda8810pl-gpio-fix-v3-2-3641cdcf6c1e@mainlining.org>
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=961;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=MpdOunzwRix8r+I6dz4W5XzomAmmpf9+SZqztmWlQWc=;
 b=FbBM848buke3ZFLTeEqaWSbtCt9iSjXfoKtgadZUBCbL0o6C85MggUTDyTusPlRHhTEWOI9Ub
 Ho0FsXs8vibAwBYtHPJGLAt7nm5TUJPRnjE5MKr3OpVE/Tvq+F9yrHj
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

Not all GPIO have IRQ. When we use this driver with
GPIOC (handled by modem) we get:

rda-gpio 11a08000.gpioc: error -ENXIO: IRQ index 0 not found

Let's mark IRQ as optional so this error doesn't show up.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 drivers/gpio/gpio-rda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index fb479d13eb01a49218ad4229e7d4f70f096f5a2e..7d20dbbb6ec41149a1dbf4d9ef9ac86449773c35 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -229,7 +229,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 	 * RDA8810PL, GPIOC doesn't support interrupt. So we must handle
 	 * those also.
 	 */
-	rda_gpio->irq = platform_get_irq(pdev, 0);
+	rda_gpio->irq = platform_get_irq_optional(pdev, 0);
 
 	rda_gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rda_gpio->base))

-- 
2.51.0


