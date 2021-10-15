Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9F142F5CA
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240583AbhJOOn4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:43:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:13336 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240605AbhJOOny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 10:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634308908; x=1665844908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9tJXikfeFqXFLvozQFAnutFEBzkbc2DDc4AO1Qx2cbM=;
  b=UsQdzRnaBhFZnNEg1Y5KDI/eHp6ri+mWpO95TE1+RHVLd39/V1CAt2Vf
   GHEEv4b13WT4GWuZZkf6ScNCwTB5jYNVpDF+XJnw77g3MwTfbxrUvJlnw
   PyTSMRws0ZTO7sPg3Mw9JsZT/lDGtEPCN4bVc8yhYtTx2cPBvtyvg3qTy
   OtKEGUNSu+glDpyqM52noIpY78C9WqN6hH2VNX0lglEPmgekpr46oOwnE
   dva1CTih36lCJ8yys+dxwmCG2XxwsTnOXWyTqp9c0CVDsMthE6FZKi3+D
   NS2DIM14HIng5P9VrQTv4xYJnoS0VvrKJGQtZI8/VSTsFczjpGGUq0SqE
   g==;
IronPort-SDR: W+oc4kns8kbpohM77eURWSvCXnQ6UdX23+EvT8brmt8ax1TGMenE7BPUKJ33A9JjOhlXJ/oxhd
 +gZmonQyr7MSTDy1Sq4Q3bWeTrBKdjrB3SKg2UaVhtKNg2620SRKcze96J+eVJKsGwNpqFcUWp
 yTWLDS2mQC0ld0iiH1UK1EY6VqXDfRRA0+XUlHm1WadT6ylpL0SJ9oshRXk4wUm7iEEmMRwsOz
 VPYERhwyZM4pG01Wd9QLdSkZbKt1Jzr97wOEbU2AU1Kgr9R9t+tTtZLj+qHAVhQjfSB+ogG+q8
 ByTikYQwE4jMLgqBRXpJf8Zr
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; 
   d="scan'208";a="135665731"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2021 07:41:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 07:41:46 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 07:41:44 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v5 2/2] pinctrl: microchip sgpio: use reset driver
Date:   Fri, 15 Oct 2021 16:42:59 +0200
Message-ID: <20211015144259.219909-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015144259.219909-1-horatiu.vultur@microchip.com>
References: <20211015144259.219909-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On lan966x platform when the switch gets reseted then also the sgpio
gets reseted. The fix for this is to extend also the sgpio driver to
call the reset driver which will be reseted only once by the first
driver that is probed.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 072bccdea2a5..529808c5af18 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -803,6 +804,7 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 	int div_clock = 0, ret, port, i, nbanks;
 	struct device *dev = &pdev->dev;
 	struct fwnode_handle *fwnode;
+	struct reset_control *reset;
 	struct sgpio_priv *priv;
 	struct clk *clk;
 	u32 val;
@@ -813,6 +815,11 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 
 	priv->dev = dev;
 
+	reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");
+	reset_control_reset(reset);
+
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
-- 
2.33.0

