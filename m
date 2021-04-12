Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5AA35C84D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 16:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240857AbhDLOIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 10:08:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:3863 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238015AbhDLOIG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Apr 2021 10:08:06 -0400
IronPort-SDR: y719wU3Qo32tpDJcZOqfjP7Bls4/M+bnEFBhWg7RSLi2RkbBygWlu5STLb7AvBlz4VLwqbKp14
 NsS/KkpOF5kA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181324212"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="181324212"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 07:07:47 -0700
IronPort-SDR: C/0xSAiujeNrrjoW0Bhi0+oqN7bayy/LQ3uM5e1fWDRT+GXQ9Ry6BBAm35MUbpB5okilnMaMRP
 8dqHZ+48/jyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="382956085"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 12 Apr 2021 07:07:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7A09812A; Mon, 12 Apr 2021 17:07:59 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1 2/3] pinctrl: Introduce MODE group in enum pin_config_param
Date:   Mon, 12 Apr 2021 17:07:40 +0300
Message-Id: <20210412140741.39946-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
References: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Better to have a MODE group of settings to keep them together
when ordered alphabetically. Hence, rename PIN_CONFIG_LOW_POWER_MODE
to PIN_CONFIG_MODE_LOW_POWER.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinconf-generic.c       | 6 +++---
 drivers/pinctrl/pinctrl-lpc18xx.c       | 4 ++--
 drivers/pinctrl/pinctrl-single.c        | 6 +++---
 drivers/pinctrl/pinctrl-zynq.c          | 4 ++--
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c    | 4 ++--
 drivers/soc/tegra/pmc.c                 | 4 ++--
 include/linux/pinctrl/pinconf-generic.h | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 1e225d513988..22e8d4c4040e 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -43,7 +43,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL, false),
-	PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode", true),
+	PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
@@ -174,8 +174,8 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
 	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
 	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
-	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
-	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
+	{ "low-power-disable", PIN_CONFIG_MODE_LOW_POWER, 0 },
+	{ "low-power-enable", PIN_CONFIG_MODE_LOW_POWER, 1 },
 	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
 	{ "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 7b2f885e68bd..ed9bf2c89998 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -646,7 +646,7 @@ static const struct pin_config_item lpc18xx_conf_items[ARRAY_SIZE(lpc18xx_params
 static int lpc18xx_pconf_get_usb1(enum pin_config_param param, int *arg, u32 reg)
 {
 	switch (param) {
-	case PIN_CONFIG_LOW_POWER_MODE:
+	case PIN_CONFIG_MODE_LOW_POWER:
 		if (reg & LPC18XX_SCU_USB1_EPWR)
 			*arg = 0;
 		else
@@ -904,7 +904,7 @@ static int lpc18xx_pconf_set_usb1(struct pinctrl_dev *pctldev,
 				  u32 param_val, u32 *reg)
 {
 	switch (param) {
-	case PIN_CONFIG_LOW_POWER_MODE:
+	case PIN_CONFIG_MODE_LOW_POWER:
 		if (param_val)
 			*reg &= ~LPC18XX_SCU_USB1_EPWR;
 		else
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 39aac32ed09c..2c9c9835f375 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -533,7 +533,7 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH:
 		case PIN_CONFIG_SLEW_RATE:
-		case PIN_CONFIG_LOW_POWER_MODE:
+		case PIN_CONFIG_MODE_LOW_POWER:
 		default:
 			*config = data;
 			break;
@@ -571,7 +571,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			case PIN_CONFIG_INPUT_SCHMITT:
 			case PIN_CONFIG_DRIVE_STRENGTH:
 			case PIN_CONFIG_SLEW_RATE:
-			case PIN_CONFIG_LOW_POWER_MODE:
+			case PIN_CONFIG_MODE_LOW_POWER:
 				shift = ffs(func->conf[i].mask) - 1;
 				data &= ~func->conf[i].mask;
 				data |= (arg << shift) & func->conf[i].mask;
@@ -919,7 +919,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
 		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
 		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
-		{ "pinctrl-single,low-power-mode", PIN_CONFIG_LOW_POWER_MODE, },
+		{ "pinctrl-single,low-power-mode", PIN_CONFIG_MODE_LOW_POWER, },
 	};
 	static const struct pcs_conf_type prop4[] = {
 		{ "pinctrl-single,bias-pullup", PIN_CONFIG_BIAS_PULL_UP, },
diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index c6052a0e827a..5fb924a2eedd 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1016,7 +1016,7 @@ static int zynq_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_SLEW_RATE:
 		arg = !!(reg & ZYNQ_PINCONF_SPEED);
 		break;
-	case PIN_CONFIG_LOW_POWER_MODE:
+	case PIN_CONFIG_MODE_LOW_POWER:
 	{
 		enum zynq_io_standards iostd = zynq_pinconf_iostd_get(reg);
 
@@ -1087,7 +1087,7 @@ static int zynq_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 			reg &= ~ZYNQ_PINCONF_IOTYPE_MASK;
 			reg |= arg << ZYNQ_PINCONF_IOTYPE_SHIFT;
 			break;
-		case PIN_CONFIG_LOW_POWER_MODE:
+		case PIN_CONFIG_MODE_LOW_POWER:
 			if (arg)
 				reg |= ZYNQ_PINCONF_DISABLE_RECVR;
 			else
diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index eab029a21643..d2568dab8c78 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -194,7 +194,7 @@ static int pxa2xx_pconf_group_get(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pctl->lock, flags);
 	val = readl_relaxed(pgsr) & BIT(pin % 32);
-	*config = val ? PIN_CONFIG_LOW_POWER_MODE : 0;
+	*config = val ? PIN_CONFIG_MODE_LOW_POWER : 0;
 	spin_unlock_irqrestore(&pctl->lock, flags);
 
 	dev_dbg(pctl->dev, "get sleep gpio state(pin=%d) %d\n",
@@ -217,7 +217,7 @@ static int pxa2xx_pconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		switch (pinconf_to_config_param(configs[i])) {
-		case PIN_CONFIG_LOW_POWER_MODE:
+		case PIN_CONFIG_MODE_LOW_POWER:
 			is_set = pinconf_to_config_argument(configs[i]);
 			break;
 		default:
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6bd22359d411..8e3b78bb2ac2 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1904,7 +1904,7 @@ static int tegra_io_pad_pinconf_get(struct pinctrl_dev *pctl_dev,
 		arg = ret;
 		break;
 
-	case PIN_CONFIG_LOW_POWER_MODE:
+	case PIN_CONFIG_MODE_LOW_POWER:
 		ret = tegra_io_pad_is_powered(pmc, pad->id);
 		if (ret < 0)
 			return ret;
@@ -1941,7 +1941,7 @@ static int tegra_io_pad_pinconf_set(struct pinctrl_dev *pctl_dev,
 		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
-		case PIN_CONFIG_LOW_POWER_MODE:
+		case PIN_CONFIG_MODE_LOW_POWER:
 			if (arg)
 				err = tegra_io_pad_power_disable(pad->id);
 			else
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 188db8d84162..189e701832ea 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -76,7 +76,7 @@ struct pinctrl_map;
  * @PIN_CONFIG_INPUT_SCHMITT_ENABLE: control schmitt-trigger mode on the pin.
  *      If the argument != 0, schmitt-trigger mode is enabled. If it's 0,
  *      schmitt-trigger mode is disabled.
- * @PIN_CONFIG_LOW_POWER_MODE: this will configure the pin for low power
+ * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
  *	to indicate low power mode, argument 0 turns low power mode off.
@@ -124,7 +124,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
-	PIN_CONFIG_LOW_POWER_MODE,
+	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_OUTPUT_ENABLE,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_PERSIST_STATE,
-- 
2.30.2

