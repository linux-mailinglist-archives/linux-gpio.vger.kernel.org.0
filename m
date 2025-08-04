Return-Path: <linux-gpio+bounces-23983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12289B19828
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 02:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1CF3B7714
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 00:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA9B19755B;
	Mon,  4 Aug 2025 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNIQjZCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5E38D;
	Mon,  4 Aug 2025 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267524; cv=none; b=vBW5TGzUKDqXu5OS45vFeJbLSwcvdbuQnZLeiEukGgbqgT3scet2OPs1OzGCBFe9fhoDLY1i8cWCuN0k7XFifZkLTz7Ocf1aBUc/xzI8ZIYlFW6X+FRDqFjc835+QtDxALJV80dny6wT3r+naR6eSDJ7Tmaf4x58jkmX/LlFnW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267524; c=relaxed/simple;
	bh=Z9Q/IX48zM4LaR3KBMe4N/HBMaW0O4skYQf3C9G+5Sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V6mGW7XnilbFdDdC8xTB8vk5JteX8mxqVh/VBlYsUhkp/DFYrEat0CTmAR8wdS2EfAtdu548aiY1m7OLVhS5WR2k8k9hm77mWMOCRrqgXGFPO51zwRhT/qoL0qxWKmrLehMWCSHXxzoTG9/gJ7FUXjY7xU/BqwevazrF8j4PEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNIQjZCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21031C4CEF8;
	Mon,  4 Aug 2025 00:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267524;
	bh=Z9Q/IX48zM4LaR3KBMe4N/HBMaW0O4skYQf3C9G+5Sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNIQjZCE1eyKsGbYMblt94GfKUDtU4PJyr9QdMBOvCvLWsWhA0BQPKgy28pk8LbB3
	 5M53UHZVIzMr1BfHJL+pANLbxeK7f4LK6GzM700EE/DbHdh1ER86N7DIYHL4C4/8hX
	 w5hiriftJYO76QvQvAzi+bAHTKaFtjCV/p3X0XYwvwQ3hjsdkHuqMRcTw9W6Cd0A26
	 Kb9Rc5tQJQG/d/sBOkp3dMQ203+coP2caCNuzufu9RrhVh1N3nbMYPnDHr1MtFZtTP
	 h0SAMyGoNdDpwxcHHLF/nYJRCKh68PmCTNZb2M/E76AUYDx7LyrfOfXpfi7Lfa4vP3
	 sD11pcGUi9/VA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 16/69] gpio: wcd934x: check the return value of regmap_update_bits()
Date: Sun,  3 Aug 2025 20:30:26 -0400
Message-Id: <20250804003119.3620476-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003119.3620476-1-sashal@kernel.org>
References: <20250804003119.3620476-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.41
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit ff0f0d7c6587e38c308be9905e36f86e98fb9c1f ]

regmap_update_bits() can fail so check its return value in
wcd_gpio_direction_output() for consistency with the rest of the code
and propagate any errors.

Link: https://lore.kernel.org/r/20250709-gpiochip-set-rv-gpio-remaining-v1-2-b8950f69618d@linaro.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, here's my determination:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **It fixes a real bug**: The `wcd_gpio_direction_output()` function
   in drivers/gpio/gpio-wcd934x.c was not checking the return value of
   the first `regmap_update_bits()` call (lines 50-51 in the original
   code). This could lead to silent failures where the GPIO direction
   register update fails, but the function continues to update the value
   register, potentially leaving the GPIO in an inconsistent state.

2. **The fix is minimal and contained**: The change is very small - it
   only adds 4 lines of code to check the return value and propagate the
   error. This minimizes the risk of introducing regressions.

3. **Consistency with the rest of the driver**: Looking at the code,
   other functions in the same driver already properly check regmap
   operation return values:
   - `wcd_gpio_get_direction()` checks the return value of
     `regmap_read()` at line 27-29
   - `wcd_gpio_direction_input()` already returns the result of
     `regmap_update_bits()` directly

4. **Consistency with other GPIO drivers**: My examination of other GPIO
   drivers (gpio-lp87565.c, gpio-lp873x.c, gpio-tps65912.c, gpio-
   adp5585.c) shows that properly checking return values from regmap
   operations in `direction_output` functions is the standard practice.

5. **Potential for real-world impact**: The WCD934x is an audio codec
   used in Qualcomm SoCs like SDM845. A failure to properly set GPIO
   direction could cause issues with audio functionality or other
   peripherals connected through these GPIOs. The bug could manifest as
   intermittent failures that are hard to debug.

6. **No architectural changes**: The commit doesn't introduce new
   features or change any APIs. It's purely a bug fix that adds proper
   error handling.

7. **Clear bug pattern**: The pattern of not checking the first regmap
   operation but checking (returning) the second one suggests this was
   an oversight rather than intentional behavior.

The commit follows stable kernel rules by being a clear bug fix that
addresses a potential reliability issue without introducing new
functionality or making architectural changes.

 drivers/gpio/gpio-wcd934x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 2bba27b13947..cfa7b0a50c8e 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -46,9 +46,12 @@ static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 				     int val)
 {
 	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+	int ret;
 
-	regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
-			   WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+	ret = regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+				 WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
 				  WCD_PIN_MASK(pin),
-- 
2.39.5


