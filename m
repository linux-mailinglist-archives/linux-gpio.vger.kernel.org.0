Return-Path: <linux-gpio+bounces-22122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B190AE797B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 650F57A4FCF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6225620C476;
	Wed, 25 Jun 2025 08:05:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344EC20C00D;
	Wed, 25 Jun 2025 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838755; cv=none; b=QurGGmxgfMfOZqx1D6DQJwZix1nu+ZcGm2PilHdG07D2eWPlg+walUsInxKMU5rpnXXwsjB16bxrnUGM7rYPbKk5WGlLUZ23y2HlToqhrO8MtphricTO0Zne31b7/p6AKhYx5yTlFTQ5e7+sr2wcruhRl/kWlckp7D7q9XWSV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838755; c=relaxed/simple;
	bh=2AaSwKeJlREZQ0QdQ9V28fltYFJbr9J+NOb+r+k1lGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4BpSIA6SLRJHFpCStR1aduHv9aSwCXYYJFQ2d50ScvU21SyephyWOilz3rb2EhsKk9+z7vvj5KCtcGno2t9gXtYI7qB7Hr94YN0cclmva+pr9q0o9gVP78WBkvWH0KLCSG5Q+LfHgAPj7JtSOe8LI4gbloHw19OqsLRulJCXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C111C4CEEE;
	Wed, 25 Jun 2025 08:05:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] gpio: rcar: Remove checks for empty bankmasks
Date: Wed, 25 Jun 2025 10:05:46 +0200
Message-ID: <29fb200d3f92e79cdd5ce4048d2847c265f337b4.1750838486.git.geert+renesas@glider.be>
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

The GPIO core never passes empty bankmasks to the callbacks for handling
multiple signals at once.  Remove the superfluous checks, and refactor
the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/gpio/gpio-rcar.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 18c965ee02c8d368..8416e0430887bd5e 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -331,14 +331,11 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
 static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 				  unsigned long *bits)
 {
+	u32 bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
-	u32 bankmask, outputs, m, val = 0;
+	u32 outputs, m, val = 0;
 	unsigned long flags;
 
-	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
-	if (!bankmask)
-		return 0;
-
 	if (p->info.has_always_in) {
 		bits[0] = gpio_rcar_read(p, INDT) & bankmask;
 		return 0;
@@ -372,13 +369,10 @@ static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
 static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 				   unsigned long *bits)
 {
+	u32 bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
-	u32 val, bankmask;
-
-	bankmask = mask[0] & GENMASK(chip->ngpio - 1, 0);
-	if (!bankmask)
-		return;
+	u32 val;
 
 	raw_spin_lock_irqsave(&p->lock, flags);
 	val = gpio_rcar_read(p, OUTDT);
-- 
2.43.0


