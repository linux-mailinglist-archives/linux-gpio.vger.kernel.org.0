Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FBC2DF9E1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Dec 2020 09:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgLUI0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Dec 2020 03:26:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9233 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgLUI0E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Dec 2020 03:26:04 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Czsvc18RMzktNl;
        Mon, 21 Dec 2020 16:24:28 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 21 Dec 2020
 16:25:18 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] gpio: hisi: delete some unused variables in hisi_gpio_probe()
Date:   Mon, 21 Dec 2020 16:25:24 +0800
Message-ID: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

kernel test rebot report that dat, set and clr in hisi_gpio_probe() is
unused variables. So delete it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/gpio-hisi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index a389780..d2971c9 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -254,7 +254,6 @@ static void hisi_gpio_get_pdata(struct device *dev,
 static int hisi_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	void __iomem *dat, *set, *clr;
 	struct hisi_gpio *hisi_gpio;
 	int port_num;
 	int ret;
-- 
2.7.4

