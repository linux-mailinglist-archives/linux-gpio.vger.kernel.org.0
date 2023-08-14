Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7BA377B24F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 09:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbjHNHY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 03:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbjHNHYr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 03:24:47 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D58FE71;
        Mon, 14 Aug 2023 00:24:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,171,1684767600"; 
   d="scan'208";a="176575845"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2023 16:24:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 29B47419AC62;
        Mon, 14 Aug 2023 16:24:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference in rzg2l_dt_subnode_to_map()
Date:   Mon, 14 Aug 2023 08:24:34 +0100
Message-Id: <20230814072436.3757-2-biju.das.jz@bp.renesas.com>
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
pinctrl group and function creation/remove calls in
rzg2l_dt_subnode_to_map() with mutex lock.

Crash logs:
[   15.310036] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   15.354291] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   15.870714] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[   15.939989] Internal error: Oops: 0000000096000004 2 PREEMPT SMP
[   15.946285] Modules linked in: drm_shmem_helper rzg2l_mipi_dsi videobuf2_common display_connector gpu_sched mc drm_kms_helper rcar_fcp drm rcar_canfd snd_soc_wm8978 rtc_isl1208 can_dev rzg2l_adc snd_soc_rz_ssi renesas_rpc_if spi_rspi backlight ipv6
[   15.969077] CPU: 1 PID: 117 Comm: systemd-udevd Tainted: G      D            6.5.0-rc4-next-20230801-00013-gd1819ab30a54 #986
[   15.980351] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[   15.986857] pstate: 40400005 (nZcv daif +PAN UAO -TCO -DIT -SSBS BTYPE=-)
[   15.993797] pc : __pi_strcmp+0x20/0x140
[   15.997647] lr : pinmux_func_name_to_selector+0x68/0xa4
[   16.002876] sp : ffff800082d9b5a0
[   16.006210] x29: ffff800082d9b5a0 x28: 0000000000000002 x27: ffff00000cda7080
[   16.013338] x26: 0000000000000002 x25: ffff00000a1f26c0 x24: ffff00000cda7080
[   16.020456] x23: ffff800081224960 x22: ffff00007fc2e598 x21: 000000000000000c
[   16.027571] x20: ffff00000b6c8840 x19: 000000000000000b x18: 0000000000000002
[   16.034686] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   16.041799] x14: 0000000000000001 x13: 0000000000068a68 x12: 0000000000000040
[   16.048913] x11: ffff00000b092ff8 x10: 0000ffff803d1a68 x9 : ffff00000b6c8888
[   16.056028] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000000
[   16.063142] x5 : ffff00000b092ff8 x4 : ffff00000b093078 x3 : 0000000000000000
[   16.070256] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00007fc2e598
[   16.077370] Call trace:
[   16.079807]  __pi_strcmp+0x20/0x140
[   16.083296]  pinmux_generic_add_function+0x34/0xcc
[   16.088077]  rzg2l_dt_subnode_to_map+0x314/0x44c
[   16.092682]  rzg2l_dt_node_to_map+0x164/0x194
[   16.097025]  pinctrl_dt_to_map+0x218/0x37c
[   16.101107]  create_pinctrl+0x70/0x3d8

Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
Cc: stable@kernel.org
Tested-by: Chris Paterson <Chris.Paterson2@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 4f34f8f24bde..8a14cbb56449 100644
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
@@ -153,6 +154,7 @@ struct rzg2l_pinctrl {
 	unsigned int			hwirq[RZG2L_TINT_MAX_INTERRUPT];
 
 	spinlock_t			lock;
+	struct mutex			mutex; /* serialize adding groups and functions */
 };
 
 static const unsigned int iolh_groupa_mA[] = { 2, 4, 8, 12 };
@@ -362,10 +364,12 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
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
 
@@ -380,6 +384,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		goto remove_group;
 	}
 
+	mutex_unlock(&pctrl->mutex);
+
 	maps[idx].type = PIN_MAP_TYPE_MUX_GROUP;
 	maps[idx].data.mux.group = name;
 	maps[idx].data.mux.function = name;
@@ -391,6 +397,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 
 remove_group:
 	pinctrl_generic_remove_group(pctldev, gsel);
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

