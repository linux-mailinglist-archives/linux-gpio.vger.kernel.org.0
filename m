Return-Path: <linux-gpio+bounces-3192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 283068515C3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 14:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91B6F1F21959
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 13:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1BC3D966;
	Mon, 12 Feb 2024 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DawKnAGW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C15E3D549;
	Mon, 12 Feb 2024 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745479; cv=none; b=kp8G6oZl23FWmdt34dBTMEq/dJiJZzoqo+HfEgnzJcymznA6LCW6hvE8Yjn/f+olL+fNvTLF0cw5trwOZiHj41Pj0cDv0jnGCioAg9Es+rfCxCgq1zFkWGZqEW0wfJp6/AyDKtdQcNZ5lCAGIgRY5p3E+SDbbrjaVWhxgZQDgqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745479; c=relaxed/simple;
	bh=YIEKqK5MI7C6wgG1cBeAfL6H69SH6ljkSO16YrF7vPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQiw0lfs62VVIzpDI5GcRrKZEQSyW97tZSj6US0XbBkP+JoniAq5SmS6UL/h3Lsxu95sZD3YLRGMB93j+WqFkoKDSShMyCd2PJy6PskEqcXgBYfkfwLDgCYXEzahR3mLxFSefZWCAjYTACPAAgOgmgNvE40cSxF34CLbQdiQFiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DawKnAGW; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ECEDFF802;
	Mon, 12 Feb 2024 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707745475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pM6whmgyRwSqq5DhU05BK7t5rD5rPlWu1apIXMRZECI=;
	b=DawKnAGWiKXF0FSl4Sd28dy7tSWbsS9R1KLVoe+V4yFPbSIP8wOP3BE3bT64jf6cqe1jlf
	8xsTa/OKgwb7eq2PqqByT8w3gmCtaBgG9a6PTV3GZfGu/gIWBMmY1uiM/sITT86ZIUdTsx
	7LF/DYVEUUdLS/qM8l8LHPpT8IbtMGqBUv5s/+XieiCt0bf7/NEwcFrloOxhMAwYHhYKcA
	CVLe8sEHuNjkHT32aArX8gjbCsHC9HtonUl9aIxhbYQ57h47zfQPWW9NMvaZnnw5FvYn4M
	9WT95vBiJVcgxK4CEELa4OVs6CCW7yZkrJpmMSvJugWqrigDRBCN3vmLB22aJg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 12 Feb 2024 14:44:32 +0100
Subject: [PATCH v6 01/13] clk: fixed-factor: add optional accuracy support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240212-mbly-clk-v6-1-c46fa1f93839@bootlin.com>
References: <20240212-mbly-clk-v6-0-c46fa1f93839@bootlin.com>
In-Reply-To: <20240212-mbly-clk-v6-0-c46fa1f93839@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Fixed factor clock reports the parent clock accuracy. Add flags and acc
fields to `struct clk_fixed_factor` to support setting a fixed
accuracy. The default if no flag is set is not changed: use the parent
clock accuracy.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-fixed-factor.c | 28 +++++++++++++++++++++-------
 include/linux/clk-provider.h   | 12 +++++++++++-
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index b3e66202b942..bc2644a9bd7d 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -57,10 +57,22 @@ static int clk_factor_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+static unsigned long clk_factor_recalc_accuracy(struct clk_hw *hw,
+						unsigned long parent_accuracy)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (fix->flags & CLK_FIXED_FACTOR_FIXED_ACCURACY)
+		return fix->acc;
+
+	return parent_accuracy;
+}
+
 const struct clk_ops clk_fixed_factor_ops = {
 	.round_rate = clk_factor_round_rate,
 	.set_rate = clk_factor_set_rate,
 	.recalc_rate = clk_factor_recalc_rate,
+	.recalc_accuracy = clk_factor_recalc_accuracy,
 };
 EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
@@ -81,7 +93,7 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name,
 		const struct clk_hw *parent_hw, int index,
 		unsigned long flags, unsigned int mult, unsigned int div,
-		bool devm)
+		unsigned long acc, unsigned int fixflags, bool devm)
 {
 	struct clk_fixed_factor *fix;
 	struct clk_init_data init = { };
@@ -105,6 +117,8 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	fix->mult = mult;
 	fix->div = div;
 	fix->hw.init = &init;
+	fix->acc = acc;
+	fix->flags = fixflags;
 
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
@@ -152,7 +166,7 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
 		unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL, index,
-					      flags, mult, div, true);
+					      flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
 
@@ -174,7 +188,7 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
-					      -1, flags, mult, div, true);
+					      -1, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
 
@@ -184,7 +198,7 @@ struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL,
 					      parent_hw, -1, flags, mult, div,
-					      false);
+					      0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
 
@@ -193,7 +207,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL, -1,
-					      flags, mult, div, false);
+					      flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
@@ -240,7 +254,7 @@ struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
 		unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL, -1,
-			flags, mult, div, true);
+			flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
 
@@ -267,7 +281,7 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
 	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, NULL, 0,
-					    0, mult, div, false);
+					    0, mult, div, 0, 0, false);
 	if (IS_ERR(hw)) {
 		/*
 		 * Clear OF_POPULATED flag so that clock registration can be
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1293c38ddb7f..7ddc952c8c67 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1084,18 +1084,28 @@ void of_fixed_factor_clk_setup(struct device_node *node);
  * @hw:		handle between common and hardware-specific interfaces
  * @mult:	multiplier
  * @div:	divider
+ * @acc:	fixed accuracy in ppb
+ * @flags:	behavior modifying flags
  *
  * Clock with a fixed multiplier and divider. The output frequency is the
  * parent clock rate divided by div and multiplied by mult.
- * Implements .recalc_rate, .set_rate and .round_rate
+ * Implements .recalc_rate, .set_rate, .round_rate and .recalc_accuracy
+ *
+ * Flags:
+ * * CLK_FIXED_FACTOR_FIXED_ACCURACY - Use the value in @acc instead of the
+ *                                     parent clk accuracy.
  */
 
 struct clk_fixed_factor {
 	struct clk_hw	hw;
 	unsigned int	mult;
 	unsigned int	div;
+	unsigned long	acc;
+	unsigned int	flags;
 };
 
+#define CLK_FIXED_FACTOR_FIXED_ACCURACY	BIT(0)
+
 #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor, hw)
 
 extern const struct clk_ops clk_fixed_factor_ops;

-- 
2.43.0


