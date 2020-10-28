Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC49F29DAE1
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390288AbgJ1Xgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390549AbgJ1XfT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:35:19 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Oct 2020 16:35:19 PDT
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68445C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:35:19 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLsc86DLHzMwkhW
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id lTGg2300T4C55Sk01TGglM; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBo-000pDo-8T; Wed, 28 Oct 2020 16:16:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H9M-DG; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 8/8] pinctrl: renesas: Protect GPIO leftovers by CONFIG_PINCTRL_SH_FUNC_GPIO
Date:   Wed, 28 Oct 2020 16:16:37 +0100
Message-Id: <20201028151637.1734130-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On SuperH and ARM SH/R-Mobile SoCs, the pin control driver handles
GPIOs, too.  To reduce code size when compiling a kernel supporting only
modern SoCs, most, but not all, of the GPIO functionality is protected
by checks for CONFIG_PINCTRL_SH_FUNC_GPIO.

Factor out the remaining parts when not needed:
  1. sh_pfc_soc_info.{in,out}put describe GPIO pins that have input
     resp. output capabilities (SuperH and SH/R-Mobile).
  2. sh_pfc_soc_info.gpio_irq{,_size} describe the mapping from GPIO
     pins to interrupt numbers (SH/R-Mobile).
  3. sh_pfc_gpio_set_direction() configures GPIO direction, called from
     the GPIO driver through pinctrl_gpio_direction_{in,out}put()
     (SH/R-Mobile).  Unfortunately this function cannot just be moved to
     drivers/pinctrl/renesas/gpio.c, as it relies on knowledge of
     sh_pfc_pinctrl, which is internal to
     drivers/pinctrl/renesas/pinctrl.c.

While code size reduction is minimal, this does help in documenting
depencies.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c    | 2 ++
 drivers/pinctrl/renesas/pinctrl.c | 4 ++++
 drivers/pinctrl/renesas/sh_pfc.h  | 8 +++++---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index c528c124fb0e9259..2cc457279345b95d 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -315,6 +315,7 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type)
 		range = NULL;
 		break;
 
+#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
 	case PINMUX_TYPE_OUTPUT:
 		range = &pfc->info->output;
 		break;
@@ -322,6 +323,7 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type)
 	case PINMUX_TYPE_INPUT:
 		range = &pfc->info->input;
 		break;
+#endif /* CONFIG_PINCTRL_SH_PFC_GPIO */
 
 	default:
 		return -EINVAL;
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index d5c798e98c18abee..ac542d278a387de1 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -435,6 +435,7 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
 
+#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
 static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 				     struct pinctrl_gpio_range *range,
 				     unsigned offset, bool input)
@@ -462,6 +463,9 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	spin_unlock_irqrestore(&pfc->lock, flags);
 	return ret;
 }
+#else
+#define sh_pfc_gpio_set_direction	NULL
+#endif
 
 static const struct pinmux_ops sh_pfc_pinmux_ops = {
 	.get_functions_count	= sh_pfc_get_functions_count,
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 3b390dffacb4910d..dc484c13f59c74e5 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -270,8 +270,13 @@ struct sh_pfc_soc_info {
 	const char *name;
 	const struct sh_pfc_soc_operations *ops;
 
+#ifdef CONFIG_PINCTRL_SH_PFC_GPIO
 	struct pinmux_range input;
 	struct pinmux_range output;
+	const struct pinmux_irq *gpio_irq;
+	unsigned int gpio_irq_size;
+#endif
+
 	struct pinmux_range function;
 
 	const struct sh_pfc_pin *pins;
@@ -295,9 +300,6 @@ struct sh_pfc_soc_info {
 	const u16 *pinmux_data;
 	unsigned int pinmux_data_size;
 
-	const struct pinmux_irq *gpio_irq;
-	unsigned int gpio_irq_size;
-
 	u32 unlock_reg;
 };
 
-- 
2.25.1

