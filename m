Return-Path: <linux-gpio+bounces-9707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD796A97F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 23:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F861F21E8C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 21:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3FF1DFE1F;
	Tue,  3 Sep 2024 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkqFQksU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251B71DFE16;
	Tue,  3 Sep 2024 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396505; cv=none; b=VY7XsoMLv5CcdCmf6oMsolOx4dMorv3R2BLupQexjQgj++mavUj0A+XrMtlHjjz2LX3izR6rMMghB4gxdcGIinNA1Iw4ei36njrCed1ewz7ixvacnT/pGWOcoHdJNEGTp5+2SgNh3UZI2U/i6VRgMxzgWeImP1pdjKG3Ye9q5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396505; c=relaxed/simple;
	bh=91Y9pJpi9qRMRVV1eNq3XPfF+tpsc2w36dbLk1iPug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LunJGvXrRZDwMWrOeqvPGMpkcdyZ9s/XT1FP3BFo+oU2uRCnWZp8PHKnmtUGEP7I0fXt4IxM1kiGJB7H8gQr20LC8jPxYmb3ILihiWEHPaWO2Ji+xbw+ESuH7bIC0W386c138Ac0OS3aDpa+0q5DNmh4S4VgJGHduGAFYlNffuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkqFQksU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F567C4CEC8;
	Tue,  3 Sep 2024 20:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396504;
	bh=91Y9pJpi9qRMRVV1eNq3XPfF+tpsc2w36dbLk1iPug8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DkqFQksU607zQUMpWnlETtb/v8XfZkAfeS+EqjA4lYeUVkURTFwVjPy79X4bu24oW
	 KVDswETyF14kLB2kzpHg7MoAOEsRNEGYATZaTWKzi1oBU0+tXgJyZe+Pgz4aZ/dVwT
	 LA4VSYiOPzl9tdC2kjTlmYjwy2aPq1KyJHOfks2b08BHk78opBPxO+HVNzMlFOCjDn
	 4VOFRxeZBSlZth5uZrcGu6O/JvfZJUYLol5pDtGEqxPTd3XmXTXE4wcyW0MACveQKK
	 nWbhWNi2ahRSNzrKDMynFdcsyeozwsAJSlyXVxv2mWcG1JKUvSqPN6ce41u8Gz/+iX
	 Vz/qEYRuDfgUA==
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
Subject: [PATCH AUTOSEL 5.4 4/8] pinctrl: at91: make it work with current gpiolib
Date: Tue,  3 Sep 2024 15:28:40 -0400
Message-ID: <20240903192859.1108979-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192859.1108979-1-sashal@kernel.org>
References: <20240903192859.1108979-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.282
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
index 39a55fd85b192..4e6e151db11f2 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1398,8 +1398,11 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
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


