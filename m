Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D1441D4EA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 09:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348859AbhI3IBc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 04:01:32 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:27940 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348840AbhI3IBb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 04:01:31 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HKlsZ0mD6zbmyw;
        Thu, 30 Sep 2021 15:55:30 +0800 (CST)
Received: from kwepemm600018.china.huawei.com (7.193.23.140) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 30 Sep 2021 15:59:43 +0800
Received: from huawei.com (10.69.192.56) by kwepemm600018.china.huawei.com
 (7.193.23.140) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 15:59:43 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] MAINTAINERS: Change maintainer for gpio-hisi driver
Date:   Thu, 30 Sep 2021 15:58:07 +0800
Message-ID: <20210930075807.333-1-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600018.china.huawei.com (7.193.23.140)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qi Liu take over the maintenance of HISILICON GPIO driver next, change
the maintainer information.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..b7ee5ddaf820 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8400,7 +8400,7 @@ S:	Maintained
 F:	drivers/dma/hisi_dma.c
 
 HISILICON GPIO DRIVER
-M:	Luo Jiaxing <luojiaxing@huawei.com>
+M:	Qi Liu <liuqi115@huawei.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-hisi.c
-- 
2.33.0

