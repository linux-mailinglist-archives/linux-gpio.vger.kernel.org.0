Return-Path: <linux-gpio+bounces-4308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48D87B575
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 00:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ABEB1F22F8B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Mar 2024 23:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A409B5D8FE;
	Wed, 13 Mar 2024 23:55:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EA5D724
	for <linux-gpio@vger.kernel.org>; Wed, 13 Mar 2024 23:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374138; cv=none; b=cdGtj59xH0mKMwYWVAf/E/oOwiYtby6sZUr6sNT92qUlGIExcR7+Pbl9Tj6xSm32B4HmCpY4dVB+1z/W1u0eLPd+UVZRfV8qdmMjIMolGf0qDTf4D+tVINOWiDbKzMolf9c5jWOVsnol4hU+dZpnZjxCOtfFb5ajL/S3TsQu+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374138; c=relaxed/simple;
	bh=k+1YhdyA6bA8FnqCXxwU7KWqjxoU2scZqrkAAb7HRG4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RsESUxbpJQdVXvgOx/7Phzwk81BBIzcmfUekqPe90IbSWN04SJJNjKnQw/zJVfNaOzq/pjZPn74am1eY7CpllX9+dG9IrMgpkhL7fHaZwd89P5sHyvozomfqsjWJ92TX33M8udxbF3zJhYlXV4wDiwXfmZwnFb7j/GqprpX6q3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 06688e94-e195-11ee-abf4-005056bdd08f;
	Thu, 14 Mar 2024 01:54:27 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/11] pinctrl: aw9523: Always try both ports in aw9523_gpio_set_multiple()
Date: Thu, 14 Mar 2024 01:52:06 +0200
Message-ID: <20240313235422.180075-4-andy.shevchenko@gmail.com>
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

The ports are equivalent from the user's point of view. Don't limit
trying them both if writing to one fails.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 65d523697b731..d93640a02d1d3 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -653,7 +653,7 @@ static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret = 0;
+	int ret;
 
 	mask_lo = *mask & U8_MAX;
 	mask_hi = (*mask >> 8) & U8_MAX;
@@ -663,10 +663,8 @@ static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
 		bits_hi = (*bits >> 8) & U8_MAX;
 
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
-		if (ret) {
+		if (ret)
 			dev_warn(awi->dev, "Cannot write port1 out level\n");
-			goto out;
-		}
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
@@ -675,7 +673,6 @@ static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
 		if (ret)
 			dev_warn(awi->dev, "Cannot write port0 out level\n");
 	}
-out:
 	mutex_unlock(&awi->i2c_lock);
 }
 
-- 
2.44.0


