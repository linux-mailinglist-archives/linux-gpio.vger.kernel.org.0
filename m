Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A607658B3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 16:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfGKOZh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 10:25:37 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53140 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728045AbfGKOZh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 10:25:37 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C5510EC944DB3A989B11;
        Thu, 11 Jul 2019 22:25:32 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 11 Jul 2019
 22:25:26 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: aspeed: Make aspeed_pinmux_ips static
Date:   Thu, 11 Jul 2019 22:24:57 +0800
Message-ID: <20190711142457.37028-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix sparse warning:

drivers/pinctrl/aspeed/pinmux-aspeed.c:8:12: warning:
 symbol 'aspeed_pinmux_ips' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 5b0fe17..839c01b 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -5,7 +5,7 @@
 
 #include "pinmux-aspeed.h"
 
-const char *const aspeed_pinmux_ips[] = {
+static const char *const aspeed_pinmux_ips[] = {
 	[ASPEED_IP_SCU] = "SCU",
 	[ASPEED_IP_GFX] = "GFX",
 	[ASPEED_IP_LPC] = "LPC",
-- 
2.7.4


