Return-Path: <linux-gpio+bounces-9708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56096A98F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 23:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDD63B23627
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 21:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAE91E008E;
	Tue,  3 Sep 2024 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvF+RYMP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703D1E0085;
	Tue,  3 Sep 2024 20:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396534; cv=none; b=fKk3ocRgsaLUw+7NNOUHZLLHISNMDQQ4yVOhysR1+A9OnxZqFWbGoTLNKbFYL0iW1wZnFHYgO86qcjR2ZsUayXS3+/8FDqx+De0dtNUb31iFKh9nc7CnH0sHsT0oUnmn03Kj2SznV8IoJZ7rx1nsEKDTL8/kErALl75bg9laeiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396534; c=relaxed/simple;
	bh=9drg3IuSqSlqrrUnylsLjOCWQUfV/OQPav5QXn07Dcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvT9edpRizAIXjSFFyx5BS3vDzqlaMDWGuDHx4zPvD2CBvCA7Mskjvg6n0nGCV8Og6FCNhfiUdsGXsovnM8UuYeifLmy4At6ImMzX4nP+roubIcQIB3zkwciBXS0OY+W9nFSxv+fvIFUH9WGv1m5qSk6AageaJGphnMNzf8ttIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvF+RYMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F280C4CEC9;
	Tue,  3 Sep 2024 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396533;
	bh=9drg3IuSqSlqrrUnylsLjOCWQUfV/OQPav5QXn07Dcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JvF+RYMPIH7Du/oeWuPSyx/jf859FaErWOUhZlki6TjAaMT8xeVPb8qS8VGK/sPuE
	 DVrugQRKVtkKTo7kWuxRv4nCGhiQ5xB7E5M0wSx3dUPoMMy8LpX0K+Q5ATItChit3X
	 nq+J1i9E8+Cd6QsnBHtrXtpF99962DTNx2iu9SxVYoA4MwWdDNun6uaQPX5G64elfG
	 7hqim7IwqefuoQjnGXnhzJPKg24qjN1b+NLW45w7QXFFSJuJZUFPw0DK651EEVD91t
	 bzAWdLVsjfcgCk5lsYBErjYNhkZS4VWdOj1czJc6HuylUgbRR53BEjvP5kFCV3H9Ot
	 W1kwRlLgxP7bw==
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
Subject: [PATCH AUTOSEL 4.19 2/6] pinctrl: at91: make it work with current gpiolib
Date: Tue,  3 Sep 2024 15:29:22 -0400
Message-ID: <20240903192937.1109185-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192937.1109185-1-sashal@kernel.org>
References: <20240903192937.1109185-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.320
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
index ad01cc5798232..48374945b2d7b 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1290,8 +1290,11 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
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


