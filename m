Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C1C3F7110
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Aug 2021 10:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239361AbhHYIYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Aug 2021 04:24:00 -0400
Received: from mx21.baidu.com ([220.181.3.85]:56130 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229780AbhHYIXt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Aug 2021 04:23:49 -0400
Received: from BJHW-Mail-Ex14.internal.baidu.com (unknown [10.127.64.37])
        by Forcepoint Email with ESMTPS id 1D08B6A8A7C0864D0D51;
        Wed, 25 Aug 2021 16:23:00 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex14.internal.baidu.com (10.127.64.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 25 Aug 2021 16:22:59 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 25 Aug 2021 16:22:59 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <aisheng.dong@nxp.com>, <festevam@gmail.com>,
        <shawnguo@kernel.org>, <stefan@agner.ch>,
        <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] pinctrl: freescale: Add helper dependency on COMPILE_TEST
Date:   Wed, 25 Aug 2021 16:22:51 +0800
Message-ID: <20210825082251.2484-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex14_2021-08-25 16:23:00:057
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

it's helpful for complie test in other platform(e.g.X86)

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/pinctrl/freescale/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 21fa21c6547b..defc1f38efc7 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -119,28 +119,28 @@ config PINCTRL_IMX7ULP
 
 config PINCTRL_IMX8MM
 	tristate "IMX8MM pinctrl driver"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mm pinctrl driver
 
 config PINCTRL_IMX8MN
 	tristate "IMX8MN pinctrl driver"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mn pinctrl driver
 
 config PINCTRL_IMX8MP
 	tristate "IMX8MP pinctrl driver"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mp pinctrl driver
 
 config PINCTRL_IMX8MQ
 	tristate "IMX8MQ pinctrl driver"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
@@ -168,7 +168,7 @@ config PINCTRL_IMX8DXL
 
 config PINCTRL_IMX8ULP
 	tristate "IMX8ULP pinctrl driver"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || (COMPILE_TEST && OF)
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8ulp pinctrl driver
-- 
2.25.1

