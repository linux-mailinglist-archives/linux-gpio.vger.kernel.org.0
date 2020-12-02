Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999042CB8F4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 10:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387718AbgLBJdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 04:33:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8555 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbgLBJcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 04:32:55 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CmDJ31WzyzhXrr;
        Wed,  2 Dec 2020 17:31:47 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Dec 2020
 17:32:06 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC:     <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v1 2/3] MAINTAINERS: Add maintainer for HiSilicon GPIO driver
Date:   Wed, 2 Dec 2020 17:32:22 +0800
Message-ID: <1606901543-8957-3-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here add maintainer information for HiSilicon GPIO driver.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee..8d13419a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7896,6 +7896,13 @@ L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	drivers/dma/hisi_dma.c
 
+HISILICON GPIO DRIVER
+M:	Luo Jiaxing <luojiaxing@huawei.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-hisi.c
+F:	include/linux/platform_data/gpio-hisi.h
+
 HISILICON HIGH PERFORMANCE RSA ENGINE DRIVER (HPRE)
 M:	Zaibo Xu <xuzaibo@huawei.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.7.4

