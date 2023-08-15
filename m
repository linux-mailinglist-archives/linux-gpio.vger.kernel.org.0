Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC3677CD40
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 15:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbjHONQ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 09:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237412AbjHONQJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 09:16:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 796001987;
        Tue, 15 Aug 2023 06:16:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="173003478"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2023 22:16:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.136])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BAD740029AC;
        Tue, 15 Aug 2023 22:16:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference in rzg2l_dt_subnode_to_map()
Date:   Tue, 15 Aug 2023 14:15:56 +0100
Message-Id: <20230815131558.33787-2-biju.das.jz@bp.renesas.com>
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
pinctrl group and function creation/remove calls in
rzg2l_dt_subnode_to_map() with mutex lock.

Crash logs:
 pc : __pi_strcmp+0x20/0x140
 lr : pinmux_func_name_to_selector+0x68/0xa4
 Call trace:
 __pi_strcmp+0x20/0x140
 pinmux_generic_add_function+0x34/0xcc
 rzg2l_dt_subnode_to_map+0x314/0x44c
 rzg2l_dt_node_to_map+0x164/0x194
 pinctrl_dt_to_map+0x218/0x37c
 create_pinctrl+0x70/0x3d8

While at it, add comments for bitmap_lock and lock.

Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
Cc: stable@kernel.org
Tested-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added comment for bitmap_lock and lock.
 * Moved map allocation down to reduce lock section.
 * Added locks for maps and pinctrl group and function creation/remove
   calls
 * Added unlock_and_done label for lock error path.
v1->v2:
 * Updated crash logs as per submitting patches doc.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 58 ++++++++++++++-----------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 4f34f8f24bde..571a32d2f697 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -149,10 +150,11 @@ struct rzg2l_pinctrl {
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
 	DECLARE_BITMAP(tint_slot, RZG2L_TINT_MAX_INTERRUPT);
-	spinlock_t			bitmap_lock;
+	spinlock_t			bitmap_lock; /* protect tint_slot bitmap */
 	unsigned int			hwirq[RZG2L_TINT_MAX_INTERRUPT];
 
-	spinlock_t			lock;
+	spinlock_t			lock; /* lock read/write registers */
+	struct mutex			mutex; /* serialize adding groups and functions */
 };
 
 static const unsigned int iolh_groupa_mA[] = { 2, 4, 8, 12 };
@@ -309,28 +311,6 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
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
-			ret = rzg2l_map_add_config(&maps[idx], pin,
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
@@ -362,11 +342,34 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
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
+			ret = rzg2l_map_add_config(&maps[idx], pin,
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
@@ -380,6 +383,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto remove_group;
 	}
 
+	mutex_unlock(&pctrl->mutex);
+
 	maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
 	maps[idx].data.mux.group = name;
 	maps[idx].data.mux.function = name;
@@ -391,6 +396,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 
 remove_group:
 	pinctrl_generic_remove_group(pctldev, gsel);
+unlock_and_done:
+	mutex_unlock(&pctrl->mutex);
 done:
 	*index = idx;
 	kfree(configs);
@@ -1503,6 +1510,7 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 
 	spin_lock_init(&pctrl->lock);
 	spin_lock_init(&pctrl->bitmap_lock);
+	mutex_init(&pctrl->mutex);
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.25.1

