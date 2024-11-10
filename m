Return-Path: <linux-gpio+bounces-12789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ADD9C34A6
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 22:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D675282435
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 21:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19143158533;
	Sun, 10 Nov 2024 21:01:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F1157487
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272463; cv=none; b=bDh5RILm2zuOioNvn/SUZ9UEYPB6xbkpEB/nTjaNT7hNwwPMf3zo5/xJM78yq9vdfhTiBEkGj4UtWZ0PaHLckUo2PZLQ/n38hbrm46IFQoTnKBsMKRcjNiiQIxxxgTzLl+IZSdbQ7Neq32IBxS1UXBtKOSw4KqS2+oevzZKYaZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272463; c=relaxed/simple;
	bh=QZQswWBjiA6sKRY7WdJThEE2ZM5Xh2HKQzfY+W6JxpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/yTbTlfAnfJMxsyAWu3Jw4PvfF/jqBKeW/9U4HDrKU+QCs+gPa2Fgi4tC4hPqwcm7LSW9V8HkF92bNF17n+MOQmz4jGvxoDOwflxucQs8aZiyO1HQ0kMdbPi91iurcEEJFMIP5wy/uZMxI9F5NJ/zEPntyTbVvzluIWsnAu+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id dd80ce7b-9fa6-11ef-9b01-005056bd6ce9;
	Sun, 10 Nov 2024 23:00:50 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 3/6] pinctrl: cy8c95x0: use flexible sleeping in reset function
Date: Sun, 10 Nov 2024 22:59:43 +0200
Message-ID: <20241110210040.18918-4-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110210040.18918-1-andy.shevchenko@gmail.com>
References: <20241110210040.18918-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device reset assert and deassert length was created by usleep_range()
but that does not ensure optimal handling of all the different values from
device tree properties. By switching to the new flexible sleeping helper
function, fsleep(), the correct delay function is called depending on
delay length, e.g. udelay(), usleep_range() or msleep().

While at it, move out GPIO consumer name setting of the reset conditional,
the all necessary checks are already done there, so logically that call is
not related to the reset sequence.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index cb6d9458c1e8..54b080f63226 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1475,12 +1475,11 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	chip->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->gpio_reset))
 		return dev_err_probe(chip->dev, PTR_ERR(chip->gpio_reset), "Failed to get GPIO 'reset'\n");
+	gpiod_set_consumer_name(chip->gpio_reset, "CY8C95X0 RESET");
 	if (chip->gpio_reset) {
-		usleep_range(1000, 2000);
+		fsleep(1000);
 		gpiod_set_value_cansleep(chip->gpio_reset, 0);
-		usleep_range(250000, 300000);
-
-		gpiod_set_consumer_name(chip->gpio_reset, "CY8C95X0 RESET");
+		fsleep(250000);
 	}
 
 	/* Regmap for direct and paged registers */
-- 
2.47.0


