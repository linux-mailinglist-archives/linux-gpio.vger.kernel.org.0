Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C4963BE57
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 11:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiK2K6Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 05:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiK2K6Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 05:58:24 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2559E1F2E3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 02:58:23 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NLzkV3rFlzJntQ;
        Tue, 29 Nov 2022 18:54:58 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 18:58:20 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <lakshmi.sowjanya.d@intel.com>, <linus.walleij@linaro.org>,
        <rafal@milecki.pl>, <cuigaosheng1@huawei.com>
CC:     <linux-gpio@vger.kernel.org>
Subject: [PATCH] pinctrl: thunderbay: fix possible memory leak in thunderbay_add_functions()
Date:   Tue, 29 Nov 2022 18:58:20 +0800
Message-ID: <20221129105820.1539875-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The memory of funcs is allocated by thunderbay_build_functions(),
thunderbay_add_functions() will free funcs when everything is ok,
but it will not be freed when thunderbay_add_functions() fails,
then there will be a memory leak, so add kfree() when
thunderbay_add_functions() fails to fix it.

Fixes: 25d2e41cf59b ("pinctrl: thunderbay: rework loops looking for groups names")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/pinctrl/pinctrl-thunderbay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
index 9328b17485cf..10a7380af8e6 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -784,8 +784,10 @@ static int thunderbay_add_functions(struct thunderbay_pinctrl *tpc, struct funct
 
 		group_names = devm_kcalloc(tpc->dev, func->num_group_names,
 					   sizeof(*group_names), GFP_KERNEL);
-		if (!group_names)
+		if (!group_names) {
+			kfree(funcs);
 			return -ENOMEM;
+		}
 
 		for (j = 0; j < tpc->soc->npins; j++) {
 			const struct pinctrl_pin_desc *pin_info = &thunderbay_pins[j];
-- 
2.25.1

