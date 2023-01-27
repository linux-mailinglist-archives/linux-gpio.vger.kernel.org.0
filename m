Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE77467E64E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbjA0NNR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbjA0NNI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:13:08 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61AA7E06C
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:12:42 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:735b:e883:8069:427])
        by albert.telenet-ops.be with bizsmtp
        id DpC1290024pY4D906pC18P; Fri, 27 Jan 2023 14:12:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLOWD-007Y0i-7W;
        Fri, 27 Jan 2023 14:12:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLOWO-005QBN-Vj;
        Fri, 27 Jan 2023 14:12:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779f0: Fix tsn1_avtp_pps pin group
Date:   Fri, 27 Jan 2023 14:11:59 +0100
Message-Id: <45ea6e87b91c36fd0b9706cf58ff50a4d1a99c44.1674825039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

Correct a typo mistake in the definition of the tsn1_avtp_pps pin group
mux.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Fixes: babe298e9caaa3d7 ("pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl.

 drivers/pinctrl/renesas/pfc-r8a779f0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index 417c357f16b194d5..65c141ce909ac371 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -1213,7 +1213,7 @@ static const unsigned int tsn1_avtp_pps_pins[] = {
 	RCAR_GP_PIN(3, 13),
 };
 static const unsigned int tsn1_avtp_pps_mux[] = {
-	TSN0_AVTP_PPS_MARK,
+	TSN1_AVTP_PPS_MARK,
 };
 static const unsigned int tsn1_avtp_capture_a_pins[] = {
 	/* TSN1_AVTP_CAPTURE_A */
-- 
2.34.1

