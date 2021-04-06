Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FDC354E6A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 10:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbhDFIVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 04:21:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15486 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbhDFIVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Apr 2021 04:21:01 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FF0m275gRzwRMx;
        Tue,  6 Apr 2021 16:18:42 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 16:20:44 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 1/1] bus: bt1-apb: Remove duplicated header file inclusion
Date:   Tue, 6 Apr 2021 16:20:34 +0800
Message-ID: <20210406082034.2371-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210406082034.2371-1-thunder.leizhen@huawei.com>
References: <20210406082034.2371-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delete one of the header files <linux/clk.h> that are included twice, all
included header files are then rearranged alphabetically.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/bus/bt1-apb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index b25ff941e7c7f52..f7d3d2851a6cc48 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -8,22 +8,21 @@
  * Baikal-T1 APB-bus driver
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/device.h>
 #include <linux/atomic.h>
-#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/nmi.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/clk.h>
 #include <linux/reset.h>
-#include <linux/time64.h>
-#include <linux/clk.h>
 #include <linux/sysfs.h>
+#include <linux/time64.h>
+#include <linux/types.h>
 
 #define APB_EHB_ISR			0x00
 #define APB_EHB_ISR_PENDING		BIT(0)
-- 
1.8.3


