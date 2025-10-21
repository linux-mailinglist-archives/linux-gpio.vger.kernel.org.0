Return-Path: <linux-gpio+bounces-27387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938FBF70B2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06645355E99
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACE933C500;
	Tue, 21 Oct 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="a6AU+z9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E172D6E67
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056675; cv=none; b=DtVjaUzy8GPCA/ECdoXp5uByrcNm8J55jikQUpP0kKjnIu/gZg2kxDkkjSES3QtqW/zkQYioCuuRMORggRKNZYNtU0Cy06hvkcprMSyek7D9BSvhSuGT8v7Gfo2AqY+xkPdg6oHs9OPloQ2Cnju7NE+rHULuPSFpR1/cr/M5Ec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056675; c=relaxed/simple;
	bh=bpGpijdjZAR7OyV2uiqmTwCnTxW/nQi49zgcRxMPFb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3gfC3wXWZg/ZiShT0gF/XuhyZod5/N9LDOlczuiH1iKwnQxHkjaI4vESMCk+V/PVNN3kyrJ3K1Fxg+jx8Q1fgZIi2bvbyFam5uZIMlx4GkDePKpv3qw/4Ao4ZUp1GbgVG2mC4ULUGlYk2a4olmYr4bIMMnKtNBKvm6K3X8kJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=a6AU+z9R; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 5CFF968A1CC;
	Tue, 21 Oct 2025 16:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761056671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeM3dHttDCgxcjOT7kFTiod27po3wdP3a4W2ChFB354=;
	b=a6AU+z9REHJx9dYxBOXXb1Kp0OmUDm54fZ8We2+iBYlwJN9k7DdpNGrZRtWyzSVV9oI6DW
	cT4AeLCr2aKs2RpybT0qNVeJiQ7KfUy74mUPrjFcoq9F8Ckb/RcfINJus4J2M65/W/6eel
	GJPy8q3ZOkBXVgxbrhq3JRiXqjeR7tqRuRn4Ztu5gRgMFId1pOQFgd1ujN3ies5YVX1qOH
	p2KSRRJBgM0CVYF6kljJ9gC9xPA8EKw9bAUYh55D0slcBwLJR783tPYUo2BxJpRJqtWOSO
	tZfD+vfJpa+EXeNLHiBi01Ws/jM6iCk72CDTY/vraUIEMmr94AB/DxiD+9jiJA==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v6 1/8] gpio: regmap: Force writes for aliased data regs
Date: Tue, 21 Oct 2025 16:23:56 +0200
Message-ID: <20251021142407.307753-2-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO chips often have data input and output fields aliased to the same
offset. Since gpio-regmap performs a value update before the direction
update (to prevent glitches), a pin currently configured as input may
cause regmap_update_bits() to not perform a write.

This may cause unexpected line states when the current input state
equals the requested output state:

        OUT   IN      OUT
    DIR ''''''\...|.../''''''

    pin ....../'''|'''\......
             (1) (2) (3)

    1. Line was configurad as out-low, but is reconfigured to input.
       External logic results in high value.
    2. Set output value high. regmap_update_bits() sees the value is
       already high and discards the register write.
    3. Line is switched to output, maintaining the stale output config
       (low) instead of the requested config (high).

By switching to regmap_write_bits(), a write of the requested output
value can be forced, irrespective of the read state. Do this only for
aliased registers, so the more efficient regmap_update_bits() can still
be used for distinct registers.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ab9e4077fa60..ba3c19206ccf 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -93,7 +93,7 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
-	unsigned int reg, mask;
+	unsigned int reg, mask, mask_val;
 	int ret;
 
 	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
@@ -101,9 +101,15 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
 		return ret;
 
 	if (val)
-		ret = regmap_update_bits(gpio->regmap, reg, mask, mask);
+		mask_val = mask;
 	else
-		ret = regmap_update_bits(gpio->regmap, reg, mask, 0);
+		mask_val = 0;
+
+	/* ignore input values which shadow the old output value */
+	if (gpio->reg_dat_base == gpio->reg_set_base)
+		ret = regmap_write_bits(gpio->regmap, reg, mask, mask_val);
+	else
+		ret = regmap_update_bits(gpio->regmap, reg, mask, mask_val);
 
 	return ret;
 }
-- 
2.51.0


