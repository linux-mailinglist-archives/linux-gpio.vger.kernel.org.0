Return-Path: <linux-gpio+bounces-9706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1ED96A96A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 23:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D5AB1F242B0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 21:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E241D799A;
	Tue,  3 Sep 2024 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqDQnUjR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74171D7994;
	Tue,  3 Sep 2024 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396461; cv=none; b=rACSYGa0gwypVfceC7YwjJjdfjrqkZ1ezn34QdyMcx3HduTJH1sjyLkJTLo9tKsn3BwAYFwz8q9sjkIkWNpVnPB6wmUyT4Zla4xekA5pCqlmONDlI7MA3NuWsvrsfOuQBkKFaoga/55PWBP4PHRrmd9jhz1rUnOufeOzQBjMU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396461; c=relaxed/simple;
	bh=+f/j5Lq6rX6nBgJ1RviQB2pxhUSUgZ2OByCkFCXUfTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJGmgLODDEc7gq58sygbQc06FONgs829D4jxCj9spxKhMKf8WaLJ5ySPn9xdWj8mX2zND8LKp07LGupjuSGFcH3oOu3PM6iFElXPKsOy9feM3pPW1JoEoKE0A+RHybHVy3ShOQTARfrq5jP0IryjTyx354I5LDPMMVIHJxRtRYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqDQnUjR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E713EC4CEC4;
	Tue,  3 Sep 2024 20:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396461;
	bh=+f/j5Lq6rX6nBgJ1RviQB2pxhUSUgZ2OByCkFCXUfTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MqDQnUjRHIfSySajmEz+9VY68oOqUX50XQtHQOLq2L2pVb33yefika0540M20Eurs
	 C/ek4J/R9RDxTisMlSPhoKmoa+ehbx92nNueCfMnEJEX8fXdEqcXj2vF7K4VG1KKPO
	 HOMpy9F+dPQEi2y7j6zprc3iSEQaC8Gyw0sWOqNltYWG7aSRukX97gRWxGTVJqqtpd
	 GMm/7VirwR0qWj+6EbFpBB72meO8nYztgM80p1xiM6dcschksdQs24wNfsrs2Ai1bW
	 OfmqJ4BET7yzte257OLKiaR+uuJOF/ydx/HQ0JPQOTysdkmSgi6sFuOEotaPNOPz6A
	 LLQcnybnA9awA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Blocher <thomas.blocher@ek-dev.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	ludovic.desroches@microchip.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/8] pinctrl: at91: make it work with current gpiolib
Date: Tue,  3 Sep 2024 15:27:54 -0400
Message-ID: <20240903192815.1108754-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192815.1108754-1-sashal@kernel.org>
References: <20240903192815.1108754-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.224
Content-Transfer-Encoding: 8bit

From: Thomas Blocher <thomas.blocher@ek-dev.de>

[ Upstream commit 752f387faaae0ae2e84d3f496922524785e77d60 ]

pinctrl-at91 currently does not support the gpio-groups devicetree
property and has no pin-range.
Because of this at91 gpios stopped working since patch
commit 2ab73c6d8323fa1e ("gpio: Support GPIO controllers without pin-ranges")
This was discussed in the patches
commit fc328a7d1fcce263 ("gpio: Revert regression in sysfs-gpio (gpiolib.c)")
commit 56e337f2cf132632 ("Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"")

As a workaround manually set pin-range via gpiochip_add_pin_range() until
a) pinctrl-at91 is reworked to support devicetree gpio-groups
b) another solution as mentioned in
commit 56e337f2cf132632 ("Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"")
is found

Signed-off-by: Thomas Blocher <thomas.blocher@ek-dev.de>
Link: https://lore.kernel.org/5b992862-355d-f0de-cd3d-ff99e67a4ff1@ek-dev.de
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-at91.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 52ecd47c18e2d..bb9348f14b1ba 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1401,8 +1401,11 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
 	/* We will handle a range of GPIO pins */
 	for (i = 0; i < gpio_banks; i++)
-		if (gpio_chips[i])
+		if (gpio_chips[i]) {
 			pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
+			gpiochip_add_pin_range(&gpio_chips[i]->chip, dev_name(info->pctl->dev), 0,
+				gpio_chips[i]->range.pin_base, gpio_chips[i]->range.npins);
+		}
 
 	dev_info(&pdev->dev, "initialized AT91 pinctrl driver\n");
 
-- 
2.43.0


