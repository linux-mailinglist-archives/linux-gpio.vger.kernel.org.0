Return-Path: <linux-gpio+bounces-9703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3796A8ED
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 22:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF631F240D8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 20:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34D41E0B9C;
	Tue,  3 Sep 2024 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws1gx/jr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA61E0B92;
	Tue,  3 Sep 2024 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396244; cv=none; b=El/gfVqACK5fgaez51tQLO1ydEFiRMIbYp21qaoVBcRJBhaqoMVFg09ydQXWgC9SvOdMSo2qoTuCb7QUCXxwJEGwYrWzzs3yoJQLlwweCKYSPkYHoexozl3098eWNCRTzLH3B/tCctzD5xkzzbK3N0JHf2cRrY4U8qBU3XNJPro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396244; c=relaxed/simple;
	bh=OjCBct6utP0eiJi0kbYF5FvJLWxEVq+ao5PMjpG0pW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTpUutLzFYBBBspG6xeAhN1e4cMeWWDWRMrMdscZITGiQC5uA2cjbcBtt3szbxdyUxWIkLwKovG2KzNtChX65pkg9BaJGq3AuZsk7PZ6zoT4K7QQ70KgWkxKWJv5/+L/+EyxHPWYvDs/Sd9YMvaV9Q2unXRHCqldXvpPSAajEig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws1gx/jr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8DEC4CEC8;
	Tue,  3 Sep 2024 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396244;
	bh=OjCBct6utP0eiJi0kbYF5FvJLWxEVq+ao5PMjpG0pW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ws1gx/jrEyIqFxkAJt77I7V/3UZHw8+djXldpHhKzddx9o4QD7dF4ssvVKhlDIztW
	 S9C3x7Y0ueDEzFWxfqUPOwJsTmVOhYw1JyqOU5NNfmrQDtIXUv5EVdjM9pIpM7QkzE
	 e25pn2oJc4uvsvdVR0aJNoSC/yERzZcTB4cP4XkGoj3TPOEox+mdXzJzzymUUnjG2K
	 Rx8B/20k1BmSEwvCxrw7nFTj2ErIFw5iPNocfFZ69Ki1yQAJXj5QzAx1ykrdxkX4SU
	 OqjCyMXxHXrxxCkuLPHIQVPf58lO27uek2Kmzo2bWosVMDwxt8xxAh8zbYRbtlA/ta
	 SAsHw0yYIehIw==
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
Subject: [PATCH AUTOSEL 6.6 08/20] pinctrl: at91: make it work with current gpiolib
Date: Tue,  3 Sep 2024 15:23:40 -0400
Message-ID: <20240903192425.1107562-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192425.1107562-1-sashal@kernel.org>
References: <20240903192425.1107562-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.48
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
index 608f55c5ba5fe..ad30fd47a4bb0 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1410,8 +1410,11 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
 	/* We will handle a range of GPIO pins */
 	for (i = 0; i < gpio_banks; i++)
-		if (gpio_chips[i])
+		if (gpio_chips[i]) {
 			pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
+			gpiochip_add_pin_range(&gpio_chips[i]->chip, dev_name(info->pctl->dev), 0,
+				gpio_chips[i]->range.pin_base, gpio_chips[i]->range.npins);
+		}
 
 	dev_info(dev, "initialized AT91 pinctrl driver\n");
 
-- 
2.43.0


