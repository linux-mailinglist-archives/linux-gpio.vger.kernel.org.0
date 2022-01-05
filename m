Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1253485749
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 18:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242326AbiAERao (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 12:30:44 -0500
Received: from foss.arm.com ([217.140.110.172]:46202 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242271AbiAERaW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Jan 2022 12:30:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C583811D4;
        Wed,  5 Jan 2022 09:30:20 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E663F774;
        Wed,  5 Jan 2022 09:30:19 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        SASANO Takayoshi <uaa@mx5.nisiq.net>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH] pinctrl: sunxi: Fix H616 I2S3 pin data
Date:   Wed,  5 Jan 2022 17:29:52 +0000
Message-Id: <20220105172952.23347-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Two bugs have sneaked in the H616 pinctrl data:
- PH9 uses the mux value of 0x3 twice (one should be 0x5 instead)
- PH8 and PH9 use the "i2s3" function name twice in each pin

For the double pin name we use the same trick we pulled for i2s0: append
the pin function to the group name to designate the special function.

Fixes: 25adc29407fb ("pinctrl: sunxi: Add support for the Allwinner H616 pin controller")
Reported-by: SASANO Takayoshi <uaa@mx5.nisiq.net>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
index ce1917e230f4..152b71226a80 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
@@ -363,16 +363,16 @@ static const struct sunxi_desc_pin h616_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
-		  SUNXI_FUNCTION(0x3, "i2s3"),	/* DO0 */
+		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DO0 */
 		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
-		  SUNXI_FUNCTION(0x5, "i2s3"),	/* DI1 */
+		  SUNXI_FUNCTION(0x5, "i2s3_din1"),	/* DI1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 8)),	/* PH_EINT8 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x3, "i2s3"),	/* DI0 */
+		  SUNXI_FUNCTION(0x3, "i2s3_din0"),	/* DI0 */
 		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS1 */
-		  SUNXI_FUNCTION(0x3, "i2s3"),	/* DO1 */
+		  SUNXI_FUNCTION(0x5, "i2s3_dout1"),	/* DO1 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),	/* PH_EINT9 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.17.6

