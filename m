Return-Path: <linux-gpio+bounces-4842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45018891733
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 11:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C903D287CC5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 10:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8747EF16;
	Fri, 29 Mar 2024 10:56:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7600F6A8CA
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711709810; cv=none; b=dugboouStikMMU4NpoxniN75+J9r38TWYf/IowIE/rBKv2dE5VAnKsDQimvfq4d4zXgalQnv/JK8oSd13gMPntO7X78YNW9VPXPLxWDnfL+yl5ndtqMwVVTdiXe/2Yev12Su+slW5e0No3hNT5pU+eQB7EG3fx0y+yG6xLEB0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711709810; c=relaxed/simple;
	bh=k82nFsDevwArKZdemO6rENI1k+BpJTfP0Xv1r08V0KM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxTW1zPniM4vBC8qt5QtWTm+lw+doPpNOlqW6w+VIxdhYE+4JTp/XUZ1JH6ZORKags9yEynK6exhOS3BejbZoqrPt9zzWEdCetRI6eBeNk1B2zLQnX2at4iz7yoSdutzLSki9L3cQ32xsTc41fhZrsoyzAq/A3S7D8ba7c9FP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 08621d3e-edbb-11ee-b972-005056bdfda7;
	Fri, 29 Mar 2024 12:56:45 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] pinctrl: aw9523: Fix indentation in a few places
Date: Fri, 29 Mar 2024 12:55:24 +0200
Message-ID: <20240329105634.712457-11-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329105634.712457-1-andy.shevchenko@gmail.com>
References: <20240329105634.712457-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the comment, function prototype, and array of strings indentation
is kinda broken. Reindent that.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 49d5035899227..b5e1c467625ba 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Awinic AW9523B i2c pin controller driver
- * Copyright (c) 2020, AngeloGioacchino Del Regno
- *                     <angelogioacchino.delregno@somainline.org>
+ * Copyright (c) 2020, AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
  */
 
 #include <linux/bitfield.h>
@@ -139,9 +138,10 @@ static const struct pinctrl_ops aw9523_pinctrl_ops = {
 };
 
 static const char * const gpio_pwm_groups[] = {
-	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
-	"gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11",
-	"gpio12", "gpio13", "gpio14", "gpio15"
+	"gpio0", "gpio1", "gpio2", "gpio3",		/* 0-3 */
+	"gpio4", "gpio5", "gpio6", "gpio7",		/* 4-7 */
+	"gpio8", "gpio9", "gpio10", "gpio11",		/* 8-11 */
+	"gpio12", "gpio13", "gpio14", "gpio15",		/* 11-15 */
 };
 
 /* Warning: Do NOT reorder this array */
@@ -388,8 +388,8 @@ static int aw9523_get_pin_direction(struct regmap *regmap, u8 pin, u8 n)
  *
  * Return: Zero for success or negative number for error
  */
-static int aw9523_get_port_state(struct regmap *regmap, u8 pin,
-				   u8 regbit, unsigned int *state)
+static int aw9523_get_port_state(struct regmap *regmap, u8 pin, u8 regbit,
+				 unsigned int *state)
 {
 	u8 reg;
 	int dir;
@@ -984,8 +984,7 @@ static int aw9523_probe(struct i2c_client *client)
 	}
 
 	mutex_init(&awi->i2c_lock);
-	lockdep_set_subclass(&awi->i2c_lock,
-			     i2c_adapter_depth(client->adapter));
+	lockdep_set_subclass(&awi->i2c_lock, i2c_adapter_depth(client->adapter));
 
 	pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
 	if (!pdesc)
-- 
2.44.0


