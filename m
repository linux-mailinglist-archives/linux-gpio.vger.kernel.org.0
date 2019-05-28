Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9014A2C2EB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 11:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfE1JS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 05:18:28 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17597 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725943AbfE1JS2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 May 2019 05:18:28 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7534E5D4545AA8DA46A7;
        Tue, 28 May 2019 17:18:26 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Tue, 28 May 2019
 17:18:20 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <rafal@milecki.pl>,
        <gregkh@linuxfoundation.org>, <opendmb@gmail.com>,
        <eric@anholt.net>, <tglx@linutronix.de>, <matheus@castello.eng.br>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: bcm2835: Fix build error without CONFIG_OF
Date:   Tue, 28 May 2019 17:13:04 +0800
Message-ID: <20190528091304.9932-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pctl_dt_node_to_map:
drivers/pinctrl/bcm/pinctrl-bcm2835.c:720:8: error: implicit declaration of function pinconf_generic_dt_node_to_map_all;
drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pinctrl_probe:
drivers/pinctrl/bcm/pinctrl-bcm2835.c:1022:15: error: struct gpio_chip has no member named of_node
  pc->gpio_chip.of_node = np;

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl binding")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/bcm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 4b5842c..dcf7df7 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -19,7 +19,7 @@ config PINCTRL_BCM281XX
 
 config PINCTRL_BCM2835
 	bool "Broadcom BCM2835 GPIO (with PINCONF) driver"
-	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
+	depends on OF && (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
-- 
2.7.4


