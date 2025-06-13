Return-Path: <linux-gpio+bounces-21498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D07AD8543
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DAE21883F40
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 08:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDAE45948;
	Fri, 13 Jun 2025 08:09:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025219A;
	Fri, 13 Jun 2025 08:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802179; cv=none; b=Bifa5iBqnxi4T5Lk9k5OMSgiexv0sn9ZCq2Q3OMx7iczt/Zqu2cdEgVggMf1M6Uktsmcve4OjFLZOqAyD6ZV7vfm9RjUb08JFsqhZzqwsI8w1/sAo5bEbizJybxm0FD4rdVEv/eIZ5Rc1hBjjKJ9idye/Rt3Rg7bDO8LaK+GdwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802179; c=relaxed/simple;
	bh=izGiYVBbmFETcGfVmpEcpFp+k0lDwOi42Kedzz3nYc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qi+UjGF4mJSTIb9WoYYLJieYcMEX8HOs/tlVWnYU+rDd4oULvgH8SDd2PB0uqdxXZze5LAIoM9phIQllf9UKoXqzRmX4UPTlmHvQx98JYSLga0/PS3w+tXn6mQh1gkQWFTZZSP1wSdIcs4MjgZWKMFPqrjx0h64A8NlNs6pOwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6398C4CEE3;
	Fri, 13 Jun 2025 08:09:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Use new line value setter callbacks
Date: Fri, 13 Jun 2025 10:09:29 +0200
Message-ID: <b648ffcfe6268d3886b134a98908b2f91dbece56.1749801865.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct gpio_chip now has callbacks for setting line values that return
integers, so they can indicate failures.  Convert the driver to using
them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 4fc7cad5032a7a80..130aa0cac186d0cb 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -359,7 +359,7 @@ static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
-static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
+static int gpio_rcar_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -367,10 +367,12 @@ static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_lock_irqsave(&p->lock, flags);
 	gpio_rcar_modify_bit(p, OUTDT, offset, value);
 	raw_spin_unlock_irqrestore(&p->lock, flags);
+
+	return 0;
 }
 
-static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				   unsigned long *bits)
+static int gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -378,7 +380,7 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 
 	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
 	if (!bankmask)
-		return;
+		return 0;
 
 	raw_spin_lock_irqsave(&p->lock, flags);
 	val = gpio_rcar_read(p, OUTDT);
@@ -386,6 +388,8 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	val |= (bankmask & bits[0]);
 	gpio_rcar_write(p, OUTDT, val);
 	raw_spin_unlock_irqrestore(&p->lock, flags);
+
+	return 0;
 }
 
 static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -537,8 +541,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->get = gpio_rcar_get;
 	gpio_chip->get_multiple = gpio_rcar_get_multiple;
 	gpio_chip->direction_output = gpio_rcar_direction_output;
-	gpio_chip->set = gpio_rcar_set;
-	gpio_chip->set_multiple = gpio_rcar_set_multiple;
+	gpio_chip->set_rv = gpio_rcar_set;
+	gpio_chip->set_multiple_rv = gpio_rcar_set_multiple;
 	gpio_chip->label = name;
 	gpio_chip->parent = dev;
 	gpio_chip->owner = THIS_MODULE;

