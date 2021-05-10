Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832FE3797EB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhEJTsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:48:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:34075 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232236AbhEJTsF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:48:05 -0400
IronPort-SDR: gqLq3H3YuO4qODn+bF4vHy9OG/UpXsSXGWDgKRy4aDbD3yR1ni7LYWZ+T9e/CdLTYO2AVzncj9
 9YEOxcsJaNjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186718681"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="186718681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:46:59 -0700
IronPort-SDR: fu6qRqu8qZdnx0slxO9Gl6e2u1qA/TFTB4AwEqt0IguyolHLtQQ+NTyZ2i/ALhoIRd3Kc+TRrc
 sIm+gXZSQYsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="541340834"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2021 12:46:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8F616D7; Mon, 10 May 2021 22:47:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] pinctrl: Keep enum pin_config_param ordered by name (part 2)
Date:   Mon, 10 May 2021 22:47:17 +0300
Message-Id: <20210510194717.12255-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It seems the ordering is by name. Keep it that way.
Here updating the entire list (there were two more options not in order).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pinctrl/pinconf-generic.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index e18ab3d5908f..98ed5959ca9a 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -81,28 +81,28 @@ struct pinctrl_map;
  *	passed in the argument on a custom form, else just use argument 1
  *	to indicate low power mode, argument 0 turns low power mode off.
  * @PIN_CONFIG_MODE_PWM: this will configure the pin for PWM
+ * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
+ * 	value on the line. Use argument 1 to indicate high level, argument 0 to
+ *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
+ *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
  * 	without driving a value there. For most platforms this reduces to
  * 	enable the output buffers and then let the pin controller current
  * 	configuration (eg. the currently selected mux function) drive values on
  * 	the line. Use argument 1 to enable output mode, argument 0 to disable
  * 	it.
- * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
- * 	value on the line. Use argument 1 to indicate high level, argument 0 to
- *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
- *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_PERSIST_STATE: retain pin state across sleep or controller reset
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
  *	the driver which alternative power source to use.
- * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
- * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
- *	this parameter (on a custom format) tells the driver which alternative
- *	slew rate to use.
  * @PIN_CONFIG_SKEW_DELAY: if the pin has programmable skew rate (on inputs)
  *	or latch delay (on outputs) this parameter (in a custom format)
  *	specifies the clock skew or latch delay. It typically controls how
  *	many double inverters are put in front of the line.
+ * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
+ * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
+ *	this parameter (on a custom format) tells the driver which alternative
+ *	slew rate to use.
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
@@ -127,13 +127,13 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
-	PIN_CONFIG_OUTPUT_ENABLE,
 	PIN_CONFIG_OUTPUT,
+	PIN_CONFIG_OUTPUT_ENABLE,
 	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_POWER_SOURCE,
+	PIN_CONFIG_SKEW_DELAY,
 	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
-	PIN_CONFIG_SKEW_DELAY,
 	PIN_CONFIG_END = 0x7F,
 	PIN_CONFIG_MAX = 0xFF,
 };
-- 
2.30.2

