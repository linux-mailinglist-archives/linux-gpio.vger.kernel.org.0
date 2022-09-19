Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9073F5BC57F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 11:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiISJgU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 05:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiISJgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 05:36:02 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1417F25C60
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 02:35:51 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWKFC21B7zlVlT;
        Mon, 19 Sep 2022 17:31:43 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 17:35:47 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <kumaravel.thiagarajan@microchip.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <linux-gpio@vger.kernel.org>, <liwei391@huawei.com>
Subject: [PATCH -next] mchp_pci1xxxx: gpio: fix unused function compile warning
Date:   Mon, 19 Sep 2022 17:42:50 +0800
Message-ID: <20220919094250.858716-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix below compile warning when CONFIG_PM_SLEEP
feature is disabled:

drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c:311:12: error: ‘pci1xxxx_gpio_resume’ defined but not used [-Werror=unused-function]
  311 | static int pci1xxxx_gpio_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~
drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c:295:12: error: ‘pci1xxxx_gpio_suspend’ defined but not used [-Werror=unused-function]
  295 | static int pci1xxxx_gpio_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~

Using these DEFINE_SIMPLE_DEV_PM_OPS() and
pm_sleep_ptr() macros which allows the compiler
to remove the unused structure and functions
when !CONFIG_PM_SLEEP.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
index 9cc771c604ed..9735d5b74c8f 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -405,7 +405,7 @@ static int pci1xxxx_gpio_probe(struct auxiliary_device *aux_dev,
 	return devm_gpiochip_add_data(&aux_dev->dev, &priv->gpio, priv);
 }
 
-static SIMPLE_DEV_PM_OPS(pci1xxxx_gpio_pm_ops, pci1xxxx_gpio_suspend, pci1xxxx_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pci1xxxx_gpio_pm_ops, pci1xxxx_gpio_suspend, pci1xxxx_gpio_resume);
 
 static const struct auxiliary_device_id pci1xxxx_gpio_auxiliary_id_table[] = {
 	{.name = "mchp_pci1xxxx_gp.gp_gpio"},
@@ -416,8 +416,8 @@ MODULE_DEVICE_TABLE(auxiliary, pci1xxxx_gpio_auxiliary_id_table);
 static struct auxiliary_driver pci1xxxx_gpio_driver = {
 	.driver = {
 		.name = "PCI1xxxxGPIO",
-		.pm = &pci1xxxx_gpio_pm_ops,
-		},
+		.pm = pm_sleep_ptr(&pci1xxxx_gpio_pm_ops),
+	},
 	.probe = pci1xxxx_gpio_probe,
 	.id_table = pci1xxxx_gpio_auxiliary_id_table
 };
-- 
2.25.1

