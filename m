Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD926B749B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 11:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjCMKtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 06:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjCMKtM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:49:12 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1072B16AE3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:49:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:7ed1:e2c6:b94:264a])
        by albert.telenet-ops.be with bizsmtp
        id Xmp62900901Vtj806mp69p; Mon, 13 Mar 2023 11:49:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pbfjA-00C3Fp-Mv;
        Mon, 13 Mar 2023 11:49:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pbfjm-008cMY-3L;
        Mon, 13 Mar 2023 11:49:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Drop support for Renesas-specific properties
Date:   Mon, 13 Mar 2023 11:49:04 +0100
Message-Id: <ff9c14781110bbf19b56b45dd1f01e6da90319ad.1678704441.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The last user of the Renesas-specific properties was converted to the
standard properties in commit af897250ea54c6f2 ("ARM: dts: gose: use
generic pinctrl properties in SDHI nodes") in v4.10.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v6.4.

 drivers/pinctrl/renesas/pinctrl.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index f6ef658fb2276bb0..4d9d58fc1356ff53 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -40,10 +40,6 @@ struct sh_pfc_pinctrl {
 
 	struct pinctrl_pin_desc *pins;
 	struct sh_pfc_pin_config *configs;
-
-	const char *func_prop_name;
-	const char *groups_prop_name;
-	const char *pins_prop_name;
 };
 
 static int sh_pfc_get_groups_count(struct pinctrl_dev *pctldev)
@@ -120,27 +116,10 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	const char *pin;
 	int ret;
 
-	/* Support both the old Renesas-specific properties and the new standard
-	 * properties. Mixing old and new properties isn't allowed, neither
-	 * inside a subnode nor across subnodes.
-	 */
-	if (!pmx->func_prop_name) {
-		if (of_find_property(np, "groups", NULL) ||
-		    of_find_property(np, "pins", NULL)) {
-			pmx->func_prop_name = "function";
-			pmx->groups_prop_name = "groups";
-			pmx->pins_prop_name = "pins";
-		} else {
-			pmx->func_prop_name = "renesas,function";
-			pmx->groups_prop_name = "renesas,groups";
-			pmx->pins_prop_name = "renesas,pins";
-		}
-	}
-
 	/* Parse the function and configuration properties. At least a function
 	 * or one configuration must be specified.
 	 */
-	ret = of_property_read_string(np, pmx->func_prop_name, &function);
+	ret = of_property_read_string(np, "function", &function);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(dev, "Invalid function in DT\n");
 		return ret;
@@ -158,7 +137,7 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	/* Count the number of pins and groups and reallocate mappings. */
-	ret = of_property_count_strings(np, pmx->pins_prop_name);
+	ret = of_property_count_strings(np, "pins");
 	if (ret == -EINVAL) {
 		num_pins = 0;
 	} else if (ret < 0) {
@@ -168,7 +147,7 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		num_pins = ret;
 	}
 
-	ret = of_property_count_strings(np, pmx->groups_prop_name);
+	ret = of_property_count_strings(np, "groups");
 	if (ret == -EINVAL) {
 		num_groups = 0;
 	} else if (ret < 0) {
@@ -199,7 +178,7 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = nmaps;
 
 	/* Iterate over pins and groups and create the mappings. */
-	of_property_for_each_string(np, pmx->groups_prop_name, prop, group) {
+	of_property_for_each_string(np, "groups", prop, group) {
 		if (function) {
 			maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
 			maps[idx].data.mux.group = group;
@@ -223,7 +202,7 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto done;
 	}
 
-	of_property_for_each_string(np, pmx->pins_prop_name, prop, pin) {
+	of_property_for_each_string(np, "pins", prop, pin) {
 		ret = sh_pfc_map_add_config(&maps[idx], pin,
 					    PIN_MAP_TYPE_CONFIGS_PIN,
 					    configs, num_configs);
-- 
2.34.1

