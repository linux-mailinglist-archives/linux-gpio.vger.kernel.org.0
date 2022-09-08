Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C8D5B1B4F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 13:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiIHLYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 07:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiIHLYb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 07:24:31 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240EF12631
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 04:24:28 -0700 (PDT)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MNc9w51tdz14QQf;
        Thu,  8 Sep 2022 19:20:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemi500015.china.huawei.com (7.221.188.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 8 Sep 2022 19:24:26 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>
CC:     <linux-gpio@vger.kernel.org>, <jonathan.cameron@huawei.com>,
        <jiaxingluo@autox.ai>, <prime.zeng@hisilicon.com>
Subject: [PATCH] MAINTAINERS: Update HiSilicon GPIO Driver maintainer
Date:   Thu, 8 Sep 2022 19:21:51 +0800
Message-ID: <20220908112151.13912-1-f.fangjian@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Jay Fang as the maintainer of the HiSilicon GPIO Driver, replacing
Luo Jiaxing.

Cc: Luo Jiaxing <jiaxingluo@autox.ai>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1390b8270b2..907451fb013a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9122,7 +9122,7 @@ S:	Maintained
 F:	drivers/dma/hisi_dma.c
 
 HISILICON GPIO DRIVER
-M:	Luo Jiaxing <luojiaxing@huawei.com>
+M:	Jay Fang <f.fangjian@huawei.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-hisi.c
-- 
2.33.0

