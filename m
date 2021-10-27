Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F8243CB09
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 15:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242266AbhJ0Nrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 09:47:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:39040 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242235AbhJ0Nrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 09:47:46 -0400
X-IronPort-AV: E=Sophos;i="5.87,186,1631545200"; 
   d="scan'208";a="98370789"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Oct 2021 22:45:19 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 791A54010DD8;
        Wed, 27 Oct 2021 22:45:17 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] pinctrl: pinconf-generic: Add support for "output-impedance-ohms" to be extracted from DT files
Date:   Wed, 27 Oct 2021 14:45:07 +0100
Message-Id: <20211027134509.5036-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add "output-impedance-ohms" property to generic options used for DT
parsing files. This enables drivers, which use generic pin configurations,
to get the value passed to this property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1
 * Renamed PIN_CONFIG_OUTPUT_IMPEDANCE -> PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 * Renamed output-impedance to output-impedance-ohms
 * Included RB tags
 * Updated description and commit message
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 22e8d4c4040e..f8edcc88ac01 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -46,6 +46,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
+	PCONFDUMP(PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS, "output impedance", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
@@ -179,6 +180,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
 	{ "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
+	{ "output-impedance-ohms", PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS, 0 },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index eee0e3948537..2422211d6a5a 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -91,6 +91,8 @@ struct pinctrl_map;
  * 	configuration (eg. the currently selected mux function) drive values on
  * 	the line. Use argument 1 to enable output mode, argument 0 to disable
  * 	it.
+ * @PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: this will configure the output impedance
+ * 	of the pin with the value passed as argument. The argument is in ohms.
  * @PIN_CONFIG_PERSIST_STATE: retain pin state across sleep or controller reset
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
@@ -129,6 +131,7 @@ enum pin_config_param {
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_OUTPUT_ENABLE,
+	PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS,
 	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SKEW_DELAY,
-- 
2.17.1

