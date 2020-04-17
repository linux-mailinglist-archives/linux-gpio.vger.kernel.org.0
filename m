Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC601AD934
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 10:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbgDQIzO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 04:55:14 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:55402 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729784AbgDQIzO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 04:55:14 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E2194417BC2613B5E240;
        Fri, 17 Apr 2020 16:55:09 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:54:59 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <linus.walleij@linaro.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] pinctrl: mcp23s08: add module license
Date:   Fri, 17 Apr 2020 17:21:25 +0800
Message-ID: <20200417092125.12513-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following build warning:

WARNING: modpost: missing MODULE_LICENSE() in
drivers/pinctrl/pinctrl-mcp23s08.o
see include/linux/module.h for more information

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cb545557dcd4..151931b593f6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -658,3 +658,4 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mcp23s08_probe_one);
+MODULE_LICENSE("GPL");
-- 
2.21.1

