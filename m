Return-Path: <linux-gpio+bounces-22710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F50AF72B0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0683B3AE497
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68E52E49AF;
	Thu,  3 Jul 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfrcAsuA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD52E613D;
	Thu,  3 Jul 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542336; cv=none; b=hqJKpc/jpTL3IZ7hDqw8rTyqqtzVwADLvZAMjE2wX7lAP9eZi9TYAguandkUT6Nr6yxQg9EUCiXWNLxr9tov7LBwlTccNiF6gMLvax1y7eVoNJVy20xIcagrJPSOj5VhFEj4rMbo0S9hqC7CtscGGOJaZoKJn6s/z7BwxUHlhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542336; c=relaxed/simple;
	bh=ocZ2re+U8WMMPhbIQruoOerVGVWD9zswfN8MaVgrtsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QJiFJn52gk5anA+x411uWLFXlXAGTZP2gp3aX9Eh1IaKW2li1LZ5zUT3O16KMVrw/K/jX9ISLCzMCjmNZzZ8kCNOk4Snr9EDiD4TYQIABVzj7T1TeO71SsWPosHSVFXcAp37XFgHoPWHqMZLkpNxYzMyPCbmJSoC9dpwfHBWVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfrcAsuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83B3C4CEEB;
	Thu,  3 Jul 2025 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542336;
	bh=ocZ2re+U8WMMPhbIQruoOerVGVWD9zswfN8MaVgrtsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfrcAsuAm1T3UitJSL59FM/jrpWNoGNlX4VcvaZbWpDezqD711D8b9kxQhQ/PZsQl
	 JizuUdnhoMMeb+wr4g9ew9wQD7MM3rMxI6DZpF7VK6F1aREXTkIyywJe536MXEjCVv
	 AJeLbToY+AJHUQh4ImAwQiboa71ZrYKNS4043qIcCj3mgKpCYXJL6ZDr1KnQe+9Zng
	 qtHuNTnWIhv9Q+q5XrVEfPcpzXh5q2B1O5fIcIhxFjBuOAV3DHAX4MrAAhBj5yVOJe
	 rQ5RFQYs7InbL6TyPTzGfK0MTkSa1f685MkhqvsUr2ermql7Qy3b2lIKVe4CA/n7k0
	 LpYhdPagTyOIw==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 4/8] pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
Date: Thu,  3 Jul 2025 13:31:49 +0200
Message-Id: <20250703113153.2447110-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS652G1 is a stripped down version of the TPS65224. Compared to the
TPS65224 it lacks some pin mux functions, like the ADC, voltage
monitoring and the second I2C bus.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-tps6594.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 54cc810f79d6..6726853110d1 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -226,6 +226,10 @@ static const char *const tps65224_nerr_mcu_func_group_names[] = {
 	"GPIO5",
 };
 
+static const char *const tps652g1_cs_spi_func_group_names[] = {
+	"GPIO1",
+};
+
 struct tps6594_pinctrl_function {
 	struct pinfunction pinfunction;
 	u8 muxval;
@@ -287,6 +291,18 @@ static const struct tps6594_pinctrl_function tps65224_pinctrl_functions[] = {
 	FUNCTION(tps65224, nerr_mcu, TPS65224_PINCTRL_NERR_MCU_FUNCTION),
 };
 
+static const struct tps6594_pinctrl_function tps652g1_pinctrl_functions[] = {
+	FUNCTION(tps65224, gpio, TPS6594_PINCTRL_GPIO_FUNCTION),
+	FUNCTION(tps65224, sda_i2c2_sdo_spi, TPS65224_PINCTRL_SDA_I2C2_SDO_SPI_FUNCTION),
+	FUNCTION(tps65224, nsleep2, TPS65224_PINCTRL_NSLEEP2_FUNCTION),
+	FUNCTION(tps65224, nint, TPS65224_PINCTRL_NINT_FUNCTION),
+	FUNCTION(tps652g1, cs_spi, TPS65224_PINCTRL_SCL_I2C2_CS_SPI_FUNCTION),
+	FUNCTION(tps65224, nsleep1, TPS65224_PINCTRL_NSLEEP1_FUNCTION),
+	FUNCTION(tps65224, pb, TPS65224_PINCTRL_PB_FUNCTION),
+	FUNCTION(tps65224, wkup, TPS65224_PINCTRL_WKUP_FUNCTION),
+	FUNCTION(tps65224, syncclkin, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION),
+};
+
 struct tps6594_pinctrl {
 	struct tps6594 *tps;
 	struct gpio_regmap *gpio_regmap;
@@ -300,6 +316,16 @@ struct tps6594_pinctrl {
 	struct muxval_remap *remap;
 };
 
+static struct tps6594_pinctrl tps652g1_template_pinctrl = {
+	.funcs = tps652g1_pinctrl_functions,
+	.func_cnt = ARRAY_SIZE(tps652g1_pinctrl_functions),
+	.pins = tps65224_pins,
+	.num_pins = ARRAY_SIZE(tps65224_pins),
+	.mux_sel_mask = TPS65224_MASK_GPIO_SEL,
+	.remap = tps65224_muxval_remap,
+	.remap_cnt = ARRAY_SIZE(tps65224_muxval_remap),
+};
+
 static struct tps6594_pinctrl tps65224_template_pinctrl = {
 	.funcs = tps65224_pinctrl_functions,
 	.func_cnt = ARRAY_SIZE(tps65224_pinctrl_functions),
@@ -475,6 +501,15 @@ static int tps6594_pinctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	switch (tps->chip_id) {
+	case TPS652G1:
+		pctrl_desc->pins = tps65224_pins;
+		pctrl_desc->npins = ARRAY_SIZE(tps65224_pins);
+
+		*pinctrl = tps652g1_template_pinctrl;
+
+		config.ngpio = ARRAY_SIZE(tps65224_gpio_func_group_names);
+		config.ngpio_per_reg = TPS65224_NGPIO_PER_REG;
+		break;
 	case TPS65224:
 		pctrl_desc->pins = tps65224_pins;
 		pctrl_desc->npins = ARRAY_SIZE(tps65224_pins);
-- 
2.39.5


