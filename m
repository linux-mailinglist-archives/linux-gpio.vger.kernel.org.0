Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57D21AD931
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 10:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgDQIzA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 04:55:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2395 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729784AbgDQIzA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 04:55:00 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 858E4286A544F9606FBB;
        Fri, 17 Apr 2020 16:54:57 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:54:46 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <manivannan.sadhasivam@linaro.org>, <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] pinctrl: remove unused 'pwm37_pins'
Date:   Fri, 17 Apr 2020 17:21:12 +0800
Message-ID: <20200417092112.12303-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following gcc warning:

drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: ‘pwm37_pins’ defined
but not used [-Wunused-const-variable=]
 static const unsigned int pwm37_pins[] = { 110 };
                           ^~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/pinctrl-bm1880.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index f7dff4f14101..80bc04f40964 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -260,7 +260,6 @@ static const unsigned int pwm33_pins[] = { 106 };
 static const unsigned int pwm34_pins[] = { 107 };
 static const unsigned int pwm35_pins[] = { 108 };
 static const unsigned int pwm36_pins[] = { 109 };
-static const unsigned int pwm37_pins[] = { 110 };
 static const unsigned int i2c0_pins[] = { 63, 64 };
 static const unsigned int i2c1_pins[] = { 65, 66 };
 static const unsigned int i2c2_pins[] = { 67, 68 };
-- 
2.21.1

