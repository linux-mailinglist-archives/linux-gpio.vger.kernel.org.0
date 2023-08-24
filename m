Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8790786C8F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 12:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjHXKH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 06:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240814AbjHXKHw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 06:07:52 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF64E10FC
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 03:07:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3c6b:f703:5ab5:f36d])
        by andre.telenet-ops.be with bizsmtp
        id dN7m2A00P01sfPQ01N7m3Q; Thu, 24 Aug 2023 12:07:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qZ7FY-001cxI-OT;
        Thu, 24 Aug 2023 12:07:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qZ7Fi-000NNZ-C5;
        Thu, 24 Aug 2023 12:07:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: nuvoton: Use pinconf_generic_dt_node_to_map_all()
Date:   Thu, 24 Aug 2023 12:07:44 +0200
Message-Id: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the pinconf_generic_dt_node_to_map_all() helper instead of
open-coding the same operation, to avoid having to provide custom
pinctrl_ops.dt_node_to_map() callbacks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This does sacrifice a debug print in the process. Does anyone care?
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 15 +--------------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 12 +-----------
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 843ffcd968774774..8bdd0124e2eb9467 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1588,19 +1588,6 @@ static int npcm7xx_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int npcm7xx_dt_node_to_map(struct pinctrl_dev *pctldev,
-				  struct device_node *np_config,
-				  struct pinctrl_map **map,
-				  u32 *num_maps)
-{
-	struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
-
-	dev_dbg(npcm->dev, "dt_node_to_map: %s\n", np_config->name);
-	return pinconf_generic_dt_node_to_map(pctldev, np_config,
-					      map, num_maps,
-					      PIN_MAP_TYPE_INVALID);
-}
-
 static void npcm7xx_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, u32 num_maps)
 {
@@ -1612,7 +1599,7 @@ static const struct pinctrl_ops npcm7xx_pinctrl_ops = {
 	.get_group_name = npcm7xx_get_group_name,
 	.get_group_pins = npcm7xx_get_group_pins,
 	.pin_dbg_show = npcm7xx_pin_dbg_show,
-	.dt_node_to_map = npcm7xx_dt_node_to_map,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = npcm7xx_dt_free_map,
 };
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 2d1c1652cfd9d373..6e88ef1ed020fa88 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -858,16 +858,6 @@ static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int wpcm450_dt_node_to_map(struct pinctrl_dev *pctldev,
-				  struct device_node *np_config,
-				  struct pinctrl_map **map,
-				  u32 *num_maps)
-{
-	return pinconf_generic_dt_node_to_map(pctldev, np_config,
-					      map, num_maps,
-					      PIN_MAP_TYPE_INVALID);
-}
-
 static void wpcm450_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, u32 num_maps)
 {
@@ -878,7 +868,7 @@ static const struct pinctrl_ops wpcm450_pinctrl_ops = {
 	.get_groups_count = wpcm450_get_groups_count,
 	.get_group_name = wpcm450_get_group_name,
 	.get_group_pins = wpcm450_get_group_pins,
-	.dt_node_to_map = wpcm450_dt_node_to_map,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = wpcm450_dt_free_map,
 };
 
-- 
2.34.1

