Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148367C6BB0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 12:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbjJLK5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 06:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235674AbjJLK5Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 06:57:24 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1627C6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 03:57:22 -0700 (PDT)
Received: from kwepemm000002.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S5mhs4DGpzVlV9;
        Thu, 12 Oct 2023 18:53:49 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemm000002.china.huawei.com (7.193.23.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 18:57:20 +0800
From:   Devyn Liu <liudingyuan@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andy@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <f.fangjian@huawei.com>,
        <prime.zeng@huawei.com>, <kangfenglong@huawei.com>
Subject: [PATCH] gpio: hisi: Fix format specifier
Date:   Thu, 12 Oct 2023 18:54:11 +0800
Message-ID: <20231012105411.2843043-1-liudingyuan@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.165.2]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000002.china.huawei.com (7.193.23.144)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The hisi_gpio->line is unsigned int so the format specifier
should have been %u not %d.

Signed-off-by: Devyn Liu <liudingyuan@huawei.com>
---
 drivers/gpio/gpio-hisi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 29a03de37fd8..ef5cc654a24e 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -255,7 +255,7 @@ static void hisi_gpio_get_pdata(struct device *dev,
 		hisi_gpio->irq = platform_get_irq(pdev, idx);
 
 		dev_info(dev,
-			 "get hisi_gpio[%d] with %d lines\n", idx,
+			 "get hisi_gpio[%d] with %u lines\n", idx,
 			 hisi_gpio->line_num);
 
 		idx++;
-- 
2.30.0

