Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB53B42BAB4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 10:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbhJMInq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 04:43:46 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19610 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238729AbhJMIno (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 04:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634114502; x=1665650502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2SfxK57vRWHEZrPMMA/I/4JeY6YI1pn+Pq8lPJzvFYk=;
  b=RXbXkwEUYEM8pQ6TJMWG2AUKxzn8gQU2iHESbkvxzx5haFBRjtfga/kd
   9Ja/GqmaCgcWjbRJlL4T6MTcrXiBjRR4K18jD+tzEjO8QP2WMsH4WceEi
   nFWFclQMMKFwhOSvavEEK5cJJFe1PrCQ5yOxVAoKMlIFr0tevwTRox1YR
   cjYSmlGZ7xsmujWof3kFpF/x6fDiXUqFA5ZNzXxNtfOxNcHlXI70QeWi0
   Y9z0gjAg0i1kndkKV6G/281OHRzYgR35lSXJ7ihNezS7w0Go82og46EGs
   bYOImjPdCGH3vJnfBYcINWER3t5dl35Xm4ZZ4wmwDfEDFC1DZTgtbJGBO
   w==;
IronPort-SDR: rRB1HVAnKZzbuOFDt3wOq3966HtGLzDXjFNbESo3l/cXxfc/HdD00t6L6fF4JOAUmgZ8FYYAUo
 cbwqE0cYaU0E17QyCDCElV9D+KCjPvTaMnIXcot0mWGaeGolt9K41mIIE7vMUKs7+qWi5qcIu/
 RkrBMK1lcRfZGNxnA5HUXa3fw1EQOqwoZSX67SbrMfNzGdcBlcZjX9kaObZqHsu2t68fDLCml2
 HIPUhyAK/qY8hjHR/hoTrvJbBjJLxAJ6PcDqZf19Joxlqc5yVhL38rm8WKT7ramXTb6orn+Rmm
 mjx5h3xJTp2wmwIm/d2xZfGi
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="140121183"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 01:41:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 01:41:41 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 01:41:39 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 2/2] pinctrl: microchip sgpio: use reset driver
Date:   Wed, 13 Oct 2021 10:42:17 +0200
Message-ID: <20211013084217.2298553-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013084217.2298553-1-horatiu.vultur@microchip.com>
References: <20211013084217.2298553-1-horatiu.vultur@microchip.com>
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
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 072bccdea2a5..e8a91d0824cb 100644
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
@@ -813,6 +815,10 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 
 	priv->dev = dev;
 
+	reset = devm_reset_control_get_shared(&pdev->dev, "switch");
+	if (!IS_ERR(reset))
+		reset_control_reset(reset);
+
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
-- 
2.33.0

