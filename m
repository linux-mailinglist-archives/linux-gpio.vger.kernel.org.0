Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E72085A78
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 08:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbfHHGU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 02:20:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30299 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730305AbfHHGU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 02:20:28 -0400
X-IronPort-AV: E=Sophos;i="5.64,360,1559487600"; 
   d="scan'208";a="23652843"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Aug 2019 15:20:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5143141CA0D5;
        Thu,  8 Aug 2019 15:20:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/3] pinctrl: sh-pfc: add new flags into struct sh_pfc_pin_config
Date:   Thu,  8 Aug 2019 15:19:01 +0900
Message-Id: <1565245143-15018-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To clean/modify the code up later, this patch just adds new flags
"mux_set" and "gpio_enabled" into the struct sh_pfc_pin_config.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 2824be4..864da24 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -27,6 +27,8 @@
 
 struct sh_pfc_pin_config {
 	u32 type;
+	bool mux_set;
+	bool gpio_enabled;
 };
 
 struct sh_pfc_pinctrl {
@@ -364,7 +366,15 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	for (i = 0; i < grp->nr_pins; ++i) {
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)
-			break;
+			goto done;
+	}
+
+	/* All group pins are configured, mark the pins as mux_set */
+	for (i = 0; i < grp->nr_pins; ++i) {
+		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
+		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
+
+		cfg->mux_set = true;
 	}
 
 done:
@@ -405,6 +415,7 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 	}
 
 	cfg->type = PINMUX_TYPE_GPIO;
+	cfg->gpio_enabled = true;
 
 	ret = 0;
 
@@ -426,6 +437,7 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pfc->lock, flags);
 	cfg->type = PINMUX_TYPE_NONE;
+	cfg->gpio_enabled = false;
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
 
-- 
2.7.4

