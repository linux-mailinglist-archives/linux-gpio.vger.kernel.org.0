Return-Path: <linux-gpio+bounces-23982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD8B197B6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 02:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 374863B8155
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 00:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025641CAA6C;
	Mon,  4 Aug 2025 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoqMGGMq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8E91891AB;
	Mon,  4 Aug 2025 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267352; cv=none; b=FTTLWzjHnvoTLVpU+i9t1Q/ZQI9F6aMJEw06yI/OgUp9cUGWq8t9/TJ+KDYyrGVEQ0sVNd8lpmtPNH0EbAaKRHrgimSe8uGg1/QUd2dQ4xD1Lbtdd6qK3t2RO17sMbi4XE3U2kTbIT54gcmNEHLmsJEDWKlDoxF8qTh9lKrlwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267352; c=relaxed/simple;
	bh=7M06c9i6jttEbYev5rW+GxpX144x7L0u7eR4g5iVWd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y+oGx7PPIriFpBm6rjtqjyxsSZ8rSEtjZ88YEVLmiNImNct2mhiczPZvOpGIQXxH7+xJXKiCycCTIH6OqndZBuQ1u0KE/aDKnmR/xtFvU5kc92lwIJpdEHog2Lp6VGx577cbIgpHCBFaCzTy9ZR0NMJj4goECq3PTiksY3zn2/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoqMGGMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521D0C4CEF9;
	Mon,  4 Aug 2025 00:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267352;
	bh=7M06c9i6jttEbYev5rW+GxpX144x7L0u7eR4g5iVWd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UoqMGGMqVUVh+6sfq00ybRC0t+lpV7Sigb7L7xsnuWGIyDH42/44XMv+kETmlwXH/
	 JtHMWrW8/w+vhcVAnzWYQyoIEQJX+eYjp6enI+vVLeAlHDx4yrdcpwRkk9YNv2PObX
	 g06y2S1oKP3hYc/+RANXwMEhFJvE+z+GmAm1zYdmeTvkLecGHM6BMNxCHhlx9OKhXi
	 LLLjxsVTm1M1BYkC5g1yunNFhLMv+FBnU47wn7xTSR2p00gYX4YjL3S/5aS1yy/3iH
	 Guy/QZCUH4Et8SWkOKg3bZPLaKs7UNsbEe1HLw2ayY/oTa7jYNzXYBHjaYsJhZebug
	 w5maHqW9Bo66Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 32/80] gpio: tps65912: check the return value of regmap_update_bits()
Date: Sun,  3 Aug 2025 20:26:59 -0400
Message-Id: <20250804002747.3617039-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002747.3617039-1-sashal@kernel.org>
References: <20250804002747.3617039-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.9
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit a0b2a6bbff8c26aafdecd320f38f52c341d5cafa ]

regmap_update_bits() can fail, check its return value like we do
elsewhere in the driver.

Link: https://lore.kernel.org/r/20250707-gpiochip-set-rv-gpio-round4-v1-2-35668aaaf6d2@linaro.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Bug Fix with Real Impact**: The commit fixes a bug where the return
   value of `regmap_update_bits()` in `tps65912_gpio_direction_output()`
   is not checked (line 54-55 in the original code). This could lead to
   silent failures where the GPIO initial value is not set correctly,
   but the function continues to configure the direction, potentially
   leaving the GPIO in an inconsistent state.

2. **Consistency with Driver Pattern**: The driver already checks return
   values of `regmap_update_bits()` in other functions:
   - `tps65912_gpio_direction_input()` (line 44) properly returns the
     result
   - The second `regmap_update_bits()` call in
     `tps65912_gpio_direction_output()` (line 57) also returns the
     result
   - `tps65912_gpio_get_direction()` checks the return value of
     `regmap_read()`

3. **Small and Contained Fix**: The patch is minimal - it only adds:
   - An `int ret` variable declaration
   - Captures the return value of the first `regmap_update_bits()` call
   - Adds an error check that returns early if the operation failed

4. **No Side Effects**: This change doesn't introduce any new
   functionality or alter the existing behavior when operations succeed.
   It only adds proper error handling that was missing.

5. **Hardware Communication Reliability**: The TPS65912 is a PMIC (Power
   Management IC) that communicates over I2C/SPI. Hardware communication
   can fail due to various reasons (bus errors, device issues), and not
   checking return values can lead to incorrect GPIO states which could
   affect system stability or connected peripherals.

6. **Follows Kernel Best Practices**: The kernel coding standards
   require checking return values of functions that can fail, especially
   for hardware operations. This fix brings the code in line with those
   standards.

The commit message clearly indicates this is a bug fix
("regmap_update_bits() can fail, check its return value like we do
elsewhere in the driver"), making it a perfect candidate for stable
backporting as it improves driver reliability without any risk of
regression.

 drivers/gpio/gpio-tps65912.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index fab771cb6a87..bac757c191c2 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -49,10 +49,13 @@ static int tps65912_gpio_direction_output(struct gpio_chip *gc,
 					  unsigned offset, int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
+	int ret;
 
 	/* Set the initial value */
-	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
-			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	ret = regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				 GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
 				  GPIO_CFG_MASK, GPIO_CFG_MASK);
-- 
2.39.5


