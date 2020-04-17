Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1891B1AD708
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 09:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgDQHIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 03:08:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41056 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728375AbgDQHIk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 03:08:40 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id CF8AB8FD19F0FA263885;
        Fri, 17 Apr 2020 15:08:38 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 15:08:29 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] pinctrl: nomadik: ab8505: remove unused 'gpio50_a_1_pins'
Date:   Fri, 17 Apr 2020 15:34:55 +0800
Message-ID: <20200417073455.42146-1-yanaijie@huawei.com>
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

drivers/pinctrl/nomadik/pinctrl-ab8505.c:137:23: warning:
‘gpio50_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned gpio50_a_1_pins[] = { AB8505_PIN_L4 };
                       ^~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/nomadik/pinctrl-ab8505.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-ab8505.c b/drivers/pinctrl/nomadik/pinctrl-ab8505.c
index 5e6e7d28390a..ed23f1274709 100644
--- a/drivers/pinctrl/nomadik/pinctrl-ab8505.c
+++ b/drivers/pinctrl/nomadik/pinctrl-ab8505.c
@@ -134,7 +134,6 @@ static const unsigned gpio34_a_1_pins[] = { AB8505_PIN_H14 };
 static const unsigned gpio40_a_1_pins[] = { AB8505_PIN_J15 };
 static const unsigned gpio41_a_1_pins[] = { AB8505_PIN_J14 };
 static const unsigned uartrxdata_a_1_pins[] = { AB8505_PIN_J14 };
-static const unsigned gpio50_a_1_pins[] = { AB8505_PIN_L4 };
 static const unsigned gpio52_a_1_pins[] = { AB8505_PIN_D16 };
 static const unsigned gpio53_a_1_pins[] = { AB8505_PIN_D15 };
 
-- 
2.21.1

