Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80332684E5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 08:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgINGbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 02:31:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11830 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbgINGbh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 02:31:37 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E34E6C0B2D3D50EC1778;
        Mon, 14 Sep 2020 14:31:33 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 14:31:22 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] pinctrl: sprd: use module_platform_driver to simplify the code
Date:   Mon, 14 Sep 2020 14:54:02 +0800
Message-ID: <20200914065402.3726408-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
index 06c8671b40e7..d14f382f2392 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
@@ -946,18 +946,7 @@ static struct platform_driver sprd_pinctrl_driver = {
 	.remove = sprd_pinctrl_remove,
 	.shutdown = sprd_pinctrl_shutdown,
 };
-
-static int sprd_pinctrl_init(void)
-{
-	return platform_driver_register(&sprd_pinctrl_driver);
-}
-module_init(sprd_pinctrl_init);
-
-static void sprd_pinctrl_exit(void)
-{
-	platform_driver_unregister(&sprd_pinctrl_driver);
-}
-module_exit(sprd_pinctrl_exit);
+module_platform_driver(sprd_pinctrl_driver);
 
 MODULE_DESCRIPTION("SPREADTRUM Pin Controller Driver");
 MODULE_AUTHOR("Baolin Wang <baolin.wang@spreadtrum.com>");
-- 
2.25.1

