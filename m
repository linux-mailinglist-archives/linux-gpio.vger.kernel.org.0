Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C06436F76
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 03:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhJVBhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 21:37:48 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:26110 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhJVBhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 21:37:47 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hb6Ls0YyJz1DHpf;
        Fri, 22 Oct 2021 09:33:41 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 22 Oct 2021 09:35:25 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 09:35:25 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: core: fix possible memory leak in pinctrl_enable()
Date:   Fri, 22 Oct 2021 09:43:23 +0800
Message-ID: <20211022014323.1156924-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I got memory leak as follows when doing fault injection test:

unreferenced object 0xffff888020a7a680 (size 64):
  comm "i2c-mcp23018-41", pid 23090, jiffies 4295160544 (age 8.680s)
  hex dump (first 32 bytes):
    00 48 d3 1e 80 88 ff ff 00 1a 56 c1 ff ff ff ff  .H........V.....
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000083c79b35>] kmem_cache_alloc_trace+0x16d/0x360
    [<0000000051803c95>] pinctrl_init_controller+0x6ed/0xb70
    [<0000000064346707>] pinctrl_register+0x27/0x80
    [<0000000029b0e186>] devm_pinctrl_register+0x5b/0xe0
    [<00000000391f5a3e>] mcp23s08_probe_one+0x968/0x118a [pinctrl_mcp23s08]
    [<000000006112c039>] mcp230xx_probe+0x266/0x560 [pinctrl_mcp23s08_i2c]

If pinctrl_claim_hogs() fails, the 'pindesc' allocated in pinctrl_register_one_pin()
need be freed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 950b0d91dc10 ("pinctrl: core: Fix regression caused by delayed work for hogs")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pinctrl/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 5082102d7d0d..ffe39336fcac 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2100,6 +2100,8 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
 	if (error) {
 		dev_err(pctldev->dev, "could not claim hogs: %i\n",
 			error);
+		pinctrl_free_pindescs(pctldev, pctldev->desc->pins,
+				      pctldev->desc->npins);
 		mutex_destroy(&pctldev->mutex);
 		kfree(pctldev);
 
-- 
2.25.1

