Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252D21752C2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 05:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgCBElu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Mar 2020 23:41:50 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34859 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgCBElu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Mar 2020 23:41:50 -0500
Received: by mail-lf1-f66.google.com with SMTP id z9so6867419lfa.2;
        Sun, 01 Mar 2020 20:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=X78AH+SC4vyZaSDTb7riG4sKOhmRpMdZuSdK+sywT7U=;
        b=WdNxjeTigTp4M4VR52JFLZfqwLLgCAvENEx1BlGgwW9qU7GkMlofvN3+HsWNPO1zDx
         GAQqFraKnW6CpbErSXtytjG4mMD0VgGU1JF8dQrgGcAXnbKc/Ay0M/sG9RTY2fmDrYgs
         P4nMrY+X0Oh1zr1kUnJXDVjo2nhohL9Qmjl8zemKPXAyhtdi8qeybBThKBrAeNozJVcW
         vPG6cdgUwIYh5Ve62Wrrmj48lI9YHTLbyRTw9eRBjP7yvInGLyPZWBNVs/Xum0R38BPF
         qIPOxXWj4vbESDQ3/B9jzbHrV3cMC4UyiuREO97AjLfSnx+T2C5V7NrzSpJl8U4vGqdY
         I3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X78AH+SC4vyZaSDTb7riG4sKOhmRpMdZuSdK+sywT7U=;
        b=Gv3ehxx7NYSU2yes0NxxG9gFWgqQ2o/ZtTaMydsatu4cTyu2FOqAvc/9na+dvQcFAT
         nwzekdML16dOQyoeF1erVPEQwWEQn57F7zllqZSN+MFKnpFVrgSbV4pIzhFg88Uss9py
         JWOLuxZGfMNPD0n9HdBE9KYof0BucosJoHa5J4Nlu+IHaDVrGabFa+49Cba97AwpFq3f
         r17DGqjWoWxbrCKowupzuC/ZvmF5tTkamY1zAruLzb7/AasBmUGEOgD1hYfNgWtWfRK2
         yVI3wBNEBL0339GLyYfbGQ5PwGxYNsVEzLV7NJffhj3vpkG1yufonP1rqkznyXayECzF
         q8RA==
X-Gm-Message-State: ANhLgQ1vCnMPkRoFm4kikikQV+6597Gy6sa774enop7vawUS8f32Im5J
        txMNEf6xWiT586X8gzJZKDQ=
X-Google-Smtp-Source: ADFU+vtpnNn26LCVVOuUQm0JCmHwmmHvmgnGkGOXVHKsQpgeNjvA1HNjrHeX0oGwsKIp+Xfs5oapzQ==
X-Received: by 2002:a05:6512:3191:: with SMTP id i17mr7702102lfe.33.1583124107879;
        Sun, 01 Mar 2020 20:41:47 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id g78sm9723126lfd.21.2020.03.01.20.41.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 01 Mar 2020 20:41:47 -0800 (PST)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        Igor Vavro <afl2001@gmail.com>
Subject: [PATCH] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
Date:   Mon,  2 Mar 2020 08:40:56 +0400
Message-Id: <1583124056-94785-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Igor Vavro <afl2001@gmail.com>

Add the tsin pinctrl definitions needed for integrated DVB hardware
support on Meson GXBB/GXL/GXM boards.

Signed-off-by: Igor Vavro <afl2001@gmail.com>
[updated commit message]
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 43 +++++++++++++++++++++++++++---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 27 +++++++++++++++++++
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 926b999..25325235 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -231,10 +231,24 @@ static const unsigned int hdmi_hpd_pins[]	= { GPIOH_0 };
 static const unsigned int hdmi_sda_pins[]	= { GPIOH_1 };
 static const unsigned int hdmi_scl_pins[]	= { GPIOH_2 };
 
+static const unsigned int tsin_a_d_valid_pins[] = { GPIOY_0 };
+static const unsigned int tsin_a_sop_pins[]	= { GPIOY_1 };
+static const unsigned int tsin_a_clk_pins[]	= { GPIOY_2 };
+static const unsigned int tsin_a_d0_pins[]	= { GPIOY_3 };
+static const unsigned int tsin_a_dp_pins[]	= {
+	GPIOY_4, GPIOY_5, GPIOY_6, GPIOY_7, GPIOY_8, GPIOY_9, GPIOY_10
+};
+
+static const unsigned int tsin_a_fail_pins[]	= { GPIOY_11 };
 static const unsigned int i2s_out_ch23_y_pins[]	= { GPIOY_8 };
 static const unsigned int i2s_out_ch45_y_pins[]	= { GPIOY_9 };
 static const unsigned int i2s_out_ch67_y_pins[]	= { GPIOY_10 };
 
+static const unsigned int tsin_b_d_valid_pins[] = { GPIOX_6 };
+static const unsigned int tsin_b_sop_pins[]	= { GPIOX_7 };
+static const unsigned int tsin_b_clk_pins[]	= { GPIOX_8 };
+static const unsigned int tsin_b_d0_pins[]	= { GPIOX_9 };
+
 static const unsigned int spdif_out_y_pins[]	= { GPIOY_12 };
 
 static const unsigned int gen_clk_out_pins[]	= { GPIOY_15 };
@@ -437,12 +451,22 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(pwm_a_x,		3,	17),
 	GROUP(pwm_e,		2,	30),
 	GROUP(pwm_f_x,		3,	18),
+	GROUP(tsin_b_d_valid,	3,	9),
+	GROUP(tsin_b_sop,	3,	8),
+	GROUP(tsin_b_clk,	3,	10),
+	GROUP(tsin_b_d0,	3,	7),
 
 	/* Bank Y */
-	GROUP(uart_cts_c,	1,	17),
-	GROUP(uart_rts_c,	1,	16),
-	GROUP(uart_tx_c,	1,	19),
-	GROUP(uart_rx_c,	1,	18),
+	GROUP(tsin_a_fail,	3,	3),
+	GROUP(tsin_a_d_valid,	3,	2),
+	GROUP(tsin_a_sop,	3,	1),
+	GROUP(tsin_a_clk,	3,	0),
+	GROUP(tsin_a_d0,	3,	4),
+	GROUP(tsin_a_dp,	3,	5),
+	GROUP(uart_cts_c,	1,	19),
+	GROUP(uart_rts_c,	1,	18),
+	GROUP(uart_tx_c,	1,	17),
+	GROUP(uart_rx_c,	1,	16),
 	GROUP(pwm_a_y,		1,	21),
 	GROUP(pwm_f_y,		1,	20),
 	GROUP(i2s_out_ch23_y,	1,	5),
@@ -601,6 +625,15 @@ static const char * const gpio_periphs_groups[] = {
 	"GPIOX_20", "GPIOX_21", "GPIOX_22",
 };
 
+static const char * const tsin_a_groups[] = {
+	"tsin_a_clk", "tsin_a_sop", "tsin_a_d_valid", "tsin_a_d0",
+	"tsin_a_dp", "tsin_a_fail",
+};
+
+static const char * const tsin_b_groups[] = {
+	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
+};
+
 static const char * const emmc_groups[] = {
 	"emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
 };
@@ -792,6 +825,8 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(i2s_out),
 	FUNCTION(spdif_out),
 	FUNCTION(gen_clk_out),
+	FUNCTION(tsin_a),
+	FUNCTION(tsin_b),
 };
 
 static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 1b6e864..45d5831 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -241,6 +241,17 @@ static const unsigned int tsin_a_dp_pins[] = {
 	GPIODV_1, GPIODV_2, GPIODV_3, GPIODV_4, GPIODV_5, GPIODV_6, GPIODV_7,
 };
 
+static const unsigned int tsin_b_clk_pins[]	= { GPIOH_6 };
+static const unsigned int tsin_b_d0_pins[]	= { GPIOH_7 };
+static const unsigned int tsin_b_sop_pins[]	= { GPIOH_8 };
+static const unsigned int tsin_b_d_valid_pins[] = { GPIOH_9 };
+
+static const unsigned int tsin_b_fail_z4_pins[] = { GPIOZ_4 };
+static const unsigned int tsin_b_clk_z3_pins[]	= { GPIOZ_3 };
+static const unsigned int tsin_b_d0_z2_pins[]	= { GPIOZ_2 };
+static const unsigned int tsin_b_sop_z1_pins[]	= { GPIOZ_1 };
+static const unsigned int tsin_b_d_valid_z0_pins[] = { GPIOZ_0 };
+
 static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
 	MESON_PIN(GPIOAO_0),
 	MESON_PIN(GPIOAO_1),
@@ -438,6 +449,11 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GROUP(eth_txd1,		4,	12),
 	GROUP(eth_txd2,		4,	11),
 	GROUP(eth_txd3,		4,	10),
+	GROUP(tsin_b_fail_z4,	3,	15),
+	GROUP(tsin_b_clk_z3,	3,	16),
+	GROUP(tsin_b_d0_z2,	3,	17),
+	GROUP(tsin_b_sop_z1,	3,	18),
+	GROUP(tsin_b_d_valid_z0, 3,	19),
 	GROUP(pwm_c,		3,	20),
 	GROUP(i2s_out_ch23_z,	3,	26),
 	GROUP(i2s_out_ch45_z,	3,	25),
@@ -454,6 +470,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GROUP(i2s_out_lr_clk,	6,	24),
 	GROUP(i2s_out_ch01,	6,	23),
 	GROUP(spdif_out_h,	6,	28),
+	GROUP(tsin_b_d0,	6,	17),
+	GROUP(tsin_b_sop,	6,	18),
+	GROUP(tsin_b_d_valid,	6,	19),
+	GROUP(tsin_b_clk,	6,	20),
 
 	/* Bank DV */
 	GROUP(uart_tx_b,	2,	16),
@@ -689,6 +709,12 @@ static const char * const tsin_a_groups[] = {
 	"tsin_a_dp", "tsin_a_fail",
 };
 
+static const char * const tsin_b_groups[] = {
+	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
+	"tsin_b_clk_z3", "tsin_b_sop_z1", "tsin_b_d_valid_z0", "tsin_b_d0_z2",
+	"tsin_b_fail_z4",
+};
+
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
@@ -764,6 +790,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(spdif_out),
 	FUNCTION(eth_led),
 	FUNCTION(tsin_a),
+	FUNCTION(tsin_b),
 };
 
 static struct meson_pmx_func meson_gxl_aobus_functions[] = {
-- 
2.7.4

