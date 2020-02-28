Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C2D172F9B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 05:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbgB1EBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Feb 2020 23:01:02 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:50004 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730736AbgB1EBB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Feb 2020 23:01:01 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C34833B2A4412ACF6327;
        Fri, 28 Feb 2020 12:00:59 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Fri, 28 Feb 2020
 12:00:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <support.opensource@diasemi.com>, <linus.walleij@linaro.org>,
        <Adam.Thomson.Opensource@diasemi.com>, <m.felsch@pengutronix.de>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: da9062: Fix error gpiolib.h path
Date:   Fri, 28 Feb 2020 12:00:47 +0800
Message-ID: <20200228040047.14808-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/pinctrl/pinctrl-da9062.c:28:10: fatal error: ../gpio/gpiolib.h: No such file or directory
 #include <../gpio/gpiolib.h>
          ^~~~~~~~~~~~~~~~~~~

Fix this wrong include path.

Fixes: 56cc3af4e8c8 ("pinctrl: da9062: add driver support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/pinctrl-da9062.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index f704ee0b2fd9..c15eb6e99bc1 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -25,7 +25,7 @@
  * We need this get the gpio_desc from a <gpio_chip,offset> tuple to decide if
  * the gpio is active low without a vendor specific dt-binding.
  */
-#include <../gpio/gpiolib.h>
+#include "../../gpio/gpiolib.h"
 
 #define DA9062_TYPE(offset)		(4 * (offset % 2))
 #define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))
-- 
2.17.1


