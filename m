Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57993774136
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 19:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbjHHRQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 13:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbjHHRQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 13:16:22 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8128A30C1
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 09:06:41 -0700 (PDT)
Received: from dggpemm100005.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RKsqw0nZcz1L93H;
        Tue,  8 Aug 2023 20:26:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100005.china.huawei.com (7.185.36.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 20:27:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 20:27:45 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <vaibhaavram.tl@microchip.com>,
        <kumaravel.thiagarajan@microchip.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>,
        <tharunkumar.pasumarthi@microchip.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next v2] misc: microchip: pci1xxxx: fix return value in pci1xxxx_otp_eeprom_probe()
Date:   Tue, 8 Aug 2023 20:24:53 +0800
Message-ID: <20230808122453.556632-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_nvmem_register() never returns NULL pointer, it will return
ERR_PTR() when it fails, so replace the check with IS_ERR() and
use PTR_ERR() as return code.

Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX EEPROM via NVMEM sysfs")
Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Use PTR_ERR_OR_ZERO().
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 3d3d1578119a..1b5b61cdacde 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -379,8 +379,8 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 		priv->nvmem_eeprom = devm_nvmem_register(&aux_dev->dev,
 							 &priv->nvmem_config_eeprom);
-		if (!priv->nvmem_eeprom)
-			return -ENOMEM;
+		if (IS_ERR(priv->nvmem_eeprom))
+			return PTR_ERR(priv->nvmem_eeprom);
 	}
 
 	release_sys_lock(priv);
@@ -398,10 +398,8 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 	priv->nvmem_otp = devm_nvmem_register(&aux_dev->dev,
 					      &priv->nvmem_config_otp);
-	if (!priv->nvmem_otp)
-		return -ENOMEM;
 
-	return ret;
+	return PTR_ERR_OR_ZERO(priv->nvmem_otp);
 }
 
 static void pci1xxxx_otp_eeprom_remove(struct auxiliary_device *aux_dev)
-- 
2.25.1

