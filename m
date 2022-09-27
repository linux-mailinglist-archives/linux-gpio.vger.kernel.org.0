Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9860D5EC4C0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbiI0NmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 09:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbiI0NmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 09:42:07 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1C3E11A6
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:42:06 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4McLMl4mqwzHqJK;
        Tue, 27 Sep 2022 21:39:47 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:42:03 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <linus.walleij@linaro.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] pinctrl: bcm: Remove unused struct bcm6328_pingroup
Date:   Tue, 27 Sep 2022 13:39:26 +0000
Message-ID: <20220927133926.103943-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After commit 0e3db16300fb("pinctrl: bcm: Convert drivers to use struct pingroup
and PINCTRL_PINGROUP()"), no one use struct bcm6328_pingroup, so remove it.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm6328.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
index 1eef5ab9a5e5..1e8cc2c80c81 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6328.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
@@ -26,12 +26,6 @@
 #define BCM6328_MUX_OTHER_REG	0x24
 #define  BCM6328_MUX_MASK	GENMASK(1, 0)
 
-struct bcm6328_pingroup {
-	const char *name;
-	const unsigned * const pins;
-	const unsigned num_pins;
-};
-
 struct bcm6328_function {
 	const char *name;
 	const char * const *groups;
-- 
2.17.1

