Return-Path: <linux-gpio+bounces-23989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B8B19907
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 02:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2051F1895C06
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 00:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFFB1FE45A;
	Mon,  4 Aug 2025 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnF9oeoU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E511FDD;
	Mon,  4 Aug 2025 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267953; cv=none; b=OvqDZ5v6Wpl3RocJ3xmrUUjMhxd2vMfnn/maOvDXDbPy4LXJOQ4/IOu1s+PvMeWeYKerUWC0kxkipBDKPhnw7o0I1Wbu9+iLtDxrI9/m7QrBk0qef/XmO6F5OwalgbdXSYS72ZP7B0K+lxLsyijt7lYD96aERvDvnK/IcNoC2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267953; c=relaxed/simple;
	bh=8eZUrqzetqGBCjKnX1dwDPFNLSNpgksz0bneRQqIx+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4V9p0l23NJltnT1U2wW48HApXd4EAOLpBx66SE0WlUO2k5VDBhoWFebzx2Jmq28/G4AefA9sPIG8MtDtT0qBjarroAX+zPiSK+6PmnkiTZq4crh4WIHXlNfoaehiiYWJXy51DhfU6GzBlB4HBxlkhkkunSLZYneybhxiMQA8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnF9oeoU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF88EC4CEF0;
	Mon,  4 Aug 2025 00:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267953;
	bh=8eZUrqzetqGBCjKnX1dwDPFNLSNpgksz0bneRQqIx+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GnF9oeoUOvWEgCevON/ACWB1ye6VDm04Pa1/7Xr5zfWkeetVHojmCN+xjqH0BHZhL
	 XcOrfppgF4V3yA1uroELteH4T29f55ZHDO/y/GfpP7ytyzUFi/vLPC783mJYrd4T1H
	 XJPzlefYLGPCDbvaksiudHfTIZn/OHkPg/2LFfs7Ki0akYgxFeGpwWXuyvFpMHoSfh
	 zl4zjd4E3q7xsZzoXblWYqQSv2si87hIiG/wyDv37u3M2ZJ0SsW956Bqj70pGE1D/B
	 qT74clGkPn17khnMKB8gX/kaRIhXUu82HJHEcAF5XOug9umZPNAJeXl4KUsUA2hhon
	 oIt+IbnJhhTdg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/44] gpio: wcd934x: check the return value of regmap_update_bits()
Date: Sun,  3 Aug 2025 20:38:14 -0400
Message-Id: <20250804003849.3627024-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003849.3627024-1-sashal@kernel.org>
References: <20250804003849.3627024-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.189
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
index 97e6caedf1f3..c00968ce7a56 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -45,9 +45,12 @@ static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
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


