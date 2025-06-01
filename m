Return-Path: <linux-gpio+bounces-20858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED28ACA4A6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 02:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B24E18907E0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jun 2025 00:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A7329ACDB;
	Sun,  1 Jun 2025 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heQ4XMg6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AC129AAFF;
	Sun,  1 Jun 2025 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820835; cv=none; b=j8+B7rzrOhtyjr/sqFOkD8HiSzDT/JzaFDF1Oi5eKSJbvr5z6/m0N19xUsz3V7/mwaOkhn5WRtF6mHtk3XKbIUuKKuv8t+ae2dcE9CkARPsLXqG8N7ZRmmztLeTzc8sn8Fs+4UtdoZgMBgnxfyWxjwax2XM4oQG+8gIVKOOx5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820835; c=relaxed/simple;
	bh=n0M/wQVZo/kUxUGlIqqyj2MoFjGtXjzCGIX1oHALJLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qBWDCgfz+Ki+AgipS0bkcEfoXsd72Rz4ytQQvJ+hJpwXoDp8+225/UgjCbBb2Wckt9MIjyL4+ArbTsO4phVPSnoy8iC4Mg0F9NyzTyhlE+VqHpHZl36FIx0AXul2v6kmEl4uW4kQicgdm5Cdrq+XyjAveTn2CNv1uwh5mDSzJOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heQ4XMg6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C255C4CEE7;
	Sun,  1 Jun 2025 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820835;
	bh=n0M/wQVZo/kUxUGlIqqyj2MoFjGtXjzCGIX1oHALJLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=heQ4XMg660NcDjKNbJutHeoUPNDjJQDoyA7UznADhG3oa9AAEFKaaDXBB1KPiceCf
	 oJsmAQTHOunNVJi9ve3M98ChGeHjBebKEb/G0Cwcnd8kdz/Nxtl+7LAYIRhSNYX96v
	 qR9BUNDIxFvTbiY+Ve8lrQ2M6mnAHFIBiQPRMkWJ0CsY3SBhL4WcSYlQluSvPREiLL
	 iE2CRo2CwhwkTzAV5sfbI7rnMI1Eu94yFTG0tTs70HiiDCHealqq5km5mnJSBDf2Ru
	 hf6Y5hIOOJtRY/8nHegDEqQ7p6fOePrN49bKg8mn3SUBj1NetI+l+GDpDXR7407u5C
	 dCLpEE1etnhEw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 101/102] gpio: ds4520: don't check the 'ngpios' property in the driver
Date: Sun,  1 Jun 2025 19:29:33 -0400
Message-Id: <20250601232937.3510379-101-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit df1540f8f311a8b2ef0e450e7e40710784acc8c7 ]

This is already done by the gpio-regmap abstraction by calling
gpiochip_get_ngpios(). We don't need to do this at the driver level.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Link: https://lore.kernel.org/r/20250408-gpio-regmap-ngpios-v2-1-26f254014f57@linaro.org
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

NO This commit should NOT be backported to stable kernel trees.
**Analysis:** This commit removes driver-level handling of the 'ngpios'
property in the ds4520 GPIO driver, relying instead on the gpio-regmap
abstraction layer to handle this automatically via
`gpiochip_get_ngpios()`. **Reasons this should NOT be backported:** 1.
**Code cleanup, not a bugfix**: The commit message explicitly states
"This is already done by the gpio-regmap abstraction by calling
gpiochip_get_ngpios(). We don't need to do this at the driver level."
This indicates the change removes redundant code rather than fixing a
functional issue. 2. **No user-visible impact**: Both the before and
after code achieve the same functionality - reading the 'ngpios'
property and configuring the GPIO count. The driver worked correctly
before this change. 3. **Architectural cleanup**: The change moves
responsibility from the driver level to the abstraction layer, which is
a code organization improvement rather than a critical fix. 4. **Missing
infrastructure dependencies**: Looking at the code in
`/home/sasha/linux/drivers/gpio/gpio-regmap.c:274-278`, the automatic
ngpios handling was added in commit db305161880a "gpio: regmap: Allow
ngpio to be read from the property". Without this infrastructure change
being backported first, this commit would break the ds4520 driver in
stable trees. 5. **Similar commits marked NO**: The reference commits
show that code organization changes (#1, #4, #5) are marked as NO for
backporting, while actual bugfixes (#2, #3) are marked as YES. 6. **No
stable tree indicators**: The commit message contains no "Fixes:" tag,
"Cc: stable" notation, or indication that this addresses a user-
impacting issue. 7. **Risk vs benefit**: The change removes 6 lines of
working code (lines 28, 36-38, 47 in the original) without fixing any
reported issues. The risk of regression outweighs any benefit for stable
trees. The ds4520 driver was relatively new (first commit 659ad5f7efec)
and this cleanup came shortly after, making it an optimization rather
than a critical fix requiring backport.

 drivers/gpio/gpio-ds4520.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-ds4520.c b/drivers/gpio/gpio-ds4520.c
index 1903deaef3e9b..f52ecae382a45 100644
--- a/drivers/gpio/gpio-ds4520.c
+++ b/drivers/gpio/gpio-ds4520.c
@@ -25,7 +25,6 @@ static int ds4520_gpio_probe(struct i2c_client *client)
 	struct gpio_regmap_config config = { };
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
-	u32 ngpio;
 	u32 base;
 	int ret;
 
@@ -33,10 +32,6 @@ static int ds4520_gpio_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Missing 'reg' property.\n");
 
-	ret = device_property_read_u32(dev, "ngpios", &ngpio);
-	if (ret)
-		return dev_err_probe(dev, ret, "Missing 'ngpios' property.\n");
-
 	regmap = devm_regmap_init_i2c(client, &ds4520_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
@@ -44,7 +39,6 @@ static int ds4520_gpio_probe(struct i2c_client *client)
 
 	config.regmap = regmap;
 	config.parent = dev;
-	config.ngpio = ngpio;
 
 	config.reg_dat_base = base + DS4520_IO_STATUS0;
 	config.reg_set_base = base + DS4520_PULLUP0;
-- 
2.39.5


