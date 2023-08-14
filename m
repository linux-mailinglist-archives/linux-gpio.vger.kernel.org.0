Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF78A77B255
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 09:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbjHNHY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 03:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbjHNHYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 03:24:50 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46D1EE71;
        Mon, 14 Aug 2023 00:24:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,171,1684767600"; 
   d="scan'208";a="176575851"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 16:24:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 86598419AC8E;
        Mon, 14 Aug 2023 16:24:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org
Subject: [PATCH 2/3] pinctrl: renesas: rzv2m: Fix NULL pointer dereference in rzv2m_dt_subnode_to_map()
Date:   Mon, 14 Aug 2023 08:24:35 +0100
Message-Id: <20230814072436.3757-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the below random NULL pointer crash during boot by serializing
groups and functions creation in rzv2m_dt_subnode_to_map() with
mutex lock.

Crash logs:
[ 9.215283] CPU: 0 PID: 104 Comm: systemd-udevd Tainted: G D 6.4.0-next-20230628-g9d42909cfd05-dirty #1
[ 9.226128] Hardware name: RZ/V2M Evaluation Kit 2.0 (DT)
[ 9.231555] pstate: 40000005 (nZcv daif PAN -UAO -TCO -DIT -SSBS BTYPE=-)
[ 9.238557] pc : __pi_strcmp+0x20/0x140
[ 9.242428] lr : pinmux_func_name_to_selector+0x68/0xa4
[ 9.247688] sp : ffff800082c1b630
[ 9.251018] x29: ffff800082c1b630 x28: 0000000000000002 x27: ffff000143ee35c0
[ 9.258201] x26: 0000000000000002 x25: ffff000143ee6100 x24: ffff000143ee35c0
[ 9.265385] x23: ffff80008120ecf8 x22: ffff0001bfab8e88 x21: 0000000000000007
[ 9.272569] x20: ffff0001437ee9c0 x19: 0000000000000006 x18: 0000000000000020
[ 9.279751] x17: 0000000000000000 x16: 0000000000000000 x15: ffffffffffffffff
[ 9.286933] x14: ffffffffffffffff x13: 0000000000000038 x12: 0000000000000040
[ 9.294117] x11: ffff0001430d4db0 x10: 0000fffe40547178 x9 : ffff0001437eea08
[ 9.301300] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000000
[ 9.308483] x5 : ffff0001430d4db0 x4 : ffff0001430d4e08 x3 : 0000000000000000
[ 9.315666] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0001bfab8e88
[ 9.322850] Call trace:
[ 9.325308] __pi_strcmp+0x20/0x140
[ 9.328821] pinmux_generic_add_function+0x34/0xcc
[ 9.333643] rzv2m_dt_subnode_to_map+0x2e4/0x418
[ 9.338290] rzv2m_dt_node_to_map+0x15c/0x18c
[ 9.342672] pinctrl_dt_to_map+0x218/0x37c
[ 9.346795] create_pinctrl+0x70/0x3d8

Fixes: 92a9b8252576 ("pinctrl: renesas: Add RZ/V2M pin and gpio controller driver")
Cc: stable@kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index c73784b8b4ba..65718c9bfc0c 100644
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
@@ -124,6 +125,7 @@ struct rzv2m_pinctrl {
 	struct pinctrl_gpio_range	gpio_range;
 
 	spinlock_t			lock;
+	struct mutex			mutex; /* serialize adding groups and functions */
 };
 
 static const unsigned int drv_1_8V_group2_uA[] = { 1800, 3800, 7800, 11000 };
@@ -322,10 +324,12 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		name = np->name;
 	}
 
+	mutex_lock(&pctrl->mutex);
 	/* Register a single pin group listing all the pins we read from DT */
 	gsel = pinctrl_generic_add_group(pctldev, name, pins, num_pinmux, NULL);
 	if (gsel < 0) {
 		ret = gsel;
+		mutex_unlock(&pctrl->mutex);
 		goto done;
 	}
 
@@ -340,6 +344,8 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto remove_group;
 	}
 
+	mutex_unlock(&pctrl->mutex);
+
 	maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
 	maps[idx].data.mux.group = name;
 	maps[idx].data.mux.function = name;
@@ -351,6 +357,7 @@ static int rzv2m_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 
 remove_group:
 	pinctrl_generic_remove_group(pctldev, gsel);
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

