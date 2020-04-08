Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65BB1A1C47
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 09:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgDHHGr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 03:06:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:49050 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725932AbgDHHGr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 03:06:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id B7FD4F397D8D46CF05E4;
        Wed,  8 Apr 2020 15:06:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 15:06:11 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Asmaa Mnebhi <Asmaa@mellanox.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     YueHaibing <yuehaibing@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] gpio: remove unused including <linux/version.h>
Date:   Wed, 8 Apr 2020 07:08:32 +0000
Message-ID: <20200408070832.137037-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-mlxbf2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 7b7085050219..240b488609ac 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -14,7 +14,6 @@
 #include <linux/resource.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/version.h>
 
 /*
  * There are 3 YU GPIO blocks:



