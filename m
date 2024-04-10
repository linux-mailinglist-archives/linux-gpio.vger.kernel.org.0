Return-Path: <linux-gpio+bounces-5268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCE89EB02
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 08:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92824B24104
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 06:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B8C17BDA;
	Wed, 10 Apr 2024 06:39:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53196946C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712731183; cv=none; b=ljZ78O2uU7Pq3giJUQbLAWl9Fvf1OlZL5ijHs0MLguE1G9xANt3XZ2pNBRiLA1UXXUOI66T24DnH6f42QUfNMT5/WVGz3aBjle/DS95d12qTHjl7DNigveV7rAu7ilPK6WB/pizjPfvdXXx0hVeYMNqu5ebhb0xTrHu4MeFO8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712731183; c=relaxed/simple;
	bh=VtsoA8qcOroNxlO1AUFUjZ7rSJfWSRsdeMnoPl8cN6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKPpvHthkeOWDv9p8k9cbNSgJN745kh3hUnX73s912SPlaNNU/CuPJOh6fZM6boQ5+ipOX3OVljMmygLDJMkbjqbIXB/OhE8GbNYGhjxICvJ98ExQ83k7Gx4vnebGLvmpfLG+Tvr35/Ede+NzkYWezSt0uGTlhy45AFuIlPBs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 16f419d1-f705-11ee-a9de-005056bdf889;
	Wed, 10 Apr 2024 09:39:33 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: regmap: Use -ENOTSUPP consistently
Date: Wed, 10 Apr 2024 09:39:30 +0300
Message-ID: <20240410063930.1199355-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO library expects the drivers to return -ENOTSUPP in some cases
and not using analogue POSIX code. Make the driver to follow this.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-regmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index c08c8e528867e..71684dee2ca5d 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -129,7 +129,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 		base = gpio_regmap_addr(gpio->reg_dir_in_base);
 		invert = 1;
 	} else {
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
@@ -160,7 +160,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 		base = gpio_regmap_addr(gpio->reg_dir_in_base);
 		invert = 1;
 	} else {
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
-- 
2.44.0


