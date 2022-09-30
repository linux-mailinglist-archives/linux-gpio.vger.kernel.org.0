Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5265F0C53
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 15:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbiI3NU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 09:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiI3NUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 09:20:55 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68ABE107599;
        Fri, 30 Sep 2022 06:20:53 -0700 (PDT)
Received: (Authenticated sender: foss@0leil.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 44FCC2000C;
        Fri, 30 Sep 2022 13:20:49 +0000 (UTC)
From:   Quentin Schulz <foss+kernel@0leil.net>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
        jay.xu@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        foss+kernel@0leil.net,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 1/2] pinctrl: rockchip: add pinmux_ops.gpio_set_direction callback
Date:   Fri, 30 Sep 2022 15:20:32 +0200
Message-Id: <20220930132033.4003377-2-foss+kernel@0leil.net>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930132033.4003377-1-foss+kernel@0leil.net>
References: <20220930132033.4003377-1-foss+kernel@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Before the split of gpio and pinctrl sections in their own driver,
rockchip_set_mux was called in pinmux_ops.gpio_set_direction for
configuring a pin in its GPIO function.

This is essential for cases where pinctrl is "bypassed" by gpio
consumers otherwise the GPIO function is not configured for the pin and
it does not work. Such was the case for the sysfs/libgpiod userspace
GPIO handling.

Let's re-implement the pinmux_ops.gpio_set_direction callback so that
the gpio subsystem can request from the pinctrl driver to put the pin in
its GPIO function.

Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
Cc: stable@vger.kernel.org
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v2:
 - added Reviewed-by,

 drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 32e41395fc768..c84bd0e1ce5a6 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2393,11 +2393,24 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
+static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
+					   struct pinctrl_gpio_range *range,
+					   unsigned offset,
+					   bool input)
+{
+	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
+	struct rockchip_pin_bank *bank;
+
+	bank = pin_to_bank(info, offset);
+	return rockchip_set_mux(bank, offset - bank->pin_base, RK_FUNC_GPIO);
+}
+
 static const struct pinmux_ops rockchip_pmx_ops = {
 	.get_functions_count	= rockchip_pmx_get_funcs_count,
 	.get_function_name	= rockchip_pmx_get_func_name,
 	.get_function_groups	= rockchip_pmx_get_groups,
 	.set_mux		= rockchip_pmx_set,
+	.gpio_set_direction	= rockchip_pmx_gpio_set_direction,
 };
 
 /*
-- 
2.37.3

