Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C055C1BBCE2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 13:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgD1L4b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 07:56:31 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:59456 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726505AbgD1L4b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 07:56:31 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E6470767EDA26952B564;
        Tue, 28 Apr 2020 19:56:29 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 19:56:19 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <manivannan.sadhasivam@linaro.org>, <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] pinctrl: add pwm37 to bm1880_pctrl_groups
Date:   Tue, 28 Apr 2020 19:55:43 +0800
Message-ID: <20200428115543.33379-1-yanaijie@huawei.com>
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

The 'pwm37' is not added to bm1880_pctrl_groups, which triggers a gcc
build warning:

drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: ‘pwm37_pins’ defined
but not used [-Wunused-const-variable=]
 static const unsigned int pwm37_pins[] = { 110 };

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/pinctrl/pinctrl-bm1880.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index f7dff4f14101..d1a7d9836787 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -408,6 +408,7 @@ static const struct bm1880_pctrl_group bm1880_pctrl_groups[] = {
 	BM1880_PINCTRL_GRP(pwm34),
 	BM1880_PINCTRL_GRP(pwm35),
 	BM1880_PINCTRL_GRP(pwm36),
+	BM1880_PINCTRL_GRP(pwm37),
 	BM1880_PINCTRL_GRP(i2c0),
 	BM1880_PINCTRL_GRP(i2c1),
 	BM1880_PINCTRL_GRP(i2c2),
-- 
2.21.1

