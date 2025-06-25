Return-Path: <linux-gpio+bounces-22123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C0AE797A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E90865A0779
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7DD20C00D;
	Wed, 25 Jun 2025 08:05:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5001E5B95;
	Wed, 25 Jun 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838757; cv=none; b=tCBR8WaEkX03SlKAd3Z7J7h2/sr3pbYqWl92BS+i+axx27GMP9KLY9QAP0DM6eq4CV+Tn7Te+tFh021mk0gHSJ8t5rLnKG8Mtst2bfrPUS4umDZ3f+BpZt4EbqLvvVsnLIuI3WqbJmYP+ddsvnjjs1HuZWnyRwJVHsW0zUurO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838757; c=relaxed/simple;
	bh=m4s27MBJCT7wdhGNUL8+TSGO3vAJAA0A+1pGmYq74t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wx9hrXhJ2TW96CyA++Qs2SfD/912ie67Flw+N3vcWdlKrE7BsTthFrDy84+9afluPCC/t9qGejC5eItJmSzBegY9jxA1fLkPlCnh7HtUjDWGitDYyODIiyhW0DXltD6THMt/x1+iO/zdk1K0By3ZqYZdPJT7lMAHyEKwpgUyi8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314F9C4CEF1;
	Wed, 25 Jun 2025 08:05:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] gpio: rcar: Use new line value setter callbacks
Date: Wed, 25 Jun 2025 10:05:47 +0200
Message-ID: <f09a0481fc0ddafb9aa05d903fbb42ef52332c03.1750838486.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750838486.git.geert+renesas@glider.be>
References: <cover.1750838486.git.geert+renesas@glider.be>
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
v2:
  - Rebase.
---
 drivers/gpio/gpio-rcar.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 8416e0430887bd5e..1d121a4275905e09 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -356,7 +356,7 @@ static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
-static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
+static int gpio_rcar_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -364,10 +364,12 @@ static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
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
 	u32 bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
@@ -380,6 +382,8 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	val |= (bankmask & bits[0]);
 	gpio_rcar_write(p, OUTDT, val);
 	raw_spin_unlock_irqrestore(&p->lock, flags);
+
+	return 0;
 }
 
 static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -531,8 +535,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
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
-- 
2.43.0


