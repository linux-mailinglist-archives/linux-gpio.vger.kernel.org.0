Return-Path: <linux-gpio+bounces-22895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3084EAFB92C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 18:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64428424816
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AE5235072;
	Mon,  7 Jul 2025 16:53:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CBA230BC9;
	Mon,  7 Jul 2025 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907221; cv=none; b=lNE3H5qab+1IUdV24XSb29wWc7505heed0TQdxb9YZkd5XCoxFYDiG6TqpVtj8gre7HGeohVJ4Cs8yzXUHSY3uiaHB7zlrVFE1d5TVJL8yDOakQKcNDyHSNenmQMWfMtsPvTzYz8G2IbPAvj3esL2DOW/QZZh+vTWkpA3HsE+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907221; c=relaxed/simple;
	bh=fyzQhFsUd32Xtyioz+AW/2SgTMkJKNT0SjViBBy68L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dgb/JcSAXSNMfAPtM4v0Z5vbPKxkqvw9t8R5mZGbE3uQIu4TLzX8HESH38305T7ma+reCy6QlrAomKnSUzOxt6E3XQNWmw521GLv60tCBHUJx+uCh5DDZtSpRt/sC2C6yrzU9XYcxrDM7vdpMKUucrUf0KGDcWAwVJXw3+xMONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D6D911F00036;
	Mon,  7 Jul 2025 16:53:36 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6D66FACAEF2; Mon,  7 Jul 2025 16:53:36 +0000 (UTC)
X-Spam-Level: **
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id CF175ACAEE1;
	Mon,  7 Jul 2025 16:52:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 1/4] Revert "pinctrl: sunxi: Fix a100 emac pin function name"
Date: Mon,  7 Jul 2025 18:51:52 +0200
Message-ID: <20250707165155.581579-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the A100/A133 chips only expose a single EMAC, the sun50iw10 die
that they share actually has two such controllers.

One specific package, the T509 is reported to expose both ports.

Since we want to keep the pinctrl function names unique accross
packages of the same die to share a single common base dtsi, keep the
emac0 naming in order to allow the introduction of the emac1 function
in the future.

Note that the original commit also breaks the ABI between the driver
and the device-tree. It's however unlikely that anybody would have
complained about that since the a100/a133 port is still very early
and experimental.

Fixes: d4775ba60b55 ("pinctrl: sunxi: Fix a100 emac pin function name")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
index 95b764ee1c0d..b97de80ae2f3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
@@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
 		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
 		  SUNXI_FUNCTION(0x4, "ledc"),
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
 		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
 		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
 		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
 		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
 		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
 		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
 		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
 		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
-		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
+		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.49.0


