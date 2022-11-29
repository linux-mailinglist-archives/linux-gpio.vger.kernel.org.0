Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352DF63BF9E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbiK2MCU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbiK2MBb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:01:31 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A9C27CD9
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:01:29 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NM1BS2DfWzmWGB;
        Tue, 29 Nov 2022 20:00:48 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 20:01:27 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <lakshmi.sowjanya.d@intel.com>, <linus.walleij@linaro.org>,
        <kiran.kumar1.s@intel.com>, <rafal@milecki.pl>,
        <cuigaosheng1@huawei.com>
CC:     <linux-gpio@vger.kernel.org>
Subject: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in thunderbay_build_functions()
Date:   Tue, 29 Nov 2022 20:01:26 +0800
Message-ID: <20221129120126.1567338-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The thunderbay_add_functions() will free memory of thunderbay_funcs
when everything is ok, but thunderbay_funcs will not be freed when
thunderbay_add_functions() fails, then there will be a memory leak,
so we need to add kfree() when thunderbay_add_functions() fails to
fix it.

In addition, doing some cleaner works, moving kfree(funcs) from
thunderbay_add_functions() to thunderbay_build_functions().

Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
v3:
- Doing some cleaner works, moving kfree(funcs) from thunderbay_add_functions()
  to thunderbay_build_functions(), and update the commit message, thanks!
v2:
- Free the memory in thunderbay_build_functions, and update the commit
  message and the fixes tag, thanks!
 drivers/pinctrl/pinctrl-thunderbay.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
index 9328b17485cf..590bbbf619af 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -808,7 +808,7 @@ static int thunderbay_add_functions(struct thunderbay_pinctrl *tpc, struct funct
 					    funcs[i].num_group_names,
 					    funcs[i].data);
 	}
-	kfree(funcs);
+
 	return 0;
 }
 
@@ -817,6 +817,7 @@ static int thunderbay_build_functions(struct thunderbay_pinctrl *tpc)
 	struct function_desc *thunderbay_funcs;
 	void *ptr;
 	int pin;
+	int ret;
 
 	/*
 	 * Allocate maximum possible number of functions. Assume every pin
@@ -860,7 +861,10 @@ static int thunderbay_build_functions(struct thunderbay_pinctrl *tpc)
 		return -ENOMEM;
 
 	thunderbay_funcs = ptr;
-	return thunderbay_add_functions(tpc, thunderbay_funcs);
+	ret = thunderbay_add_functions(tpc, thunderbay_funcs);
+
+	kfree(thunderbay_funcs);
+	return ret;
 }
 
 static int thunderbay_pinconf_set_tristate(struct thunderbay_pinctrl *tpc,
-- 
2.25.1

