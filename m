Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC3542A449
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 14:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhJLMZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 08:25:11 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:40467 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbhJLMZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 08:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634041390; x=1665577390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2SfxK57vRWHEZrPMMA/I/4JeY6YI1pn+Pq8lPJzvFYk=;
  b=ZcWIhaO3dwkGN//pXdPvM9Zs/UGPg4SMLd/5+RUL0JNdth+YdpExRUqy
   tWKt09EBy/8l+DqsDyN/h9WorspBuxF7q0/E3rq8g4r/0KgxkwMQVqFMW
   vSzA070GCH0A9HB/kLdWR4rOcqz6sXMvDzVkheXLauwxFwddMYzMejj7X
   WiQw6s/LAZFLsGowCExhW8YFepHX/Wgi9HPXamwFaSxxrfyr/TpWNyuOR
   PvazAvZ4N3Ljcu5eZRwA0chQaiim0as+Nuxz1GgmDnLnWF49wk23bY4TJ
   t4F/w6VnVKv0U5g7Fvvzm8mpNaiPiTQQjIzcU5s2k8kyAZcfqX0oSzjYM
   Q==;
IronPort-SDR: kUJmdcpXewFX2mpXw7sJ01Se7cqsg36TfUOlLLul1+v9j472YREF+WdaT8kXO7Q5CKyaRDoblo
 5b9Kix/6QfsSlXlCN4Kuv5DPfqkMlySUCazsy7mhiy/6kZnukjRd3f+1tVSbHux2wjY3RpR0pM
 IlyvPAvjBclwBCWs3WaDwRGXIDxmCIX7cvQgo7t6av0w2Fwpqiw3FuKI87FpDYfsWP/Ytav0JJ
 cIzztCGMkZfRYO2zxIKS8OZHm14YNCUQwmjx8YkcCghqiOUe8me1Y7aPdG8AfcN5VGSdbZhS2V
 F1mG0CftwcukEwTnd5D4rV+Y
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; 
   d="scan'208";a="139400192"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2021 05:23:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 12 Oct 2021 05:23:08 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 12 Oct 2021 05:23:07 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <linus.walleij@linaro.org>,
        <p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH] pinctrl: microchip sgpio: use reset driver
Date:   Tue, 12 Oct 2021 14:24:35 +0200
Message-ID: <20211012122435.2081930-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
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

