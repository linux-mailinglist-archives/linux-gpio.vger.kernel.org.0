Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA63051AB9A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 May 2022 19:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357174AbiEDRsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 May 2022 13:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359639AbiEDRo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 13:44:28 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD33F532C0
        for <linux-gpio@vger.kernel.org>; Wed,  4 May 2022 10:07:42 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8C411FB;
        Wed,  4 May 2022 10:07:42 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C76E3FA27;
        Wed,  4 May 2022 10:07:41 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     writeforever@foxmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] pinctrl: sunxi: f1c100s: Fix signal name comment for PA2 SPI pin
Date:   Wed,  4 May 2022 18:07:36 +0100
Message-Id: <20220504170736.2669595-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The manual describes function 0x6 of pin PA2 as "SPI1_CLK", so change
the comment to reflect that.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c b/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
index 2801ca7062732..8109efac341e2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
@@ -51,7 +51,7 @@ static const struct sunxi_desc_pin suniv_f1c100s_pins[] = {
 		  SUNXI_FUNCTION(0x3, "pwm0"),		/* PWM0 */
 		  SUNXI_FUNCTION(0x4, "i2s"),		/* IN */
 		  SUNXI_FUNCTION(0x5, "uart1"),		/* RX */
-		  SUNXI_FUNCTION(0x6, "spi1")),		/* MOSI */
+		  SUNXI_FUNCTION(0x6, "spi1")),		/* CLK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-- 
2.25.1

