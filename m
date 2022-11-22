Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79136633C3E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 13:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiKVMRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 07:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233680AbiKVMRN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 07:17:13 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723F9303C6
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 04:17:12 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NGjpq5QPxzJnpN;
        Tue, 22 Nov 2022 20:13:55 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 20:17:10 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 20:17:10 +0800
From:   Xiongfeng Wang <wangxiongfeng2@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <acourbot@nvidia.com>
CC:     <linux-gpio@vger.kernel.org>, <yangyingliang@huawei.com>,
        <wangxiongfeng2@huawei.com>
Subject: [PATCH] drivers: gpio: amd8111: Fix PCI device reference count leak
Date:   Tue, 22 Nov 2022 20:35:08 +0800
Message-ID: <20221122123508.112090-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

for_each_pci_dev() is implemented by pci_get_device(). The comment of
pci_get_device() says that it will increase the reference count for the
returned pci_dev and also decrease the reference count for the input
pci_dev @from if it is not NULL.

If we break for_each_pci_dev() loop with pdev not NULL, we need to call
pci_dev_put() to decrease the reference count. Add the missing
pci_dev_put() after the 'out' label. Since pci_dev_put() can handle NULL
input parameter, there is no problem for the 'Device not found' branch.
For the normal path, add pci_dev_put() in amd_gpio_exit().

Fixes: f942a7de047d ("gpio: add a driver for GPIO pins found on AMD-8111 south bridge chips")
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/gpio/gpio-amd8111.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 14e6b3e64add..6f3ded619c8b 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -226,7 +226,10 @@ static int __init amd_gpio_init(void)
 		ioport_unmap(gp.pm);
 		goto out;
 	}
+	return 0;
+
 out:
+	pci_dev_put(pdev);
 	return err;
 }
 
@@ -234,6 +237,7 @@ static void __exit amd_gpio_exit(void)
 {
 	gpiochip_remove(&gp.chip);
 	ioport_unmap(gp.pm);
+	pci_dev_put(gp.pdev);
 }
 
 module_init(amd_gpio_init);
-- 
2.20.1

