Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB13173123
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 07:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgB1Gfe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 01:35:34 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44382 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbgB1Gfd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Feb 2020 01:35:33 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 5DFC9E23F0708A0CB4F0;
        Fri, 28 Feb 2020 14:35:25 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Fri, 28 Feb 2020
 14:35:19 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <support.opensource@diasemi.com>, <linus.walleij@linaro.org>,
        <Adam.Thomson.Opensource@diasemi.com>, <m.felsch@pengutronix.de>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] pinctrl: da9062: Fix error gpiolib.h path
Date:   Fri, 28 Feb 2020 14:34:29 +0800
Message-ID: <20200228063429.47528-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200228040047.14808-1-yuehaibing@huawei.com>
References: <20200228040047.14808-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gcc 7.4.0 build fails:

drivers/pinctrl/pinctrl-da9062.c:28:10: fatal error: ../gpio/gpiolib.h: No such file or directory
 #include <../gpio/gpiolib.h>
          ^~~~~~~~~~~~~~~~~~~

Fix this wrong include path.

Fixes: 56cc3af4e8c8 ("pinctrl: da9062: add driver support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: Fix wrong path
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
+#include "../gpio/gpiolib.h"
 
 #define DA9062_TYPE(offset)		(4 * (offset % 2))
 #define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))
-- 
2.17.1


