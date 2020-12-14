Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415252D9426
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 09:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439253AbgLNIZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 03:25:12 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9436 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439230AbgLNIZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 03:25:03 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CvZD323CFzhsYg;
        Mon, 14 Dec 2020 16:23:47 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Mon, 14 Dec 2020
 16:24:05 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <john.garry@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v2 2/3] MAINTAINERS: Add maintainer for HiSilicon GPIO driver
Date:   Mon, 14 Dec 2020 16:24:14 +0800
Message-ID: <1607934255-52544-3-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
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

