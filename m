Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D0C788383
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 11:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbjHYJ1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 05:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244235AbjHYJ1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 05:27:19 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C671FC3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 02:27:16 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RXF0Q6fTqzVkF6;
        Fri, 25 Aug 2023 17:24:54 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 17:27:13 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: lantiq: Remove unsued declaration ltq_pinctrl_unregister()
Date:   Fri, 25 Aug 2023 17:27:06 +0800
Message-ID: <20230825092706.14680-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

Commit 3f8c50c9b110 ("OF: pinctrl: MIPS: lantiq: implement lantiq/xway pinctrl support")
declared but never implemented it, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/pinctrl-lantiq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-lantiq.h b/drivers/pinctrl/pinctrl-lantiq.h
index efb25fc34f14..1ac49ae638de 100644
--- a/drivers/pinctrl/pinctrl-lantiq.h
+++ b/drivers/pinctrl/pinctrl-lantiq.h
@@ -198,5 +198,4 @@ enum ltq_pin {
 
 extern int ltq_pinctrl_register(struct platform_device *pdev,
 				   struct ltq_pinmux_info *info);
-extern int ltq_pinctrl_unregister(struct platform_device *pdev);
 #endif	/* __PINCTRL_LANTIQ_H */
-- 
2.34.1

