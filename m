Return-Path: <linux-gpio+bounces-9705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5396A94B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 22:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0F81C240DD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 20:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27F91E6DDA;
	Tue,  3 Sep 2024 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBsRy34F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C21E6DD0;
	Tue,  3 Sep 2024 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396405; cv=none; b=jJ1rMRt3/HmBcv2ii7gG67JeaOQIWe9yxGqkMXYNI4qYen8j1b5mz8haWlFMrYqYeJKTJASQ0IL6NZLmH45kHPGa27afNwTDnmaMzrWnHedUZwZ7ZIILij13iHAkoLBAUVZ9IJmSNm0bST+656KjWmF5ihfIUniXbzrf/abgbpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396405; c=relaxed/simple;
	bh=K2XP8FQ5/gFQqUzjnGgIsdTXx1wvqouRnQ17Vs3MY8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cX4nOmLVsrI6vLdcxSM3+42CZDG3KthY1nG/MGfRiKRmunVSl4xlQhatr8UI4Z/1r5NMPw0fq0IDq4W5x+37t6Z3sS15ZRIk7zK/gqNTNHEL6BDGt0DcunvmsMngmDYe8dIeeiTbbsNJcrtf0QPUmNqNED2l+tKYI3RUIUnii5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBsRy34F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F02BC4CECA;
	Tue,  3 Sep 2024 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396405;
	bh=K2XP8FQ5/gFQqUzjnGgIsdTXx1wvqouRnQ17Vs3MY8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SBsRy34Fiorc9QhhPt93hbPjCFSd8M9lD3/1ydS4SMFFx52DK0UQp/HTuMJ5WoFus
	 Vsvn7IKDyBAEb5M2VqbMfENkWxg0vUUgPZOqAzvDG9qEcE9C8FCMNfqlHloUjUKhwB
	 LGAsJJXDblRvZW0Mip5t1R4Unhhvxk9RuIA2oWPRJj0cbXx8aWxUwgiU1DI3gVeIC/
	 cwrNklv0eW84sds6BX0krAlVsMOYOSrT8aMdwB6Dt0vMlEcgNZs4r/MVoSkhYUxrgZ
	 KbLU+BHAkthLr5n4iE/V8u4cbqBkE8+iI+nNRIcDp3rpqBtvcBMGinlnm2wviFdHP9
	 tf8rbAm4aMrsA==
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
Subject: [PATCH AUTOSEL 5.15 05/12] pinctrl: at91: make it work with current gpiolib
Date: Tue,  3 Sep 2024 15:26:49 -0400
Message-ID: <20240903192718.1108456-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192718.1108456-1-sashal@kernel.org>
References: <20240903192718.1108456-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.165
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
index 3b0341c730ee0..9c92838428b8f 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1403,8 +1403,11 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
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


