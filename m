Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D325D8DE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfGCAaW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:30:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:11577 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfGCAaW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jul 2019 20:30:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jul 2019 17:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; 
   d="scan'208";a="184619587"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jul 2019 17:30:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A1D6843; Wed,  3 Jul 2019 03:30:19 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: baytrail: Re-use data structures from pinctrl-intel.h
Date:   Wed,  3 Jul 2019 03:30:18 +0300
Message-Id: <20190703003018.75186-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
References: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have some data structures duplicated across the drivers.
Let's deduplicate them by using ones that being provided by
pinctrl-intel.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 299 +++++------------------
 1 file changed, 60 insertions(+), 239 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index c72d831ca8b6..bfde1c710bd9 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -24,6 +24,8 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
+#include "pinctrl-intel.h"
+
 /* memory mapped register offsets */
 #define BYT_CONF0_REG		0x000
 #define BYT_CONF1_REG		0x004
@@ -98,34 +100,6 @@ struct byt_gpio_pin_context {
 	u32 val;
 };
 
-struct byt_simple_func_mux {
-	const char *name;
-	unsigned short func;
-};
-
-struct byt_mixed_func_mux {
-	const char *name;
-	const unsigned short *func_values;
-};
-
-struct byt_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	size_t npins;
-	unsigned short has_simple_funcs;
-	union {
-		const struct byt_simple_func_mux *simple_funcs;
-		const struct byt_mixed_func_mux *mixed_funcs;
-	};
-	size_t nfuncs;
-};
-
-struct byt_function {
-	const char *name;
-	const char * const *groups;
-	size_t ngroups;
-};
-
 struct byt_community {
 	unsigned int pin_base;
 	size_t npins;
@@ -133,47 +107,6 @@ struct byt_community {
 	void __iomem *reg_base;
 };
 
-#define SIMPLE_FUNC(n, f)	\
-	{			\
-		.name	= (n),	\
-		.func	= (f),	\
-	}
-#define MIXED_FUNC(n, f)		\
-	{				\
-		.name		= (n),	\
-		.func_values	= (f),	\
-	}
-
-#define PIN_GROUP_SIMPLE(n, p, f)				\
-	{							\
-		.name			= (n),			\
-		.pins			= (p),			\
-		.npins			= ARRAY_SIZE((p)),	\
-		.has_simple_funcs	= 1,			\
-		{						\
-			.simple_funcs		= (f),		\
-		},						\
-		.nfuncs			= ARRAY_SIZE((f)),	\
-	}
-#define PIN_GROUP_MIXED(n, p, f)				\
-	{							\
-		.name			= (n),			\
-		.pins			= (p),			\
-		.npins			= ARRAY_SIZE((p)),	\
-		.has_simple_funcs	= 0,			\
-		{						\
-			.mixed_funcs		= (f),		\
-		},						\
-		.nfuncs			= ARRAY_SIZE((f)),	\
-	}
-
-#define FUNCTION(n, g)					\
-	{						\
-		.name		= (n),			\
-		.groups		= (g),			\
-		.ngroups	= ARRAY_SIZE((g)),	\
-	}
-
 #define COMMUNITY(p, n, map)		\
 	{				\
 		.pin_base	= (p),	\
@@ -185,9 +118,9 @@ struct byt_pinctrl_soc_data {
 	const char *uid;
 	const struct pinctrl_pin_desc *pins;
 	size_t npins;
-	const struct byt_pingroup *groups;
+	const struct intel_pingroup *groups;
 	size_t ngroups;
-	const struct byt_function *functions;
+	const struct intel_function *functions;
 	size_t nfunctions;
 	const struct byt_community *communities;
 	size_t ncommunities;
@@ -327,20 +260,11 @@ static const unsigned int byt_score_pins_map[BYT_NGPIO_SCORE] = {
 /* SCORE groups */
 static const unsigned int byt_score_uart1_pins[] = { 70, 71, 72, 73 };
 static const unsigned int byt_score_uart2_pins[] = { 74, 75, 76, 77 };
-static const struct byt_simple_func_mux byt_score_uart_mux[] = {
-	SIMPLE_FUNC("uart", 1),
-};
 
 static const unsigned int byt_score_pwm0_pins[] = { 94 };
 static const unsigned int byt_score_pwm1_pins[] = { 95 };
-static const struct byt_simple_func_mux byt_score_pwm_mux[] = {
-	SIMPLE_FUNC("pwm", 1),
-};
 
 static const unsigned int byt_score_sio_spi_pins[] = { 66, 67, 68, 69 };
-static const struct byt_simple_func_mux byt_score_spi_mux[] = {
-	SIMPLE_FUNC("spi", 1),
-};
 
 static const unsigned int byt_score_i2c5_pins[] = { 88, 89 };
 static const unsigned int byt_score_i2c6_pins[] = { 90, 91 };
@@ -349,50 +273,29 @@ static const unsigned int byt_score_i2c3_pins[] = { 84, 85 };
 static const unsigned int byt_score_i2c2_pins[] = { 82, 83 };
 static const unsigned int byt_score_i2c1_pins[] = { 80, 81 };
 static const unsigned int byt_score_i2c0_pins[] = { 78, 79 };
-static const struct byt_simple_func_mux byt_score_i2c_mux[] = {
-	SIMPLE_FUNC("i2c", 1),
-};
 
 static const unsigned int byt_score_ssp0_pins[] = { 8, 9, 10, 11 };
 static const unsigned int byt_score_ssp1_pins[] = { 12, 13, 14, 15 };
 static const unsigned int byt_score_ssp2_pins[] = { 62, 63, 64, 65 };
-static const struct byt_simple_func_mux byt_score_ssp_mux[] = {
-	SIMPLE_FUNC("ssp", 1),
-};
 
 static const unsigned int byt_score_sdcard_pins[] = {
 	7, 33, 34, 35, 36, 37, 38, 39, 40, 41,
 };
-static const unsigned short byt_score_sdcard_mux_values[] = {
+static const unsigned int byt_score_sdcard_mux_values[] = {
 	2, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 };
-static const struct byt_mixed_func_mux byt_score_sdcard_mux[] = {
-	MIXED_FUNC("sdcard", byt_score_sdcard_mux_values),
-};
 
 static const unsigned int byt_score_sdio_pins[] = { 27, 28, 29, 30, 31, 32 };
-static const struct byt_simple_func_mux byt_score_sdio_mux[] = {
-	SIMPLE_FUNC("sdio", 1),
-};
 
 static const unsigned int byt_score_emmc_pins[] = {
 	16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
 };
-static const struct byt_simple_func_mux byt_score_emmc_mux[] = {
-	SIMPLE_FUNC("emmc", 1),
-};
 
 static const unsigned int byt_score_ilb_lpc_pins[] = {
 	42, 43, 44, 45, 46, 47, 48, 49, 50,
 };
-static const struct byt_simple_func_mux byt_score_lpc_mux[] = {
-	SIMPLE_FUNC("lpc", 1),
-};
 
 static const unsigned int byt_score_sata_pins[] = { 0, 1, 2 };
-static const struct byt_simple_func_mux byt_score_sata_mux[] = {
-	SIMPLE_FUNC("sata", 1),
-};
 
 static const unsigned int byt_score_plt_clk0_pins[] = { 96 };
 static const unsigned int byt_score_plt_clk1_pins[] = { 97 };
@@ -400,70 +303,37 @@ static const unsigned int byt_score_plt_clk2_pins[] = { 98 };
 static const unsigned int byt_score_plt_clk3_pins[] = { 99 };
 static const unsigned int byt_score_plt_clk4_pins[] = { 100 };
 static const unsigned int byt_score_plt_clk5_pins[] = { 101 };
-static const struct byt_simple_func_mux byt_score_plt_clk_mux[] = {
-	SIMPLE_FUNC("plt_clk", 1),
-};
 
 static const unsigned int byt_score_smbus_pins[] = { 51, 52, 53 };
-static const struct byt_simple_func_mux byt_score_smbus_mux[] = {
-	SIMPLE_FUNC("smbus", 1),
-};
 
-static const struct byt_pingroup byt_score_groups[] = {
-	PIN_GROUP_SIMPLE("uart1_grp",
-			 byt_score_uart1_pins, byt_score_uart_mux),
-	PIN_GROUP_SIMPLE("uart2_grp",
-			 byt_score_uart2_pins, byt_score_uart_mux),
-	PIN_GROUP_SIMPLE("pwm0_grp",
-			 byt_score_pwm0_pins, byt_score_pwm_mux),
-	PIN_GROUP_SIMPLE("pwm1_grp",
-			 byt_score_pwm1_pins, byt_score_pwm_mux),
-	PIN_GROUP_SIMPLE("ssp2_grp",
-			 byt_score_ssp2_pins, byt_score_pwm_mux),
-	PIN_GROUP_SIMPLE("sio_spi_grp",
-			 byt_score_sio_spi_pins, byt_score_spi_mux),
-	PIN_GROUP_SIMPLE("i2c5_grp",
-			 byt_score_i2c5_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("i2c6_grp",
-			 byt_score_i2c6_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("i2c4_grp",
-			 byt_score_i2c4_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("i2c3_grp",
-			 byt_score_i2c3_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("i2c2_grp",
-			 byt_score_i2c2_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("i2c1_grp",
-			 byt_score_i2c1_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("i2c0_grp",
-			 byt_score_i2c0_pins, byt_score_i2c_mux),
-	PIN_GROUP_SIMPLE("ssp0_grp",
-			 byt_score_ssp0_pins, byt_score_ssp_mux),
-	PIN_GROUP_SIMPLE("ssp1_grp",
-			 byt_score_ssp1_pins, byt_score_ssp_mux),
-	PIN_GROUP_MIXED("sdcard_grp",
-			byt_score_sdcard_pins, byt_score_sdcard_mux),
-	PIN_GROUP_SIMPLE("sdio_grp",
-			 byt_score_sdio_pins, byt_score_sdio_mux),
-	PIN_GROUP_SIMPLE("emmc_grp",
-			 byt_score_emmc_pins, byt_score_emmc_mux),
-	PIN_GROUP_SIMPLE("lpc_grp",
-			 byt_score_ilb_lpc_pins, byt_score_lpc_mux),
-	PIN_GROUP_SIMPLE("sata_grp",
-			 byt_score_sata_pins, byt_score_sata_mux),
-	PIN_GROUP_SIMPLE("plt_clk0_grp",
-			 byt_score_plt_clk0_pins, byt_score_plt_clk_mux),
-	PIN_GROUP_SIMPLE("plt_clk1_grp",
-			 byt_score_plt_clk1_pins, byt_score_plt_clk_mux),
-	PIN_GROUP_SIMPLE("plt_clk2_grp",
-			 byt_score_plt_clk2_pins, byt_score_plt_clk_mux),
-	PIN_GROUP_SIMPLE("plt_clk3_grp",
-			 byt_score_plt_clk3_pins, byt_score_plt_clk_mux),
-	PIN_GROUP_SIMPLE("plt_clk4_grp",
-			 byt_score_plt_clk4_pins, byt_score_plt_clk_mux),
-	PIN_GROUP_SIMPLE("plt_clk5_grp",
-			 byt_score_plt_clk5_pins, byt_score_plt_clk_mux),
-	PIN_GROUP_SIMPLE("smbus_grp",
-			 byt_score_smbus_pins, byt_score_smbus_mux),
+static const struct intel_pingroup byt_score_groups[] = {
+	PIN_GROUP("uart1_grp", byt_score_uart1_pins, 1),
+	PIN_GROUP("uart2_grp", byt_score_uart2_pins, 1),
+	PIN_GROUP("pwm0_grp", byt_score_pwm0_pins, 1),
+	PIN_GROUP("pwm1_grp", byt_score_pwm1_pins, 1),
+	PIN_GROUP("ssp2_grp", byt_score_ssp2_pins, 1),
+	PIN_GROUP("sio_spi_grp", byt_score_sio_spi_pins, 1),
+	PIN_GROUP("i2c5_grp", byt_score_i2c5_pins, 1),
+	PIN_GROUP("i2c6_grp", byt_score_i2c6_pins, 1),
+	PIN_GROUP("i2c4_grp", byt_score_i2c4_pins, 1),
+	PIN_GROUP("i2c3_grp", byt_score_i2c3_pins, 1),
+	PIN_GROUP("i2c2_grp", byt_score_i2c2_pins, 1),
+	PIN_GROUP("i2c1_grp", byt_score_i2c1_pins, 1),
+	PIN_GROUP("i2c0_grp", byt_score_i2c0_pins, 1),
+	PIN_GROUP("ssp0_grp", byt_score_ssp0_pins, 1),
+	PIN_GROUP("ssp1_grp", byt_score_ssp1_pins, 1),
+	PIN_GROUP("sdcard_grp", byt_score_sdcard_pins, byt_score_sdcard_mux_values),
+	PIN_GROUP("sdio_grp", byt_score_sdio_pins, 1),
+	PIN_GROUP("emmc_grp", byt_score_emmc_pins, 1),
+	PIN_GROUP("lpc_grp", byt_score_ilb_lpc_pins, 1),
+	PIN_GROUP("sata_grp", byt_score_sata_pins, 1),
+	PIN_GROUP("plt_clk0_grp", byt_score_plt_clk0_pins, 1),
+	PIN_GROUP("plt_clk1_grp", byt_score_plt_clk1_pins, 1),
+	PIN_GROUP("plt_clk2_grp", byt_score_plt_clk2_pins, 1),
+	PIN_GROUP("plt_clk3_grp", byt_score_plt_clk3_pins, 1),
+	PIN_GROUP("plt_clk4_grp", byt_score_plt_clk4_pins, 1),
+	PIN_GROUP("plt_clk5_grp", byt_score_plt_clk5_pins, 1),
+	PIN_GROUP("smbus_grp", byt_score_smbus_pins, 1),
 };
 
 static const char * const byt_score_uart_groups[] = {
@@ -497,10 +367,9 @@ static const char * const byt_score_gpio_groups[] = {
 	"sdcard_grp", "sdio_grp", "emmc_grp", "lpc_grp", "sata_grp",
 	"plt_clk0_grp", "plt_clk1_grp", "plt_clk2_grp", "plt_clk3_grp",
 	"plt_clk4_grp", "plt_clk5_grp", "smbus_grp",
-
 };
 
-static const struct byt_function byt_score_functions[] = {
+static const struct intel_function byt_score_functions[] = {
 	FUNCTION("uart", byt_score_uart_groups),
 	FUNCTION("pwm", byt_score_pwm_groups),
 	FUNCTION("ssp", byt_score_ssp_groups),
@@ -589,38 +458,30 @@ static const unsigned int byt_sus_pins_map[BYT_NGPIO_SUS] = {
 };
 
 static const unsigned int byt_sus_usb_over_current_pins[] = { 19, 20 };
-static const struct byt_simple_func_mux byt_sus_usb_oc_mux[] = {
-	SIMPLE_FUNC("usb", 0),
-	SIMPLE_FUNC("gpio", 1),
-};
+static const unsigned int byt_sus_usb_over_current_mode_values[] = { 0, 0 };
+static const unsigned int byt_sus_usb_over_current_gpio_mode_values[] = { 1, 1 };
 
 static const unsigned int byt_sus_usb_ulpi_pins[] = {
 	14, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43,
 };
-static const unsigned short byt_sus_usb_ulpi_mode_values[] = {
+static const unsigned int byt_sus_usb_ulpi_mode_values[] = {
 	2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
 };
-static const unsigned short byt_sus_usb_ulpi_gpio_mode_values[] = {
-	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
-};
-static const struct byt_mixed_func_mux byt_sus_usb_ulpi_mux[] = {
-	MIXED_FUNC("usb", byt_sus_usb_ulpi_mode_values),
-	MIXED_FUNC("gpio", byt_sus_usb_ulpi_gpio_mode_values),
+static const unsigned int byt_sus_usb_ulpi_gpio_mode_values[] = {
+	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 };
 
 static const unsigned int byt_sus_pcu_spi_pins[] = { 21 };
-static const struct byt_simple_func_mux byt_sus_pcu_spi_mux[] = {
-	SIMPLE_FUNC("spi", 0),
-	SIMPLE_FUNC("gpio", 1),
-};
+static const unsigned int byt_sus_pcu_spi_mode_values[] = { 0 };
+static const unsigned int byt_sus_pcu_spi_gpio_mode_values[] = { 1 };
 
-static const struct byt_pingroup byt_sus_groups[] = {
-	PIN_GROUP_SIMPLE("usb_oc_grp",
-			byt_sus_usb_over_current_pins, byt_sus_usb_oc_mux),
-	PIN_GROUP_MIXED("usb_ulpi_grp",
-			byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_mux),
-	PIN_GROUP_SIMPLE("pcu_spi_grp",
-			byt_sus_pcu_spi_pins, byt_sus_pcu_spi_mux),
+static const struct intel_pingroup byt_sus_groups[] = {
+	PIN_GROUP("usb_oc_grp", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_mode_values),
+	PIN_GROUP("usb_ulpi_grp", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_mode_values),
+	PIN_GROUP("pcu_spi_grp", byt_sus_pcu_spi_pins, byt_sus_pcu_spi_mode_values),
+	PIN_GROUP("usb_oc_grp_gpio", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_gpio_mode_values),
+	PIN_GROUP("usb_ulpi_grp_gpio", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_gpio_mode_values),
+	PIN_GROUP("pcu_spi_grp_gpio", byt_sus_pcu_spi_pins, byt_sus_pcu_spi_gpio_mode_values),
 };
 
 static const char * const byt_sus_usb_groups[] = {
@@ -628,10 +489,10 @@ static const char * const byt_sus_usb_groups[] = {
 };
 static const char * const byt_sus_spi_groups[] = { "pcu_spi_grp" };
 static const char * const byt_sus_gpio_groups[] = {
-	"usb_oc_grp", "usb_ulpi_grp", "pcu_spi_grp",
+	"usb_oc_grp_gpio", "usb_ulpi_grp_gpio", "pcu_spi_grp_gpio",
 };
 
-static const struct byt_function byt_sus_functions[] = {
+static const struct intel_function byt_sus_functions[] = {
 	FUNCTION("usb", byt_sus_usb_groups),
 	FUNCTION("spi", byt_sus_spi_groups),
 	FUNCTION("gpio", byt_sus_gpio_groups),
@@ -811,41 +672,9 @@ static int byt_get_function_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int byt_get_group_simple_mux(const struct byt_pingroup group,
-				    const char *func_name,
-				    unsigned short *func)
-{
-	int i;
-
-	for (i = 0; i < group.nfuncs; i++) {
-		if (!strcmp(group.simple_funcs[i].name, func_name)) {
-			*func = group.simple_funcs[i].func;
-			return 0;
-		}
-	}
-
-	return 1;
-}
-
-static int byt_get_group_mixed_mux(const struct byt_pingroup group,
-				   const char *func_name,
-				   const unsigned short **func)
-{
-	int i;
-
-	for (i = 0; i < group.nfuncs; i++) {
-		if (!strcmp(group.mixed_funcs[i].name, func_name)) {
-			*func = group.mixed_funcs[i].func_values;
-			return 0;
-		}
-	}
-
-	return 1;
-}
-
 static void byt_set_group_simple_mux(struct byt_gpio *vg,
-				     const struct byt_pingroup group,
-				     unsigned short func)
+				     const struct intel_pingroup group,
+				     unsigned int func)
 {
 	unsigned long flags;
 	int i;
@@ -874,8 +703,8 @@ static void byt_set_group_simple_mux(struct byt_gpio *vg,
 }
 
 static void byt_set_group_mixed_mux(struct byt_gpio *vg,
-				    const struct byt_pingroup group,
-				    const unsigned short *func)
+				    const struct intel_pingroup group,
+				    const unsigned int *func)
 {
 	unsigned long flags;
 	int i;
@@ -907,23 +736,15 @@ static int byt_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
 		       unsigned int group_selector)
 {
 	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
-	const struct byt_function func = vg->soc_data->functions[func_selector];
-	const struct byt_pingroup group = vg->soc_data->groups[group_selector];
-	const unsigned short *mixed_func;
-	unsigned short simple_func;
-	int ret = 1;
-
-	if (group.has_simple_funcs)
-		ret = byt_get_group_simple_mux(group, func.name, &simple_func);
-	else
-		ret = byt_get_group_mixed_mux(group, func.name, &mixed_func);
+	const struct intel_function func = vg->soc_data->functions[func_selector];
+	const struct intel_pingroup group = vg->soc_data->groups[group_selector];
 
-	if (ret)
+	if (group.modes)
+		byt_set_group_mixed_mux(vg, group, group.modes);
+	else if (!strcmp(func.name, "gpio"))
 		byt_set_group_simple_mux(vg, group, BYT_DEFAULT_GPIO_MUX);
-	else if (group.has_simple_funcs)
-		byt_set_group_simple_mux(vg, group, simple_func);
 	else
-		byt_set_group_mixed_mux(vg, group, mixed_func);
+		byt_set_group_simple_mux(vg, group, group.mode);
 
 	return 0;
 }
-- 
2.20.1

