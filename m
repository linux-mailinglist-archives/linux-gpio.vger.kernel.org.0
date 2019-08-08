Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535D985A7A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 08:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbfHHGU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 02:20:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:4488 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731145AbfHHGU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 02:20:28 -0400
X-IronPort-AV: E=Sophos;i="5.64,360,1559487600"; 
   d="scan'208";a="23432816"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Aug 2019 15:20:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E89541CA0B5;
        Thu,  8 Aug 2019 15:20:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/3] pinctrl: sh-pfc: remove incomplete flag "cfg->type"
Date:   Thu,  8 Aug 2019 15:19:02 +0900
Message-Id: <1565245143-15018-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The old commit c58d9c1b26e3 ("sh-pfc: Implement generic pinconf
support") broke the cfg->type flag to PINMUX_TYPE_FUNCTION because
sh_pfc_pinconf_set() didn't call sh_pfc_reconfig_pin().
Now if we fix the cfg->type condition, it gets worse because:
 - Some drivers might be deferred so that .set_mux() will be called
   multiple times.
 - In such the case, the sh-pfc driver returns -EBUSY even if
   the group is the same, and then that driver fails to probe.

Since the pinctrl subsystem already has such conditions according
to @set_mux and @gpio_request_enable, this patch just remove
the incomplete flag from sh-pfc/pinctrl.c.

Fixes: c58d9c1b26e3 ("sh-pfc: Implement generic pinconf support")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 864da24..ab2aa93 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -26,7 +26,6 @@
 #include "../pinconf.h"
 
 struct sh_pfc_pin_config {
-	u32 type;
 	bool mux_set;
 	bool gpio_enabled;
 };
@@ -354,16 +353,6 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	spin_lock_irqsave(&pfc->lock, flags);
 
 	for (i = 0; i < grp->nr_pins; ++i) {
-		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
-		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
-
-		if (cfg->type != PINMUX_TYPE_NONE) {
-			ret = -EBUSY;
-			goto done;
-		}
-	}
-
-	for (i = 0; i < grp->nr_pins; ++i) {
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)
 			goto done;
@@ -395,14 +384,6 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pfc->lock, flags);
 
-	if (cfg->type != PINMUX_TYPE_NONE) {
-		dev_err(pfc->dev,
-			"Pin %u is busy, can't configure it as GPIO.\n",
-			offset);
-		ret = -EBUSY;
-		goto done;
-	}
-
 	if (!pfc->gpio) {
 		/* If GPIOs are handled externally the pin mux type need to be
 		 * set to GPIO here.
@@ -414,7 +395,6 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 			goto done;
 	}
 
-	cfg->type = PINMUX_TYPE_GPIO;
 	cfg->gpio_enabled = true;
 
 	ret = 0;
@@ -436,7 +416,6 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 
 	spin_lock_irqsave(&pfc->lock, flags);
-	cfg->type = PINMUX_TYPE_NONE;
 	cfg->gpio_enabled = false;
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
@@ -450,7 +429,6 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	int new_type = input ? PINMUX_TYPE_INPUT : PINMUX_TYPE_OUTPUT;
 	int idx = sh_pfc_get_pin_index(pfc, offset);
 	const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
-	struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
 	unsigned long flags;
 	unsigned int dir;
 	int ret;
@@ -470,8 +448,6 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto done;
 
-	cfg->type = new_type;
-
 done:
 	spin_unlock_irqrestore(&pfc->lock, flags);
 	return ret;
@@ -794,13 +770,11 @@ static int sh_pfc_map_pins(struct sh_pfc *pfc, struct sh_pfc_pinctrl *pmx)
 
 	for (i = 0; i < pfc->info->nr_pins; ++i) {
 		const struct sh_pfc_pin *info = &pfc->info->pins[i];
-		struct sh_pfc_pin_config *cfg = &pmx->configs[i];
 		struct pinctrl_pin_desc *pin = &pmx->pins[i];
 
 		/* If the pin number is equal to -1 all pins are considered */
 		pin->number = info->pin != (u16)-1 ? info->pin : i;
 		pin->name = info->name;
-		cfg->type = PINMUX_TYPE_NONE;
 	}
 
 	return 0;
-- 
2.7.4

