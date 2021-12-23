Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34ECF47E4AD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348973AbhLWOmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348876AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B661CC061785
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by michel.telenet-ops.be with bizsmtp
        id ZqiC2600h1rdBcm06qiDac; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a8u-I0; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYK-Os; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/60] pinctrl: renesas: r8a77470: Reduce size for narrow VIN1 channel
Date:   Thu, 23 Dec 2021 15:41:11 +0100
Message-Id: <52716fa89139f6f92592633edb52804d4c5e18f0.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The second video-in channel on RZ/G1C has only 12 data lanes, but the
pin control driver uses the vin_data union, which is meant for 24 data
lanes, thus wasting space.

Fix this by using the vin_data12 union instead.

This reduces kernel size by 96 bytes.

Fixes: 50f3f2d73e3426ba ("pinctrl: sh-pfc: Reduce kernel size for narrow VIN channels")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
All other Renesas pin control drivers were fixed, but RZ/G1C was
forgotten, as RZ/G1C video-in support went in just before these fixes.
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index e6e5487691c16f35..cf7153d06a953863 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -2140,7 +2140,7 @@ static const unsigned int vin0_clk_mux[] = {
 	VI0_CLK_MARK,
 };
 /* - VIN1 ------------------------------------------------------------------- */
-static const union vin_data vin1_data_pins = {
+static const union vin_data12 vin1_data_pins = {
 	.data12 = {
 		RCAR_GP_PIN(3,  1), RCAR_GP_PIN(3, 2),
 		RCAR_GP_PIN(3,  3), RCAR_GP_PIN(3, 4),
@@ -2150,7 +2150,7 @@ static const union vin_data vin1_data_pins = {
 		RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
 	},
 };
-static const union vin_data vin1_data_mux = {
+static const union vin_data12 vin1_data_mux = {
 	.data12 = {
 		VI1_DATA0_MARK, VI1_DATA1_MARK,
 		VI1_DATA2_MARK, VI1_DATA3_MARK,
-- 
2.25.1

