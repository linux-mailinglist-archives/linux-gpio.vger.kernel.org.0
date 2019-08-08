Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4830685A7D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 08:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731151AbfHHGU3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 02:20:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30299 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731147AbfHHGU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 02:20:29 -0400
X-IronPort-AV: E=Sophos;i="5.64,360,1559487600"; 
   d="scan'208";a="23652846"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Aug 2019 15:20:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6BEBD41CA0B9;
        Thu,  8 Aug 2019 15:20:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/3] pinctrl: sh-pfc: Rollback to mux if requires when the gpio is freed
Date:   Thu,  8 Aug 2019 15:19:03 +0900
Message-Id: <1565245143-15018-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

R-Car PWM controller requires the gpio to output zero duty,
this patch allows to roll it back from gpio to mux when the gpio
is freed.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index ab2aa93..c9bdca5 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -26,6 +26,7 @@
 #include "../pinconf.h"
 
 struct sh_pfc_pin_config {
+	unsigned int mux_mark;
 	bool mux_set;
 	bool gpio_enabled;
 };
@@ -353,6 +354,16 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	spin_lock_irqsave(&pfc->lock, flags);
 
 	for (i = 0; i < grp->nr_pins; ++i) {
+		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
+		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
+
+		/*
+		 * This driver cannot manage both gpio and mux when the gpio
+		 * pin is already enabled. So, this function failed.
+		 */
+		if (cfg->gpio_enabled)
+			return -EBUSY;
+
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)
 			goto done;
@@ -364,6 +375,7 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
 
 		cfg->mux_set = true;
+		cfg->mux_mark = grp->mux[i];
 	}
 
 done:
@@ -417,6 +429,9 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pfc->lock, flags);
 	cfg->gpio_enabled = false;
+	/* If mux is already set, this configures it here */
+	if (cfg->mux_set)
+		sh_pfc_config_mux(pfc, cfg->mux_mark, PINMUX_TYPE_FUNCTION);
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
 
-- 
2.7.4

