Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDEC35C853
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 16:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242117AbhDLOII (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 10:08:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:40962 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242140AbhDLOIH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Apr 2021 10:08:07 -0400
IronPort-SDR: mygq9Ag+MqqtGbnrypqnBzeTS2xrgZIsqP9mNq0OPJu+uFNlEyXIFsT1uSo/oxiX5tAPVd4NDu
 w2xl26uhKXOw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="193760847"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="193760847"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 07:07:48 -0700
IronPort-SDR: BGhmllKTW9Z6NxJaTifkLifZqnSkdcO9scHaBTB25wRZoe5QphRb0LEbp2FL3UNZKlNiKHbYCP
 nPUCxGNhF57w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="599997938"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2021 07:07:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8AF161D2; Mon, 12 Apr 2021 17:08:00 +0300 (EEST)
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
Subject: [PATCH v1 3/3] pinctrl: Add PIN_CONFIG_MODE_PWM to enum pin_config_param
Date:   Mon, 12 Apr 2021 17:07:41 +0300
Message-Id: <20210412140741.39946-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
References: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It seems that we will have more and more pin controllers that support
PWM function on the (selected) pins. Due to it being a part of pin
controller IP the idea is to have some code that will switch the mode
and attach the corresponding driver, for example, via using it as
a library. Meanwhile, put a corresponding item to the pin_config_param
enumerator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pinctrl/pinconf-generic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 189e701832ea..e18ab3d5908f 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -80,6 +80,7 @@ struct pinctrl_map;
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
  *	to indicate low power mode, argument 0 turns low power mode off.
+ * @PIN_CONFIG_MODE_PWM: this will configure the pin for PWM
  * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
  * 	without driving a value there. For most platforms this reduces to
  * 	enable the output buffers and then let the pin controller current
@@ -125,6 +126,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_MODE_LOW_POWER,
+	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT_ENABLE,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_PERSIST_STATE,
-- 
2.30.2

