Return-Path: <linux-gpio+bounces-21530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BFAD8B3A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE76166857
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AA42E763A;
	Fri, 13 Jun 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itWIbPsM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3202E6D1C;
	Fri, 13 Jun 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815140; cv=none; b=dehvJ23NPsYcwo4RQZ/jJA/AYYN8qAE5ag9UKB0GebeJ9GO11pZFMoWwCnu1Z/Mnxsjh/6dNUFae7qGGVLkhzjftMZAwykEwQh/avSDPuawEhAWBThWkY3FUGUsvdTuRb783WDFgsInBGBwDkcnVjpy2chvyC1Wk56R6Ocx1x7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815140; c=relaxed/simple;
	bh=CgXQt18/fwfG+U7n7eKXWqZxA7sWPstObh3sA0/OouM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o6jYQLPekn+s/B4I78o5Li8mMcJ5yYKlSd9b6eiqocSbMX8XSjVwcjhA7xUAv69sBJJcr1uQIeaOxVKBOdbqLiVhDIaRbZZTkVm4HafirXEZy/8FBB8/tH7/WvHlPU+fVs3ziEdyS9dvhMguUMvIHwaXullJMTD8gLFHlpInh1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itWIbPsM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEDDC4CEE3;
	Fri, 13 Jun 2025 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815140;
	bh=CgXQt18/fwfG+U7n7eKXWqZxA7sWPstObh3sA0/OouM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=itWIbPsM03VtKz48qNHPngscvRk0c0NugoSx7BCIAP74dEfzR0jFlPRKMCk39B9hz
	 lVZcrGIZGaA9xF6Ok9NwbyqtMactMQTd+jLiIOrN6HNQ+R/E1RMK9BWgvruFuzw2xV
	 LBkxtDAuDPrJK5oVeby0D8bKrXKTXbVcfb1e/fYrbYZJRwtJ6ayZpGmBFwdyf/Dva0
	 iAycZ0OzepJcaXWDD0CKJY57b48unLIpIO7KwVNvrmfALs2zveEEHjg0fCDKgHgvmJ
	 rPnEetAm/dcvx5l+WgUA+eMM6KxrsXznNkOTkHRf8GBzeBCKvFRNzcQFf7Xc7PAx5C
	 6uSZKg1OuNFhw==
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
Subject: [PATCH v2 3/7] pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
Date: Fri, 13 Jun 2025 13:45:14 +0200
Message-Id: <20250613114518.1772109-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>
References: <20250613114518.1772109-1-mwalle@kernel.org>
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


