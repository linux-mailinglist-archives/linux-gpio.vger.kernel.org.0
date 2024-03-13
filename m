Return-Path: <linux-gpio+bounces-4304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F81587B56C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 00:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B871C20EAD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Mar 2024 23:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54F75F847;
	Wed, 13 Mar 2024 23:54:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FE5EE64
	for <linux-gpio@vger.kernel.org>; Wed, 13 Mar 2024 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374078; cv=none; b=nuAMnwtpbTOs0I/tixNjbsDPfKjlNJX24tvAhra1+xTBhasVlKdnT78x70I8x23p/ukhHDuiqcs/tMrFx+cpenIyEafgUjE2D4c4bomY+NmVbMiZC9BNuH4bdLWcwa3LB7kk3Tw34lfPmac8xrGxjpHT+BOZm//wnIn2RHxvWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374078; c=relaxed/simple;
	bh=A/6Rxz4Bmsq8vL9J8RxsvzpoTJK2t8DPLAAu7jQ7ezk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaRMXNdVFnYoZ5JdHM/Br09+sn4Tzncvj4IYSf85+hFTJfPCmQewkXUBsxIThjD4wHBdtuur8wkyhKkVvEl8OTVXmxCyCZnIVjnlEE4Xm/DtQh+vTyKTuDpxxin1a6LX+NH6zGycTLg+2evhCWEyu4J9ViM6C8frUg2cWypbqFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 07bc019b-e195-11ee-b972-005056bdfda7;
	Thu, 14 Mar 2024 01:54:29 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/11] pinctrl: aw9523: Get rid of redundant ' & U8_MAX' pieces
Date: Thu, 14 Mar 2024 01:52:09 +0200
Message-ID: <20240313235422.180075-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313235422.180075-1-andy.shevchenko@gmail.com>
References: <20240313235422.180075-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the variable is declared as u8, no need to perform ' & U8_MAX'
as it's implied anyway.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 118896373844a..9e8e658f81404 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -603,7 +603,7 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	mutex_lock(&awi->i2c_lock);
 
 	/* Port 0 (gpio 0-7) */
-	m = *mask & U8_MAX;
+	m = *mask;
 	if (m) {
 		ret = _aw9523_gpio_get_multiple(awi, 0, &state, m);
 		if (ret)
@@ -612,7 +612,7 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	*bits = state;
 
 	/* Port 1 (gpio 8-15) */
-	m = (*mask >> 8) & U8_MAX;
+	m = *mask >> 8;
 	if (m) {
 		ret = _aw9523_gpio_get_multiple(awi, AW9523_PINS_PER_PORT,
 						&state, m);
@@ -635,20 +635,20 @@ static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
 	unsigned int reg;
 	int ret;
 
-	mask_lo = *mask & U8_MAX;
-	mask_hi = (*mask >> 8) & U8_MAX;
+	mask_lo = *mask;
+	mask_hi = *mask >> 8;
+	bits_lo = *bits;
+	bits_hi = *bits >> 8;
+
 	mutex_lock(&awi->i2c_lock);
 	if (mask_hi) {
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
-		bits_hi = (*bits >> 8) & U8_MAX;
-
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
 			dev_warn(awi->dev, "Cannot write port1 out level\n");
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
-		bits_lo = *bits & U8_MAX;
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
 			dev_warn(awi->dev, "Cannot write port0 out level\n");
-- 
2.44.0


