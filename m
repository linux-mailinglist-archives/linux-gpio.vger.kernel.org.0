Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8331D5F2CC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 08:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfGDG1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 02:27:50 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37182 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725879AbfGDG1u (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jul 2019 02:27:50 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E32053DD455490766B38;
        Thu,  4 Jul 2019 14:27:47 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 4 Jul 2019
 14:27:38 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <dvhart@infradead.org>, <andy@infradead.org>,
        <linus.walleij@linaro.org>, <rdunlap@infradead.org>,
        <info@metux.net>
CC:     <linux-kernel@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] platform/x86: Fix PCENGINES_APU2 Kconfig warning
Date:   Thu, 4 Jul 2019 14:27:25 +0800
Message-ID: <20190704062725.50400-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix Kconfig warning for PCENGINES_APU2 symbol:

WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
  Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]

WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
  Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]

Add GPIOLIB dependency to fix it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8c8bd45..2409d26 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1322,7 +1322,7 @@ config HUAWEI_WMI
 
 config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
-	depends on INPUT && INPUT_KEYBOARD
+	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
 	depends on LEDS_CLASS
 	select GPIO_AMD_FCH
 	select KEYBOARD_GPIO_POLLED
-- 
2.7.4


