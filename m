Return-Path: <linux-gpio+bounces-23401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA8B08DAA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 14:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A26F4A4505
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 12:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AEA2D3209;
	Thu, 17 Jul 2025 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iAv5pDUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6A1F92A
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757084; cv=none; b=eMJCZ/gmeiExFhooxMb+8RfJ4jPneEfo6e+/ICGqlN74G2cot0qbhISqhy3Qhfbm5FY55JizFktoOnkjv/Ynk8tQ8moPR4iVUozIXBB82+V+U3dZzRB08OKoPDrl/ffM1F+KQOWpZgK9BVtG9taNgnLPVi7Smw6bhJgSr/BJ9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757084; c=relaxed/simple;
	bh=RsggvlbXuKQUjDvIXhfAw6fZmnRVxzpAcnV8aFDPl70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVjWWowpLSsAQh1NnCii2NC2B4uRFgrAlZal5Mm4OulvFkUq1ujOSid4GNZYWeIAUCJuw5OsAxtoRMjw4FC4Rd6aVNT5e6lOVt5+gqI2xyMzNdy1Z/sqROidqqnNy16NnDROHvp1Eg5VPiLJ+CHSlJWE+YLPADqsowckBSdGkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iAv5pDUo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so490373f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752757081; x=1753361881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkmEdAi1mYXLj0GumaAbmFTj8/Vf6pdxJ9LxWbK4qIA=;
        b=iAv5pDUoSbWKnTwE1NdQhTe6JblAWVuilGZwDGhRDWbaRsJ60kC8wOJJgIO2QlbAMh
         16Yx50nmV9FHWkb+wlUwTphOQzG8rmbGMxq+VRSD4+SJB0iXeEadhqA/JygNIHubVrOt
         wZpqRNJPZFfwHa0LbZUXOCtiX4SQhi2dgL5dOKjUXvaGUFwS+RezSNYiUpHcGnU1JCun
         Fpj4u8W9OyhVaNjGYbXS1UejotrqseNOTeVceUi1dqQ2h78LMNazVyS0Jqz0bch7/51H
         mkG3Mj+vLXmXqzzUCiWPfCYginhnY/iEq7zAsoLVrEXl1ezZUCveQoYmaPh3buh46JaI
         kIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757081; x=1753361881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkmEdAi1mYXLj0GumaAbmFTj8/Vf6pdxJ9LxWbK4qIA=;
        b=wcRoVanpi3D+cUM7w82e5hqSRwcR1IXZyzgXIprxdsx8DB8oR37754lxYKzgMEJ4cM
         kRbNh00JtDsz+4+evBbV/K/DM4p3fDWevI/0gVzoT4W9z015ZAYvTDzKr4EXisQU/Z1m
         rOhq7WkqKICRyGC2SuWcZJdRUZZudevRcVDwQaHHmCg+f00mERtaf8eodFwlvTzvM16Z
         6/PPAiySgDCDkZHflUtx7qRoHeC467TOvv8WA0Hz092OqaUO8cGJVyjkArgavTGtX73k
         5n41pnp4Hrifsp/jthCCNCqhF+HScQztXIxMEMFG9WKDl6p6Hu2u+MS0ESrdGCbSkps3
         1XEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTgo1zgrrCkhnUT7vlDkaWguVCxvQDGzdeoed3riZJoIEPzgGFR7CzttXA4IRNMQ//4BRQL+gapslG@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjcezmVNS6LqKEOJVj/xGwPYBeGiN6RI5TSXNKv8SIYuQcbqH
	37iy5Y58Xjz5ScLYd5ZNZ63VK52A5WfT/XIRatn5tYBcw273eUemIrNJ9OkfzHiZC9g=
X-Gm-Gg: ASbGnctR7lW/JNBnKROcFWgAd6TH99M7Ym/WsbRugovwHUVyD/IQC80OgSG5ksfj52x
	COrQf5ODYpP0NRLcDnruEX3Dvv5uTDZYXM0Lcsom/tZ/DeJBonAocM9HXPsIm1uMTv/hLjuikkL
	X4r3omQDpaNz2FXQTfcoBFWNsqyAl+c0L7TxWqFKWX1qzPAPt0A1EB9kmZCteb0SitufnOJ6wxl
	7G6NP7ERHrWyeimWJu64whQBRyGrVdi6ZyXyTRGBHKeob+pqPLqfZ/vUQ2hZmk8G1rTRoMrP2jn
	hWiLN2zJBEtE86sy6Dx+cE9KniiojsdAuaDL1vE6QjlSPIIbiFKQt9ubirlXbQUz5SYK/W5ZAGv
	K8/+GIDFbd57aZ98xWvbdveIdr+2qYOX/Eg==
X-Google-Smtp-Source: AGHT+IEUUPM2Bn3BQQTqraXEIB2Jm5m5lpH7CokHPg/MliMMzl3/KP587ZU4bPNjNv333+jZ1/DKow==
X-Received: by 2002:a05:6000:290f:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3b60e4d0841mr6039464f8f.20.1752757080738;
        Thu, 17 Jul 2025 05:58:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e61:4694:c621:5693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c308sm50080735e9.30.2025.07.17.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:58:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: ma35: use new GPIO line value setter callbacks
Date: Thu, 17 Jul 2025 14:57:58 +0200
Message-ID: <20250717125758.53141-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
I realized one of the pinctrl drivers was missed during the conversion.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index b51704bafd81..da5220da5149 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -361,7 +361,7 @@ static int ma35_gpio_core_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(readl(reg_pin) & BIT(gpio));
 }
 
-static void ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
 	void __iomem *reg_dout = bank->reg_base + MA35_GP_REG_DOUT;
@@ -373,6 +373,8 @@ static void ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		regval = readl(reg_dout) & ~BIT(gpio);
 
 	writel(regval, reg_dout);
+
+	return 0;
 }
 
 static int ma35_gpio_core_to_request(struct gpio_chip *gc, unsigned int gpio)
@@ -524,7 +526,7 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 		bank->chip.direction_input = ma35_gpio_core_direction_in;
 		bank->chip.direction_output = ma35_gpio_core_direction_out;
 		bank->chip.get = ma35_gpio_core_get;
-		bank->chip.set = ma35_gpio_core_set;
+		bank->chip.set_rv = ma35_gpio_core_set;
 		bank->chip.base = -1;
 		bank->chip.ngpio = bank->nr_pins;
 		bank->chip.can_sleep = false;
-- 
2.48.1


