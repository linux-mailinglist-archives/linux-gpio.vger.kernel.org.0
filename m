Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B88077C8F6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 09:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbjHOH4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 03:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235492AbjHOH4V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 03:56:21 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EEC8DD;
        Tue, 15 Aug 2023 00:56:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="172984486"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2023 16:56:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.136])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ED7DA41822E3;
        Tue, 15 Aug 2023 16:56:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        stable@kernel.org
Subject: [PATCH v2 3/3] pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
Date:   Tue, 15 Aug 2023 08:56:02 +0100
Message-Id: <20230815075602.10473-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815075602.10473-1-biju.das.jz@bp.renesas.com>
References: <20230815075602.10473-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl group and function creation/remove calls expect
caller to take care of locking. Add lock around these functions.

Fixes: b59d0e782706 ("pinctrl: Add RZ/A2 pin and gpio controller")
Cc: stable@kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 0b454a31c4bd..afb595a6eb9e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -14,6 +14,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
@@ -47,6 +48,7 @@ struct rza2_pinctrl_priv {
 	struct pinctrl_dev *pctl;
 	struct pinctrl_gpio_range gpio_range;
 	int npins;
+	struct mutex mutex; /* serialize adding groups and functions */
 };
 
 #define RZA2_PDR(port)		(0x0000 + (port) * 2)	/* Direction 16-bit */
@@ -359,10 +361,13 @@ static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
 		psel_val[i] = MUX_FUNC(value);
 	}
 
+	mutex_lock(&priv->mutex);
 	/* Register a single pin group listing all the pins we read from DT */
 	gsel = pinctrl_generic_add_group(pctldev, np->name, pins, npins, NULL);
-	if (gsel < 0)
+	if (gsel < 0) {
+		mutex_unlock(&priv->mutex);
 		return gsel;
+	}
 
 	/*
 	 * Register a single group function where the 'data' is an array PSEL
@@ -390,6 +395,7 @@ static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
 	(*map)->data.mux.group = np->name;
 	(*map)->data.mux.function = np->name;
 	*num_maps = 1;
+	mutex_unlock(&priv->mutex);
 
 	return 0;
 
@@ -398,6 +404,7 @@ static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 remove_group:
 	pinctrl_generic_remove_group(pctldev, gsel);
+	mutex_unlock(&priv->mutex);
 
 	dev_err(priv->dev, "Unable to parse DT node %s\n", np->name);
 
@@ -474,6 +481,8 @@ static int rza2_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	mutex_init(&priv->mutex);
+
 	platform_set_drvdata(pdev, priv);
 
 	priv->npins = (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
-- 
2.25.1

