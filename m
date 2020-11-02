Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885D72A266A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 09:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgKBIyd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 03:54:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:47631 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727960AbgKBIyd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 03:54:33 -0500
IronPort-SDR: XqpctjZmgDbmjA+oQS8tzYaMAPEz10snycNWizGTQYGuceDfmD9eQ7iea+xsK8zSAPBOIwLvKu
 YnWKd8zgCgZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="148708873"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="148708873"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 00:54:31 -0800
IronPort-SDR: cVyAzr8doxaMI9PpzTeppD+DYNbkWDZgKifldHjUmuh0Q/0nmuSM2v8mFg5Ylm2dgUKEhekmdN
 Xul1PKelQEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="305380174"
Received: from lkp-server02.sh.intel.com (HELO 2b057d7acab6) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2020 00:54:27 -0800
Received: from kbuild by 2b057d7acab6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZVbf-00002x-6v; Mon, 02 Nov 2020 08:54:27 +0000
Date:   Mon, 2 Nov 2020 16:53:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [RFC PATCH] pinctrl: pinctrl-microchip-sgpio: properties_luton can
 be static
Message-ID: <20201102085330.GA17314@d07872ef61d7>
References: <20201029134027.232951-3-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029134027.232951-3-lars.povlsen@microchip.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 pinctrl-microchip-sgpio.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 1a9c01e2ad99f6..439779bc6e4e0b 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -58,7 +58,7 @@ struct sgpio_properties {
 #define SGPIO_F_PORT_CFG_BIT_SOURCE(p, x) __BF_PREP((p)->properties->bit_source, x)
 #define SGPIO_X_PORT_CFG_BIT_SOURCE(p, x) __BF_GET((p)->properties->bit_source, x)
 
-const struct sgpio_properties properties_luton = {
+static const struct sgpio_properties properties_luton = {
 	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
 	.auto_repeat = BIT(5),
 	.port_width  = GENMASK(3, 2),
@@ -66,7 +66,7 @@ const struct sgpio_properties properties_luton = {
 	.bit_source  = GENMASK(11, 0),
 };
 
-const struct sgpio_properties properties_ocelot = {
+static const struct sgpio_properties properties_ocelot = {
 	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
 	.auto_repeat = BIT(10),
 	.port_width  = GENMASK(8, 7),
@@ -74,7 +74,7 @@ const struct sgpio_properties properties_ocelot = {
 	.bit_source  = GENMASK(23, 12),
 };
 
-const struct sgpio_properties properties_sparx5 = {
+static const struct sgpio_properties properties_sparx5 = {
 	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
 	.auto_repeat = BIT(6),
 	.port_width  = GENMASK(4, 3),
