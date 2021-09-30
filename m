Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D231C41D98F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350819AbhI3MTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:19:06 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43517 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1350818AbhI3MTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 08:19:05 -0400
X-IronPort-AV: E=Sophos;i="5.85,336,1624287600"; 
   d="scan'208";a="95535895"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2021 21:17:21 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2FC1D437E760;
        Thu, 30 Sep 2021 21:17:19 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/4] pinctrl: pinconf-generic: Add support for "output-impedance" to be extracted from DT files
Date:   Thu, 30 Sep 2021 13:16:28 +0100
Message-Id: <20210930121630.17449-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add "output-impedance" property to generic options used for DT parsing
files. This enables drivers, which use generic pin configurations, to
get the value passed to this property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 22e8d4c4040e..3bff4e4340b9 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -46,6 +46,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
+	PCONFDUMP(PIN_CONFIG_OUTPUT_IMPEDANCE, "output impedance", "ohm", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
 	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
@@ -179,6 +180,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
 	{ "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
+	{ "output-impedance", PIN_CONFIG_OUTPUT_IMPEDANCE, 0 },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
 	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index eee0e3948537..e6293ebd4052 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -91,6 +91,8 @@ struct pinctrl_map;
  * 	configuration (eg. the currently selected mux function) drive values on
  * 	the line. Use argument 1 to enable output mode, argument 0 to disable
  * 	it.
+ * @PIN_CONFIG_OUTPUT_IMPEDANCE: this will configure the pins output impedance with
+ *	 the value passed as argument. The argument is in ohm.
  * @PIN_CONFIG_PERSIST_STATE: retain pin state across sleep or controller reset
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
@@ -129,6 +131,7 @@ enum pin_config_param {
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_OUTPUT_ENABLE,
+	PIN_CONFIG_OUTPUT_IMPEDANCE,
 	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SKEW_DELAY,
-- 
2.17.1

