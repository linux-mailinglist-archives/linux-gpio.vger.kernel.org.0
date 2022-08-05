Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4AE58AACB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 14:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237634AbiHEMW2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 08:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240661AbiHEMWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 08:22:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1247B9B
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 05:22:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7425FB82866
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 12:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6190C433D7;
        Fri,  5 Aug 2022 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659702142;
        bh=QqMenMtuuDz9IMUdXlJREV9LB27AexWX4PM5ieA0+6o=;
        h=From:To:Cc:Subject:Date:From;
        b=E8E8YwXW2mqxe/LRXEGW9zoRu8l6QVnpUuCfGhiCCtuvlW6J0Wn4wL6XKuo4q9+5l
         IRz+4I1+kXQH8h7Krnzs/tC1jGc/aI2zBw62J0Z87+vWJ9OQmNm9iKz66RuA0U6i35
         szCCBAc5HxwRZufI9Ty2Tx6sWwk6QZmwDPcVAs/ifGHv5S0jxgvBXpQkWTWa2LI3m4
         gRkyyc39YrvMZvE6cev3ZuDz0yYJRau+tMYmStyR/H49Fa/Bw5tnEAeKOgATRGaxg8
         8+GEFvFSl0CJfqZfAgUyl39HXsrYDMNR6yIB8O7lyA0uqFM+emIUPFSKdz45T3Btsz
         zhhC9VH1e6MQw==
Received: by pali.im (Postfix)
        id 1B91E82D; Fri,  5 Aug 2022 14:22:19 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/4] pinctrl: armada-37xx: Add missing GPIO-only pins
Date:   Fri,  5 Aug 2022 14:21:59 +0200
Message-Id: <20220805122202.23174-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpio1_5 and gpio2_2 are GPIO-only pins. Add them into MPP groups table
so they are properly exported as valid pin numbers.

Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index a140b6bfbfaa..2b44c634ccb5 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -122,6 +122,16 @@ struct armada_37xx_pinctrl {
 		.funcs = {_func1, _func2}	\
 	}
 
+#define PIN_GRP_GPIO_0(_name, _start, _nr)	\
+	{					\
+		.name = _name,			\
+		.start_pin = _start,		\
+		.npins = _nr,			\
+		.reg_mask = 0,			\
+		.val = {0},			\
+		.funcs = {"gpio"}		\
+	}
+
 #define PIN_GRP_GPIO(_name, _start, _nr, _mask, _func1)	\
 	{					\
 		.name = _name,			\
@@ -179,6 +189,7 @@ static struct armada_37xx_pin_group armada_37xx_nb_groups[] = {
 		       "pwm", "led"),
 	PIN_GRP_GPIO("pmic1", 7, 1, BIT(7), "pmic"),
 	PIN_GRP_GPIO("pmic0", 6, 1, BIT(8), "pmic"),
+	PIN_GRP_GPIO_0("gpio1_5", 5, 1),
 	PIN_GRP_GPIO("i2c2", 2, 2, BIT(9), "i2c"),
 	PIN_GRP_GPIO("i2c1", 0, 2, BIT(10), "i2c"),
 	PIN_GRP_GPIO("spi_cs1", 17, 1, BIT(12), "spi"),
@@ -195,6 +206,7 @@ static struct armada_37xx_pin_group armada_37xx_nb_groups[] = {
 static struct armada_37xx_pin_group armada_37xx_sb_groups[] = {
 	PIN_GRP_GPIO("usb32_drvvbus0", 0, 1, BIT(0), "drvbus"),
 	PIN_GRP_GPIO("usb2_drvvbus1", 1, 1, BIT(1), "drvbus"),
+	PIN_GRP_GPIO_0("gpio2_2", 2, 1),
 	PIN_GRP_GPIO("sdio_sb", 24, 6, BIT(2), "sdio"),
 	PIN_GRP_GPIO("rgmii", 6, 12, BIT(3), "mii"),
 	PIN_GRP_GPIO("smi", 18, 2, BIT(4), "smi"),
-- 
2.20.1

