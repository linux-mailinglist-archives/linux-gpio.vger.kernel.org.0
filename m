Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B9814BD3C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 16:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgA1PuJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 10:50:09 -0500
Received: from mga12.intel.com ([192.55.52.136]:43034 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbgA1PuJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 10:50:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 07:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; 
   d="scan'208";a="222143503"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Jan 2020 07:49:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 60C7413F; Tue, 28 Jan 2020 17:49:50 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Sort entries in database for PIN CONTROLLER
Date:   Tue, 28 Jan 2020 17:49:49 +0200
Message-Id: <20200128154949.66521-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Run parse-maintainers.pl and choose PIN CONTROLLER records.
Fix them accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e9951659c52..39b7dfb9006f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2727,8 +2727,8 @@ L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/pinctrl/aspeed/
 F:	Documentation/devicetree/bindings/pinctrl/aspeed,*
+F:	drivers/pinctrl/aspeed/
 
 ASPEED SCU INTERRUPT CONTROLLER DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
@@ -13181,21 +13181,13 @@ K:	\b(clone_args|kernel_clone_args)\b
 PIN CONTROL SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-gpio@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 F:	Documentation/devicetree/bindings/pinctrl/
 F:	Documentation/driver-api/pinctl.rst
 F:	drivers/pinctrl/
 F:	include/linux/pinctrl/
 
-PIN CONTROLLER - MICROCHIP AT91
-M:	Ludovic Desroches <ludovic.desroches@microchip.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-gpio@vger.kernel.org
-S:	Supported
-F:	drivers/pinctrl/pinctrl-at91*
-F:	drivers/gpio/gpio-sama5d2-piobu.c
-
 PIN CONTROLLER - FREESCALE
 M:	Dong Aisheng <aisheng.dong@nxp.com>
 M:	Fabio Estevam <festevam@gmail.com>
@@ -13204,14 +13196,14 @@ M:	Stefan Agner <stefan@agner.ch>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/pinctrl/freescale/
 F:	Documentation/devicetree/bindings/pinctrl/fsl,*
+F:	drivers/pinctrl/freescale/
 
 PIN CONTROLLER - INTEL
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 M:	Andy Shevchenko <andy@kernel.org>
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
 F:	drivers/pinctrl/intel/
 
 PIN CONTROLLER - MEDIATEK
@@ -13222,18 +13214,26 @@ F:	Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
 F:	Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
 F:	drivers/pinctrl/mediatek/
 
+PIN CONTROLLER - MICROCHIP AT91
+M:	Ludovic Desroches <ludovic.desroches@microchip.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-gpio@vger.kernel.org
+S:	Supported
+F:	drivers/gpio/gpio-sama5d2-piobu.c
+F:	drivers/pinctrl/pinctrl-at91*
+
 PIN CONTROLLER - QUALCOMM
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
-S:	Maintained
 L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/qcom,*.txt
 F:	drivers/pinctrl/qcom/
 
 PIN CONTROLLER - RENESAS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
 F:	drivers/pinctrl/pinctrl-rz*
 F:	drivers/pinctrl/sh-pfc/
 
@@ -13243,12 +13243,12 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
-Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
+Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+F:	Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
 F:	drivers/pinctrl/samsung/
 F:	include/dt-bindings/pinctrl/samsung.h
-F:	Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
 
 PIN CONTROLLER - SINGLE
 M:	Tony Lindgren <tony@atomide.com>
@@ -13261,8 +13261,8 @@ F:	drivers/pinctrl/pinctrl-single.c
 PIN CONTROLLER - ST SPEAR
 M:	Viresh Kumar <vireshk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-W:	http://www.st.com/spear
 S:	Maintained
+W:	http://www.st.com/spear
 F:	drivers/pinctrl/spear/
 
 PISTACHIO SOC SUPPORT
-- 
2.24.1

