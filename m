Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE13377CD3C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 15:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237412AbjHONQ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 09:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbjHONQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 09:16:12 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EDAE1987;
        Tue, 15 Aug 2023 06:16:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="173003484"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2023 22:16:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.136])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 845804002979;
        Tue, 15 Aug 2023 22:16:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org
Subject: [PATCH v3 2/3] pinctrl: renesas: rzv2m: Fix NULL pointer dereference in rzv2m_dt_subnode_to_map()
Date:   Tue, 15 Aug 2023 14:15:57 +0100
Message-Id: <20230815131558.33787-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the below random NULL pointer crash during boot by serializing
groups and functions creation in rzv2m_dt_subnode_to_map() with
mutex lock.

Crash logs:
 pc : __pi_strcmp+0x20/0x140
 lr : pinmux_func_name_to_selector+0x68/0xa4
 Call trace:
 __pi_strcmp+0x20/0x140
 pinmux_generic_add_function+0x34/0xcc
 rzv2m_dt_subnode_to_map+0x2e4/0x418
 rzv2m_dt_node_to_map+0x15c/0x18c
 pinctrl_dt_to_map+0x218/0x37c
 create_pinctrl+0x70/0x3d8

While at it, add comment for lock.

Fixes: 92a9b8252576 ("pinctrl: renesas: Add RZ/V2M pin and gpio controller driver")
Cc: stable@kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added comment for lock.
 * Moved map allocation down to reduce lock section.
 * Added locks for maps and pinctrl group and function creation/remove
   calls
 * Added unlock_and_done label for lock error path.
v1->v2:
 * Updated crash logs as per submitting patches doc.
---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 56 ++++++++++++++-----------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index c73784b8b4ba..19586a0861a4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -14,6 +14,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
@@ -123,7 +124,8 @@ struct rzv2m_pinctrl {
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
 
-	spinlock_t			lock;
+	spinlock_t			lock; /* lock read/write registers */
+	struct mutex			mutex; /* serialize adding groups and functions */
 };
 
 static const unsigned int drv_1_8V_group2_uA[] = { 1800, 3800, 7800, 11000 };
@@ -269,28 +271,6 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	if (num_pins)
 		nmaps += num_pins;
 
-	maps = krealloc_array(maps, nmaps, sizeof(*maps), GFP_KERNEL);
-	if (!maps) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	*map = maps;
-	*num_maps = nmaps;
-	if (num_pins) {
-		of_property_for_each_string(np, "pins", prop, pin) {
-			ret = rzv2m_map_add_config(&maps[idx], pin,
-						   PIN_MAP_TYPE_CONFIGS_PIN,
-						   configs, num_configs);
-			if (ret < 0)
-				goto done;
-
-			idx++;
-		}
-		ret = 0;
-		goto done;
-	}
-
 	pins = devm_kcalloc(pctrl->dev, num_pinmux, sizeof(*pins), GFP_KERNEL);
 	psel_val = devm_kcalloc(pctrl->dev, num_pinmux, sizeof(*psel_val),
 				GFP_KERNEL);
@@ -322,11 +302,34 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		name = np->name;
 	}
 
+	mutex_lock(&pctrl->mutex);
+	maps = krealloc_array(maps, nmaps, sizeof(*maps), GFP_KERNEL);
+	if (!maps) {
+		ret = -ENOMEM;
+		goto unlock_and_done;
+	}
+
+	*map = maps;
+	*num_maps = nmaps;
+	if (num_pins) {
+		of_property_for_each_string(np, "pins", prop, pin) {
+			ret = rzv2m_map_add_config(&maps[idx], pin,
+						   PIN_MAP_TYPE_CONFIGS_PIN,
+						   configs, num_configs);
+			if (ret < 0)
+				goto unlock_and_done;
+
+			idx++;
+		}
+		ret = 0;
+		goto unlock_and_done;
+	}
+
 	/* Register a single pin group listing all the pins we read from DT */
 	gsel = pinctrl_generic_add_group(pctldev, name, pins, num_pinmux, NULL);
 	if (gsel < 0) {
 		ret = gsel;
-		goto done;
+		goto unlock_and_done;
 	}
 
 	/*
@@ -340,6 +343,8 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto remove_group;
 	}
 
+	mutex_unlock(&pctrl->mutex);
+
 	maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
 	maps[idx].data.mux.group = name;
 	maps[idx].data.mux.function = name;
@@ -351,6 +356,8 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 
 remove_group:
 	pinctrl_generic_remove_group(pctldev, gsel);
+unlock_and_done:
+	mutex_unlock(&pctrl->mutex);
 done:
 	*index = idx;
 	kfree(configs);
@@ -1065,6 +1072,7 @@ static int rzv2m_pinctrl_probe(struct platform_device *pdev)
 				     "failed to enable GPIO clk\n");
 
 	spin_lock_init(&pctrl->lock);
+	mutex_init(&pctrl->mutex);
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.25.1

