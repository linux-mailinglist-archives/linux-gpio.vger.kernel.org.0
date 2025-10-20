Return-Path: <linux-gpio+bounces-27303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C7BF0F4F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD6018A392D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 11:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822B4305E1D;
	Mon, 20 Oct 2025 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="ENfVlslW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68B3043B2
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961416; cv=none; b=oH7U2941SA3ltZDoiYfDhBAhFCPFwIoCOWMBe5YeAasVij64GXAu8pDrICIs7PSYgJh8rLMHwEASPYqh6df2CI7s9mD0+J6tV6UUHflSlMkA331PsFpPdoOcf6UxV2u9QHcwarjt4/OWBS2+Ja2ja+JBe6BvX63nW+4pSyJCpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961416; c=relaxed/simple;
	bh=UsXuZZ4CDFIoXGnnkmOrhlJLsqGjNyIDH0B5Oxy4ZpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC7FrOBFml9DuY5LFhIM/V6V0jMIwKeKPmywXWYaCoQpDidCQncZGnrWQSAoz6yQWz2GJ5/Y5JVCiyigOusmRpsdEAR5eWjlsz9GG/p8d9ErnzjJYbD9MgP5TZs4RCMXjE02n852RXXMq3iI0B1tNmnNjoHyRGMPDFV3+jkwWZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=ENfVlslW; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 888AB6892EA;
	Mon, 20 Oct 2025 13:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1760961405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpDo+Y//qXEqMrDZTOpLmk6gC9gJwVO5/Lm3bRVPYDk=;
	b=ENfVlslWElP/mU84qI/SuiwVtLFSAiBaVhvHwawUW4s5BTBp85uU+CZ3Ulq9JgN0E8zDW1
	+2T/f0cfYowSddeXIxJmK+H0t9X6WWLq3hruonAv+lRWK8ym533QH2BTI+taiDhvCgYpaC
	RtZtevEhUPdX/LrW1eVWZPrD4hCrgIKqZs2uj1gWcPsbPqGveR0tGhxT1U1HTwjCsfulVx
	Rl7i2IVZEJeSaBVyn1P90eDffaf2YGci1FtH4A2IeiCHj45ESeAcFMFDibZjZg6WAHEnJt
	P1xhecl7m5f87g9Dkmb34q56GecfsRQcdbUGsfsIlWe85bLEHVXOtHIIzdFPWg==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [RFC PATCH 1/2] gpio: regmap: Force writes for aliased data regs
Date: Mon, 20 Oct 2025 13:56:35 +0200
Message-ID: <20251020115636.55417-2-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020115636.55417-1-sander@svanheule.net>
References: <20251020115636.55417-1-sander@svanheule.net>
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


