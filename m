Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356A2431298
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 10:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhJRI7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 04:59:01 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:64214 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbhJRI6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 04:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634547404; x=1666083404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dmu56FePmkD9SY8hzYkN3QZ2I6g48iWva5nUKCFMZ7o=;
  b=P+Eg/gReZJnVVgtD+jhSzLmRB2zqVWn7A0mgR4qvt9qxAfMN7ooDCycy
   I1afDJNVIBcCr7Z1C/fC2FiriJP1LbhuVSnq5x4Nn6q+eboyx/p5hDFbL
   SkOb5PnXZ7bNCPa1Ug/F29PdVZg57JZaOYMWkZr1MBjZXAGH6z9C++eiC
   DG+rz/QGjQI6D1XeM/nmbBOf8egfA6Kpx+B7rlAQIvtiKwS3L2ERQRjee
   ZuVoNmW6dCaKpUXZ/xnOLqlVd+ABhWwGCfHg/nRqVRjkGQXYb6yubNhMx
   +qVAYFDL2o0MUO7kYlj9jIAxdbNCk3qMtp6EB+dYDJBAE2UcJYnRH0AIj
   w==;
IronPort-SDR: ma6XuNJHNk0zBhi/s3TCpI6P3ozcJWelL9tvnJSOdsbxuS3NoFDUPOZHwMiuONyNI5BFQs7gjg
 RED/xQTkDp5GpiR3lClag3Attx5Ct4/7AbKon3jfrMmg9aJoVbsh1uRV3y3ga5/sdaZt2ZBC5U
 tnNwLNkvTQ7e+bKIh+zlHowXUtM2MVg+QXkPzIQUV1ElmWvCqjAG2Y6g6Og0n+Q+2S84NE1wOu
 R8bvUPgJD7SjUmD3jDqPA9f6bNpLSWYRJP1ZSO8Sr0BNw4pKDbRf7AxPjurevw7pMcTlwMdznC
 IcytAtXeQHpntk/T4NPRLn+7
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="148516571"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Oct 2021 01:56:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 18 Oct 2021 01:56:34 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 18 Oct 2021 01:56:32 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v6 2/2] pinctrl: microchip sgpio: use reset driver
Date:   Mon, 18 Oct 2021 10:57:54 +0200
Message-ID: <20211018085754.1066056-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
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
index 072bccdea2a5..78765faa245a 100644
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
 
+	reset = devm_reset_control_get_optional_shared(&pdev->dev, "switch");
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");
+	reset_control_reset(reset);
+
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
-- 
2.33.0

