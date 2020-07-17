Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3832230C2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 03:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgGQBtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 21:49:33 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:38796 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgGQBtU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 21:49:20 -0400
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id 97FFACA856;
        Fri, 17 Jul 2020 09:49:12 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P17843T139819799787264S1594950550837667_;
        Fri, 17 Jul 2020 09:49:12 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f4a8f6afb7330e815421503c4fffe68f>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
        david.wu@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 01/13] pinctrl: rockchip: add nr_pins to rockchip_pin_ctrl
Date:   Fri, 17 Jul 2020 09:48:56 +0800
Message-Id: <20200717014908.13914-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717014908.13914-1-jay.xu@rock-chips.com>
References: <20200717014908.13914-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add nr_pins to rockchip_pin_ctrl by hand, instead of calculating during
driver probe. This patch is prepare work for making rockchip_pin_ctrl to
be const type.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c07324d1f265..bc465da68f26 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3573,6 +3573,7 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
+	u32 nr_pins;
 
 	match = of_match_node(rockchip_pinctrl_dt_match, node);
 	ctrl = (struct rockchip_pin_ctrl *)match->data;
@@ -3599,13 +3600,14 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	drv_pmu_offs = ctrl->pmu_drv_offset;
 	drv_grf_offs = ctrl->grf_drv_offset;
 	bank = ctrl->pin_banks;
+	nr_pins = 0;
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		int bank_pins = 0;
 
 		raw_spin_lock_init(&bank->slock);
 		bank->drvdata = d;
-		bank->pin_base = ctrl->nr_pins;
-		ctrl->nr_pins += bank->nr_pins;
+		bank->pin_base = nr_pins;
+		nr_pins += bank->nr_pins;
 
 		/* calculate iomux and drv offsets */
 		for (j = 0; j < 4; j++) {
@@ -3692,6 +3694,8 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 		}
 	}
 
+	WARN_ON(nr_pins != ctrl->nr_pins);
+
 	return ctrl;
 }
 
@@ -3852,6 +3856,7 @@ static struct rockchip_pin_bank px30_pin_banks[] = {
 static struct rockchip_pin_ctrl px30_pin_ctrl = {
 		.pin_banks		= px30_pin_banks,
 		.nr_banks		= ARRAY_SIZE(px30_pin_banks),
+		.nr_pins		= 128,
 		.label			= "PX30-GPIO",
 		.type			= PX30,
 		.grf_mux_offset		= 0x0,
@@ -3876,6 +3881,7 @@ static struct rockchip_pin_bank rv1108_pin_banks[] = {
 static struct rockchip_pin_ctrl rv1108_pin_ctrl = {
 	.pin_banks		= rv1108_pin_banks,
 	.nr_banks		= ARRAY_SIZE(rv1108_pin_banks),
+	.nr_pins		= 128,
 	.label			= "RV1108-GPIO",
 	.type			= RV1108,
 	.grf_mux_offset		= 0x10,
@@ -3897,6 +3903,7 @@ static struct rockchip_pin_bank rk2928_pin_banks[] = {
 static struct rockchip_pin_ctrl rk2928_pin_ctrl = {
 		.pin_banks		= rk2928_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk2928_pin_banks),
+		.nr_pins		= 128,
 		.label			= "RK2928-GPIO",
 		.type			= RK2928,
 		.grf_mux_offset		= 0xa8,
@@ -3912,6 +3919,7 @@ static struct rockchip_pin_bank rk3036_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3036_pin_ctrl = {
 		.pin_banks		= rk3036_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3036_pin_banks),
+		.nr_pins		= 96,
 		.label			= "RK3036-GPIO",
 		.type			= RK2928,
 		.grf_mux_offset		= 0xa8,
@@ -3930,6 +3938,7 @@ static struct rockchip_pin_bank rk3066a_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3066a_pin_ctrl = {
 		.pin_banks		= rk3066a_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3066a_pin_banks),
+		.nr_pins		= 176,
 		.label			= "RK3066a-GPIO",
 		.type			= RK2928,
 		.grf_mux_offset		= 0xa8,
@@ -3946,6 +3955,7 @@ static struct rockchip_pin_bank rk3066b_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3066b_pin_ctrl = {
 		.pin_banks	= rk3066b_pin_banks,
 		.nr_banks	= ARRAY_SIZE(rk3066b_pin_banks),
+		.nr_pins	= 128,
 		.label		= "RK3066b-GPIO",
 		.type		= RK3066B,
 		.grf_mux_offset	= 0x60,
@@ -3961,6 +3971,7 @@ static struct rockchip_pin_bank rk3128_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3128_pin_ctrl = {
 		.pin_banks		= rk3128_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3128_pin_banks),
+		.nr_pins		= 128,
 		.label			= "RK3128-GPIO",
 		.type			= RK3128,
 		.grf_mux_offset		= 0xa8,
@@ -3981,6 +3992,7 @@ static struct rockchip_pin_bank rk3188_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3188_pin_ctrl = {
 		.pin_banks		= rk3188_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3188_pin_banks),
+		.nr_pins		= 128,
 		.label			= "RK3188-GPIO",
 		.type			= RK3188,
 		.grf_mux_offset		= 0x60,
@@ -3999,6 +4011,7 @@ static struct rockchip_pin_bank rk3228_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3228_pin_ctrl = {
 		.pin_banks		= rk3228_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3228_pin_banks),
+		.nr_pins		= 128,
 		.label			= "RK3228-GPIO",
 		.type			= RK3288,
 		.grf_mux_offset		= 0x0,
@@ -4043,6 +4056,7 @@ static struct rockchip_pin_bank rk3288_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
 		.pin_banks		= rk3288_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3288_pin_banks),
+		.nr_pins		= 264,
 		.label			= "RK3288-GPIO",
 		.type			= RK3288,
 		.grf_mux_offset		= 0x0,
@@ -4079,6 +4093,7 @@ static struct rockchip_pin_bank rk3308_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
 		.pin_banks		= rk3308_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
+		.nr_pins		= 160,
 		.label			= "RK3308-GPIO",
 		.type			= RK3308,
 		.grf_mux_offset		= 0x0,
@@ -4108,6 +4123,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
 		.pin_banks		= rk3328_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
+		.nr_pins		= 128,
 		.label			= "RK3328-GPIO",
 		.type			= RK3288,
 		.grf_mux_offset		= 0x0,
@@ -4134,6 +4150,7 @@ static struct rockchip_pin_bank rk3368_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3368_pin_ctrl = {
 		.pin_banks		= rk3368_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3368_pin_banks),
+		.nr_pins		= 128,
 		.label			= "RK3368-GPIO",
 		.type			= RK3368,
 		.grf_mux_offset		= 0x0,
@@ -4198,6 +4215,7 @@ static struct rockchip_pin_bank rk3399_pin_banks[] = {
 static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.pin_banks		= rk3399_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3399_pin_banks),
+		.nr_pins		= 160,
 		.label			= "RK3399-GPIO",
 		.type			= RK3399,
 		.grf_mux_offset		= 0xe000,
-- 
2.17.1



