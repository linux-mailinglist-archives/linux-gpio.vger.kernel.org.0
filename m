Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE45746FBC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 13:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjGDLUB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jul 2023 07:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjGDLT4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2023 07:19:56 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B3F010D2;
        Tue,  4 Jul 2023 04:19:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; 
   d="scan'208";a="166778495"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jul 2023 20:19:03 +0900
Received: from localhost.localdomain (unknown [10.226.93.53])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EC5A7420363E;
        Tue,  4 Jul 2023 20:19:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable <stable@kernel.org>
Subject: [PATCH] pinctrl: renesas: rzg2l: Handle non-unique subnode names
Date:   Tue,  4 Jul 2023 12:18:58 +0100
Message-Id: <20230704111858.215278-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, sd1 and sd0 have unique subnode names 'sd1_mux' and 'sd0_mux'.
If we change it to a non-unique subnode name such as 'mux' this can lead
to the below conflicts as the RZ/G2L pin control driver considers only the
names of the subnodes.

   pinctrl-rzg2l 11030000.pinctrl: pin P47_0 already requested by 11c00000.mmc; cannot claim for 11c10000.mmc
   pinctrl-rzg2l 11030000.pinctrl: pin-376 (11c10000.mmc) status -22
   pinctrl-rzg2l 11030000.pinctrl: could not request pin 376 (P47_0) from group mux  on device pinctrl-rzg2l
   renesas_sdhi_internal_dmac 11c10000.mmc: Error applying setting, reverse things back

Fix this by constructing unique names from the node names of both the
pin control configuration node and its child node, where appropriate.

Based on the work done by Geert for RZ/V2M pinctrl driver.

Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
Cc: stable <stable@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is tested on RZ/V2L SMARC EVK.

before with patch[1]:
root@smarc-rzv2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pingroups
registered pin groups:
group: usb0
pin 32 (P4_0)
pin 40 (P5_0)
pin 41 (P5_1)

group: usb1
pin 336 (P42_0)
pin 337 (P42_1)

group: scif0
pin 304 (P38_0)
pin 305 (P38_1)

group: scif2
pin 384 (P48_0)
pin 385 (P48_1)
pin 387 (P48_3)
pin 388 (P48_4)

group: eth0
pin 225 (P28_1)
pin 217 (P27_1)
pin 224 (P28_0)
pin 160 (P20_0)
pin 161 (P20_1)
pin 162 (P20_2)
pin 168 (P21_0)
pin 169 (P21_1)
pin 176 (P22_0)
pin 192 (P24_0)
pin 193 (P24_1)
pin 200 (P25_0)
pin 201 (P25_1)
pin 208 (P26_0)
pin 209 (P26_1)
pin 8 (P1_0)

group: eth1
pin 298 (P37_2)
pin 296 (P37_0)
pin 297 (P37_1)
pin 232 (P29_0)
pin 233 (P29_1)
pin 240 (P30_0)
pin 241 (P30_1)
pin 248 (P31_0)
pin 249 (P31_1)
pin 265 (P33_1)
pin 272 (P34_0)
pin 273 (P34_1)
pin 280 (P35_0)
pin 281 (P35_1)
pin 288 (P36_0)
pin 9 (P1_1)

group: i2c3
pin 144 (P18_0)
pin 145 (P18_1)

group: mux
pin 376 (P47_0)

group: spi1
pin 352 (P44_0)
pin 353 (P44_1)
pin 354 (P44_2)
pin 355 (P44_3)

group: ssi0
pin 360 (P45_0)
pin 361 (P45_1)
pin 362 (P45_2)
pin 363 (P45_3)

group: adc
pin 72 (P9_0)

group: can0
pin 81 (P10_1)
pin 88 (P11_0)

group: can1
pin 97 (P12_1)
pin 104 (P13_0)

root@smarc-rzv2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-functions
function 0: usb0, groups = [ usb0 ]
function 1: usb1, groups = [ usb1 ]
function 2: scif0, groups = [ scif0 ]
function 3: scif2, groups = [ scif2 ]
function 4: eth0, groups = [ eth0 ]
function 5: eth1, groups = [ eth1 ]
function 6: i2c3, groups = [ i2c3 ]
function 7: mux, groups = [ mux ]
function 8: spi1, groups = [ spi1 ]
function 9: ssi0, groups = [ ssi0 ]
function 10: adc, groups = [ adc ]
function 11: can0, groups = [ can0 ]
function 12: can1, groups = [ can1 ]
root@smarc-rzv2l:~#

After with patch[1]:
root@smarc-rzv2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pingroups
registered pin groups:
group: usb0
pin 32 (P4_0)
pin 40 (P5_0)
pin 41 (P5_1)

group: usb1
pin 336 (P42_0)
pin 337 (P42_1)

group: scif0
pin 304 (P38_0)
pin 305 (P38_1)

group: scif2
pin 384 (P48_0)
pin 385 (P48_1)
pin 387 (P48_3)
pin 388 (P48_4)

group: eth0
pin 225 (P28_1)
pin 217 (P27_1)
pin 224 (P28_0)
pin 160 (P20_0)
pin 161 (P20_1)
pin 162 (P20_2)
pin 168 (P21_0)
pin 169 (P21_1)
pin 176 (P22_0)
pin 192 (P24_0)
pin 193 (P24_1)
pin 200 (P25_0)
pin 201 (P25_1)
pin 208 (P26_0)
pin 209 (P26_1)
pin 8 (P1_0)

group: eth1
pin 298 (P37_2)
pin 296 (P37_0)
pin 297 (P37_1)
pin 232 (P29_0)
pin 233 (P29_1)
pin 240 (P30_0)
pin 241 (P30_1)
pin 248 (P31_0)
pin 249 (P31_1)
pin 265 (P33_1)
pin 272 (P34_0)
pin 273 (P34_1)
pin 280 (P35_0)
pin 281 (P35_1)
pin 288 (P36_0)
pin 9 (P1_1)

group: i2c3
pin 144 (P18_0)
pin 145 (P18_1)

group: sd0.mux
pin 376 (P47_0)

group: sd0_uhs.mux
pin 376 (P47_0)

group: sd1.mux
pin 152 (P19_0)

group: sd1_uhs.mux
pin 152 (P19_0)

group: spi1
pin 352 (P44_0)
pin 353 (P44_1)
pin 354 (P44_2)
pin 355 (P44_3)

group: ssi0
pin 360 (P45_0)
pin 361 (P45_1)
pin 362 (P45_2)
pin 363 (P45_3)

group: adc
pin 72 (P9_0)

group: can0
pin 81 (P10_1)
pin 88 (P11_0)

group: can1
pin 97 (P12_1)
pin 104 (P13_0)

root@smarc-rzv2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinctrl-rzg2l/pinmux-functions
function 0: usb0, groups = [ usb0 ]
function 1: usb1, groups = [ usb1 ]
function 2: scif0, groups = [ scif0 ]
function 3: scif2, groups = [ scif2 ]
function 4: eth0, groups = [ eth0 ]
function 5: eth1, groups = [ eth1 ]
function 6: i2c3, groups = [ i2c3 ]
function 7: sd0.mux, groups = [ sd0.mux ]
function 8: sd0_uhs.mux, groups = [ sd0_uhs.mux ]
function 9: sd1.mux, groups = [ sd1.mux ]
function 10: sd1_uhs.mux, groups = [ sd1_uhs.mux ]
function 11: spi1, groups = [ spi1 ]
function 12: ssi0, groups = [ ssi0 ]
function 13: adc, groups = [ adc ]
function 14: can0, groups = [ can0 ]
function 15: can1, groups = [ can1 ]
root@smarc-rzv2l:~#

[1]:

-		sd1_mux {
+		mux {
 			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
 		};
 	};

-		sd1_mux_uhs {
+		mux {
 			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
 		};
 	};

+#define EMMC	0

-		sd0_mux {
+		mux {
 			pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
 		};
 	};

-		sd0_mux_uhs {
+		mux {
 			pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
 		};
 	};
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 28 ++++++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9511d920565e..b53d26167da5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -249,6 +249,7 @@ static int rzg2l_map_add_config(struct pinctrl_map *map,
 
 static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 				   struct device_node *np,
+				   struct device_node *parent,
 				   struct pinctrl_map **map,
 				   unsigned int *num_maps,
 				   unsigned int *index)
@@ -266,6 +267,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	struct property *prop;
 	int ret, gsel, fsel;
 	const char **pin_fn;
+	const char *name;
 	const char *pin;
 
 	pinmux = of_find_property(np, "pinmux", NULL);
@@ -349,8 +351,19 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		psel_val[i] = MUX_FUNC(value);
 	}
 
+	if (parent) {
+		name = devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOFn.%pOFn",
+				      parent, np);
+		if (!name) {
+			ret = -ENOMEM;
+			goto done;
+		}
+	} else {
+		name = np->name;
+	}
+
 	/* Register a single pin group listing all the pins we read from DT */
-	gsel = pinctrl_generic_add_group(pctldev, np->name, pins, num_pinmux, NULL);
+	gsel = pinctrl_generic_add_group(pctldev, name, pins, num_pinmux, NULL);
 	if (gsel < 0) {
 		ret = gsel;
 		goto done;
@@ -360,17 +373,16 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	 * Register a single group function where the 'data' is an array PSEL
 	 * register values read from DT.
 	 */
-	pin_fn[0] = np->name;
-	fsel = pinmux_generic_add_function(pctldev, np->name, pin_fn, 1,
-					   psel_val);
+	pin_fn[0] = name;
+	fsel = pinmux_generic_add_function(pctldev, name, pin_fn, 1, psel_val);
 	if (fsel < 0) {
 		ret = fsel;
 		goto remove_group;
 	}
 
 	maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
-	maps[idx].data.mux.group = np->name;
-	maps[idx].data.mux.function = np->name;
+	maps[idx].data.mux.group = name;
+	maps[idx].data.mux.function = name;
 	idx++;
 
 	dev_dbg(pctrl->dev, "Parsed %pOF with %d pins\n", np, num_pinmux);
@@ -417,7 +429,7 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	index = 0;
 
 	for_each_child_of_node(np, child) {
-		ret = rzg2l_dt_subnode_to_map(pctldev, child, map,
+		ret = rzg2l_dt_subnode_to_map(pctldev, child, np, map,
 					      num_maps, &index);
 		if (ret < 0) {
 			of_node_put(child);
@@ -426,7 +438,7 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	if (*num_maps == 0) {
-		ret = rzg2l_dt_subnode_to_map(pctldev, np, map,
+		ret = rzg2l_dt_subnode_to_map(pctldev, np, NULL, map,
 					      num_maps, &index);
 		if (ret < 0)
 			goto done;
-- 
2.25.1

