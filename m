Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B438421C6C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 04:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhJECNx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 22:13:53 -0400
Received: from mx.socionext.com ([202.248.49.38]:41272 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230495AbhJECNw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Oct 2021 22:13:52 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 05 Oct 2021 11:12:01 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 5D6C52059034;
        Tue,  5 Oct 2021 11:12:01 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 5 Oct 2021 11:12:01 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id D7D0CAB192;
        Tue,  5 Oct 2021 11:12:00 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 1/3] pinctrl: uniphier: Add extra audio pinmux settings for LD11, LD20 and PXs3 SoCs
Date:   Tue,  5 Oct 2021 11:11:58 +0900
Message-Id: <1633399920-1537-2-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633399920-1537-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1633399920-1537-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add extra audio I/O pinmux setting for LD11, LD20 and PXs3 SoCs.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 18 +++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 35 +++++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c | 40 ++++++++++++++++++++++++
 3 files changed, 93 insertions(+)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
index c390a55..a4fa8e3 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
@@ -461,10 +461,18 @@ static const struct pinctrl_pin_desc uniphier_ld11_pins[] = {
 			     166, UNIPHIER_PIN_PULL_DOWN),
 };
 
+static const unsigned ain1_pins[] = {151, 152, 153, 154, 155, 156, 157};
+static const int ain1_muxvals[] = {4, 4, 4, 4, 4, 4, 4};
 static const unsigned aout1_pins[] = {137, 138, 139, 140, 141, 142};
 static const int aout1_muxvals[] = {0, 0, 0, 0, 0, 0};
+static const unsigned ainiec1_pins[] = {150};
+static const int ainiec1_muxvals[] = {4};
+static const unsigned ainiec1b_pins[] = {141};
+static const int ainiec1b_muxvals[] = {4};
 static const unsigned aoutiec1_pins[] = {135, 136};
 static const int aoutiec1_muxvals[] = {0, 0};
+static const unsigned aoutiec2_pins[] = {135, 136};
+static const int aoutiec2_muxvals[] = {1, 1};
 static const unsigned int emmc_pins[] = {19, 20, 21, 22, 23, 24, 25};
 static const int emmc_muxvals[] = {0, 0, 0, 0, 0, 0, 0};
 static const unsigned emmc_dat8_pins[] = {26, 27, 28, 29};
@@ -573,8 +581,12 @@ static const unsigned int gpio_range5_pins[] = {
 };
 
 static const struct uniphier_pinctrl_group uniphier_ld11_groups[] = {
+	UNIPHIER_PINCTRL_GROUP(ain1),
 	UNIPHIER_PINCTRL_GROUP(aout1),
+	UNIPHIER_PINCTRL_GROUP(ainiec1),
+	UNIPHIER_PINCTRL_GROUP(ainiec1b),
 	UNIPHIER_PINCTRL_GROUP(aoutiec1),
+	UNIPHIER_PINCTRL_GROUP(aoutiec2),
 	UNIPHIER_PINCTRL_GROUP(emmc),
 	UNIPHIER_PINCTRL_GROUP(emmc_dat8),
 	UNIPHIER_PINCTRL_GROUP(ether_rmii),
@@ -614,8 +626,11 @@ static const struct uniphier_pinctrl_group uniphier_ld11_groups[] = {
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range5),
 };
 
+static const char * const ain1_groups[] = {"ain1"};
 static const char * const aout1_groups[] = {"aout1"};
+static const char * const ainiec1_groups[] = {"ainiec1", "ainiec1b"};
 static const char * const aoutiec1_groups[] = {"aoutiec1"};
+static const char * const aoutiec2_groups[] = {"aoutiec2"};
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_rmii_groups[] = {"ether_rmii"};
 static const char * const hscin0_groups[] = {"hscin0_ci",
@@ -646,8 +661,11 @@ static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
 
 static const struct uniphier_pinmux_function uniphier_ld11_functions[] = {
+	UNIPHIER_PINMUX_FUNCTION(ain1),
 	UNIPHIER_PINMUX_FUNCTION(aout1),
+	UNIPHIER_PINMUX_FUNCTION(ainiec1),
 	UNIPHIER_PINMUX_FUNCTION(aoutiec1),
+	UNIPHIER_PINMUX_FUNCTION(aoutiec2),
 	UNIPHIER_PINMUX_FUNCTION(emmc),
 	UNIPHIER_PINMUX_FUNCTION(ether_rmii),
 	UNIPHIER_PINMUX_FUNCTION(hscin0),
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
index 0a8b186..8507369 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
@@ -542,12 +542,26 @@ static const struct pinctrl_pin_desc uniphier_ld20_pins[] = {
 			     175, UNIPHIER_PIN_PULL_DOWN),
 };
 
+static const unsigned ain1_pins[] = {150, 151, 152, 153, 154, 155, 156};
+static const int ain1_muxvals[] = {4, 4, 4, 4, 4, 4, 4};
+static const unsigned ain2_pins[] = {116, 117, 118, 119, 120, 121, 122};
+static const int ain2_muxvals[] = {26, 26, 26, 26, 26, 26, 26};
+static const unsigned ain3_pins[] = {116, 117, 118, 119};
+static const int ain3_muxvals[] = {27, 27, 27, 27};
 static const unsigned aout1_pins[] = {137, 138, 139, 140, 141, 142};
 static const int aout1_muxvals[] = {0, 0, 0, 0, 0, 0};
 static const unsigned aout1b_pins[] = {150, 151, 152, 153, 154, 155, 156};
 static const int aout1b_muxvals[] = {1, 1, 1, 1, 1, 1, 1};
+static const unsigned aout2_pins[] = {165, 157, 162, 158, 159, 160, 161};
+static const int aout2_muxvals[] = {2, 2, 2, 1, 1, 1, 1};
+static const unsigned aout3_pins[] = {166, 167, 168, 163};
+static const int aout3_muxvals[] = {2, 2, 2, 1};
+static const unsigned aout4_pins[] = {169, 170, 171, 164};
+static const int aout4_muxvals[] = {2, 2, 2, 1};
 static const unsigned aoutiec1_pins[] = {135, 136};
 static const int aoutiec1_muxvals[] = {0, 0};
+static const unsigned aoutiec2_pins[] = {135, 136};
+static const int aoutiec2_muxvals[] = {1, 1};
 static const unsigned int emmc_pins[] = {19, 20, 21, 22, 23, 24, 25};
 static const int emmc_muxvals[] = {0, 0, 0, 0, 0, 0, 0};
 static const unsigned emmc_dat8_pins[] = {26, 27, 28, 29};
@@ -667,9 +681,16 @@ static const unsigned int gpio_range2_pins[] = {
 };
 
 static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
+	UNIPHIER_PINCTRL_GROUP(ain1),
+	UNIPHIER_PINCTRL_GROUP(ain2),
+	UNIPHIER_PINCTRL_GROUP(ain3),
 	UNIPHIER_PINCTRL_GROUP(aout1),
 	UNIPHIER_PINCTRL_GROUP(aout1b),
+	UNIPHIER_PINCTRL_GROUP(aout2),
+	UNIPHIER_PINCTRL_GROUP(aout3),
+	UNIPHIER_PINCTRL_GROUP(aout4),
 	UNIPHIER_PINCTRL_GROUP(aoutiec1),
+	UNIPHIER_PINCTRL_GROUP(aoutiec2),
 	UNIPHIER_PINCTRL_GROUP(emmc),
 	UNIPHIER_PINCTRL_GROUP(emmc_dat8),
 	UNIPHIER_PINCTRL_GROUP(ether_rgmii),
@@ -713,8 +734,15 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
 };
 
+static const char * const ain1_groups[] = {"ain1"};
+static const char * const ain2_groups[] = {"ain2"};
+static const char * const ain3_groups[] = {"ain3"};
 static const char * const aout1_groups[] = {"aout1", "aout1b"};
+static const char * const aout2_groups[] = {"aout2"};
+static const char * const aout3_groups[] = {"aout3"};
+static const char * const aout4_groups[] = {"aout4"};
 static const char * const aoutiec1_groups[] = {"aoutiec1"};
+static const char * const aoutiec2_groups[] = {"aoutiec2"};
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_rgmii_groups[] = {"ether_rgmii"};
 static const char * const ether_rmii_groups[] = {"ether_rmii"};
@@ -752,8 +780,15 @@ static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
 
 static const struct uniphier_pinmux_function uniphier_ld20_functions[] = {
+	UNIPHIER_PINMUX_FUNCTION(ain1),
+	UNIPHIER_PINMUX_FUNCTION(ain2),
+	UNIPHIER_PINMUX_FUNCTION(ain3),
 	UNIPHIER_PINMUX_FUNCTION(aout1),
+	UNIPHIER_PINMUX_FUNCTION(aout2),
+	UNIPHIER_PINMUX_FUNCTION(aout3),
+	UNIPHIER_PINMUX_FUNCTION(aout4),
 	UNIPHIER_PINMUX_FUNCTION(aoutiec1),
+	UNIPHIER_PINMUX_FUNCTION(aoutiec2),
 	UNIPHIER_PINMUX_FUNCTION(emmc),
 	UNIPHIER_PINMUX_FUNCTION(ether_rgmii),
 	UNIPHIER_PINMUX_FUNCTION(ether_rmii),
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c
index 2b388fd..4810db6 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c
@@ -767,6 +767,22 @@ static const struct pinctrl_pin_desc uniphier_pxs3_pins[] = {
 			     250, UNIPHIER_PIN_PULL_DOWN),
 };
 
+static const unsigned ain1_pins[] = {186, 187, 188, 189, 237, 238, 239};
+static const int ain1_muxvals[] = {0, 0, 0, 0, 1, 1, 1};
+static const unsigned ain2_pins[] = {243, 244, 245, 246, 247, 248, 249};
+static const int ain2_muxvals[] = {1, 1, 1, 1, 1, 1, 1};
+static const unsigned aout1_pins[] = {226, 227, 228, 229, 230, 231, 232};
+static const int aout1_muxvals[] = {1, 1, 1, 1, 1, 1, 1};
+static const unsigned aout2_pins[] = {192, 193, 194, 195, 196, 197, 198};
+static const int aout2_muxvals[] = {0, 0, 0, 0, 0, 0, 0};
+static const unsigned aout3_pins[] = {199, 200, 201, 202};
+static const int aout3_muxvals[] = {0, 0, 0, 0};
+static const unsigned ainiec1_pins[] = {240};
+static const int ainiec1_muxvals[] = {1};
+static const unsigned aoutiec1_pins[] = {190};
+static const int aoutiec1_muxvals[] = {0};
+static const unsigned aoutiec2_pins[] = {191};
+static const int aoutiec2_muxvals[] = {0};
 static const unsigned int emmc_pins[] = {32, 33, 34, 35, 36, 37, 38};
 static const int emmc_muxvals[] = {0, 0, 0, 0, 0, 0, 0};
 static const unsigned int emmc_dat8_pins[] = {39, 40, 41, 42};
@@ -871,6 +887,14 @@ static const unsigned int gpio_range2_pins[] = {
 };
 
 static const struct uniphier_pinctrl_group uniphier_pxs3_groups[] = {
+	UNIPHIER_PINCTRL_GROUP(ain1),
+	UNIPHIER_PINCTRL_GROUP(ain2),
+	UNIPHIER_PINCTRL_GROUP(aout1),
+	UNIPHIER_PINCTRL_GROUP(aout2),
+	UNIPHIER_PINCTRL_GROUP(aout3),
+	UNIPHIER_PINCTRL_GROUP(ainiec1),
+	UNIPHIER_PINCTRL_GROUP(aoutiec1),
+	UNIPHIER_PINCTRL_GROUP(aoutiec2),
 	UNIPHIER_PINCTRL_GROUP(emmc),
 	UNIPHIER_PINCTRL_GROUP(emmc_dat8),
 	UNIPHIER_PINCTRL_GROUP(ether_rgmii),
@@ -902,6 +926,14 @@ static const struct uniphier_pinctrl_group uniphier_pxs3_groups[] = {
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
 };
 
+static const char * const ain1_groups[] = {"ain1"};
+static const char * const ain2_groups[] = {"ain2"};
+static const char * const aout1_groups[] = {"aout1"};
+static const char * const aout2_groups[] = {"aout2"};
+static const char * const aout3_groups[] = {"aout3"};
+static const char * const ainiec1_groups[] = {"ainiec1"};
+static const char * const aoutiec1_groups[] = {"aoutiec1"};
+static const char * const aoutiec2_groups[] = {"aoutiec2"};
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_rgmii_groups[] = {"ether_rgmii"};
 static const char * const ether_rmii_groups[] = {"ether_rmii"};
@@ -928,6 +960,14 @@ static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
 
 static const struct uniphier_pinmux_function uniphier_pxs3_functions[] = {
+	UNIPHIER_PINMUX_FUNCTION(ain1),
+	UNIPHIER_PINMUX_FUNCTION(ain2),
+	UNIPHIER_PINMUX_FUNCTION(aout1),
+	UNIPHIER_PINMUX_FUNCTION(aout2),
+	UNIPHIER_PINMUX_FUNCTION(aout3),
+	UNIPHIER_PINMUX_FUNCTION(ainiec1),
+	UNIPHIER_PINMUX_FUNCTION(aoutiec1),
+	UNIPHIER_PINMUX_FUNCTION(aoutiec2),
 	UNIPHIER_PINMUX_FUNCTION(emmc),
 	UNIPHIER_PINMUX_FUNCTION(ether_rgmii),
 	UNIPHIER_PINMUX_FUNCTION(ether_rmii),
-- 
2.7.4

